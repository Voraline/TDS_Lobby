-- Script path: ReplicatedStorage.Assets.Emotes.Couldron.Effects
-- Decompile time: 0.27 ms

return {
    Eat = function(a1, a2) -- Line: 2
        local Cookie = a2:FindFirstChild("Cookie")
        if Cookie then
            Cookie.Handle.EatSound:Play()
            Cookie.Handle.Crumbs:Emit(15)
        end
    end,
    Slurp = function(a1, a2) -- Line: 11
        local Mug = a2:FindFirstChild("Mug")
        if Mug then
            Mug.Handle.Slurp:Play()
        end
    end,
}