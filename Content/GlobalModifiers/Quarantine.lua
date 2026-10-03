-- Script path: ReplicatedStorage.Content.GlobalModifiers.Quarantine
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "Quarantine",
    description = "Towers are unable to be placed next to other towers",
    rewardMultiplier = 0.2,
    icon = 84005317290977,
    canToggle = true,
}