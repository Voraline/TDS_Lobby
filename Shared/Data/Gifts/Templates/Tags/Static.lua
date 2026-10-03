-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Tags.Static
-- Decompile time: 0.36 ms

game:GetService("BadgeService")
return require(script.Parent.Parent.Parent.Types)({
    id = "static-tag",
    sender = "Tag Reward",
    name = "Static Tag",
    cover = 13690741683,
    icon = 6053790285,
    rewards = {{type = "tag", tag = "Static"}},
    eligible = function(a1) -- Line: 17 -- types: a1: userdata
        local success, result = pcall(function() -- Line: 18 -- upvalues: a1 (val)
            return 251 <= (a1:GetRankInGroup(4914494))
        end)
        return success and result
    end,
})