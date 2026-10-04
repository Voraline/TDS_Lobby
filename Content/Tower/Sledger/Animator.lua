-- Script path: ReplicatedStorage.Content.Tower.Sledger.Animator
-- Decompile time: 5.69 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local CurrentCamera = workspace.CurrentCamera
local u52 = Random.new()
local v1 = {}
v1.__index = v1

function v1:_cancelFaceTween() -- Line: 17
    if self._faceTween then
        self._faceTween:Cancel()
        self._faceTween = nil
    end
end

function v1.Initialize(a1) -- Line: 24
    -- upvalues: Animation (val), EasySound (val), u52 (val), TimescaleUtilities (val), EmitterManager (val)
    -- upvalues: UpgradesStore (val), HttpService (val), AreaIndicatorStore (val)
    local Name, Name_2, v1
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local u107 = {
        a1.Model.Head.Hit1,
        a1.Model.Head.Hit2,
        a1.Model.Head.Hit3,
    }
    local u108 = {
        a1.Model.Head.Swing1,
        a1.Model.Head.Swing2,
        a1.Model.Head.Swing3,
    }
    a1._animations = {}
    for i, v in ipairs(Animations:GetDescendants()) do
        if v:IsA("Animation") then
            Name = v.Name
            Name_2 = v.Parent.Name
            if not tonumber(Name_2) then
                Name = Name_2
            end
            v1 = Animation.new({Preload = true, Target = AnimationController, Track = v})
            if string.match(Name, "^Slash") then
                (v1.Controller:GetMarkerReachedSignal("Trail")):Connect(function(a1_2) -- Line: 49 -- upvalues: a1 (val), EasySound (upval), u108 (val), u52 (upval) -- types: a1_2: string
                    if a1_2 ~= "true" then
                        for i, v in ipairs(a1.Model.Weapon.Weapon.Handle:GetChildren()) do
                            if v:IsA("Trail") then
                                v.Enabled = false
                            end
                        end
                        return
                    end
                    local v1 = a1.Replicator:Get("Swing") or 1
                    for i2, i3 in ipairs(a1.Model.Weapon.Weapon.Handle:GetChildren()) do
                        if i3:IsA("Trail") then
                            i3.Enabled = true
                        end
                    end
                    EasySound.Play({
                        volume = 0.5,
                        destroyOnEnd = true,
                        audioGroup = "Towers",
                        id = u108[v1].SoundId,
                        parent = a1.Model.PrimaryPart,
                        playbackSpeed = u52:NextNumber(0.8, 1.2),
                    })
                end)
            end
            a1._animations[Name] = v1
        end
    end
    a1.Executables = {
        Swing = function(a1_2, a2, a3) -- Line: 81
            -- upvalues: a1 (val), TimescaleUtilities (upval)
            local v1 = a1.Replicator:Get("Swing")
            v1 = a1._animations[("Slash%*"):format(v1 or 1)]
            local v2 = v1:Play()
            local Cooldown = a1:GetCooldown()
            local v3 = Cooldown / 2
            v1:AdjustSpeed(1 / (Cooldown / v2.Length))
            local u38 = a1:_faceTarget(a1_2, v3)
            if a2 then
                TimescaleUtilities.Delay(v3, function() -- Line: 93 -- upvalues: a1 (upval), u38 (val), a3 (val)
                    a1:_createIceSpikes(u38 + Vector3.new(0, a1.Model.PrimaryPart.HeightOffset.CFrame.Y, 0), a3)
                end)
            end
        end,
        Face = function(a1_2) -- Line: 101 -- upvalues: a1 (val) -- types: a1_2: vector
            a1:_faceTarget(a1_2, 0.2)
        end,
        Hit = function(a1_2, a2, a3) -- Line: 104
            -- upvalues: a1 (val), EmitterManager (upval), TimescaleUtilities (upval), EasySound (upval), u52 (upval)
            -- upvalues: u107 (val)
            local u9 = a1.Model.Handle.Hit:Clone()
            u9.Parent = workspace.Terrain
            u9.WorldPosition = a1_2
            EmitterManager.manualEmit(u9)
            TimescaleUtilities.Delay(1, function() -- Line: 109 -- upvalues: u9 (val)
                u9:Destroy()
            end)
            if not a3 then
                EasySound.Play({
                    volume = 0.5,
                    destroyOnEnd = true,
                    audioGroup = "Towers",
                    id = u107[a2].SoundId,
                    position = a1_2,
                    playbackSpeed = u52:NextNumber(0.8, 1.2),
                })
                return
            end
            local SoundId = a1.Model.Head.Crit.SoundId
            EasySound.Play({
                volume = 0.5,
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = SoundId,
                position = a1_2,
                playbackSpeed = u52:NextNumber(0.8, 1.2),
            })
            if not (5 <= (a1:GetLevel())) then
                return
            end
            EmitterManager.Emit("SnowballAoeBlast", CFrame.new(a1_2), 0.5)
        end,
        AreaIndicator = function(a1_2, a2, a3) -- Line: 138
            -- upvalues: UpgradesStore (upval), a1 (val), HttpService (upval), AreaIndicatorStore (upval)
            if UpgradesStore.getState().model ~= a1.Model then
                return
            end
            local v1 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v1, {
                type = "normal",
                initialAngle = 0,
                radius = a2,
                desiredAngle = a1_2,
                color3 = Color3.fromRGB(255, 255, 255),
                cframe = CFrame.new(-a1.Model.PrimaryPart.HeightOffset.Position),
                tweenInfo = TweenInfo.new(0.25),
                lifeTime = a3,
                basePart = a1.Model.PrimaryPart,
            })
            a1:Wait(a3 + 1)
            AreaIndicatorStore.remove(v1)
        end,
    }
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 159 -- upvalues: a1 (val)
        a1:_cancelFaceTween()
    end)))
