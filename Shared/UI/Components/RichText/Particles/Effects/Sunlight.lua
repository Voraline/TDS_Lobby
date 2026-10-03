-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Sunlight
-- Decompile time: 6.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(-2.00057983, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v2[Children] = {
    Create("Beam", {
        Name = "GlowBeam",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://128263884132195",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 85, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.492, 0.488),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {Name = "2", CFrame = CFrame.new(2.00099993, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v5 = {Name = "Attachment", CFrame = CFrame.new(0, -3.10000014, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v5[Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 106, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 106, 0))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3.24), (NumberSequenceKeypoint.new(1, 3.24))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), (NumberSequenceKeypoint.new(1, 0.2))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.762),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "BStar",
        Drag = 4,
        LightEmission = 1,
        Rate = 12,
        Texture = "rbxassetid://10888604874",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(244, 255, 192)),
            ColorSequenceKeypoint.new(0.441, Color3.fromRGB(255, 217, 25)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 0))),
        }),
        Lifetime = NumberRange.new(0.8, 2),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.0985, 0.149, 0.0897),
            NumberSequenceKeypoint.new(0.186, 0),
            NumberSequenceKeypoint.new(0.314, 0.299, 0.149),
            NumberSequenceKeypoint.new(0.434, 0),
            NumberSequenceKeypoint.new(0.574, 0.179, 0.0598),
            NumberSequenceKeypoint.new(0.692, 0),
            NumberSequenceKeypoint.new(0.833, 0.329, 0.179),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Speed = NumberRange.new(2.39, 12),
        SpreadAngle = Vector2.new(-360, 360),
    }),
    Create("ParticleEmitter", {
        Name = "Flare",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://16791538193",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 223, 105)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 223, 105))),
        }),
        Lifetime = NumberRange.new(1),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3.35), (NumberSequenceKeypoint.new(1, 3.35))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.762),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "CommonSparkle",
        Acceleration = Vector3.new(0, 2, 0),
        Brightness = 3,
        Drag = 12,
        LightEmission = 1,
        Rate = 16,
        Texture = "rbxassetid://10888718050",
        ZOffset = 2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 141, 52)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 141, 52))),
        }),
        Lifetime = NumberRange.new(0.3, 0.6),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.484, 0),
            NumberSequenceKeypoint.new(0.489, 0.335, 0.107),
            NumberSequenceKeypoint.new(0.551, 0.602, 0.107),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Speed = NumberRange.new(12, 26),
        SpreadAngle = Vector2.new(-360, 360),
    }),
    (Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LightInfluence = 1,
        LockedToPart = true,
        Rate = 15,
        Texture = "rbxassetid://7105041644",
        ZOffset = -3,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 191, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 191, 0))),
        }),
        Lifetime = NumberRange.new(1),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1.72, 0.34),
            (NumberSequenceKeypoint.new(1, 2.87, 0.445)),
        }),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, -0.825), (NumberSequenceKeypoint.new(1, 0.75))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0.625),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v2 = Create("Attachment", v5)
local v6 = {
    Name = "Sun",
    CFrame = CFrame.new(-1.31774902, 0.246692181, 1.01281738, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v6[Children] = {
    Create("ParticleEmitter", {
        Name = "SunSikdeFlare",
        Brightness = 4,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://100039362635459",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))),
        }),
        Lifetime = NumberRange.new(2),
        RotSpeed = NumberRange.new(-3, 3),
        Rotation = NumberRange.new(250),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1.97),
            NumberSequenceKeypoint.new(0.1, 2.05),
            NumberSequenceKeypoint.new(0.2, 2.11),
            NumberSequenceKeypoint.new(0.3, 2.16),
            NumberSequenceKeypoint.new(0.4, 2.2),
            NumberSequenceKeypoint.new(0.5, 2.23),
            NumberSequenceKeypoint.new(0.6, 2.25),
            NumberSequenceKeypoint.new(0.7, 2.27),
            NumberSequenceKeypoint.new(0.8, 2.29),
            NumberSequenceKeypoint.new(0.9, 2.29),
            NumberSequenceKeypoint.new(1, 2.3),
            (NumberSequenceKeypoint.new(1, 2.3)),
        }),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), (NumberSequenceKeypoint.new(1, 0.1))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.497, 0.863),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "SunRays",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://72635100182883",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))),
        }),
        Lifetime = NumberRange.new(2),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1.13),
            NumberSequenceKeypoint.new(0.1, 1.29),
            NumberSequenceKeypoint.new(0.2, 1.41),
            NumberSequenceKeypoint.new(0.3, 1.5),
            NumberSequenceKeypoint.new(0.4, 1.57),
            NumberSequenceKeypoint.new(0.5, 1.62),
            NumberSequenceKeypoint.new(0.6, 1.65),
            NumberSequenceKeypoint.new(0.7, 1.67),
            NumberSequenceKeypoint.new(0.8, 1.69),
            NumberSequenceKeypoint.new(0.9, 1.7),
            NumberSequenceKeypoint.new(1, 1.7),
            (NumberSequenceKeypoint.new(1, 1.7)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.0437),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "NarrowRays",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 3,
        Texture = "rbxassetid://16791538193",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))),
        }),
        Lifetime = NumberRange.new(2),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1.05),
            NumberSequenceKeypoint.new(0.1, 1.24),
            NumberSequenceKeypoint.new(0.2, 1.39),
            NumberSequenceKeypoint.new(0.3, 1.5),
            NumberSequenceKeypoint.new(0.4, 1.58),
            NumberSequenceKeypoint.new(0.5, 1.64),
            NumberSequenceKeypoint.new(0.6, 1.68),
            NumberSequenceKeypoint.new(0.7, 1.71),
            NumberSequenceKeypoint.new(0.8, 1.73),
            NumberSequenceKeypoint.new(0.9, 1.74),
            NumberSequenceKeypoint.new(1, 1.74),
            (NumberSequenceKeypoint.new(1, 1.74)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.486, 0.394),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "Sun",
        Brightness = 22,
        FlipbookStartRandom = true,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 1,
        Texture = "rbxassetid://81396557158474",
        FlipbookFramerate = NumberRange.new(0),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
        Lifetime = NumberRange.new(2),
        RotSpeed = NumberRange.new(-22, 22),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.775), (NumberSequenceKeypoint.new(1, 0.775))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.0437),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "SunFlare",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://17027547873",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))),
        }),
        Lifetime = NumberRange.new(2),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2.04), (NumberSequenceKeypoint.new(1, 2.04))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.497, 0.863),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v7 = Create("Attachment", v6)
v5 = Create("Attachment", {Name = "SunlightBot", CFrame = CFrame.new(0, -6.30000019, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v8 = {Name = "SunlightTop", CFrame = CFrame.new(0, 2.10000038, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v8[Children] = {
    Create("Beam", {
        Name = "GlowBeam",
        FaceCamera = true,
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://128263884132195",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        Width0 = 2,
        Width1 = 5,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 41)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 119, 41))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.492, 0.488),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v7
v1[5] = v5
v1[6] = Create("Attachment", v8)
return v1