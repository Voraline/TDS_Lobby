-- Script path: ReplicatedStorage.Content.GlobalModifiers.Limitation
-- Decompile time: 0.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "Limitation Makes Creativity",
    description = "Total tower limit is reduced by half",
    icon = 94678131230832,
    rewardMultiplier = 0.1,
    canToggle = true,
}