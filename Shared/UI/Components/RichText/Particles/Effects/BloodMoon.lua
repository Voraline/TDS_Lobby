-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.BloodMoon
-- Decompile time: 3.46 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "Attachment",
    CFrame = CFrame.new(-1.65283203, 0.475723267, 0.669555664, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v2[Children] = {
    Create("ParticleEmitter", {
        Name = "Moon",
        Brightness = 3,
        LightEmission = 0.2,
        LockedToPart = true,
        Rate = 1,
        Texture = "rbxassetid://17820906333",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(98, 32, 34)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(98, 32, 34))),
        }),
        Lifetime = NumberRange.new(3),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.13), (NumberSequenceKeypoint.new(1, 1.13))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.299, 0),
            NumberSequenceKeypoint.new(0.701, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "MoonGlow",
        Brightness = 3,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 1,
        Texture = "rbxassetid://16845964057",
        ZOffset = 0.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(98, 32, 34)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120, 58, 59)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(98, 32, 34))),
        }),
        Lifetime = NumberRange.new(3),
        Rotation = NumberRange.new(44),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.969), (NumberSequenceKeypoint.new(1, 0.969))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.299, 0),
            NumberSequenceKeypoint.new(0.701, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "OutterMoonGlow",
        Brightness = 3,
        LightEmission = 0.5,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16805183830",
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(83, 0, 3)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(83, 0, 3))),
        }),
        Lifetime = NumberRange.new(2),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2.46), (NumberSequenceKeypoint.new(1, 2.46))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.492, 0.244, 0.075),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "MoonRays",
        Brightness = 3,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://17024991807",
        ZOffset = -0.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(98, 0, 2)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(98, 0, 2))),
        }),
        Lifetime = NumberRange.new(2),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.43), (NumberSequenceKeypoint.new(1, 1.43))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.5, 0.481, 0.075),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v3 = Create("Attachment", v2)
local v4 = Create("ParticleEmitter", {
    Name = "BackgroundSmokeGlowing",
    Acceleration = Vector3.new(1, -0.14800000190734863, 0),
    Drag = 3,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://133355140520916",
    ZOffset = -0.2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 14, 52)),
        ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 0, 56)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 0))),
    }),
    EmissionDirection = Enum.NormalId.Left,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-11, 11),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.295),
        NumberSequenceKeypoint.new(0.1, 0.518),
        NumberSequenceKeypoint.new(0.2, 0.654),
        NumberSequenceKeypoint.new(0.3, 0.754),
        NumberSequenceKeypoint.new(0.4, 0.833),
        NumberSequenceKeypoint.new(0.5, 0.896),
        NumberSequenceKeypoint.new(0.6, 0.946),
        NumberSequenceKeypoint.new(0.7, 0.984),
        NumberSequenceKeypoint.new(0.8, 1.01),
        NumberSequenceKeypoint.new(0.9, 1.03),
        NumberSequenceKeypoint.new(1, 1.03),
        (NumberSequenceKeypoint.new(1, 1.03)),
    }),
    Speed = NumberRange.new(0, 0.148),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.499, 0.412, 0.156),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v5 = {
    Name = "Dots",
    Acceleration = Vector3.new(0, 3, 0),
    Brightness = 3,
    Drag = 6,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 11,
    Texture = "rbxassetid://11800717040",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 0, 255))),
    }),
    EmissionDirection = Enum.NormalId.Left,
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(1, 2),
    RotSpeed = NumberRange.new(-321, 321),
    Rotation = NumberRange.new(-360, 360),
    ShapeInOut = Enum.ParticleEmitterShapeInOut.InAndOut,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.389, 0.146),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-1.64, 1.64),
    SpreadAngle = Vector2.new(25, 180),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.195, 0.188, 0.0483),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = Create("ParticleEmitter", v5)
return v1