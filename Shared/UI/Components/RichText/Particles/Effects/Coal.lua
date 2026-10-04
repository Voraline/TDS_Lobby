-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Coal
-- Decompile time: 1.34 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    Create("ParticleEmitter", {
        Name = "Dirt",
        Acceleration = Vector3.new(0.5, -0.5, 0),
        Drag = 4,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 5,
        Texture = "rbxassetid://1084987899",
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(93, 93, 93)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 93, 93))),
        }),
        Lifetime = NumberRange.new(1.5),
        Rotation = NumberRange.new(-180, 180),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.4, 0.25),
            (NumberSequenceKeypoint.new(1, 0.3, 0.3)),
        }),
        Speed = NumberRange.new(0),
        SpreadAngle = Vector2.new(10, 10),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.744),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "Smoke",
        Acceleration = Vector3.new(0.5, -0.5, 0),
        Drag = 4,
        LockedToPart = true,
        Rate = 5,
        Texture = "rbxassetid://1084987899",
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 24, 24)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(24, 24, 24))),
        }),
        Lifetime = NumberRange.new(1.5),
        Rotation = NumberRange.new(-180, 180),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.4, 0.25),
            (NumberSequenceKeypoint.new(1, 0.3, 0.3)),
        }),
        Speed = NumberRange.new(0),
        SpreadAngle = Vector2.new(10, 10),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.744),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "Spread",
        Acceleration = Vector3.new(0, -15, 0),
        Drag = 6,
        LightEmission = 0.5,
        LockedToPart = true,
        Rate = 5,
        Texture = "rbxassetid://13925567750",
        Lifetime = NumberRange.new(0.4, 0.75),
        Orientation = Enum.ParticleOrientation.VelocityParallel,
        RotSpeed = NumberRange.new(300),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.15), (NumberSequenceKeypoint.new(1, 0.15))}),
        Speed = NumberRange.new(6, 8),
        SpreadAngle = Vector2.new(60, 60),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.701, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}