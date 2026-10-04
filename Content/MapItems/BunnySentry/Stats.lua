-- Script path: ReplicatedStorage.Content.MapItems.BunnySentry.Stats
-- Decompile time: 0.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Range = 25,
    Class = "Flying",
    Damage = 300,
    Cooldown = 0.25,
    DefaultPrice = 75000,
    PriceIncrease = 50000,
    DefaultCashReward = 0,
    SplitAmount = true,
    ReplicatorData = {},
    TargetingMode = Enum.TargetingMode.Strongest,
    Modifiers = {[Enum.Modifier.Hidden] = true, [Enum.Modifier.Flying] = true},
}