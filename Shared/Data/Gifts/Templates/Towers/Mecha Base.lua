-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Towers.Mecha Base
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
return require(script.Parent.Parent.Parent.Types)({
    id = "staff:mecha-base-3",
    sender = "Exclusive Gift",
    name = "Mecha Base",
    cover = 7207459146,
    icon = 6883292239,
    rewards = {{type = "tower", tower = "Mecha Base"}},
    eligible = function(a1) -- Line: 17 -- upvalues: SharedGameConstants (val)
        return SharedGameConstants.WM_MECHA_WHITELIST[a1.UserId] or 10 <= (a1:GetRankInGroup(4914494))
    end,
})