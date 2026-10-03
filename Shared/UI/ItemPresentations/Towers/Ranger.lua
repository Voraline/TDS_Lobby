-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Ranger
-- Decompile time: 0.29 ms

return {
    Init = function(a1, a2, a3) -- Line: 2
        a2.Rotation = CFrame.Angles(0, 2.705260340591211, 0)
        if a3 then
            a2.Offset = Vector3.new(0, 0.25, 0)
            return a1
        end
        local HeightOffset = a1:FindFirstChild("HeightOffset", true)
        if HeightOffset then
            HeightOffset.WorldCFrame = HeightOffset.WorldCFrame * CFrame.new(0, 0.3, 0)
        end
        a2.Offset = Vector3.new(0, 0.30000001192092896, 0)
        a2.ShadowRadius = 1
        return a1
    end,
}