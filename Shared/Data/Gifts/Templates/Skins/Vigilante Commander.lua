-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Vigilante Commander
-- Decompile time: 0.47 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "vigilante-commander",
    sender = "Gamepass Reward",
    name = "Vigilante Commander",
    cover = 13850421042,
    icon = 17507649270,
    rewards = {{type = "skin", tower = "Commander", skin = "Vigilante"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 193944933)
        end)
        return success and result
    end,
})