-- Script path: ReplicatedStorage.Content.Tower.Assassin.Animator
-- Decompile time: 6.92 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local Part = Instance.new("Part")
Part.Size = Vector3.new(1, 1, 1)
Part.Anchored = true
Part.CanCollide = false
Part.CanTouch = false
Part.Transparency = 1
local Model = Instance.new("Model")
Model.Name = "Crit"
Part.Parent = Model
local u48 = Random.new()
local v1 = {}
v1.__index = v1

local function _getTravelTime(a1, a2, a3) -- Line: 28
    return (a2 - a1).Magnitude / a3
end

local function _launchKnife(a1, a2, a3, a4) -- Line: 35 -- upvalues: NewTween (val)
    NewTween(a1, TweenInfo.new(a4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), function(a1_2) -- Line: 39 -- upvalues: a2 (val), a3 (val), a1 (val)
        a1.CFrame = CFrame.new(a2:Lerp(a3, a1_2), a3)
    end)
end

function v1:_setupEffectsInBones(a2) -- Line: 46
    local Effects = self.Upgrades[a2]:FindFirstChild("Effects")
    if Effects then
        local Attachment, ParentBone, v1, v2
        for i, j in Effects:GetChildren() do
            ParentBone = j:FindFirstChild("ParentBone")
            if ParentBone then
                Attachment = j:FindFirstChildOfClass("Attachment")
                v1 = ParentBone.Value:FindFirstChild(Attachment.Name, true)
                if v1 then
                    v1:Destroy()
                end
                v2 = Attachment:Clone()
                v2.Parent = ParentBone.Value
            end
        end
    end
end

function v1:_loadAnimations(a2) -- Line: 68 -- upvalues: Animation (val) -- types: self: table, a2: number
    for k, v in pairs(self._animations) do
        v:Stop(0)
    end
    table.clear(self._animations)
    local v1 = 0
    local v2 = self
    for i = 1, a2 do
        if (v2._animationFolder:WaitForChild("Fire")):FindFirstChild(i) then
            v1 = i
        end
    end
    for j, k2 in v2._animationFolder:WaitForChild("Fire")[v1]:GetChildren() do
        v2._animations[k2.Name] = (Animation.new({
            Preload = true,
            IgnorePriority = true,
            IsPersistent = true,
            Speed = 1.8,
            Target = v2._animator,
            Track = k2,
        }))
    end
    local v3 = v2._animationFolder:WaitForChild("Idle")[v1]
    v2._animations.Idle = Animation.new({IgnorePriority = true, IsPersistent = true, Target = v2._animator, Track = v3}):Play(0)
end

