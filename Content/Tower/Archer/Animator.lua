-- Script path: ReplicatedStorage.Content.Tower.Archer.Animator
-- Decompile time: 8.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Cooldown = require(ReplicatedStorage.Client.Modules.Cooldown)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

local function _findAnimation(a1, a2, a3) -- Line: 11
    local v1 = a1:FindFirstChild(a2)
    if not v1 then
        return nil
    end
    local v2 = v1:IsA("Animation") and v1
    local v3 = v1:IsA("Folder") and v1
    if v2 then
        return v2
    end
    if v3 then
        local v4 = v3:FindFirstChild((tostring(a3 or 0)))
        if not v4 then
            return nil
        end
        local v5 = v4:IsA("Animation") and v4
        local v6 = v4:IsA("Folder") and v4
        if v5 then
            return v5
        end
        if v6 then
            return v6:FindFirstChildOfClass("Animation")
        end
    end
    return nil
end

local function _getTravelTime(a1, a2, a3) -- Line: 46
    return (a2 - a1).Magnitude / a3
end

local function _getSound(a1) -- Line: 53
    if a1:IsA("Sound") then
        return a1
    end
    local Children = not a1:IsA("Sound") and a1:GetChildren()
    local v1 = Children[math.random(1, #Children)]
    if v1:IsA("Sound") then
        return v1
    end
    return nil
end

local v1 = {}
v1.__index = v1

function v1:PlayHitEffect(a2) -- Line: 70
    -- upvalues: _getSound (val), EasySound (val), EmitterManager (val), TimescaleUtilities (val)
    local u92
    local Effects = self.Model:FindFirstChild("Effects")
    local v1 = self.ArrowType == "Explosive"
    local v2 = nil
    if self.ArrowType == "Normal" then
        v2 = Effects:FindFirstChild((("Hit%*%*"):format(self.ArrowType, self.Upgrade))) or Effects:FindFirstChild((("Hit%*0"):format(self.ArrowType)))
    end
    if self.ArrowType == "Flame" or self.ArrowType == "Shock" or v1 then
        v2 = Effects:FindFirstChild((("Hit%*"):format(self.ArrowType)))
    end
    if not v1 then
        u92 = v2:FindFirstChild("root"):Clone()
        u92.Position = a2
    else
        u92 = v2:FindFirstChild("explosion"):Clone()
        local v3 = self.Stats.Attributes.ExplosiveRadius * 2
        u92:ScaleTo(v3)
        v3 = CFrame.new(a2)
        u92:PivotTo(v3)
    end
    u92.Parent = workspace.Terrain
    local v4 = _getSound((u92:FindFirstChild("HitSound", true)))
    if v4 then
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = v4.SoundId,
            parent = u92,
            playbackSpeed = v4.PlaybackSpeed or 1,
        })
    end
    EmitterManager.manualEmit(u92)
    task.defer(function() -- Line: 111 -- upvalues: TimescaleUtilities (upval), u92 (ref)
        TimescaleUtilities.Wait(2)
        u92:Destroy()
    end)
end

function v1:LaunchArrows(a2, a3) -- Line: 117 -- upvalues: NewTween (val), TimescaleUtilities (val), GameState (val)
    if not a2 then
        return
    end
    local Position = a2.Position
    local u6 = a2:Clone()
    local Motor6D = u6:FindFirstChildOfClass("Motor6D")
    if Motor6D then
        Motor6D:Destroy()
    end
    u6.Parent = workspace.Terrain
    self:SetArrowParticle(true, u6)

    local function _launchArrow(a1, a2, a3, a4) -- Line: 132 -- upvalues: NewTween (upval)
        NewTween(a1, TweenInfo.new(a4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), function(a1_2) -- Line: 136 -- upvalues: a2 (val), a3 (val), a1 (val)
            a1.CFrame = CFrame.new(a2:Lerp(a3, a1_2), a3)
        end)
    end

    task.defer(function() -- Line: 143
        -- upvalues: a3 (val), Position (val), self (val), u6 (val), NewTween (upval), TimescaleUtilities (upval)
        -- upvalues: GameState (upval)
        local v1, v2, v3, v4, v5
        local v6 = #a3
        if not (v6 > 1) then
            v6 = a3[1]
            if not v6 then
                return
            end
            local u113 = (CFrame.new(Position, v6)) * CFrame.new(0, 0, -self.Stats.Range).Position
            v2 = (Position - u113).Magnitude / 100 / GameState.TimeScale
            local u121 = u6
            local u122 = Position
            NewTween(u121, TweenInfo.new(v2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), function(a1) -- Line: 136 -- upvalues: u122 (val), u113 (val), u121 (val)
                u121.CFrame = CFrame.new(u122:Lerp(u113, a1), u113)
            end)
            TimescaleUtilities.Wait(v2)
            self:PlayHitEffect(v6)
            TimescaleUtilities.Wait(1)
            u6:Destroy()
            return
        end
        local v7 = nil
        v2 = nil
        for i, j in a3, v7, v2 do
            v3 = i == 1
            v4 = i == #a3
            v5 = a3[i - 1]
            if not v3 then
                u28 = v5
            else
                local u28 = Position
                if not u28 then
                    u28 = v5
                end
            end
            if not v4 then
                Position_2 = j
            else
                local Position_2 = ((CFrame.new(v5, j)) * CFrame.new(0, 0, -self.Stats.Range)).Position
                if not Position_2 then
                    Position_2 = j
                end
            end
            v1 = (u28 - Position_2).Magnitude / 100
            local u60 = u6
            NewTween(u60, TweenInfo.new(v1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), function(a1) -- Line: 136 -- upvalues: u28 (val), Position_2 (val), u60 (val)
                u60.CFrame = CFrame.new(u28:Lerp(Position_2, a1), Position_2)
            end)
            TimescaleUtilities.Wait(v1)
            self:PlayHitEffect(j)
        end
        TimescaleUtilities.Wait(1)
        u6:Destroy()
    end)
