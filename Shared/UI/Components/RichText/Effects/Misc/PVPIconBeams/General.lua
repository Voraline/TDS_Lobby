-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.PVPIconBeams.General
-- Decompile time: 3.91 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "Attachment",
    CFrame = CFrame.new(1.56390381, -0.0555119514, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
local v3 = {}
local v4 = {
    Name = "Beam",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(-4.1, 0.719357967, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
    WorldAxis = Vector3.new(-1, 0, 0),
    WorldSecondaryAxis = Vector3.new(0, -1, 0),
}
v4[Children] = {
    Create("Beam", {
        Name = "Beam",
        Brightness = 2.4,
        FaceCamera = true,
        LightEmission = 0.1,
        Texture = "rbxassetid://97604275944679",
        TextureSpeed = 0,
        Width0 = 1.3,
        Width1 = 1.3,
        ZOffset = 0.01,
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
local v5 = Create("Attachment", v4)
local v6 = Create("Attachment", {
    Name = "Up",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    WorldAxis = Vector3.new(-1, 0, 0),
    WorldSecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-4.1, -0.70596838, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local v7 = {Name = "Attachment", CFrame = CFrame.new(-4.1, 0.0123000145, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v7[Children] = {
    Create("ParticleEmitter", {
        Name = "RankUp",
        LightEmission = 0.5,
        LockedToPart = true,
        Rate = 0.5,
        Texture = "rbxassetid://111481698228178",
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(0.7),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.653), (NumberSequenceKeypoint.new(1, 0.653))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.05), (NumberSequenceKeypoint.new(1, 0.05))}),
    }),
    Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 149, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 30, 0))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.64),
            NumberSequenceKeypoint.new(0.1, 0.713),
            NumberSequenceKeypoint.new(0.2, 0.765),
            NumberSequenceKeypoint.new(0.3, 0.808),
            NumberSequenceKeypoint.new(0.4, 0.843),
            NumberSequenceKeypoint.new(0.5, 0.874),
            NumberSequenceKeypoint.new(0.6, 0.9),
            NumberSequenceKeypoint.new(0.7, 0.921),
            NumberSequenceKeypoint.new(0.8, 0.938),
            NumberSequenceKeypoint.new(0.9, 0.951),
            NumberSequenceKeypoint.new(1, 0.96),
            (NumberSequenceKeypoint.new(1, 0.96)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0.775),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "GlowLines",
        LightEmission = 1,
        LightInfluence = 1,
        LockedToPart = true,
        Rate = 5,
        Texture = "rbxassetid://17104026826",
        ZOffset = -3,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 140, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))),
        }),
        Lifetime = NumberRange.new(1, 2),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.295, 0.184),
            (NumberSequenceKeypoint.new(1, 0.949, 0.241)),
        }),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, -0.825), (NumberSequenceKeypoint.new(1, 0.75))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0.625),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "Flares",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 3,
        Texture = "rbxassetid://17241618949",
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 217, 0)),
            ColorSequenceKeypoint.new(0.365, Color3.fromRGB(255, 207, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 72, 0))),
        }),
        Lifetime = NumberRange.new(1),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.64, 0.32),
            NumberSequenceKeypoint.new(0.1, 0.858, 0.32),
            NumberSequenceKeypoint.new(0.2, 1.02, 0.32),
            NumberSequenceKeypoint.new(0.3, 1.14, 0.32),
            NumberSequenceKeypoint.new(0.4, 1.25, 0.32),
            NumberSequenceKeypoint.new(0.5, 1.34, 0.32),
            NumberSequenceKeypoint.new(0.6, 1.42, 0.32),
            NumberSequenceKeypoint.new(0.7, 1.48, 0.32),
            NumberSequenceKeypoint.new(0.8, 1.53, 0.32),
            NumberSequenceKeypoint.new(0.9, 1.57, 0.32),
            NumberSequenceKeypoint.new(1, 1.6, 0.32),
            (NumberSequenceKeypoint.new(1, 1.6, 0.32)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0.775),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "CommonSparkle",
        Acceleration = Vector3.new(0, 0.656000018119812, 0),
        Brightness = 3,
        Drag = 12,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 8,
        Texture = "rbxassetid://10888718050",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 170, 105)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 170, 105))),
        }),
        Lifetime = NumberRange.new(0.3, 0.6),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.273, 0),
            NumberSequenceKeypoint.new(0.347, 0.314),
            NumberSequenceKeypoint.new(0.498, 0.154),
            NumberSequenceKeypoint.new(0.649, 0.361),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Speed = NumberRange.new(2, 4),
        SpreadAngle = Vector2.new(-360, 360),
    }),
    (Create("ParticleEmitter", {
        Name = "Swirls",
        FlipbookStartRandom = true,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 1.1,
        Texture = "rbxassetid://136653236250775",
        ZOffset = 0.02,
        FlipbookFramerate = NumberRange.new(16),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.653), (NumberSequenceKeypoint.new(1, 0.653))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.05), (NumberSequenceKeypoint.new(1, 0.05))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.504, 0.734),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v3[1] = v5
v3[2] = v6
v3[3] = Create("Attachment", v7)
v2[Children] = v3
v1[1] = Create("Attachment", v2)
return v1