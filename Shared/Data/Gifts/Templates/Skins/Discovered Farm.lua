-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Discovered Farm
-- Decompile time: 0.38 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "discovered-farm",
    sender = "Gamepass Reward",
    name = "Discovered Farm",
    cover = 14318408784,
    icon = 103415189994638,
    rewards = {{type = "skin", tower = "Farm", skin = "Discovered"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 1142100573)
        end)
        return success and result
    end,
})