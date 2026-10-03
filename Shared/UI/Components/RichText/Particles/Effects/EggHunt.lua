-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.EggHunt
-- Decompile time: 2.99 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(2.00058, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v2[Children] = {
    Create("Beam", {
        Name = "GlowBeam",
        Brightness = 12,
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://94981999988605",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 23, 185)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 23, 185))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.491828, 0.4875),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {Name = "2", CFrame = CFrame.new(-2.001, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
v2 = Create("ParticleEmitter", {
    Name = "Leaf",
    Acceleration = Vector3.new(0, -32.25, 0),
    Brightness = 2,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 22,
    Texture = "rbxassetid://137963283555643",
    ZOffset = -1,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(0.8, 1.25),
    RotSpeed = NumberRange.new(-234, 234),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0.386487, 0.25),
        NumberSequenceKeypoint.new(0.117336, 0.627219, 0.25),
        NumberSequenceKeypoint.new(0.133721, 0.177515, 0.177515),
        NumberSequenceKeypoint.new(0.149577, 0.343195, 0.25),
        NumberSequenceKeypoint.new(0.2, 0.298766, 0.25),
        NumberSequenceKeypoint.new(0.3, 0.226326, 0.226326),
        NumberSequenceKeypoint.new(0.4, 0.16566, 0.16566),
        NumberSequenceKeypoint.new(0.5, 0.115172, 0.115172),
        NumberSequenceKeypoint.new(0.6, 0.074073, 0.074073),
        NumberSequenceKeypoint.new(0.7, 0.0420028, 0.0420028),
        NumberSequenceKeypoint.new(0.8, 0.0188704, 0.0188704),
        NumberSequenceKeypoint.new(0.9, 0.00478069, 0.00478069),
        NumberSequenceKeypoint.new(1, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(4, 12),
    SpreadAngle = Vector2.new(22, 22),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.301634, 0),
        NumberSequenceKeypoint.new(0.897474, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v5 = Create("ParticleEmitter", {
    Name = "Stars",
    Brightness = 4,
    Drag = 6,
    LockedToPart = true,
    Rate = 10,
    Texture = "rbxassetid://100235720010709",
    ZOffset = 0.1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 0, 255)),
        ColorSequenceKeypoint.new(0.202422, Color3.fromRGB(254, 3, 120)),
        ColorSequenceKeypoint.new(0.207612, Color3.fromRGB(239, 0, 247)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(252, 160, 255)),
        ColorSequenceKeypoint.new(0.507488, Color3.fromRGB(255, 0, 115)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(232, 103, 255))),
    }),
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 3),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.3, 0),
        NumberSequenceKeypoint.new(0.4, 0.159136, 0.0795681),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(0.7, 0),
        NumberSequenceKeypoint.new(0.8, 0.0795681, 0.0477408),
        NumberSequenceKeypoint.new(0.9, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0.954817, 2.54618),
    SpreadAngle = Vector2.new(-360, 360),
})
local v6 = {
    Name = "Stars",
    Brightness = 4,
    Drag = 6,
    LockedToPart = true,
    Rate = 10,
    Texture = "rbxassetid://100235720010709",
    ZOffset = 0.1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 79, 105)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 79, 105))),
    }),
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 3),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.3, 0),
        NumberSequenceKeypoint.new(0.4, 0.159136, 0.0795681),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(0.7, 0),
        NumberSequenceKeypoint.new(0.8, 0.0795681, 0.0477408),
        NumberSequenceKeypoint.new(0.9, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0.954817, 2.54618),
    SpreadAngle = Vector2.new(-360, 360),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v5
v1[5] = Create("ParticleEmitter", v6)
return v1