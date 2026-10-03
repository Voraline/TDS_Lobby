-- Script path: ReplicatedStorage.Shared.Modules.TowerUpgradeUtils
-- Decompile time: 0.30 ms

return {
    matchesPath = function(a1, a2) -- Line: 3 -- types: a2: number?
        if a1.Path ~= nil then
            return a1.Path == a2
        end
        local Paths = a1.Paths
        if Paths == nil then
            return true
        end
        if typeof(Paths) == "table" then
            return table.find(Paths, a2) ~= nil
        end
        return Paths == a2
    end,
}