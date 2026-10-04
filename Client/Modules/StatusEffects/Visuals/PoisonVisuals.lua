-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.PoisonVisuals
-- Decompile time: 2.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Particles = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Particles")
local ParticleLODController = require(ReplicatedStorage.Client.Modules.ParticleLODController)
return {
    onAdded = function(a1, a2) -- Line: 14 -- upvalues: Particles (val), ParticleLODController (val)
        local v1
        local Part = a1.Part or a1.PrimaryPart
        if not Part then
            return nil
        end
        local PoisonEffecct = Particles:FindFirstChild("PoisonEffecct")
        if not PoisonEffecct then
            return nil
        end
        local Emitter = PoisonEffecct:FindFirstChild("Emitter")
        if not Emitter then
            return nil
        end
        local v2 = {}
        local v3 = ParticleLODController.getOneShotMultiplier(Part.Position)
        local Shadow = Emitter:FindFirstChild("Shadow")
        if Shadow then
            local v4 = Shadow:Clone()
            v4.Parent = Part
            v1 = ParticleLODController.scaleEmitCount(5, v3)
            if v1 > 0 then
                v4:Emit(v1)
            end
            table.insert(v2, v4)
        end
        local Arrows = Emitter:FindFirstChild("Arrows")
        if Arrows then
            v1 = Arrows:Clone()
            v1.Parent = Part
            local v5 = ParticleLODController.scaleEmitCount(2, v3)
            if v5 > 0 then
                v1:Emit(v5)
            end
            table.insert(v2, v1)
        end
        return {particles = v2}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 58
        if a3 and a3.particles then
            for i, j in a3.particles do
                j.Enabled = false
                task.delay(j.Lifetime.Max, function() -- Line: 65 -- upvalues: j (val)
                    j:Destroy()
                end)
            end
            return
        end
    end,
}