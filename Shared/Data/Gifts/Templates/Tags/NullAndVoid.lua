-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Tags.NullAndVoid
-- Decompile time: 0.37 ms

local BadgeService = game:GetService("BadgeService")
return require(script.Parent.Parent.Parent.Types)({
    id = "null-and-void-tag",
    sender = "Tag Reward",
    name = "Null and Void Tag",
    cover = 80938705941296,
    icon = 138240479196531,
    rewards = {{type = "tag", tag = "NullAndVoid"}},
    eligible = function(a1) -- Line: 17 -- upvalues: BadgeService (val) -- types: a1: userdata
        local success, result = pcall(function() -- Line: 18 -- upvalues: BadgeService (upval), a1 (val)
            return BadgeService:UserHasBadgeAsync(a1.UserId, 1142864453046577)
        end)
        return success and result
    end,
})