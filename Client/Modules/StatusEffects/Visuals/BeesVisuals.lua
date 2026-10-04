-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.BeesVisuals
-- Decompile time: 1.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local Particles = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Particles")
return {
    onAdded = function(a1, a2) -- Line: 17 -- upvalues: Particles (val), EasySound (val)
        local WeldConstraint_2
        local Part = a1.Part or a1.PrimaryPart
        if not Part then
            return nil
        end
        local BeeDebuff = Particles:FindFirstChild("BeeDebuff")
        if not BeeDebuff then
            return nil
        end
        local v1 = BeeDebuff:Clone()
        v1.Parent = workspace.CurrentCamera
        if not v1:IsA("Model") then
            if v1:IsA("BasePart") then
                v1.CFrame = Part.CFrame
                WeldConstraint_2 = Instance.new("WeldConstraint")
                WeldConstraint_2.Part0 = Part
                WeldConstraint_2.Part1 = v1
                WeldConstraint_2.Parent = v1
            end
        elseif v1.PrimaryPart then
            v1:PivotTo(Part.CFrame)
            local WeldConstraint = Instance.new("WeldConstraint")
            WeldConstraint.Part0 = Part
            WeldConstraint.Part1 = v1.PrimaryPart
            WeldConstraint.Parent = v1
        elseif v1:IsA("BasePart") then
            v1.CFrame = Part.CFrame
            WeldConstraint_2 = Instance.new("WeldConstraint")
            WeldConstraint_2.Part0 = Part
            WeldConstraint_2.Part1 = v1
            WeldConstraint_2.Parent = v1
        end
        return {
            effect = v1,
            sound = EasySound.Play({
                id = 108769852637611,
                volume = 0.16,
                looped = true,
                audioGroup = "Enemies",
                parent = Part,
            }),
        }
    end,
    onRemoved = function(a1, a2, a3) -- Line: 58
        if not a3 then
            return
        end
        if a3.sound then
            a3.sound:Stop()
            a3.sound:Destroy()
        end
        if a3.effect then
            a3.effect:Destroy()
        end
    end,
}