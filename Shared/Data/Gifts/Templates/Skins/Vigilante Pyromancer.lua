-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Vigilante Pyromancer
-- Decompile time: 0.35 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "vigilante-pyromancer",
    sender = "Gamepass Reward",
    name = "Vigilante Pyromancer",
    cover = 13850421042,
    icon = 13850121921,
    rewards = {{type = "skin", tower = "Pyromancer", skin = "Vigilante"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 193944933)
        end)
        return success and result
    end,
})