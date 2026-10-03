-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.BlessedVisuals
-- Decompile time: 0.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Blessed = ReplicatedStorage:WaitForChild("Assets").Effects.Mob.ChampionTemplar:FindFirstChild("Blessed")
return {
    onAdded = function(a1, a2) -- Line: 14 -- upvalues: Blessed (val), EmitterManager (val)
        if not Blessed then
            return nil
        end
        local Model = a1.Model
        if Model and Model.PrimaryPart then
            if Model:FindFirstChild("BlessedVFX") then
                return nil
            end
            local v1 = Blessed:Clone()
            local v2 = (a1.Height or 2) * 2 / v1.Size.Y
            local Model_2 = Instance.new("Model")
            v1.Parent = Model_2
            Model_2:ScaleTo(v2)
            v1.Parent = nil
            Model_2:Destroy()
            v1.Name = "BlessedVFX"
            v1.CFrame = Model.PrimaryPart.CFrame
            v1.WeldConstraint.Part0 = v1
            v1.WeldConstraint.Part1 = Model.PrimaryPart
            v1.Parent = Model
            EmitterManager.toggle(v1, true)
            return {effect = v1}
        end
        return nil
    end,
    onRemoved = function(a1, a2, a3) -- Line: 49 -- upvalues: EmitterManager (val)
        if a3 and a3.effect then
            local effect = a3.effect
            effect.Name = "RemovingBlessedVFX"
            EmitterManager.toggle(effect, false)
            task.delay(2, function() -- Line: 57 -- upvalues: effect (val)
                effect:Destroy()
            end)
            return
        end
    end,
}