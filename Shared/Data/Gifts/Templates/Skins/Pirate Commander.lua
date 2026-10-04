-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Pirate Commander
-- Decompile time: 0.42 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "pirate-commander",
    sender = "Gamepass Reward",
    name = "Pirate Commander",
    cover = 14318408784,
    icon = 14317921604,
    rewards = {{type = "skin", tower = "Commander", skin = "Pirate"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 224102025)
        end)
        return success and result
    end,
})