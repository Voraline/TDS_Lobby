-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Vigilante Accelerator
-- Decompile time: 0.56 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "vigilante-accelerator",
    sender = "Gamepass Reward",
    name = "Vigilante Accelerator",
    cover = 13850421042,
    icon = 13850120783,
    rewards = {{type = "skin", tower = "Accelerator", skin = "Vigilante"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 193944933)
        end)
        return success and result
    end,
})