-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Turret
-- Decompile time: 0.32 ms

return {
    Init = function(a1, a2, a3) -- Line: 2
        if not a3 then
            local HeightOffset = a1:FindFirstChild("HeightOffset", true)
            if HeightOffset then
                HeightOffset.WorldCFrame = HeightOffset.WorldCFrame * CFrame.new(0, -0.1, -4.5)
            end
            a2.Offset = Vector3.new(0, 0, -4)
            a2.Rotation = CFrame.Angles(0, -0.5235987755982988, 0)
            a2.ShadowRadius = 2.3
        else
            a2.Offset = Vector3.new(-0.10000000149011612, -1.600000023841858, -20)
            a2.Rotation = CFrame.Angles(0.08726646259971647, 0.6108652381980153, 0)
        end
        a2.Rotation = a2.Rotation * CFrame.Angles(0, 3.141592653589793, 0)
        return a1
    end,
}