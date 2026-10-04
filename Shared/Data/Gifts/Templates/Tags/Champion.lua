-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Tags.Champion
-- Decompile time: 0.25 ms

return require(script.Parent.Parent.Parent.Types)({
    id = "leaderboard-tag",
    sender = "Tag Reward",
    name = "Champion Tag",
    cover = 13690741683,
    icon = 18553360651,
    rewards = {{type = "tag", tag = "Champion"}},
    eligible = function(a1) -- Line: 15
        return a1:GetAttribute("CanClaimLeaderboardTag") == true
    end,
})