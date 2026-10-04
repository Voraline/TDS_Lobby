-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Tags.Glitchy
-- Decompile time: 0.35 ms

local BadgeService = game:GetService("BadgeService")
return require(script.Parent.Parent.Parent.Types)({
    id = "glitchy-tag",
    sender = "Tag Reward",
    name = "Glitchy Tag",
    cover = 13690741683,
    icon = 6053790285,
    rewards = {{type = "tag", tag = "Glitchy"}},
    eligible = function(a1) -- Line: 17 -- upvalues: BadgeService (val)
        local success, result = pcall(function() -- Line: 18 -- upvalues: BadgeService (upval), a1 (val)
            return BadgeService:UserHasBadgeAsync(a1.UserId, 2124477833)
        end)
        return success and result
    end,
})