-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Vigilante Gladiator
-- Decompile time: 0.36 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "vigilante-gladiator",
    sender = "Gamepass Reward",
    name = "Vigilante Gladiator",
    cover = 13850421042,
    icon = 13850119777,
    rewards = {{type = "skin", tower = "Gladiator", skin = "Vigilante"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 193944933)
        end)
        return success and result
    end,
})