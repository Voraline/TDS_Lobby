-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Cookie Scout
-- Decompile time: 0.24 ms

game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "cookie-scout",
    sender = "Exclusive Gift",
    name = "Cookie Scout",
    cover = 11865722165,
    icon = 11873201542,
    rewards = {{type = "skin", tower = "Scout", skin = "Cookie"}},
    eligible = function(a1) -- Line: 18
        return false
    end,
})