-- Script path: ReplicatedStorage.Content.GlobalModifiers.VIPPlus
-- Decompile time: 0.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "VIP+ Boost",
    description = "You have VIP+! You get 50% more experience, and you get a 20% currency boost.",
    icon = 17846597859,
    rewardMultiplier = 0.75,
    sandboxDisabled = true,
}