end

function v1:_faceTarget(a2, a3) -- Line: 164
    -- upvalues: TweenService (val)
    local PrimaryPart = self.Model.PrimaryPart or self.Model:FindFirstChild("HumanoidRootPart")
    if not PrimaryPart then
        return CFrame.new()
    end
    self:_cancelFaceTween()
    local v1 = CFrame.new(PrimaryPart.CFrame.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
    if a3 <= 0 then
        PrimaryPart.CFrame = v1
        return v1
    end
    local u38 = TweenService:Create(PrimaryPart, TweenInfo.new(a3), {CFrame = v1})
    self._faceTween = u38
    u38.Completed:Connect(function() -- Line: 183 -- upvalues: self (val), u38 (val)
        if self._faceTween == u38 then
            self._faceTween = nil
        end
    end)
    u38:Play()
    return v1
end

function v1:_createIceSpikes(a2, a3) -- Line: 193
    -- upvalues: ReplicatedStorage (val), CurrentCamera (val), EasySound (val), u52 (val), TimescaleUtilities (val)
    -- upvalues: TweenService (val)
    local CFrame_3, new, v1, v2
    local v3 = true
    if self.Model.Name ~= "Chocolatier" then
        v2 = ReplicatedStorage.Assets.Effects.Misc.SledgerIceSpikes:Clone()
    else
        v3 = false
        v2 = ReplicatedStorage.Assets.Effects.Misc.ChocolatierSledgerSpikes:Clone()
    end
    v2:PivotTo(a2)
    v2.Parent = CurrentCamera
    EasySound.Play({
        id = 140082119813309,
        volume = 0.5,
        destroyOnEnd = true,
        audioGroup = "Towers",
        parent = v2.PrimaryPart,
        playbackSpeed = 4 * u52:NextNumber(0.8, 1.2),
    })
    EasySound.Play({
        id = 126908890778057,
        volume = 0.5,
        destroyOnEnd = true,
        audioGroup = "Towers",
        parent = v2.PrimaryPart,
        playbackSpeed = 4 * u52:NextNumber(0.8, 1.2),
    }, 0.65)
    local u64 = #v2.Spikes:GetChildren()
    local v4 = u64 - 1
    for i = 0, v4 do
        for i2, v in ipairs(v2.Spikes[i + 1]:GetChildren()) do
            local CFrame_2 = v.CFrame
            local Size = v.Size
            v.Transparency = if not v3 then 0 else 0.35
            v.Size = v.Size * 0.5
            CFrame_3 = v.CFrame
            new = CFrame.new
            v1 = -Size.Y
            v.CFrame = CFrame_3 * new(0, v1, Size.Z / 2)
            TimescaleUtilities.Delay(i * 0.1, function() -- Line: 235
                -- upvalues: a3 (val), u64 (val), i (val), TweenService (upval), v (val), CFrame_2 (val), Size (val)
                -- upvalues: TimescaleUtilities (upval)
                local v1 = a3 - a3 * 0.2 * (u64 - i)
                TweenService:Create(v, TweenInfo.new(v1, Enum.EasingStyle.Quint), {CFrame = CFrame_2, Size = Size}):Play()
                TimescaleUtilities.Wait(a3 + a3 * 0.2 * (u64 - i))
                local v2 = a3 * 0.25 * i + 0.5
                TweenService:Create(v, TweenInfo.new(v2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    Transparency = 1,
                    Size = v.Size * 0,
                    CFrame = v.CFrame * CFrame.new(0, 0, Size.Z * 100 / 100 / 2) - Vector3.new(0, Size.Y * 100 / 100, 0),
                }):Play()
            end)
        end
    end
end

return v1