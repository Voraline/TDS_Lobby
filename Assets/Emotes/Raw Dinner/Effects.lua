-- Script path: ReplicatedStorage.Assets.Emotes.Raw Dinner.Effects
-- Decompile time: 0.38 ms

game:GetService("TweenService")
return {
    Eat = function(a1, a2) -- Line: 4
        local Meat = a2:FindFirstChild("Meat")
        if Meat then
            local v1 = Meat.Handle.EatSound:Clone()
            v1.Name = "Sound"
            v1.PlaybackSpeed = Random.new():NextNumber(0.8, 1.2)
            v1.Parent = Meat.Handle
            v1:Play()
            game.Debris:AddItem(v1, v1.TimeLength)
            Meat.Handle.Crumbs:Emit(10)
        end
    end,
}