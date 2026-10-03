-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Medic.Animator
-- Decompile time: 2.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: Animation (val), ReplicatedStorage (val)
    local Animator = a1.Model.AnimationController.Animator
    a1._animations = {}
    a1._enemeyBeams = {}
    a1._currentBeams = {}
    a1._shield = nil
    a1.Maid:Mark(function() -- Line: 16 -- upvalues: a1 (val)
        if a1._shield then
            a1._shield:Destroy()
        end
        local v1 = nil
        local v2 = nil
        for i, j in a1._currentBeams, v1, v2 do
            for k, n in j do
                n:Destroy()
            end
        end
    end)
    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    a1.Executables = {
        Charge = function() -- Line: 39 -- upvalues: a1 (val)
            a1._animations.ShootLoop:Play()
            a1._animations.Charge:Play()
            for i, j in a1.Model.MuzzleFlash.Value:GetChildren() do
                j.Enabled = true
            end
        end,
        Outro = function() -- Line: 47 -- upvalues: a1 (val)
            a1._animations.ShootLoop:Stop()
            a1._animations.Charge:Stop()
            a1._animations.Outro:Play()
            for i, j in a1.Model.MuzzleFlash.Value:GetChildren() do
                j.Enabled = false
            end
        end,
        HealingBeams = function(a1_2) -- Line: 57 -- upvalues: a1 (val)
            a1._enemeyBeams = a1_2
        end,
        Shield = function(a1_2) -- Line: 60 -- upvalues: a1 (val), ReplicatedStorage (upval)
            if a1._shield then
                a1._shield:Destroy()
                a1._shield = nil
            end
            if a1_2 then
                local v1 = ReplicatedStorage.Assets.Effects.Mob["Corrupted Medic"].Shield:Clone()
                v1.CFrame = a1.Model.PrimaryPart.CFrame
                v1.Name = "CorruptedMedicShield"
                local WeldConstraint = Instance.new("WeldConstraint")
                WeldConstraint.Part0 = a1.Model.PrimaryPart
                WeldConstraint.Part1 = v1
                WeldConstraint.Parent = v1
                v1.Parent = workspace.Terrain
                a1._shield = v1
            end
        end,
    }
    a1:BindToStep("UpdateBeams", function() -- Line: 83 -- upvalues: a1 (val), ReplicatedStorage (upval)
        local CorruptedMedicBeamAttachment, v1, v2
        local v3 = nil
        local v4 = nil
        for i, j in a1._currentBeams, v3, v4 do
            if not table.find(a1._enemeyBeams, i) then
                for k, n in j do
                    n:Destroy()
                end
                a1._currentBeams[i] = nil
            end
        end
        v3 = nil
        v4 = nil
        for m, i5 in a1._enemeyBeams, v3, v4 do
            if not a1._currentBeams[i5] and i5.Parent and i5.PrimaryPart then
                v2 = {}
                for i6, i7 in ReplicatedStorage.Assets.Effects.Mob["Corrupted Medic"].Beams:GetChildren() do
                    CorruptedMedicBeamAttachment = i5.PrimaryPart:FindFirstChild("CorruptedMedicBeamAttachment")
                    if not CorruptedMedicBeamAttachment then
                        CorruptedMedicBeamAttachment = Instance.new("Attachment")
                        CorruptedMedicBeamAttachment.Name = "CorruptedMedicBeamAttachment"
                        CorruptedMedicBeamAttachment.Parent = i5.PrimaryPart
                    end
                    v1 = i7:Clone()
                    v1.Attachment0 = a1.Model.MuzzleFlash.Value
                    v1.Attachment1 = CorruptedMedicBeamAttachment
                    v1.Parent = workspace.Terrain
                    table.insert(v2, v1)
                end
                a1._currentBeams[i5] = v2
            end
        end
    end)
end

return v1