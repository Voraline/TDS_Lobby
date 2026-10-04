-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.JellyBeans
-- Decompile time: 1.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(-2.00057983, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
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
            NumberSequenceKeypoint.new(0.492, 0.488),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {Name = "2", CFrame = CFrame.new(2.00099993, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v5 = {
    Name = "JellyBeans",
    Acceleration = Vector3.new(0, -32.20000076293945, 0),
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
        NumberSequenceKeypoint.new(0.1, 0.386, 0.25),
        NumberSequenceKeypoint.new(0.117, 0.627, 0.25),
        NumberSequenceKeypoint.new(0.134, 0.178, 0.178),
        NumberSequenceKeypoint.new(0.15, 0.343, 0.25),
        NumberSequenceKeypoint.new(0.2, 0.299, 0.25),
        NumberSequenceKeypoint.new(0.3, 0.226, 0.226),
        NumberSequenceKeypoint.new(0.4, 0.166, 0.166),
        NumberSequenceKeypoint.new(0.5, 0.115, 0.115),
        NumberSequenceKeypoint.new(0.6, 0.0741, 0.0741),
        NumberSequenceKeypoint.new(0.7, 0.042, 0.042),
        NumberSequenceKeypoint.new(0.8, 0.0189, 0.0189),
        NumberSequenceKeypoint.new(0.9, 0.00478, 0.00478),
        NumberSequenceKeypoint.new(1, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(4, 12),
    SpreadAngle = Vector2.new(22, 22),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.302, 0),
        NumberSequenceKeypoint.new(0.897, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = Create("ParticleEmitter", v5)
return v1