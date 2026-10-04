-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Spawner.Animator
-- Decompile time: 2.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local u16 = {"Walk"}

function v1:_tweenBeamTransparency(a2) -- Line: 18 -- upvalues: TweenService (val) -- types: self: table, a2: number
    TweenService:Create(self._beamTransparency, TweenInfo.new(1), {Value = a2}):Play()
end

function v1:_playSound(a2) -- Line: 24 -- types: self: table, a2: string
    local v1 = self.Model.HumanoidRootPart:FindFirstChild(a2)
    if v1 then
        v1:Play()
        return
    end
    warn((("sound %* not found!"):format(a2)))
end

function v1:_stopSound(a2) -- Line: 33 -- types: self: table, a2: string
    local v1 = self.Model.HumanoidRootPart:FindFirstChild(a2)
    if v1 and v1.IsPlaying then
        v1:Stop()
        return
    end
    warn((("sound %* not found!"):format(a2)))
end

function v1:_playAnimation(a2, ...) -- Line: 42 -- types: self: table, a2: string
    for i, j in self.Animations do
        j:Stop()
    end
    local v1 = self._animationCallbacks[a2]
    if v1 and v1.Start then
        v1.Start()
    end
    self.Animations[a2]:Play(...)
end

function v1._emit(a1, a2) -- Line: 56
    local Attribute
    for i, j in a2:GetChildren() do
        Attribute = j:GetAttribute("EmitCount")
        j:Emit(Attribute)
    end
end

function v1:_setupAnimations() -- Line: 62 -- upvalues: u16 (val), Animation (val)
    self.Animations = {}
    for i, j in self.Model.Animations:GetChildren() do
        if j:IsA("Animation") and not table.find(u16, j.Name) then
            self.Animations[j.Name] = (Animation.new({
                IgnorePriority = true,
                IsPersistent = true,
                Preload = true,
                Track = j,
                Target = self.Model.AnimationController.Animator,
                Callback = function() -- Line: 67 -- upvalues: self (val), j (val)
                    if not self._animationCallbacks[j.Name] then
                        return
                    end
                    local v1 = self._animationCallbacks[j.Name]
                    if v1.End then
                        v1.End()
                    end
                end,
            }))
        end
    end
end

function v1.Initialize(a1) -- Line: 89
    a1:_setupAnimations()
    a1:_playSound("Drive")
    a1._beamTransparency = Instance.new("NumberValue")
    a1._beamTransparency.Name = "BeamTransparency"
    a1._beamTransparency.Value = 0
    a1:BindToStep("BeamTransparency", function() -- Line: 97 -- upvalues: a1 (val)
        for i, j in a1.Model.SpaceRoot:GetChildren() do
            if j:FindFirstChild("Beam") then
                j.Beam.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.116, 1),
                    NumberSequenceKeypoint.new(0.356, a1._beamTransparency.Value),
                    (NumberSequenceKeypoint.new(1, 1)),
                })
            end
        end
    end)
    a1._animationCallbacks = {}
    a1.Executables = {
        Driving = function() -- Line: 112 -- upvalues: a1 (val)
            a1:_tweenBeamTransparency(0.438)
            for i, j in a1.Model.SpaceRoot:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = true
                end
            end
            a1:_playAnimation("Close")
            a1:_playSound("Drive")
            a1:_playSound("Close")
        end,
        Stopped = function() -- Line: 124 -- upvalues: a1 (val)
            a1:_tweenBeamTransparency(1)
            for i, j in a1.Model.SpaceRoot:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = false
                end
            end
            a1:_stopSound("Drive")
            a1.Animations.Open:AdjustSpeed(1)
            a1:_playAnimation("Open")
            a1:_playSound("Open")
            a1:Wait(0.6666666666666666)
            a1.Animations.Open:Pause()
        end,
    }
end

return v1