function v1.Initialize(a1) -- Line: 103
    -- upvalues: Animation (val), EasySound (val), u48 (val), EmitterManager (val), Debris (val)
    -- upvalues: TimescaleUtilities (val), NewTween (val)
    a1:_setupEffectsInBones((a1:GetLevel()))
    a1._animator = (a1.Model:WaitForChild("AnimationController")):WaitForChild("Animator")
    a1._animationFolder = a1.Model:WaitForChild("Animations")
    a1._animations = {}
    a1:_loadAnimations((a1:GetLevel()))
    a1.Maid:Mark((a1.OnUpgrade:Connect(function() -- Line: 111 -- upvalues: a1 (val)
        a1:_loadAnimations((a1:GetLevel()))
    end)))
    local Hit = a1.Model.Effects:WaitForChild("Hit")
    local Attribute = Hit:GetAttribute("UseRandom")

    local function getSlashVFX() -- Line: 117 -- upvalues: Attribute (val), Hit (val)
        if Attribute then
            local Children = Hit:GetChildren()
            return Children[(Random.new()):NextInteger(1, #Children)]
        end
        Hit.PrimaryPart.Anchored = true
        return Hit
    end

    local u59 = Animation.new({
        Preload = true,
        IgnorePriority = true,
        IsPersistent = true,
        Speed = 1.4,
        Target = a1._animator,
        Track = (a1._animationFolder:WaitForChild("Throw"))[0],
    })

    local function hitVFX(a1_2) -- Line: 136
        -- upvalues: a1 (val), EasySound (upval), u48 (upval), Attribute (val), Hit (val), EmitterManager (upval)
        -- upvalues: Debris (upval)
        local v1
        if not a1_2 then
            return
        end
        local HitSFX = a1.Model.Weapon:FindFirstChild("HitSFX", true)
        if HitSFX and HitSFX:IsA("Sound") then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = HitSFX.SoundId,
                parent = HitSFX.Parent,
                playbackSpeed = HitSFX.PlaybackSpeed,
            })
        end
        local v2 = u48:NextNumber(-0.5, 0.5)
        local v3 = u48:NextNumber(-0.5, 0.5)
        local v4 = u48:NextNumber(-0.5, 0.5)
        local v5 = u48:NextNumber(-45, 45)
        if not Attribute then
            Hit.PrimaryPart.Anchored = true
            v1 = Hit
        else
            local Children = Hit:GetChildren()
            v1 = Children[(Random.new()):NextInteger(1, #Children)]
        end
        v1 = v1:Clone()
        v1:ScaleTo(a1_2.Hitbox.Size.Y / 2)
        v1:PivotTo(a1_2.PrimaryPart.CFrame * ((CFrame.new(v2, v3, v4)) * CFrame.Angles(math.rad(v5), math.rad(v5), (math.rad(v5)))))
        EmitterManager.manualEmit(v1)
        v1.Parent = workspace
        Debris:AddItem(v1, 2)
    end

    local function swingVFX(a1_2) -- Line: 168
        -- upvalues: a1 (val), EasySound (upval), EmitterManager (upval), TimescaleUtilities (upval)
        local SwingTrail
        local v1 = a1.Model.Weapon:FindFirstChild("Swing" .. a1_2, true)
        if not (a1_2 < 3) then
            SwingTrail = a1.Model.Effects:FindFirstChild((("Slash%*"):format(if a1:GetLevel() ~= 4 then 2 else 4)))
        else
            SwingTrail = a1.Model.PrimaryPart:FindFirstChild("SwingTrail", true)
            if not SwingTrail then
                SwingTrail = a1.Model.Effects:FindFirstChild((("Slash%*"):format(if a1:GetLevel() ~= 4 then 2 else 4)))
            end
        end
        if a1_2 == 3 and SwingTrail and SwingTrail:GetAttribute("UseRandom") then
            local Children = SwingTrail:GetChildren()
            SwingTrail = Children[(Random.new()):NextInteger(1, #Children)]
        end
        if v1 and v1:IsA("Sound") then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = v1.SoundId,
                parent = v1.Parent,
                playbackSpeed = v1.PlaybackSpeed,
            })
        end
        if a1_2 == 3 then
            (a1._swingAnim.Controller:GetMarkerReachedSignal("Effect")):Once(function() -- Line: 190 -- upvalues: EmitterManager (upval), SwingTrail (ref)
                EmitterManager.manualEmit(SwingTrail)
            end)
        end
        if a1._swingThread then
            task.cancel(a1._swingThread)
        end
        ;(a1._swingAnim.Controller:GetMarkerReachedSignal("Trail")):Once(function() -- Line: 199 -- upvalues: EmitterManager (upval), SwingTrail (ref)
            EmitterManager.toggle(SwingTrail, true)
        end)
        a1._swingThread = task.spawn(function() -- Line: 203 -- upvalues: TimescaleUtilities (upval), EmitterManager (upval), SwingTrail (ref)
            TimescaleUtilities.Wait(0.2)
            EmitterManager.toggle(SwingTrail, false)
        end)
    end

    a1.Executables = {
        Hit = function(a1) -- Line: 210 -- upvalues: hitVFX (val)
            if typeof(a1) ~= "table" then
                hitVFX(a1)
                return
            end
            for i, j in a1 do
                hitVFX(j)
            end
        end,
        Attack = function(a1_2) -- Line: 219 -- upvalues: a1 (val), swingVFX (val)
            if a1._swingAnim then
                a1._swingAnim:Stop(0)
            end
            a1._swingAnim = a1._animations["Swing" .. a1_2]
            a1._swingAnim:Play(0.06666666666666667)
            swingVFX(a1_2)
        end,
        KnifeFan = function() -- Line: 229 -- upvalues: a1 (val), EasySound (upval), u59 (val), EmitterManager (upval), NewTween (upval)
            local Throw = a1.Model.PrimaryPart:FindFirstChild("Throw")
            if Throw and Throw:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = Throw.SoundId,
                    parent = a1.Model.PrimaryPart,
                    playbackSpeed = Throw.PlaybackSpeed,
                })
            end
            u59:Play()
            ;(u59.Controller:GetMarkerReachedSignal("Show")):Once(function() -- Line: 244 -- upvalues: a1 (upval)
                local v1
                for i = 1, 3 do
                    v1 = a1.Model.Weapon:FindFirstChild((("ThrowingKnife%*"):format(i)))
                    v1.Transparency = 0
                end
            end)
            ;(u59.Controller:GetMarkerReachedSignal("Throw")):Once(function() -- Line: 251 -- upvalues: a1 (upval), EmitterManager (upval), NewTween (upval)
                local CFrame_2, Motor6D, ThrowingKnife1, v1, v2, v3
                for i = 1, 3 do
                    v1 = a1.Model.Weapon:FindFirstChild((("ThrowingKnife%*"):format(i)))
                    v1.Transparency = 1
                end
                for j = -1, 1 do
                    v1 = math.rad(j * 15)
                    CFrame_2 = a1.Model.PrimaryPart.CFrame
                    v2 = CFrame_2 * CFrame.Angles(0, v1, 0)
                    v3 = v2.LookVector * a1.Stats.Attributes.KnifeFanRange
                    local Position = CFrame_2.Position
                    local u49 = v2.Position + v3
                    local u52 = (Position - u49).Magnitude / 75
                    ThrowingKnife1 = a1.Model.Weapon:FindFirstChild("ThrowingKnife1", true)
                    if not ThrowingKnife1 then
                        return
                    end
                    local u64 = ThrowingKnife1:Clone()
                    u64.Transparency = 0
                    u64.Parent = workspace.Terrain
                    Motor6D = u64:FindFirstChildOfClass("Motor6D", true) or u64:FindFirstChildOfClass("RigidConstraint", true)
                    if Motor6D then
                        Motor6D:Destroy()
                    end
                    EmitterManager.toggle(u64, true)
                    local u89 = u64
                    NewTween(u89, TweenInfo.new(u52, Enum.EasingStyle.Linear, Enum.EasingDirection.In), function(a1) -- Line: 39 -- upvalues: Position (val), u49 (val), u89 (val)
                        u89.CFrame = CFrame.new(Position:Lerp(u49, a1), u49)
                    end)
                    task.defer(function() -- Line: 284 -- upvalues: u52 (val), u64 (ref)
                        task.wait(u52 + 1)
                        u64:Destroy()
                    end)
                end
            end)
        end,
    }
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 293 -- upvalues: a1 (val)
        a1:_setupEffectsInBones(a1_2)
        if not a1.Model.Upgrades:FindFirstChild(a1_2) then
            return
        end
        for i, j in a1.Model.Upgrades[a1_2]:GetDescendants() do
            if j:GetAttribute("Face") then
                j.Transparency = 0
            end
        end
    end)
end

return v1