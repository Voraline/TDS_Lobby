-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Lemons
-- Decompile time: 4.01 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Bobux",
    Acceleration = Vector3.new(0, -12, 0),
    Brightness = 1.7,
    Drag = 5,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    Rate = 6.69,
    Texture = "rbxassetid://116850928223335",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 227, 171)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 227, 171))),
    }),
    FlipbookFramerate = NumberRange.new(22, 32),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(0.5, 1.4),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.291907, 0.145953),
        NumberSequenceKeypoint.new(0.1, 0.283942, 0.145953),
        NumberSequenceKeypoint.new(0.2, 0.260823, 0.145953),
        NumberSequenceKeypoint.new(0.3, 0.225041, 0.145953),
        NumberSequenceKeypoint.new(0.4, 0.18085, 0.145953),
        NumberSequenceKeypoint.new(0.5, 0.133659, 0.133659),
        NumberSequenceKeypoint.new(0.6, 0.0889021, 0.0889021),
        NumberSequenceKeypoint.new(0.7, 0.0509812, 0.0509812),
        NumberSequenceKeypoint.new(0.8, 0.0227612, 0.0227612),
        NumberSequenceKeypoint.new(0.9, 0.00565466, 0.00565466),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 7.08588),
    SpreadAngle = Vector2.new(44, 44),
})
local v3 = {Name = "Center", WorldCFrame = CFrame.new(723.448, 6.1, 909, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v3[Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 132, 32)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 132, 32))),
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
    Name = "Goo",
    Acceleration = Vector3.new(0, -4.336813926696777, 0),
    Brightness = 2,
    FlipbookStartRandom = true,
    LightEmission = 0.2,
    LockedToPart = true,
    Rate = 22,
    Texture = "rbxassetid://80114250436548",
    ZOffset = -1.1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 250, 90)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 170, 0))),
    }),
    EmissionDirection = Enum.NormalId.Back,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(0.3, 0.8),
    RotSpeed = NumberRange.new(-22, 22),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.306088),
        NumberSequenceKeypoint.new(0.1, 0.38825),
        NumberSequenceKeypoint.new(0.2, 0.439219),
        NumberSequenceKeypoint.new(0.3, 0.478575),
        NumberSequenceKeypoint.new(0.4, 0.510777),
        NumberSequenceKeypoint.new(0.5, 0.53767),
        NumberSequenceKeypoint.new(0.6, 0.560171),
        NumberSequenceKeypoint.new(0.7, 0.578753),
        NumberSequenceKeypoint.new(0.8, 0.593628),
        NumberSequenceKeypoint.new(0.9, 0.604818),
        NumberSequenceKeypoint.new(1, 0.612175),
        (NumberSequenceKeypoint.new(1, 0.612175)),
    }),
    Speed = NumberRange.new(0, 0.116763),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0.24375, 0.14375),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
v3 = Create("ParticleEmitter", {
    Name = "Spark",
    Brightness = 4,
    Drag = 4,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://16845939768",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 116, 0)),
        ColorSequenceKeypoint.new(0.484429, Color3.fromRGB(249, 218, 63)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 116, 0))),
    }),
    Lifetime = NumberRange.new(0.6, 1.2),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.34632, 0.274949, 0.0509164),
        NumberSequenceKeypoint.new(0.500309, 0.0916496),
        NumberSequenceKeypoint.new(0.647495, 0.254582, 0.0509167),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
})
local v6 = Create("ParticleEmitter", {
    Name = "TinyDots",
    Drag = 6,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LightInfluence = 1,
    LockedToPart = true,
    Rate = 4,
    Texture = "rbxassetid://11800717040",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 32)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 32))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.664273, 0.253169),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 2),
    SpreadAngle = Vector2.new(-360, 360),
})
local v7 = {
    Name = "WaterDrops",
    Acceleration = Vector3.new(0, -27.239112854003906, 0),
    Brightness = 3,
    Drag = 12,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 22,
    ShapePartial = 0.6,
    Texture = "rbxassetid://104581830276474",
    ZOffset = -0.4,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(209, 186, 54)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(209, 85, 14))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(0.2, 0.6),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.0190141, 0.34815, 0.145062),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-3.60258, 3.60258),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.197065, 0),
        (NumberSequenceKeypoint.new(1, 0.6)),
    }),
}
v1[1] = v2
v1[2] = v4
v1[3] = v5
v1[4] = v3
v1[5] = v6
v1[6] = Create("ParticleEmitter", v7)
return v1