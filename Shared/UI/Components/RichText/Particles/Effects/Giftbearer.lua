-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Giftbearer
-- Decompile time: 5.04 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(1.22802734, -0.444204807, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v2[Children] = {
    Create("Beam", {
        Name = "Ribbons",
        Brightness = 3,
        FaceCamera = true,
        LightEmission = 0.1,
        Segments = 25,
        Texture = "rbxassetid://139766390405190",
        TextureSpeed = 0,
        Width0 = 0.7,
        Width1 = 0.7,
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 171, 129)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 171, 129))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {Name = "2", CFrame = CFrame.new(-1.20001221, -0.444204807, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v5 = {Name = "3", CFrame = CFrame.new(1.21734619, -0.743456364, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v5[Children] = {
    Create("Beam", {
        Name = "Ribbons",
        Brightness = 1.2,
        FaceCamera = true,
        LightEmission = 0.1,
        Segments = 25,
        Texture = "rbxassetid://123739368520327",
        TextureSpeed = 0,
        Width0 = 1.25,
        Width1 = 1.25,
        ZOffset = -0.21,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 224, 180)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 224, 180))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
v2 = Create("Attachment", v5)
local v6 = Create("Attachment", {Name = "4", CFrame = CFrame.new(-1.21069336, -0.743456364, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
v5 = Create("ParticleEmitter", {
    Name = "BaseSmoke",
    Acceleration = Vector3.new(0, -0.25, 0),
    Brightness = 3,
    LightEmission = 0.65,
    LockedToPart = true,
    Rate = 22,
    ShapePartial = 0.4,
    Texture = "rbxassetid://80397661829393",
    ZOffset = -0.6,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(145, 61, 5)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(145, 61, 5))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.282, 0.141),
        NumberSequenceKeypoint.new(0.1, 0.294, 0.141),
        NumberSequenceKeypoint.new(0.2, 0.304, 0.141),
        NumberSequenceKeypoint.new(0.3, 0.315, 0.141),
        NumberSequenceKeypoint.new(0.4, 0.327, 0.141),
        NumberSequenceKeypoint.new(0.5, 0.339, 0.141),
        NumberSequenceKeypoint.new(0.6, 0.351, 0.141),
        NumberSequenceKeypoint.new(0.7, 0.365, 0.141),
        NumberSequenceKeypoint.new(0.8, 0.381, 0.141),
        NumberSequenceKeypoint.new(0.9, 0.4, 0.141),
        NumberSequenceKeypoint.new(1, 0.423, 0.141),
        (NumberSequenceKeypoint.new(1, 0.423, 0.141)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.499, 0.119, 0.0687),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v7 = Create("ParticleEmitter", {
    Name = "CommonSparkle",
    Acceleration = Vector3.new(0, -4.75, 0),
    Brightness = 3,
    Drag = 4,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 16,
    Texture = "rbxassetid://103661629746125",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 195, 31)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 195, 31))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    Lifetime = NumberRange.new(0.4, 0.8),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.351, 0.211, 0.0355),
        NumberSequenceKeypoint.new(0.498, 0.048, 0.025),
        NumberSequenceKeypoint.new(0.654, 0.213, 0.0417),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 1.54),
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
local v8 = Create("ParticleEmitter", {
    Name = "DarkSmoke",
    Acceleration = Vector3.new(0, -0.7419999837875366, 0),
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 22,
    ShapePartial = 0.4,
    Texture = "rbxassetid://138210092362719",
    ZOffset = -0.8,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(63, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(63, 0, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.838, 0.419),
        NumberSequenceKeypoint.new(0.1, 0.873, 0.419),
        NumberSequenceKeypoint.new(0.2, 0.905, 0.419),
        NumberSequenceKeypoint.new(0.3, 0.938, 0.419),
        NumberSequenceKeypoint.new(0.4, 0.971, 0.419),
        NumberSequenceKeypoint.new(0.5, 1.01, 0.419),
        NumberSequenceKeypoint.new(0.6, 1.04, 0.419),
        NumberSequenceKeypoint.new(0.7, 1.09, 0.419),
        NumberSequenceKeypoint.new(0.8, 1.13, 0.419),
        NumberSequenceKeypoint.new(0.9, 1.19, 0.419),
        NumberSequenceKeypoint.new(1, 1.26, 0.419),
        (NumberSequenceKeypoint.new(1, 1.26, 0.419)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.499, 0.119, 0.0687),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v9 = {
    Name = "Fireworks",
    Brightness = 4,
    LightEmission = 0.3,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://107562304222936",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 162, 55)),
        ColorSequenceKeypoint.new(0.316, Color3.fromRGB(255, 136, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))),
    }),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(0.6, 0.9),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0.0759),
        NumberSequenceKeypoint.new(0.2, 0.139),
        NumberSequenceKeypoint.new(0.3, 0.194),
        NumberSequenceKeypoint.new(0.4, 0.243),
        NumberSequenceKeypoint.new(0.5, 0.287),
        NumberSequenceKeypoint.new(0.6, 0.325),
        NumberSequenceKeypoint.new(0.7, 0.357),
        NumberSequenceKeypoint.new(0.8, 0.383),
        NumberSequenceKeypoint.new(0.9, 0.4),
        (NumberSequenceKeypoint.new(1, 0.407)),
    }),
    Speed = NumberRange.new(0),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v6
v1[5] = v5
v1[6] = v7
v1[7] = v8
v1[8] = Create("ParticleEmitter", v9)
return v1