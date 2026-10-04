-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Towers.Elf Camp
-- Decompile time: 0.32 ms

local BadgeService = game:GetService("BadgeService")
return require(script.Parent.Parent.Parent.Types)({
    id = "elfcamp",
    sender = "Map Reward",
    name = "Elf Camp Tower",
    cover = 11865722165,
    icon = 11865830821,
    rewards = {{type = "tower", tower = "Elf Camp"}},
    eligible = function(a1) -- Line: 17 -- upvalues: BadgeService (val)
        local success, result = pcall(function() -- Line: 18 -- upvalues: BadgeService (upval), a1 (val)
            return BadgeService:UserHasBadgeAsync(a1.UserId, 2129985629)
        end)
        return success and result
    end,
})