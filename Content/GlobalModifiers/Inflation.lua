-- Script path: ReplicatedStorage.Content.GlobalModifiers.Inflation
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "Inflation",
    description = "All prices are increased by 50%",
    icon = 79686102216274,
    rewardMultiplier = 0.3,
    canToggle = true,
}