-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Prime Raven
-- Decompile time: 0.38 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "prime-raven",
    sender = "Exclusive Gift",
    name = "Prime Raven",
    cover = 11116438103,
    icon = 11123385398,
    rewards = {{type = "skin", tower = "Scout", skin = "Prime Raven"}},
    eligible = function(a1) -- Line: 18 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:PlayerOwnsAsset(a1, 10911743463)
        end)
        return success and result
    end,
})