-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Badlands Cowboy
-- Decompile time: 0.37 ms

local BadgeService = game:GetService("BadgeService")
return require(script.Parent.Parent.Parent.Types)({
    id = "badlands-cowboy",
    sender = "Map Reward",
    name = "Badlands Cowboy",
    cover = 11116454415,
    icon = 11122525473,
    rewards = {{type = "skin", tower = "Cowboy", skin = "Badlands"}},
    eligible = function(a1) -- Line: 18 -- upvalues: BadgeService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: BadgeService (upval), a1 (val)
            return BadgeService:UserHasBadgeAsync(a1.UserId, 2128794398)
        end)
        return success and result
    end,
})