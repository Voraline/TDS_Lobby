-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Accelerator.Animator
-- Decompile time: 1.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: EmitterManager (val), Animation (val)
    local Animator = a1.Model.AnimationController.Animator
    a1._animations = {}
    local BeamVFX = a1.Model.BeamVFX
    local Value = a1.Model.Beam.Value

    local function createBeam(a1, a2) -- Line: 26 -- upvalues: BeamVFX (val), EmitterManager (upval), Value (val)
        local u5 = BeamVFX:Clone()
        local RigidConstraint = Instance.new("RigidConstraint")
        RigidConstraint.Attachment0 = a1
        RigidConstraint.Attachment1 = u5.Start.Start
        RigidConstraint.Parent = u5.Start
        u5.Start.Anchored = false
        u5.End.End.WorldCFrame = CFrame.new(a2)
        u5.Parent = workspace.Trash
        EmitterManager.toggle(u5, true)
        return {
            clean = function() -- Line: 41 -- upvalues: EmitterManager (upval), u5 (val)
                EmitterManager.toggle(u5, false)
                task.delay(1, function() -- Line: 43 -- upvalues: u5 (upval)
                    u5:Destroy()
                end)
            end,
            beam = Value,
        }
    end

    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    a1.Maid:Mark(function() -- Line: 17 -- upvalues: a1 (val)
        if a1._beams then
            for i, j in a1._beams do
                j.clean()
            end
            a1._beams = nil
        end
    end)
    a1.Executables = {
        Beam = function(a1_2, a2) -- Line: 64 -- upvalues: a1 (val), createBeam (val), Value (val)
            a1:Face(a1_2.PrimaryPart.Position, TweenInfo.new(0.6), true)
            a1._animations.Charge:Play()
            a1._animations.Loop:Play()
            a1:Delay(0.14)
            if a1._beams then
                for i, j in a1._beams do
                    j.clean()
                end
                a1._beams = nil
            end
            a1._beams = {}
            table.insert(a1._beams, (createBeam(Value, a1_2.PrimaryPart.Position)))
            a1:Delay(1, function() -- Line: 77 -- upvalues: a2 (val), a1_2 (val), a1 (upval), createBeam (upval)
                if a2.Parent then
                    if not a1_2.PrimaryPart:FindFirstChild("AccelAttachment") then
                        local Attachment = Instance.new("Attachment")
                        Attachment.Parent = a1_2.PrimaryPart
                        Attachment.Name = "AccelAttachment"
                    end
                    table.insert(a1._beams, (createBeam(a1_2.PrimaryPart.AccelAttachment, a2.PrimaryPart.Position)))
                end
            end)
        end,
        StopBeams = function() -- Line: 93 -- upvalues: a1 (val)
            a1._animations.Loop:Stop()
            a1._animations.Charge:Stop()
            a1._animations.Outro:Play()
            if a1._beams then
                for i, j in a1._beams do
                    j.clean()
                end
                a1._beams = nil
            end
        end,
    }
end

return v1