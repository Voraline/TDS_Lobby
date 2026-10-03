-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.DarkFrost
-- Decompile time: 4.42 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Dots",
    Acceleration = Vector3.new(0, -7.730000019073486, 0),
    Brightness = 3,
    Drag = 4,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 9,
    Texture = "rbxassetid://16815709936",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(118, 218, 249)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(118, 218, 249))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    Lifetime = NumberRange.new(0.4, 0.8),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.356, 0.676, 0.142),
        NumberSequenceKeypoint.new(0.499, 0.142, 0.0751),
        NumberSequenceKeypoint.new(0.657, 0.692, 0.167),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 6.14),
})
local v3 = Create("ParticleEmitter", {
    Name = "CommonSparkle",
    Acceleration = Vector3.new(0, -19, 0),
    Brightness = 3,
    Drag = 4,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 16,
    Texture = "rbxassetid://10888718050",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(118, 218, 249)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(118, 218, 249))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    Lifetime = NumberRange.new(0.4, 0.8),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.351, 0.843, 0.142),
        NumberSequenceKeypoint.new(0.498, 0.192, 0.1),
        NumberSequenceKeypoint.new(0.654, 0.851, 0.167),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 6.14),
    Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.1, 0.349),
        NumberSequenceKeypoint.new(0.2, 0.257),
        NumberSequenceKeypoint.new(0.3, 0.189),
        NumberSequenceKeypoint.new(0.4, 0.135),
        NumberSequenceKeypoint.new(0.5, 0.0929),
        NumberSequenceKeypoint.new(0.6, 0.0592),
        NumberSequenceKeypoint.new(0.7, 0.0334),
        NumberSequenceKeypoint.new(0.8, 0.015),
        NumberSequenceKeypoint.new(0.9, 0.00381),
        NumberSequenceKeypoint.new(1, 5.55e-17),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
})
local v4 = Create("ParticleEmitter", {
    Name = "BaseSmoke",
    Acceleration = Vector3.new(0, -4.610000133514404, 0),
    Brightness = 2,
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 0.3,
    LockedToPart = true,
    Rate = 12,
    ShapePartial = 0.4,
    Texture = "rbxassetid://16815669870",
    ZOffset = -0.4,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 13, 31)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(43, 0, 81))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.735, 0.49),
        NumberSequenceKeypoint.new(0.1, 0.882, 0.49),
        NumberSequenceKeypoint.new(0.2, 0.958, 0.49),
        NumberSequenceKeypoint.new(0.3, 1.02, 0.49),
        NumberSequenceKeypoint.new(0.4, 1.07, 0.49),
        NumberSequenceKeypoint.new(0.5, 1.11, 0.49),
        NumberSequenceKeypoint.new(0.6, 1.15, 0.49),
        NumberSequenceKeypoint.new(0.7, 1.18, 0.49),
        NumberSequenceKeypoint.new(0.8, 1.2, 0.49),
        NumberSequenceKeypoint.new(0.9, 1.22, 0.49),
        NumberSequenceKeypoint.new(1, 1.22, 0.49),
        (NumberSequenceKeypoint.new(1, 1.22, 0.49)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.501, 0.162, 0.1),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v5 = Create("ParticleEmitter", {
    Name = "BackgroundSmokeGlowing",
    Acceleration = Vector3.new(0, -1.159999966621399, 0),
    Drag = 3,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://133355140520916",
    ZOffset = -2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(112, 0, 67)),
        ColorSequenceKeypoint.new(0.567, Color3.fromRGB(19, 0, 56)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(1, 0, 21))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-11, 11),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.322),
        NumberSequenceKeypoint.new(0.1, 0.565),
        NumberSequenceKeypoint.new(0.2, 0.713),
        NumberSequenceKeypoint.new(0.3, 0.823),
        NumberSequenceKeypoint.new(0.4, 0.909),
        NumberSequenceKeypoint.new(0.5, 0.978),
        NumberSequenceKeypoint.new(0.6, 1.03),
        NumberSequenceKeypoint.new(0.7, 1.07),
        NumberSequenceKeypoint.new(0.8, 1.1),
        NumberSequenceKeypoint.new(0.9, 1.12),
        NumberSequenceKeypoint.new(1, 1.13),
        (NumberSequenceKeypoint.new(1, 1.13)),
    }),
    Speed = NumberRange.new(0, 0.161),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.499, 0.412, 0.156),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v6 = {
    Name = "Attachment",
    WorldCFrame = CFrame.new(-493.904144, 0.5, 151.198608, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v6[Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        Brightness = 3,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        ZOffset = 2.11,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(115, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(115, 0, 255))),
        }),
        Lifetime = NumberRange.new(2),
        Rotation = NumberRange.new(90),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.5), (NumberSequenceKeypoint.new(1, 1.5))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), (NumberSequenceKeypoint.new(1, 1))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.887),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v1[1] = v2
v1[2] = v3
v1[3] = v4
v1[4] = v5
v1[5] = Create("Attachment", v6)
return v1