-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Towers.Cowboy
-- Decompile time: 0.23 ms

game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "cowboy",
    sender = "Map Reward",
    name = "Cowboy Tower",
    cover = 11116454415,
    icon = 11122577300,
    rewards = {{type = "tower", tower = "Cowboy"}},
    eligible = function(a1) -- Line: 17
        return false
    end,
})