-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Heatwave
-- Decompile time: 4.31 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(-2.00054932, -0.13983202, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v2[Children] = {
    Create("Beam", {
        Name = "GlowBeam",
        Brightness = 3,
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://116892796441655",
        TextureLength = 0.3,
        TextureSpeed = 0.1,
        Width0 = 1.25,
        Width1 = 1.25,
        ZOffset = 0.3,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 167, 16)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 137, 69))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.493, 0.584),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {Name = "2", CFrame = CFrame.new(2.00097656, 0.0866088867, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
v2 = Create("ParticleEmitter", {
    Name = "BackgroundSmokeGlowing",
    Acceleration = Vector3.new(0.7760000228881836, -0.11500000208616257, 0),
    Drag = 3,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://133355140520916",
    ZOffset = -0.2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 17, 8)),
        ColorSequenceKeypoint.new(0.544, Color3.fromRGB(49, 16, 1)),
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
        NumberSequenceKeypoint.new(0, 0.229),
        NumberSequenceKeypoint.new(0.1, 0.402),
        NumberSequenceKeypoint.new(0.2, 0.507),
        NumberSequenceKeypoint.new(0.3, 0.585),
        NumberSequenceKeypoint.new(0.4, 0.646),
        NumberSequenceKeypoint.new(0.5, 0.695),
        NumberSequenceKeypoint.new(0.6, 0.734),
        NumberSequenceKeypoint.new(0.7, 0.763),
        NumberSequenceKeypoint.new(0.8, 0.784),
        NumberSequenceKeypoint.new(0.9, 0.797),
        NumberSequenceKeypoint.new(1, 0.802),
        (NumberSequenceKeypoint.new(1, 0.802)),
    }),
    Speed = NumberRange.new(0, 0.115),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.499, 0.412, 0.156),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v5 = Create("ParticleEmitter", {
    Name = "Dots",
    Acceleration = Vector3.new(4, 3.430000066757202, 0),
    Brightness = 8,
    Drag = 6,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 14,
    Texture = "rbxassetid://11800717040",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 179, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 38, 0))),
    }),
    EmissionDirection = Enum.NormalId.Left,
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(0.4, 1.5),
    RotSpeed = NumberRange.new(-321, 321),
    Rotation = NumberRange.new(-360, 360),
    ShapeInOut = Enum.ParticleEmitterShapeInOut.InAndOut,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.195, 0.073),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-0.822, 0.822),
    SpreadAngle = Vector2.new(25, 180),
    Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), (NumberSequenceKeypoint.new(1, 0.1))}),
})
local v6 = Create("ParticleEmitter", {
    Name = "GlowSmoke",
    Acceleration = Vector3.new(4, 0.75, 0),
    Brightness = 1.5,
    Drag = 2,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://88233404886395",
    WindAffectsDrag = true,
    ZOffset = -0.1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(229, 164, 0)),
        ColorSequenceKeypoint.new(0.259, Color3.fromRGB(154, 31, 0)),
        ColorSequenceKeypoint.new(0.826, Color3.fromRGB(0, 0, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(0.5, 1.5),
    RotSpeed = NumberRange.new(-22, 22),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0.291),
        NumberSequenceKeypoint.new(0.2, 0.402),
        NumberSequenceKeypoint.new(0.3, 0.49),
        NumberSequenceKeypoint.new(0.4, 0.561),
        NumberSequenceKeypoint.new(0.5, 0.619),
        NumberSequenceKeypoint.new(0.6, 0.666),
        NumberSequenceKeypoint.new(0.7, 0.703),
        NumberSequenceKeypoint.new(0.8, 0.729),
        NumberSequenceKeypoint.new(0.9, 0.745),
        NumberSequenceKeypoint.new(1, 0.75),
        (NumberSequenceKeypoint.new(1, 0.75)),
    }),
    Speed = NumberRange.new(0.5, 1),
    SpreadAngle = Vector2.new(11, 1),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.0215, 0.739),
        NumberSequenceKeypoint.new(0.0446, 0.5),
        NumberSequenceKeypoint.new(0.0988, 0.341),
        NumberSequenceKeypoint.new(0.198, 0.248),
        NumberSequenceKeypoint.new(0.297, 0.252),
        NumberSequenceKeypoint.new(0.4, 0.341),
        NumberSequenceKeypoint.new(0.5, 0.492),
        NumberSequenceKeypoint.new(0.6, 0.672),
        NumberSequenceKeypoint.new(0.7, 0.822),
        NumberSequenceKeypoint.new(0.8, 0.926),
        NumberSequenceKeypoint.new(0.9, 0.983),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v7 = {
    Name = "Tumbleweed",
    Acceleration = Vector3.new(3, 0, 0),
    Drag = 4,
    LockedToPart = true,
    Rate = 3,
    Texture = "rbxassetid://109381491899428",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(208, 159, 110)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(83, 53, 32))),
    }),
    FlipbookFramerate = NumberRange.new(12, 22),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(1, 1.5),
    Rotation = NumberRange.new(-5, 0.5),
    ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface,
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.4, 0.2), (NumberSequenceKeypoint.new(1, 0.4, 0.2))}),
    Speed = NumberRange.new(0),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.101, 0),
        NumberSequenceKeypoint.new(0.701, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v5
v1[5] = v6
v1[6] = Create("ParticleEmitter", v7)
return v1