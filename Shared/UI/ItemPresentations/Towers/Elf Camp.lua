-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Elf Camp
-- Decompile time: 0.43 ms

return {
    Init = function(a1, a2, a3) -- Line: 2
        if not a3 then
            local v1 = CFrame.Angles(0.3490658503988659, 0.6981317007977318, 0)
            local HeightOffset = a1:FindFirstChild("HeightOffset", true)
            if HeightOffset then
                HeightOffset.WorldCFrame = HeightOffset.WorldCFrame * (v1 * CFrame.new(3.8, -1.9, -4.5))
            end
            a2.ShadowRadius = 3
            a2.Offset = Vector3.new(0, 0.20000000298023224, -5)
            a2.Rotation = v1
        else
            a2.Offset = Vector3.new(0, -3, -40)
            a2.Rotation = CFrame.Angles(0.3490658503988659, 0.6981317007977318, 0)
        end
        a2.Rotation = a2.Rotation * CFrame.Angles(0, 3.141592653589793, 0)
        return a1
    end,
}