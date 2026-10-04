-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Vigilante Shotgunner
-- Decompile time: 0.34 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "vigilante-shotgunner",
    sender = "Gamepass Reward",
    name = "Vigilante Shotgunner",
    cover = 13850421042,
    icon = 13850118265,
    rewards = {{type = "skin", tower = "Shotgunner", skin = "Vigilante"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 193944933)
        end)
        return success and result
    end,
})