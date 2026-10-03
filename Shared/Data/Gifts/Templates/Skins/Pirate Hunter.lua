-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Pirate Hunter
-- Decompile time: 0.40 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "pirate-hunter",
    sender = "Gamepass Reward",
    name = "Pirate Hunter",
    cover = 14318408784,
    icon = 14317920001,
    rewards = {{type = "skin", tower = "Hunter", skin = "Pirate"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 224102025)
        end)
        return success and result
    end,
})