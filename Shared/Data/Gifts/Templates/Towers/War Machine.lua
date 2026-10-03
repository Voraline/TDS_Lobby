-- Script path: ReplicatedStorage.Shared.Data.Gifts.Templates.Towers.War Machine
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
return require(script.Parent.Parent.Parent.Types)({
    id = "staff:war-machine-3",
    sender = "Exclusive Gift",
    name = "War Machine",
    cover = 7207459146,
    icon = 6883317252,
    rewards = {{type = "tower", tower = "War Machine"}},
    eligible = function(a1) -- Line: 17 -- upvalues: SharedGameConstants (val)
        return SharedGameConstants.WM_MECHA_WHITELIST[a1.UserId] or 5 <= (a1:GetRankInGroup(4914494))
    end,
})