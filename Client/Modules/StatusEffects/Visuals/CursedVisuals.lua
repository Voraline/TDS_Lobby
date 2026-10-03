-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.CursedVisuals
-- Decompile time: 0.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
return {
    onAdded = function(a1, a2) -- Line: 4 -- upvalues: ReplicatedStorage (val)
        local u10 = ReplicatedStorage.Assets.Effects.Mob.SoulStealer.CurseTower:Clone()
        local PrimaryPart = a1.Model.PrimaryPart
        u10.Parent = workspace.CurrentCamera
        u10.CFrame = PrimaryPart.CFrame
        u10.Anchored = false
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = u10
        WeldConstraint.Part1 = PrimaryPart
        WeldConstraint.Parent = u10
        a1.Maid:Mark(u10)
        return function() -- Line: 20 -- upvalues: a1 (val), u10 (val)
            a1.Maid:Unmark(u10)
            u10:Destroy()
        end
    end,
    onRemoved = function(a1, a2, a3) -- Line: 29
        if a3 then
            a3()
        end
    end,
}