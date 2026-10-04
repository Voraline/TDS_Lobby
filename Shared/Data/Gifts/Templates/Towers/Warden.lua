-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Towers.Warden
-- Decompile time: 0.21 ms

game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "warden",
    sender = "Map Reward",
    name = "Warden Tower",
    cover = 11401458801,
    icon = 11401184517,
    rewards = {{type = "tower", tower = "Warden"}},
    eligible = function(a1) end,
})