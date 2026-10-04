-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Skins.Slaughter Warden
-- Decompile time: 0.31 ms

local BadgeService = game:GetService("BadgeService")
return require(script.Parent.Parent.Parent.Types)({
    id = "slaughter-warden",
    sender = "Map Reward",
    name = "Slaughter Warden",
    cover = 11401458801,
    icon = 11417502802,
    rewards = {{type = "skin", tower = "Warden", skin = "Slaughter"}},
    eligible = function(a1) -- Line: 18 -- upvalues: BadgeService (val)
        local success, result = pcall(function() -- Line: 19 -- upvalues: BadgeService (upval), a1 (val)
            return BadgeService:UserHasBadgeAsync(a1.UserId, 2129234540)
        end)
        return success and result
    end,
})