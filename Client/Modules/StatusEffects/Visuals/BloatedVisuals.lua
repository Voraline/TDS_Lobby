-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.BloatedVisuals
-- Decompile time: 0.31 ms

return {
    onAdded = function(a1, a2) -- Line: 6
        local Replicator = a1.Replicator and a1.Replicator:WaitForState("BloatedScale")
        if not Replicator then
            return nil
        end
        if a1.ScaleBy then
            a1:ScaleBy(Replicator)
        end
        return {scale = Replicator}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 19
        if a1.ScaleBy then
            a1:ScaleBy(1)
        end
    end,
}