-- Script path: ReplicatedStorage.Content.GlobalModifiers.Fog
-- Decompile time: 0.35 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
return {
    displayName = "Fog",
    description = "All tower ranges reduced by 35%",
    icon = 84744520127830,
    rewardMultiplier = 0.2,
    canToggle = true,
    onEnableServer = function(a1, a2, a3) -- Line: 13 -- upvalues: Lighting (val)
        local Atmosphere = Instance.new("Atmosphere")
        Atmosphere.Name = "Atmosphere"
        Atmosphere.Color = Color3.fromRGB(159, 159, 159)
        Atmosphere.Decay = Color3.fromRGB(62, 69, 75)
        Atmosphere.Density = 0.9
        Atmosphere.Glare = 10
        Atmosphere.Haze = 2
        Atmosphere.Offset = 0.25
        Atmosphere.Parent = Lighting
        a2:Mark(function() -- Line: 24 -- upvalues: Atmosphere (val)
            Atmosphere:Destroy()
        end)
    end,
}