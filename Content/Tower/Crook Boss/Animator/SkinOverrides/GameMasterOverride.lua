-- Script path: ReplicatedStorage.Content.Tower.Crook Boss.Animator.SkinOverrides.GameMasterOverride
-- Decompile time: 6.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)

local function tix() -- Line: 157 -- upvalues: ReplicatedStorage (val), TweenService (val)
    local Attachment, Pig, VectorForce, v1, v2
    local Tix = ReplicatedStorage.Assets.Effects.Client.Tix
    for i = 1, 115 do
        Pig = workspace:FindFirstChild("Pig")
        if Pig then
            local u20 = Tix:Clone()
            TweenService:Create(u20.Part, TweenInfo.new(1), {Transparency = 0}):Play()
            for j, k in u20.Part:GetChildren() do
                v1 = TweenService
                v2 = TweenInfo.new(1)
                v1:Create(k, v2, {Transparency = 0}):Play()
            end
            Attachment = Instance.new("Attachment")
            Attachment.Parent = u20.Part
            VectorForce = Instance.new("VectorForce")
            VectorForce.Attachment0 = Attachment
            VectorForce.RelativeTo = Enum.ActuatorRelativeTo.World
            VectorForce.Force = Vector3.new(0, 1, 0) * (u20.Part.AssemblyMass * (workspace.Gravity * 0.7))
            VectorForce.Parent = u20.Part
            u20:PivotTo(Pig.Main.Spawn.WorldCFrame * CFrame.new(0, math.random(1, 5), 0) * (CFrame.Angles(0, math.rad((math.random(-180, 180))), 0)))
            u20.Parent = Pig
            task.delay(3, function() -- Line: 183 -- upvalues: u20 (val)
                if not u20.Parent then
                    return
                end
                u20.Part.Anchored = true
                u20.Part.AssemblyLinearVelocity = Vector3.new()
                u20.Part.AssemblyAngularVelocity = Vector3.new()
            end)
            task.wait(0.06)
        else
            task.wait()
        end
    end
end

