-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Cloudy
-- Decompile time: 0.95 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    Create("ParticleEmitter", {
        Name = "cloud1",
        LightInfluence = 1,
        LockedToPart = true,
        Rate = 6,
        Texture = "rbxassetid://10848625536",
        ZOffset = -0.147,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(163, 163, 163)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(163, 163, 163))),
        }),
        Lifetime = NumberRange.new(2, 2.6),
        RotSpeed = NumberRange.new(-25, 25),
        Rotation = NumberRange.new(0, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.392, 0.245),
            NumberSequenceKeypoint.new(0.5, 0.539, 0.245),
            (NumberSequenceKeypoint.new(1, 0.392, 0.245)),
        }),
        Speed = NumberRange.new(0, 0.15),
        SpreadAngle = Vector2.new(360, -360),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.198, 0.744, 0.05),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "cloud2",
        Brightness = 5,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 8,
        Texture = "rbxassetid://10848625536",
        ZOffset = -0.147,
        Lifetime = NumberRange.new(2, 2.6),
        RotSpeed = NumberRange.new(-25, 25),
        Rotation = NumberRange.new(0, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.441, 0.245),
            NumberSequenceKeypoint.new(0.5, 0.588, 0.245),
            (NumberSequenceKeypoint.new(1, 0.441, 0.245)),
        }),
        Speed = NumberRange.new(0, 0.1),
        SpreadAngle = Vector2.new(360, -360),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.195, 0.494, 0.07),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}