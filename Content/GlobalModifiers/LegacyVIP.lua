-- Script path: ReplicatedStorage.Content.GlobalModifiers.LegacyVIP
-- Decompile time: 0.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "VIP Boost",
    description = "You're a VIP! You get 25% more experience.",
    icon = 6053790285,
    rewardMultiplier = 0.25,
    sandboxDisabled = true,
}