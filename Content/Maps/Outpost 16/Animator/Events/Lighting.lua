-- Script path: ReplicatedStorage.Content.Maps.Outpost 16.Animator.Events.Lighting
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u10 = {}

function u10.init(a1) -- Line: 7 -- upvalues: u10 (val)
    u10.Lighting = {
        oldClockTime = game.Lighting.ClockTime,
        oldAtmosphere = {
            Density = game.Lighting.Atmosphere.Density,
            Color = game.Lighting.Atmosphere.Color,
        },
    }
end

function u10.run(a1) -- Line: 17 -- upvalues: TweenService (val)
    TweenService:Create(
        game.Lighting.Atmosphere,
        TweenInfo.new(10, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
        {Density = 0.55, Color = Color3.fromRGB(209, 24, 255)}
    ):Play()
end

function u10.cleanup(a1) -- Line: 28 -- upvalues: TweenService (val), u10 (val)
    TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        Density = u10.Lighting.oldAtmosphere.Density,
        Color = u10.Lighting.oldAtmosphere.Color,
    }):Play()
end

return u10