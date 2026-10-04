-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Tags.Hexscaped
-- Decompile time: 0.43 ms

local BadgeService = game:GetService("BadgeService")
return require(script.Parent.Parent.Parent.Types)({
    id = "hexscaped-tag",
    sender = "Tag Reward",
    name = "Hexscaped Tag",
    cover = 79515767807016,
    icon = 84057604550894,
    rewards = {{type = "tag", tag = "Hexscaped"}},
    eligible = function(a1) -- Line: 17 -- upvalues: BadgeService (val) -- types: a1: userdata
        local success, result = pcall(function() -- Line: 18 -- upvalues: BadgeService (upval), a1 (val)
            return BadgeService:UserHasBadgeAsync(a1.UserId, 1619512511715482)
        end)
        return success and result
    end,
})