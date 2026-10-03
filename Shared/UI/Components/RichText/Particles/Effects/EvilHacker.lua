-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.EvilHacker
-- Decompile time: 4.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Square",
    Drag = 5,
    LockedToPart = true,
    Rate = 11,
    Texture = "rbxassetid://17253889917",
    ZOffset = -0.6,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(17, 0, 57)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 0, 57))),
    }),
    Lifetime = NumberRange.new(0.6),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.183), (NumberSequenceKeypoint.new(1, 0))}),
    Speed = NumberRange.new(-1, 1),
    SpreadAngle = Vector2.new(-360, 360),
    Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.0935, 0.711),
        NumberSequenceKeypoint.new(0.197, -0.52),
        NumberSequenceKeypoint.new(0.296, 0.832),
        NumberSequenceKeypoint.new(0.399, -0.694),
        NumberSequenceKeypoint.new(0.5, 0.815),
        NumberSequenceKeypoint.new(0.599, -0.728),
        NumberSequenceKeypoint.new(0.698, 0.728),
        NumberSequenceKeypoint.new(0.798, -0.711),
        NumberSequenceKeypoint.new(0.903, 1.02),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
})
local v3 = Create("ParticleEmitter", {
    Name = "NumberFlipDark",
    Drag = 12,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 9,
    Texture = "rbxassetid://101033780328076",
    ZOffset = 0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(7, 0, 29)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 0, 29))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(0.5, 1),
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.185, 0.0924), (NumberSequenceKeypoint.new(1, 0))}),
    Speed = NumberRange.new(1.85, 8.32),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5, 0.2),
        NumberSequenceKeypoint.new(0.502, 0.494, 0.2),
        NumberSequenceKeypoint.new(0.504, 1),
        NumberSequenceKeypoint.new(0.638, 1),
        NumberSequenceKeypoint.new(0.641, 0.494, 0.2),
        NumberSequenceKeypoint.new(0.67, 0.5, 0.2),
        NumberSequenceKeypoint.new(0.671, 1),
        NumberSequenceKeypoint.new(0.752, 1),
        NumberSequenceKeypoint.new(0.755, 0),
        NumberSequenceKeypoint.new(0.813, 0),
        NumberSequenceKeypoint.new(0.823, 1),
        NumberSequenceKeypoint.new(0.885, 1),
        NumberSequenceKeypoint.new(0.889, 0),
        NumberSequenceKeypoint.new(0.938, 0),
        NumberSequenceKeypoint.new(0.94, 1),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v4 = Create("ParticleEmitter", {
    Name = "NumberFlip",
    Brightness = 16,
    Drag = 12,
    FlipbookStartRandom = true,
    LightEmission = 0.3,
    LockedToPart = true,
    Rate = 9,
    Texture = "rbxassetid://101033780328076",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 60)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 60))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(0.5, 1),
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.185, 0.0924), (NumberSequenceKeypoint.new(1, 0))}),
    Speed = NumberRange.new(1.85, 8.32),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5, 0.2),
        NumberSequenceKeypoint.new(0.502, 0.494, 0.2),
        NumberSequenceKeypoint.new(0.504, 1),
        NumberSequenceKeypoint.new(0.638, 1),
        NumberSequenceKeypoint.new(0.641, 0.494, 0.2),
        NumberSequenceKeypoint.new(0.67, 0.5, 0.2),
        NumberSequenceKeypoint.new(0.671, 1),
        NumberSequenceKeypoint.new(0.752, 1),
        NumberSequenceKeypoint.new(0.755, 0.232, 0.2),
        NumberSequenceKeypoint.new(0.816, 0.237, 0.2),
        NumberSequenceKeypoint.new(0.823, 1),
        NumberSequenceKeypoint.new(0.885, 1),
        NumberSequenceKeypoint.new(0.892, 0.75, 0.2),
        NumberSequenceKeypoint.new(0.912, 0.756, 0.2),
        NumberSequenceKeypoint.new(0.919, 1),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v5 = {Name = "1", CFrame = CFrame.new(1.7401886, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v5[Children] = {
    Create("Beam", {
        Name = "Grid",
        Brightness = 5,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://17274985244",
        Width0 = 0.8,
        Width1 = 0.8,
        ZOffset = 0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 60)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 60))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0.737),
            NumberSequenceKeypoint.new(0.5, 0.489),
            NumberSequenceKeypoint.new(0.9, 0.742),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "DarkPixels",
        FaceCamera = true,
        Texture = "rbxassetid://113521228553129",
        TextureLength = 5,
        TextureSpeed = 2,
        Width0 = 0.7,
        Width1 = 0.7,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(18, 0, 43)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 0, 43))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.506, 0),
            NumberSequenceKeypoint.new(0.947, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "DarkBG",
        FaceCamera = true,
        Texture = "rbxassetid://82101317617559",
        TextureLength = 9,
        TextureSpeed = 1.5,
        Width0 = 0.8,
        Width1 = 0.8,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 0, 70)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 0, 70))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0.737),
            NumberSequenceKeypoint.new(0.5, 0.489),
            NumberSequenceKeypoint.new(0.9, 0.742),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v6 = Create("Attachment", v5)
local v7 = {Name = "2", CFrame = CFrame.new(-1.70072937, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v1[1] = v2
v1[2] = v3
v1[3] = v4
v1[4] = v6
v1[5] = Create("Attachment", v7)
return v1