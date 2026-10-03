-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Pirate Farm
-- Decompile time: 0.48 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "pirate-farm",
    sender = "Gamepass Reward",
    name = "Pirate Farm",
    cover = 14318408784,
    icon = 14318430784,
    rewards = {{type = "skin", tower = "Farm", skin = "Pirate"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 224102025)
        end)
        return success and result
    end,
})