-- Script path: ReplicatedStorage.Content.GlobalModifiers.Broke
-- Decompile time: 0.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "Broke",
    description = "All income sources reduced by 50%",
    rewardMultiplier = 0.3,
    icon = 121100755621424,
    canToggle = true,
}