return {
    init = function(a1) -- Line: 12
        a1.fireEffects = {}
        a1.fireEffects.FlashLower = a1.Model:WaitForChild("FlashLower").Attachment
        a1.fireEffects.FlashMax = a1.Model:WaitForChild("FlashMax").Attachment
    end,
    fire = function(a1, a2) -- Line: 18
        -- upvalues: Laser (val), SoundService (val), SoundPool (val), TweenService (val), EmitterManager (val)
        if not a1._ads then
            a1._ads = true
            a1._currentADS = a1:_playAnimation("ADS")
        end
        if a1._adsDelay then
            task.cancel(a1._adsDelay)
        end
        a1._adsDelay = task.spawn(function() -- Line: 27 -- upvalues: a1 (val)
            a1:Delay(4)
            a1._ads = false
            a1._currentADS:Stop()
            a1:_playAnimation("ADS_IDLE")
        end)
        local v1 = {
            ["0"] = 1,
            ["1"] = 1,
            ["2"] = 2,
            ["3"] = 4,
            ["4"] = 4,
        }
        local v2 = {
            ["0"] = {Color3.fromRGB(255, 0, 187), (Color3.fromRGB(241, 115, 255))},
            ["4"] = {Color3.fromRGB(255, 115, 0), (Color3.fromRGB(255, 228, 139))},
        }
        local Level = a1:GetLevel()
        local v3 = if not (Level >= 4) then "FlashLower" else "FlashMax"
        a1._fireNumber = (a1._fireNumber or 1) + 1
        local _fireNumber = a1._fireNumber
        if v1[tostring(Level)] < _fireNumber then
            a1._fireNumber = 1
        end
        if a1._lastAnimation then
            a1._lastAnimation:Stop(0)
        end
        if v3 then
            local v4
            local v5 = a1.Model.Weapon:FindFirstChild(("Fire%*"):format(a1._fireNumber), true)
            local u93 = a1.fireEffects[v3]
            u93.CFrame = CFrame.new(0, 0, -v5.Size.Z / 2)
            if not u93.Parent then
                return
            end
            u93.Parent = v5
            local HitMax = if Level ~= 4 then a1.Model.HitLower else a1.Model.HitMax
            local Attachment = HitMax.Attachment
            local v6 = v2[tostring(Level)] or v2["0"]
            local v7 = Vector3.new(math.random(-5, 5) / 10, math.random(-5, 5) / 10, (math.random(-5, 5)) / 10)
            Laser:Bolt({
                Transparency = 0,
                Fade = 0.16,
                Size = 0.1,
                Type = "Fade",
                Zero = true,
                Offset = 1.25,
                Start = u93.WorldPosition,
                Pos = a2.PrimaryPart.Position + v7,
                ColorLerp1 = v6[1],
                ColorLerp2 = v6[2],
            })
            Attachment.WorldPosition = a2.PrimaryPart.Position + v7
            local _soundPools = a1._soundPools or {}
            a1._soundPools = _soundPools
            local v8 = a1.Model.HumanoidRootPart[if not v4 then "Shoot" else "MaxShoot"]
            if v8 and v8:IsA("Sound") then
                if SoundService:FindFirstChild("Towers") then
                    v8.SoundGroup = SoundService.Towers
                end
                local v9 = a1._soundPools[v8]
                if not v9 then
                    local v10 = string.match(v8.SoundId or "", "%d+")
                    local v11 = v10 and tonumber(v10)
                    if v11 then
                        v9 = SoundPool.new({
                            size = 6,
                            audioGroup = "Towers",
                            id = v11,
                            parent = a1.Model.HumanoidRootPart,
                            volume = v8.Volume,
                        })
                        a1._soundPools[v8] = v9
                    end
                end
                if v9 then
                    local Attribute = v8:GetAttribute("PlaybackSpeed") or v8.PlaybackSpeed or 1
                    v9:play({
                        playbackSpeed = (Random.new()):NextNumber(Attribute * 0.9, Attribute * 1.2),
                        volume = v8.Volume,
                    })
                end
            end
            u93.PointLight.Enabled = true
            TweenService:Create(u93.PointLight, TweenInfo.new(0.01), {Brightness = 3}):Play()
            a1:Delay(0.01, function() -- Line: 140 -- upvalues: TweenService (upval), u93 (val)
                TweenService:Create(
                    u93.PointLight,
                    TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
            end)
            EmitterManager.manualEmit(Attachment)
            EmitterManager.manualEmit(u93)
        end
        a1._lastAnimation = a1:_playAnimation(("Fire%*"):format(a1._fireNumber), 0)
    end,
    backup = function(a1) -- Line: 256 -- upvalues: SoundService (val), SoundPool (val), GameState (val)
        local _soundPools = a1._soundPools or {}
        a1._soundPools = _soundPools
        local SummonMax = not (a1:GetLevel() ~= 4) and a1.Model.HumanoidRootPart.SummonMax or a1.Model.HumanoidRootPart.Summon
        if SummonMax and SummonMax:IsA("Sound") then
            if SoundService:FindFirstChild("Towers") then
                SummonMax.SoundGroup = SoundService.Towers
            end
            local v1 = a1._soundPools[SummonMax]
            if not v1 then
                local v2 = string.match(SummonMax.SoundId or "", "%d+")
                local v3 = v2 and tonumber(v2)
                if v3 then
                    v1 = SoundPool.new({
                        size = 2,
                        audioGroup = "Towers",
                        id = v3,
                        parent = a1.Model.HumanoidRootPart,
                        volume = SummonMax.Volume,
                    })
                    a1._soundPools[SummonMax] = v1
                end
            end
            if v1 then
                v1:play({playbackSpeed = GameState.TimeScale, volume = SummonMax.Volume})
            end
        end
        a1:_playAnimation("Summon", 0)
    end,
    piggyBank = function(a1) -- Line: 195
        -- upvalues: ReplicatedStorage (val), spr (val), TimescaleUtilities (val), TweenService (val), tix (val)
        -- upvalues: EmitterManager (val)
        if workspace:FindFirstChild("Pig") then
            return
        end
        local u13 = ReplicatedStorage.Assets.Effects.Client.Pig:Clone()
        local Position = a1.Model.PrimaryPart.Position
        local v1 = (CFrame.new(Position)) * CFrame.new(0, u13:GetExtentsSize().Y / 2 + 18, 0)
        local v2 = (CFrame.new(Position)) * CFrame.new(0, u13:GetExtentsSize().Y / 2 + 60, 0)
        local CFrameValue = Instance.new("CFrameValue")
        CFrameValue.Value = v2
        local NumberValue = Instance.new("NumberValue")
        NumberValue.Value = 500
        local NumberValue_2 = Instance.new("NumberValue")
        NumberValue_2.Value = 500
        CFrameValue.Changed:Connect(function() -- Line: 210 -- upvalues: u13 (val), CFrameValue (val), NumberValue (val), NumberValue_2 (val)
            u13:PivotTo(CFrameValue.Value * CFrame.Angles(math.rad(NumberValue.Value / 100), 0, 0) * (CFrame.Angles(0, math.rad(NumberValue_2.Value / 4), 0)))
        end)
        spr.target(NumberValue_2, 0.3, 0.35, {Value = 100})
        spr.target(NumberValue, 0.4, 0.4, {Value = 0})
        spr.target(CFrameValue, 0.7, 0.7, {Value = v1})
        u13.Parent = workspace
        u13.Main.PointLight.Enabled = true
        TimescaleUtilities.Delay(4, function() -- Line: 222
            -- upvalues: TweenService (upval), u13 (val), NumberValue (val), NumberValue_2 (val), CFrameValue (val)
            -- upvalues: tix (upval), TimescaleUtilities (upval), EmitterManager (upval)
            TweenService:Create(u13.Main.PointLight, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Brightness = 5}):Play()
            NumberValue:Destroy()
            NumberValue_2:Destroy()
            CFrameValue:Destroy()
            task.spawn(function() -- Line: 231 -- upvalues: u13 (upval)
                u13.Main.Intro:Play()
                u13.Main.Intro.Ended:Wait()
                u13.Main.Loop:Play()
            end)
            tix()
            TimescaleUtilities.Delay(0.25, function() -- Line: 237 -- upvalues: TweenService (upval), u13 (upval), EmitterManager (upval)
                TweenService:Create(
                    u13.Main.PointLight,
                    TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
                u13.Main.Loop:Stop()
                u13.Main.Stop:Play()
                task.wait(4)
                local v1 = u13.Explosion:Clone()
                v1.Poof:Play()
                task.wait(0.2)
                v1.Parent = workspace
                u13:Destroy()
                EmitterManager.manualEmit(v1)
            end)
        end)
    end,
}