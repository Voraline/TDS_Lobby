-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Carrots
-- Decompile time: 4.13 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Bobux",
    Acceleration = Vector3.new(0, -16.65267562866211, 0),
    Brightness = 4,
    Drag = 5,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 6,
    Texture = "rbxassetid://104409940874775",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 157, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 157, 0))),
    }),
    FlipbookFramerate = NumberRange.new(22, 32),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(0.5, 1.4),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.943991, 0.363215),
        NumberSequenceKeypoint.new(0.1, 0.918233, 0.285514),
        NumberSequenceKeypoint.new(0.2, 0.843469, 0.238893),
        NumberSequenceKeypoint.new(0.3, 0.727755, 0.238893),
        NumberSequenceKeypoint.new(0.4, 0.584847, 0.192273),
        NumberSequenceKeypoint.new(0.5, 0.432236, 0.183593),
        NumberSequenceKeypoint.new(0.6, 0.287499, 0.147637),
        NumberSequenceKeypoint.new(0.7, 0.164867, 0.164867),
        NumberSequenceKeypoint.new(0.8, 0.073607, 0.073607),
        NumberSequenceKeypoint.new(0.9, 0.0182865, 0.0182865),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(3, 12),
    SpreadAngle = Vector2.new(22, 22),
})
local v3 = {Name = "Center", WorldCFrame = CFrame.new(718.448, 6.1, 909, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v3[Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(162, 255, 41)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(162, 255, 41))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.3), (NumberSequenceKeypoint.new(1, 1.3))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, -0.9), (NumberSequenceKeypoint.new(1, -0.9))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498313, 0.7625),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v4 = Create("Attachment", v3)
local v5 = Create("ParticleEmitter", {
    Name = "Dots",
    Acceleration = Vector3.new(0, 3, 0),
    Brightness = 12,
    Drag = 6,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 11,
    Texture = "rbxassetid://11800717040",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 128, 24)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 128, 24))),
    }),
    EmissionDirection = Enum.NormalId.Left,
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(1, 2),
    RotSpeed = NumberRange.new(-321, 321),
    Rotation = NumberRange.new(-360, 360),
    ShapeInOut = Enum.ParticleEmitterShapeInOut.InAndOut,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.389211, 0.145954),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-1.64442, 1.64442),
    SpreadAngle = Vector2.new(25, 180),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.194601, 0.1875, 0.0482581),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
v3 = Create("ParticleEmitter", {
    Name = "ErodeSmoke",
    Acceleration = Vector3.new(0, -0.0866716057062149, 0),
    Brightness = 1.9,
    Drag = 3,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 22,
    Texture = "rbxassetid://100955035693286",
    ZOffset = -0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(116, 241, 135)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(116, 241, 135))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(4, 5),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.433358, 0.216679),
        NumberSequenceKeypoint.new(0.1, 0.594541, 0.216679),
        NumberSequenceKeypoint.new(0.2, 0.66195, 0.216679),
        NumberSequenceKeypoint.new(0.3, 0.711984, 0.216679),
        NumberSequenceKeypoint.new(0.4, 0.752174, 0.216679),
        NumberSequenceKeypoint.new(0.5, 0.785303, 0.216679),
        NumberSequenceKeypoint.new(0.6, 0.812629, 0.216679),
        NumberSequenceKeypoint.new(0.7, 0.834677, 0.216679),
        NumberSequenceKeypoint.new(0.8, 0.851474, 0.216679),
        NumberSequenceKeypoint.new(0.9, 0.862554, 0.216679),
        (NumberSequenceKeypoint.new(1, 0.866716, 0.216679)),
    }),
    Speed = NumberRange.new(-0.544313, 0.544313),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.022362, 1),
        NumberSequenceKeypoint.new(0.197065, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
})
local v6 = Create("ParticleEmitter", {
    Name = "Leaves",
    Acceleration = Vector3.new(0, -0.9690013527870178, 0.16162322461605072),
    Brightness = 2,
    Drag = 2,
    FlipbookStartRandom = true,
    LightEmission = 0.4,
    LockedToPart = true,
    Rate = 6,
    Texture = "rbxassetid://129003547130533",
    ZOffset = -1.123,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 240, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(1, 3),
    RotSpeed = NumberRange.new(-111, 111),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.0459831, 0.187712, 0.0511132),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0.88827, 1.77654),
    SpreadAngle = Vector2.new(88, 88),
})
local v7 = {
    Name = "Sparkles",
    Acceleration = Vector3.new(0, 0.5648590326309204, 0),
    Brightness = 3,
    Drag = 9,
    FlipbookStartRandom = true,
    LightEmission = 1,
    Rate = 3,
    Texture = "rbxassetid://75257337824466",
    ZOffset = 1.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 255, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 255, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(0.5, 1.25),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.169458, 0.112972),
        NumberSequenceKeypoint.new(0.399049, 0.0829815, 0.0447827),
        NumberSequenceKeypoint.new(0.600423, 0.186709, 0.0582646),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(55, 55),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.0375264, 1),
        NumberSequenceKeypoint.new(0.0988372, 0),
        NumberSequenceKeypoint.new(0.700317, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v2
v1[2] = v4
v1[3] = v5
v1[4] = v3
v1[5] = v6
v1[6] = Create("ParticleEmitter", v7)
return v1