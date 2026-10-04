-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Tesla
-- Decompile time: 0.30 ms

return {
    Init = function(a1, a2) -- Line: 2
        a2.Rotation = CFrame.Angles(0, 3.0543261909900767, 0)
        ;(a1:WaitForChild("Weapon")):WaitForChild("Tower"):Destroy()
        a2.Offset = Vector3.new(2.5, 0, -2)
    end,
    Animation = function(a1) -- Line: 10
        local Animations = a1:FindFirstChild("Animations")
        local OperatorIdle = Animations and Animations:FindFirstChild("OperatorIdle")
        if OperatorIdle then
            return OperatorIdle["0"]
        end
        return nil
    end,
}