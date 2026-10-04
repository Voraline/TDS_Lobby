-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Polluted
-- Decompile time: 1.28 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    Create("ParticleEmitter", {
        Name = "PixelLightning",
        Acceleration = Vector3.new(0, 0.25, 0),
        Brightness = 5,
        LightEmission = 0.8,
        LightInfluence = 0.45,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://11864126449",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 127)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 127))),
        }),
        FlipbookFramerate = NumberRange.new(16),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        Lifetime = NumberRange.new(0.8),
        RotSpeed = NumberRange.new(0, 40),
        Rotation = NumberRange.new(-45, 0),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.6), (NumberSequenceKeypoint.new(1, 0.6))}),
        Speed = NumberRange.new(0.1),
        SpreadAngle = Vector2.new(30, 30),
    }),
    Create("ParticleEmitter", {
        Name = "PoisonSparkles",
        Acceleration = Vector3.new(0, -0.5, 0),
        Brightness = 4,
        Drag = 2,
        LockedToPart = true,
        Rate = 1.5,
        Texture = "http://www.roblox.com/asset/?id=118322059",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 127)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 255, 127))),
        }),
        Lifetime = NumberRange.new(0.7, 1.2),
        RotSpeed = NumberRange.new(-40, 40),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.1, 0.05),
            (NumberSequenceKeypoint.new(1, 0.1, 0.05)),
        }),
        Speed = NumberRange.new(1, 2),
        SpreadAngle = Vector2.new(360, 360),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.5),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "Smoke",
        Acceleration = Vector3.new(0, -0.6000000238418579, 0),
        Drag = 4,
        LockedToPart = true,
        Rate = 10,
        Texture = "rbxassetid://1084987899",
        ZOffset = -0.12,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 255, 50)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 255, 50))),
        }),
        Lifetime = NumberRange.new(1.5),
        Rotation = NumberRange.new(-180, 180),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.375, 0.15),
            (NumberSequenceKeypoint.new(1, 0.375, 0.225)),
        }),
        Speed = NumberRange.new(0),
        SpreadAngle = Vector2.new(10, 10),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.744),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}