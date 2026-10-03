-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Commander
-- Decompile time: 0.16 ms

return {
    Init = function(a1, a2, a3) -- Line: 2
        if a3 then
            a2.Offset = Vector3.new(0, -0.10000000149011612, -5)
            return a1
        end
        a2.Offset = Vector3.new(0, 0.20000000298023224, 0)
        return a1
    end,
}