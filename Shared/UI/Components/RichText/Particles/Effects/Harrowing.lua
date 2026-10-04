-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Harrowing
-- Decompile time: 2.49 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "Moon", CFrame = CFrame.new(-0.62, 0.5, 0)}
v2[Children] = {
    Create("ParticleEmitter", {
        Name = "Moon",
        Brightness = 1.5,
        LockedToPart = true,
        Rate = 1.3,
        Texture = "rbxassetid://115776324084691",
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.502, Color3.fromRGB(255, 163, 70)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
        }),
        Lifetime = NumberRange.new(2),
        Rotation = NumberRange.new(-33),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.5), (NumberSequenceKeypoint.new(1, 1.5))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = {Name = "Attachment", CFrame = CFrame.new(2, 0, 0)}
v4[Children] = {
    Create("ParticleEmitter", {
        Name = "Clouds",
        Drag = 0.3,
        FlipbookStartRandom = true,
        LockedToPart = true,
        Rate = 10,
        Texture = "rbxassetid://14449330724",
        ZOffset = -0.9,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(44, 49, 81)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(44, 49, 81))),
        }),
        EmissionDirection = Enum.NormalId.Left,
        FlipbookFramerate = NumberRange.new(0),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
        Lifetime = NumberRange.new(4, 6),
        RotSpeed = NumberRange.new(-11, 11),
        Rotation = NumberRange.new(-360, 360),
        Speed = NumberRange.new(1),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.397, 0.0875, 0.025),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v5 = Create("Attachment", v4)
v2 = Create("Beam", {
    Name = "Cloud1",
    FaceCamera = true,
    Segments = 22,
    Texture = "rbxassetid://14448663843",
    TextureSpeed = 0.025,
    Width0 = 3,
    Width1 = 3,
    ZOffset = -0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 2, 44)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 2, 44))),
    }),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.074, 0.7),
        NumberSequenceKeypoint.new(0.199, 0.256),
        NumberSequenceKeypoint.new(0.299, 0),
        NumberSequenceKeypoint.new(0.499, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v6 = {
    Name = "Bats",
    Acceleration = Vector3.new(2.4600000381469727, 4.920000076293945, -2.4600000381469727),
    Brightness = 0,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://125627232198519",
    ZOffset = -0.9,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.491, Color3.fromRGB(234, 234, 234)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(66, 66, 66))),
    }),
    FlipbookFramerate = NumberRange.new(14, 22),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(1.5, 2.5),
    RotSpeed = NumberRange.new(-66, 66),
    Rotation = NumberRange.new(-66, 66),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.0581, 0),
        NumberSequenceKeypoint.new(0.1, 0.951, 0.615),
        NumberSequenceKeypoint.new(0.2, 0.735, 0.615),
        NumberSequenceKeypoint.new(0.3, 0.557, 0.557),
        NumberSequenceKeypoint.new(0.4, 0.408, 0.408),
        NumberSequenceKeypoint.new(0.5, 0.283, 0.283),
        NumberSequenceKeypoint.new(0.6, 0.182, 0.182),
        NumberSequenceKeypoint.new(0.7, 0.103, 0.103),
        NumberSequenceKeypoint.new(0.8, 0.0464, 0.0464),
        NumberSequenceKeypoint.new(0.9, 0.0118, 0.0118),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-4.92, 4.92),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.302, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v3
v1[2] = v5
v1[3] = v2
v1[4] = Create("ParticleEmitter", v6)
return v1