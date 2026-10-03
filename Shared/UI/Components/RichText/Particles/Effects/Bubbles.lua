-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Bubbles
-- Decompile time: 3.36 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Bubbles2",
    Acceleration = Vector3.new(0, -30, 0),
    Brightness = 150,
    Drag = 9,
    LockedToPart = true,
    Rate = 12,
    ShapePartial = 2.3,
    Texture = "rbxassetid://14021491219",
    TimeScale = 0.8,
    ZOffset = 0.184,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(2, 86, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(2, 86, 255))),
    }),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(0.162, 1.13),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Disc,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.0668),
        (NumberSequenceKeypoint.new(1, 0.0759, 0.0237)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(40, 40),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v3 = Create("ParticleEmitter", {
    Name = "Bubblews",
    Acceleration = Vector3.new(0, 0.8479999899864197, 0),
    Brightness = 3,
    Drag = 4,
    LightEmission = 0.4,
    LockedToPart = true,
    Rate = 6,
    ShapePartial = 0.5,
    Texture = "rbxassetid://14975057231",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(142, 249, 255)),
        ColorSequenceKeypoint.new(0.26, Color3.fromRGB(33, 181, 250)),
        ColorSequenceKeypoint.new(0.407, Color3.fromRGB(96, 23, 205)),
        ColorSequenceKeypoint.new(0.593, Color3.fromRGB(231, 109, 192)),
        ColorSequenceKeypoint.new(0.773, Color3.fromRGB(236, 236, 13)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(55, 255, 0))),
    }),
    FlipbookFramerate = NumberRange.new(12),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(1.4, 1.8),
    Shape = Enum.ParticleEmitterShape.Disc,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.05, 0.141, 0.0707),
        NumberSequenceKeypoint.new(0.0732, 0.333, 0.0707),
        NumberSequenceKeypoint.new(0.1, 0.141, 0.0707),
        NumberSequenceKeypoint.new(0.929, 0.141, 0.0707),
        (NumberSequenceKeypoint.new(1, 0.424, 0.0707)),
    }),
    Speed = NumberRange.new(0, 1.41),
    SpreadAngle = Vector2.new(-360, 360),
    Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.195, -0.0867, 0.0347),
        NumberSequenceKeypoint.new(0.353, 0.0694, 0.0284),
        NumberSequenceKeypoint.new(0.435, -0.052, 0.0246),
        NumberSequenceKeypoint.new(0.5, 0.0347, 0.0215),
        NumberSequenceKeypoint.new(0.702, -0.0347, 0.0131),
        NumberSequenceKeypoint.new(0.862, 0.052, 0.0426),
        NumberSequenceKeypoint.new(0.918, -0.0867, 0.0188),
        NumberSequenceKeypoint.new(0.968, 0.0694, 0.00997),
        (NumberSequenceKeypoint.new(1, -0.225)),
    }),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.399, 0.05),
        NumberSequenceKeypoint.new(0.703, 0.206),
        NumberSequenceKeypoint.new(0.901, 0.506),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v4 = {Name = "Center"}
v4[Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 89, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 89, 255))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.3), (NumberSequenceKeypoint.new(1, 1.3))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, -0.9), (NumberSequenceKeypoint.new(1, -0.9))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.762),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v5 = Create("Attachment", v4)
local v6 = {
    Name = "Drops2",
    Acceleration = Vector3.new(0, -1.409999966621399, 0),
    Drag = 12,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 4,
    Texture = "rbxassetid://87678414912886",
    ZOffset = 1.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 179, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 179, 255))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2),
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0.265, 0.053))}),
    Speed = NumberRange.new(-0.349),
    Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), (NumberSequenceKeypoint.new(1, 0.2))}),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.503, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v2
v1[2] = v3
v1[3] = v5
v1[4] = Create("ParticleEmitter", v6)
return v1