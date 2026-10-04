-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Tags.Rainbow
-- Decompile time: 0.33 ms

local MarketplaceService = game:GetService("MarketplaceService")
return require(script.Parent.Parent.Parent.Types)({
    id = "rainbow-tag",
    sender = "Tag Reward",
    name = "Rainbow Tag",
    cover = 13690741683,
    icon = 6053790285,
    rewards = {{type = "tag", tag = "Rainbow"}},
    eligible = function(a1) -- Line: 17 -- upvalues: MarketplaceService (val)
        local success, result = pcall(function() -- Line: 18 -- upvalues: MarketplaceService (upval), a1 (val)
            return MarketplaceService:UserOwnsGamePassAsync(a1.UserId, 10518590)
        end)
        return success and result
    end,
})