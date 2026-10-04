-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.ScaleVisuals
-- Decompile time: 0.62 ms

return {
    onAdded = function(a1, a2) -- Line: 7
        local parameters = a2.parameters
        local SizeModifier = parameters and parameters.SizeModifier or 1.5
        if a1.ScaleBy then
            a1:ScaleBy(SizeModifier, 20, 0.5)
        end
        return {sizeModifier = SizeModifier}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 19
        if a1.ScaleBy then
            a1:ScaleBy(1, 20, 0.5)
        end
    end,
}