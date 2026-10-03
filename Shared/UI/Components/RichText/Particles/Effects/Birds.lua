-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Birds
-- Decompile time: 4.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "ErodeSmoke",
    Acceleration = Vector3.new(0, -0.10000000149011612, 0),
    Drag = 3,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 16,
    Texture = "rbxassetid://100955035693286",
    ZOffset = -0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 188, 241)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 188, 241))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(4, 5),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5, 0.25),
        NumberSequenceKeypoint.new(0.1, 0.686, 0.25),
        NumberSequenceKeypoint.new(0.2, 0.764, 0.25),
        NumberSequenceKeypoint.new(0.3, 0.821, 0.25),
        NumberSequenceKeypoint.new(0.4, 0.868, 0.25),
        NumberSequenceKeypoint.new(0.5, 0.906, 0.25),
        NumberSequenceKeypoint.new(0.6, 0.938, 0.25),
        NumberSequenceKeypoint.new(0.7, 0.963, 0.25),
        NumberSequenceKeypoint.new(0.8, 0.982, 0.25),
        NumberSequenceKeypoint.new(0.9, 0.995, 0.25),
        (NumberSequenceKeypoint.new(1, 1, 0.25)),
    }),
    Speed = NumberRange.new(-0.628, 0.628),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.052, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
})
local v3 = Create("ParticleEmitter", {
    Name = "GlowingSmoke",
    Acceleration = Vector3.new(-0.800000011920929, -0.019999999552965164, 0.008999999612569809),
    Brightness = 2,
    Drag = 6,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 1,
    Texture = "rbxassetid://113056197708366",
    ZOffset = -0.3,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 48, 84)),
        ColorSequenceKeypoint.new(0.23, Color3.fromRGB(160, 188, 241)),
        ColorSequenceKeypoint.new(0.81, Color3.fromRGB(131, 155, 204)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 48, 84))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    FlipbookFramerate = NumberRange.new(25, 32),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(3, 5),
    ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.255, 0.299),
        NumberSequenceKeypoint.new(0.501, 0.384),
        NumberSequenceKeypoint.new(0.802, 0.32),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0.185),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.0996, 0),
        NumberSequenceKeypoint.new(0.901, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v4 = Create("ParticleEmitter", {
    Name = "GlowingSmoke2",
    Acceleration = Vector3.new(0.5, -0.10999999940395355, 0.05000000074505806),
    Brightness = 2,
    Drag = 6,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 9,
    Texture = "rbxassetid://100955035693286",
    ZOffset = -0.45,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 188, 241)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 188, 241))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(4, 5),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.55, 0.275),
        NumberSequenceKeypoint.new(0.1, 0.755, 0.275),
        NumberSequenceKeypoint.new(0.2, 0.84, 0.275),
        NumberSequenceKeypoint.new(0.3, 0.904, 0.275),
        NumberSequenceKeypoint.new(0.4, 0.955, 0.275),
        NumberSequenceKeypoint.new(0.5, 0.997, 0.275),
        NumberSequenceKeypoint.new(0.6, 1.03, 0.275),
        NumberSequenceKeypoint.new(0.7, 1.06, 0.275),
        NumberSequenceKeypoint.new(0.8, 1.08, 0.275),
        NumberSequenceKeypoint.new(0.9, 1.09, 0.275),
        (NumberSequenceKeypoint.new(1, 1.1, 0.275)),
    }),
    Speed = NumberRange.new(1),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.052, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
})
local v5 = {Name = "1", CFrame = CFrame.new(-2.00057983, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v5[Children] = {
    Create("Beam", {
        Name = "GlowBeam",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://128263884132195",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(138, 159, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(47, 85, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.492, 0.488),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "GlowBeam",
        Brightness = 2,
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://114208817139118",
        TextureLength = 0.125,
        TextureSpeed = 0.1,
        Width0 = 1.25,
        Width1 = 1.25,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 126, 255)),
            ColorSequenceKeypoint.new(0.488, Color3.fromRGB(202, 214, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 126, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.492, 0.488),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v6 = Create("Attachment", v5)
local v7 = {Name = "2", CFrame = CFrame.new(2.00099993, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v1[1] = v2
v1[2] = v3
v1[3] = v4
v1[4] = v6
v1[5] = Create("Attachment", v7)
return v1