-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Butterflies
-- Decompile time: 4.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(-2.00057983, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v2[Children] = {
    Create("Beam", {
        Name = "Beam",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://71382903252205",
        TextureLength = 0.1,
        TextureSpeed = -0.2,
        Width0 = 2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 60, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "Beam",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://71382903252205",
        TextureLength = 0.25,
        TextureSpeed = 0.3,
        Width1 = 2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 78, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(240, 78, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "GlowBeam",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://128263884132195",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 99, 242)),
            ColorSequenceKeypoint.new(0.244, Color3.fromRGB(255, 103, 210)),
            ColorSequenceKeypoint.new(0.517, Color3.fromRGB(255, 116, 103)),
            ColorSequenceKeypoint.new(0.661, Color3.fromRGB(255, 126, 14)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 128, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.492, 0.488),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {Name = "2", CFrame = CFrame.new(2.00099993, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
v2 = Create("ParticleEmitter", {
    Name = "Moths",
    Acceleration = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612),
    Brightness = 3,
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 6,
    Texture = "rbxassetid://120762238111496",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 138, 70)),
        ColorSequenceKeypoint.new(0.415, Color3.fromRGB(255, 137, 75)),
        ColorSequenceKeypoint.new(0.562, Color3.fromRGB(255, 109, 225)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 243))),
    }),
    FlipbookFramerate = NumberRange.new(32, 48),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(1, 3),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.0994, 0.187, 0.079),
        NumberSequenceKeypoint.new(0.2, 0.261, 0.146),
        NumberSequenceKeypoint.new(0.3, 0.225, 0.146),
        NumberSequenceKeypoint.new(0.4, 0.181, 0.146),
        NumberSequenceKeypoint.new(0.5, 0.134, 0.134),
        NumberSequenceKeypoint.new(0.6, 0.0889, 0.0889),
        NumberSequenceKeypoint.new(0.7, 0.051, 0.051),
        NumberSequenceKeypoint.new(0.8, 0.0228, 0.0228),
        NumberSequenceKeypoint.new(0.9, 0.00565, 0.00565),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-1, 1),
    SpreadAngle = Vector2.new(-360, 360),
})
local v5 = Create("ParticleEmitter", {
    Name = "Moths",
    Acceleration = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612),
    Brightness = 5,
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 0.4,
    LockedToPart = true,
    Rate = 3,
    Texture = "rbxassetid://118149320623261",
    ZOffset = -0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 228, 164)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 0))),
    }),
    FlipbookFramerate = NumberRange.new(12, 18),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(1, 3),
    RotSpeed = NumberRange.new(-22, 22),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.0994, 0.187, 0.079),
        NumberSequenceKeypoint.new(0.2, 0.261, 0.146),
        NumberSequenceKeypoint.new(0.3, 0.225, 0.146),
        NumberSequenceKeypoint.new(0.4, 0.181, 0.146),
        NumberSequenceKeypoint.new(0.5, 0.134, 0.134),
        NumberSequenceKeypoint.new(0.6, 0.0889, 0.0889),
        NumberSequenceKeypoint.new(0.7, 0.051, 0.051),
        NumberSequenceKeypoint.new(0.8, 0.0228, 0.0228),
        NumberSequenceKeypoint.new(0.9, 0.00565, 0.00565),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-3, 3),
    SpreadAngle = Vector2.new(-360, 360),
})
local v6 = Create("ParticleEmitter", {
    Name = "StarCluster",
    Acceleration = Vector3.new(0, -0.17599999904632568, 0),
    Brightness = 8,
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://17696603161",
    ZOffset = -0.05,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(252, 158, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 134, 64))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(1, 2),
    RotSpeed = NumberRange.new(-5, 5),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.528, 0.176),
        NumberSequenceKeypoint.new(0.1, 0.549, 0.176),
        NumberSequenceKeypoint.new(0.2, 0.569, 0.176),
        NumberSequenceKeypoint.new(0.3, 0.589, 0.176),
        NumberSequenceKeypoint.new(0.4, 0.61, 0.176),
        NumberSequenceKeypoint.new(0.5, 0.632, 0.176),
        NumberSequenceKeypoint.new(0.6, 0.656, 0.176),
        NumberSequenceKeypoint.new(0.7, 0.682, 0.176),
        NumberSequenceKeypoint.new(0.8, 0.712, 0.176),
        NumberSequenceKeypoint.new(0.9, 0.748, 0.176),
        NumberSequenceKeypoint.new(1, 0.793, 0.176),
        (NumberSequenceKeypoint.new(1, 0.793, 0.176)),
    }),
    Speed = NumberRange.new(0.0881, 0.44),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.469, 0.113),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v7 = {
    Name = "TinyDots",
    Acceleration = Vector3.new(0, -0.8840000033378601, 0),
    Brightness = 4,
    Drag = 6,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 6,
    Texture = "rbxassetid://11800717040",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 102, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 97, 229))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(1, 6),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.201, 0.308, 0.126),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 1.05),
    SpreadAngle = Vector2.new(111, 111),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v5
v1[5] = v6
v1[6] = Create("ParticleEmitter", v7)
return v1