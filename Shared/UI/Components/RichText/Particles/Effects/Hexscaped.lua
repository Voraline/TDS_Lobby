-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Hexscaped
-- Decompile time: 5.28 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "FgSmoke",
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 16,
    Texture = "rbxassetid://17285277195",
    ZOffset = -2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 225, 131)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 225, 131))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 3),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.54, 0.18),
        NumberSequenceKeypoint.new(0.1, 0.704, 0.18),
        NumberSequenceKeypoint.new(0.2, 0.818, 0.18),
        NumberSequenceKeypoint.new(0.3, 0.908, 0.18),
        NumberSequenceKeypoint.new(0.4, 0.981, 0.18),
        NumberSequenceKeypoint.new(0.5, 1.04, 0.18),
        NumberSequenceKeypoint.new(0.6, 1.09, 0.18),
        NumberSequenceKeypoint.new(0.7, 1.12, 0.18),
        NumberSequenceKeypoint.new(0.8, 1.15, 0.18),
        NumberSequenceKeypoint.new(0.9, 1.16, 0.18),
        NumberSequenceKeypoint.new(1, 1.17, 0.18),
        (NumberSequenceKeypoint.new(1, 1.17, 0.18)),
    }),
    Speed = NumberRange.new(0.045, 0.225),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.469, 0.113),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v3 = Create("ParticleEmitter", {
    Name = "BackgroundSmoke",
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 16,
    Texture = "rbxassetid://11881355186",
    ZOffset = -3,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 0, 100)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 0, 100))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 3),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.518, 0.173),
        NumberSequenceKeypoint.new(0.1, 0.676, 0.173),
        NumberSequenceKeypoint.new(0.2, 0.786, 0.173),
        NumberSequenceKeypoint.new(0.3, 0.872, 0.173),
        NumberSequenceKeypoint.new(0.4, 0.942, 0.173),
        NumberSequenceKeypoint.new(0.5, 0.999, 0.173),
        NumberSequenceKeypoint.new(0.6, 1.04, 0.173),
        NumberSequenceKeypoint.new(0.7, 1.08, 0.173),
        NumberSequenceKeypoint.new(0.8, 1.1, 0.173),
        NumberSequenceKeypoint.new(0.9, 1.12, 0.173),
        NumberSequenceKeypoint.new(1, 1.12, 0.173),
        (NumberSequenceKeypoint.new(1, 1.12, 0.173)),
    }),
    Speed = NumberRange.new(0.0432, 0.216),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.469, 0.113),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v4 = Create("ParticleEmitter", {
    Name = "Dots",
    Brightness = 5,
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 4,
    ShapePartial = 0.4,
    Texture = "rbxassetid://11800717040",
    ZOffset = 1.2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(247, 0, 255)),
        ColorSequenceKeypoint.new(0.0657, Color3.fromRGB(225, 0, 255)),
        ColorSequenceKeypoint.new(0.531, Color3.fromRGB(66, 0, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 149))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(3, 6),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.13, 0.359, 0.0578),
        NumberSequenceKeypoint.new(0.3, 0.193, 0.0805),
        NumberSequenceKeypoint.new(0.4, 0.663, 0.109),
        NumberSequenceKeypoint.new(0.5, 0.497, 0.138),
        NumberSequenceKeypoint.new(0.6, 0.111, 0.11),
        NumberSequenceKeypoint.new(0.698, 0.221, 0.0826),
        NumberSequenceKeypoint.new(0.799, 0.608, 0.112),
        NumberSequenceKeypoint.new(0.895, 0.415, 0.143),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-3, 3),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.462, 0.137),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v5 = Create("Attachment", {Name = "4", CFrame = CFrame.new(-3.5, 0, 0)})
local v6 = {Name = "3", CFrame = CFrame.new(3.5, 0, 0)}
v6[Children] = {
    Create("Beam", {
        Name = "Glow",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://128263884132195",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(119, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(119, 0, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.492, 0.488),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "SmokeSwirl2",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://114380910487048",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        Width0 = 2,
        Width1 = 2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 170)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 170))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "SmokeSwirl1",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://113929761496028",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        Width0 = 3,
        Width1 = 3,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 102)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 102))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v7 = Create("Attachment", v6)
local v8 = {
    Name = "BrighttSwirl",
    Acceleration = Vector3.new(0, -1, 0),
    Brightness = 5,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 11,
    Texture = "rbxassetid://80397661829393",
    ZOffset = -2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 157)),
        ColorSequenceKeypoint.new(0.567, Color3.fromRGB(149, 0, 241)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 128))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(1, 2),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Cylinder,
    ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.499, 0.125),
        NumberSequenceKeypoint.new(0.1, 0.622, 0.125),
        NumberSequenceKeypoint.new(0.2, 0.717, 0.125),
        NumberSequenceKeypoint.new(0.3, 0.794, 0.125),
        NumberSequenceKeypoint.new(0.4, 0.854, 0.125),
        NumberSequenceKeypoint.new(0.5, 0.902, 0.125),
        NumberSequenceKeypoint.new(0.6, 0.939, 0.125),
        NumberSequenceKeypoint.new(0.7, 0.966, 0.125),
        NumberSequenceKeypoint.new(0.8, 0.985, 0.125),
        NumberSequenceKeypoint.new(0.9, 0.996, 0.125),
        NumberSequenceKeypoint.new(1, 0.999, 0.125),
        (NumberSequenceKeypoint.new(1, 0.999, 0.125)),
    }),
    Speed = NumberRange.new(0),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0.744),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v2
v1[2] = v3
v1[3] = v4
v1[4] = v5
v1[5] = v7
v1[6] = Create("ParticleEmitter", v8)
return v1