end

function v1:SetArrowParticle(a2, a3) -- Line: 191 -- upvalues: EmitterManager (val)
    local Effects = self.Model:FindFirstChild("Effects")
    local Arrow = a3
    if not Arrow then
        Arrow = self.Model.Weapon:FindFirstChild("Arrow")
    end

    local function _cleanup() -- Line: 195 -- upvalues: Arrow (val)
        for i, j in Arrow:GetChildren() do
            if j:IsA("ParticleEmitter") or j:IsA("Attachment") then
                j:Destroy()
            end
        end
    end

    local function _setEffect(a1) -- Line: 203 -- upvalues: Arrow (val)
        local v1
        for i, j in a1.root:GetChildren() do
            v1 = j:Clone()
            v1.Parent = Arrow
        end
    end

    if Effects and Arrow then
        _cleanup()
        if not a2 then
            return
        end
        local v1 = self.Upgrade or 0
        local v2 = Effects:FindFirstChild(self.ArrowType) or Effects:FindFirstChild((tostring(v1))) or Effects:FindFirstChild("0")
        if v2 then
            for i, j in v2.root:GetChildren() do
                j:Clone().Parent = Arrow
            end
        end
        EmitterManager.toggle(Arrow, a2)
    end
end

function v1.Initialize(a1) -- Line: 230
    -- upvalues: Animation (val), _findAnimation (val), _getSound (val), GameState (val), EmitterManager (val)
    -- upvalues: EasySound (val), TimescaleUtilities (val), Cooldown (val)
    if a1.FBXModel ~= nil then end
    a1.ArrowType = "Normal"
    a1.Aiming = false
    a1.ChargedDebounce = nil
    a1._cachedArrowTemplate = nil
    local u20 = Animation.new({
        Track = _findAnimation(a1.Model.Animations, "Fire", 0),
        Target = a1.Model.AnimationController,
    })

    local function getArrow() -- Line: 246 -- upvalues: a1 (val)
        local Weapon = a1.Model:FindFirstChild("Weapon")
        local Arrow = Weapon and Weapon:FindFirstChild("Arrow", true)
        if Arrow and Arrow:IsA("BasePart") then
            a1._cachedArrowTemplate = Arrow:Clone()
            return Arrow
        end
        if a1._cachedArrowTemplate and a1._cachedArrowTemplate:IsA("BasePart") then
            local v1 = a1._cachedArrowTemplate:Clone()
            local ArrowStart = a1.Model.PrimaryPart:FindFirstChild("ArrowStart", true)
            if ArrowStart and ArrowStart:IsA("BasePart") then
                v1.CFrame = ArrowStart.CFrame
                return v1
            end
            v1.CFrame = a1.Model.PrimaryPart.CFrame
            return v1
        end
        return nil
    end

    local function Fire(a1_2) -- Line: 270
        -- upvalues: a1 (val), _getSound (upval), getArrow (val), u20 (ref), GameState (upval), EmitterManager (upval)
        -- upvalues: EasySound (upval), TimescaleUtilities (upval)
        local Arrow = a1.Model.Weapon:FindFirstChild("Arrow")
        local OnFire = a1.Model.PrimaryPart:FindFirstChild("OnFire", true)
        local Fire = a1.Model.PrimaryPart:FindFirstChild("Fire")
        local u25 = _getSound(Fire)
        local u26 = false

        local function launchProjectile() -- Line: 277 -- upvalues: u26 (ref), a1 (upval), getArrow (upval), a1_2 (val)
            if u26 then
                return
            end
            u26 = true
            a1:LaunchArrows(getArrow(), a1_2)
        end

        a1.Aiming = false
        local Cooldown = a1.Cooldown
        local v1 = u20.Controller.Length / Cooldown
        u20.Controller:AdjustSpeed(v1 * GameState.TimeScale)
        ;(u20.Controller:GetMarkerReachedSignal("Show")):Once(function() -- Line: 295 -- upvalues: Arrow (val)
            if Arrow then
                Arrow.Transparency = 0
            end
        end)
        ;(u20.Controller:GetMarkerReachedSignal("Hide")):Once(function() -- Line: 301 -- upvalues: Arrow (val)
            if Arrow then
                Arrow.Transparency = 1
            end
        end)
        ;(u20.Controller:GetMarkerReachedSignal("Fire")):Once(function() -- Line: 307
            -- upvalues: u26 (ref), a1 (upval), getArrow (upval), a1_2 (val), OnFire (val), EmitterManager (upval)
            -- upvalues: u25 (val), EasySound (upval)
            if not u26 then
                u26 = true
                a1:LaunchArrows(getArrow(), a1_2)
            end
            if OnFire then
                EmitterManager.manualEmit(OnFire)
            end
            if u25 then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = u25.SoundId,
                    parent = a1.Model.PrimaryPart,
                    playbackSpeed = u25.PlaybackSpeed or 1,
                })
            end
        end)
        TimescaleUtilities.Delay(0.2, function() -- Line: 325 -- upvalues: u26 (ref), a1 (upval), getArrow (upval), a1_2 (val)
            if u26 then
                return
            end
            u26 = true
            a1:LaunchArrows(getArrow(), a1_2)
        end)
    end

    local function AimToggle(a1_2, a2) -- Line: 330
        -- upvalues: a1 (val), u20 (ref), GameState (upval), Cooldown (upval)
        if not a1_2 then
            if a1.Aiming == true then
                if a1.ChargedDebounce and a1.ChargedDebounce:isActive() then
                    return
                end
                a1.Aiming = false
                u20.Controller:AdjustSpeed(-1)
            end
            return
        end
        local PrimaryPart = a2 and a2.PrimaryPart
        if not PrimaryPart then
            return
        end
        if a1.Aiming == false then
            if not u20.Controller or not u20.Controller.IsPlaying then
                a1.Aiming = true
                u20:Play()
                local Cooldown_2 = a1.Cooldown
                local v1 = u20.Controller.Length / Cooldown_2
                u20.Controller:AdjustSpeed(v1 * GameState.TimeScale)
                task.defer(function() -- Line: 349 -- upvalues: u20 (upval), a1 (upval)
                    (u20.Controller:GetMarkerReachedSignal("Aiming")):Once(function() -- Line: 350 -- upvalues: a1 (upval), u20 (upval)
                        if a1.Aiming then
                            u20.Controller:AdjustSpeed(0)
                        end
                    end)
                end)
            end
        end
        a1.ChargedDebounce = Cooldown.new(a1.Cooldown + 0.5)
        a1:Face(PrimaryPart.Position)
    end

    a1.OnUpgrade:Connect(function(a1_2) -- Line: 374 -- upvalues: a1 (val), u20 (ref), _findAnimation (upval), Animation (upval)
        if a1.Model.Name == "Spooky" then
            a1.Upgrades[a1_2 - 1]:ClearAllChildren()
        end
        local Effects = a1.Upgrades[a1_2]:FindFirstChild("Effects")
        if Effects then
            local ParentBone, v1
            for i, j in Effects:GetChildren() do
                ParentBone = j:FindFirstChild("ParentBone")
                if ParentBone then
                    v1 = j:Clone()
                    v1.Parent = ParentBone.Value
                end
            end
        end
        local IsPlaying = false
        local TimePosition = 0
        local Speed = 1
        if u20.Controller then
            IsPlaying = u20.Controller.IsPlaying
            TimePosition = u20.Controller.TimePosition
            Speed = u20.Controller.Speed
        end
        local v2 = _findAnimation(a1.Model.Animations, "Fire", a1_2)
        if v2 then
            u20:Stop(0)
            u20 = nil
            u20 = Animation.new({Track = v2, Target = a1.Model.AnimationController})
            if IsPlaying then
                u20:Play()
                u20.Controller.TimePosition = TimePosition
                u20.Controller:AdjustSpeed(Speed)
            end
        end
    end)
    a1:Thread(function() -- Line: 424 -- upvalues: a1 (val), AimToggle (val)
        local v1 = a1:FindTarget()
        AimToggle(v1 ~= nil, v1)
    end)
    a1.Executables = {
        Projectile = function(a1) -- Line: 432 -- upvalues: Fire (val)
            Fire(a1)
        end,
        UpdateArrow = function(a1_2) -- Line: 435 -- upvalues: a1 (val)
            a1.ArrowType = a1_2 or "Normal"
        end,
    }
end

return v1