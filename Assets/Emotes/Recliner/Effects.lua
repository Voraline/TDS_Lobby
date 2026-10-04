-- Script path: ReplicatedStorage.Assets.Emotes.Recliner.Effects
-- Decompile time: 0.27 ms

return {
    Eat = function(a1, a2) -- Line: 2
        local Burger = a2:FindFirstChild("Burger")
        if Burger then
            Burger.Handle.EatSound:Play()
            Burger.Handle.Crumbs:Emit(15)
        end
    end,
    Drink = function(a1, a2) -- Line: 11
        local Drink = a2:FindFirstChild("Drink")
        if Drink then
            Drink.Handle.Slurp:Play()
        end
    end,
}