-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.BleedVisuals
-- Decompile time: 2.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Particles = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Particles")
local ParticleLODController = require(ReplicatedStorage.Client.Modules.ParticleLODController)
return {
    onAdded = function(a1, a2) -- Line: 14 -- upvalues: Particles (val), ParticleLODController (val)
        local Part = a1.Part
        if not Part then
            Part = a1.PrimaryPart
        end
        if not Part then
            return nil
        end
        local Bleed = Particles:FindFirstChild("Bleed")
        if not Bleed then
            return nil
        end
        local v1 = Bleed:Clone()
        v1.Parent = workspace.CurrentCamera
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = Part
        if v1:IsA("BasePart") then
            WeldConstraint.Part1 = v1
            v1.CFrame = Part.CFrame
        elseif v1:IsA("Model") and v1.PrimaryPart then
            WeldConstraint.Part1 = v1.PrimaryPart
            v1:PivotTo(Part.CFrame)
        end
        WeldConstraint.Parent = v1
        return {
            effect = v1,
            root = Part,
            unregisterLOD = ParticleLODController.registerRoot(v1, function() -- Line: 40 -- upvalues: Part (val)
                return Part.Position
            end),
        }
    end,
    onUpdated = function(a1, a2, a3) -- Line: 47 -- upvalues: ParticleLODController (val)
        if a3 and a3.effect then
            local Attribute, v1
            local v2 = if not a3.root then ParticleLODController.getRootMultiplier(a3.effect) else ParticleLODController.getOneShotMultiplier(a3.root.Position)
            for i, j in a3.effect:GetDescendants() do
                if j:IsA("ParticleEmitter") then
                    Attribute = j:GetAttribute("EmitCount")
                    if Attribute then
                        v1 = ParticleLODController.scaleEmitCount(Attribute, v2)
                        if v1 > 0 then
                            j:Emit(v1)
                        end
                    end
                end
            end
            return
        end
    end,
    onRemoved = function(a1, a2, a3) -- Line: 71
        if a3 and a3.effect then
            if a3.unregisterLOD then
                a3.unregisterLOD()
            end
            a3.effect:Destroy()
        end
    end,
}