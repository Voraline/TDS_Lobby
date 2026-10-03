-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Crab
-- Decompile time: 1.84 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local v1 = {}
local v2 = {Name = "Center"}
v2[Create.Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 32, 32)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 32, 32))),
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
local v3 = Create("Attachment", v2)
local v4 = Create("ParticleEmitter", {
    Name = "Crab",
    Brightness = 2.5,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 1.35,
    Texture = "rbxassetid://137395627969169",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 158, 130)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 158, 130))),
    }),
    EmissionDirection = Enum.NormalId.Left,
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(2, 3),
    Rotation = NumberRange.new(-5, 5),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0.336, 0.15),
        NumberSequenceKeypoint.new(0.899, 0.373, 0.15),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-0.246, 0.246),
    SpreadAngle = Vector2.new(-5, 5),
})
local v5 = {
    Name = "Tix",
    Acceleration = Vector3.new(0, -6, 0),
    Brightness = 2,
    Drag = 5,
    FlipbookStartRandom = true,
    LightEmission = 0.4,
    LockedToPart = true,
    Rate = 15,
    Texture = "rbxassetid://122516086124746",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(162, 255, 162)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(48, 125, 60))),
    }),
    FlipbookFramerate = NumberRange.new(11, 22),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(0.5, 1.4),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.292, 0.146),
        NumberSequenceKeypoint.new(0.1, 0.284, 0.146),
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
    Speed = NumberRange.new(0, 7.09),
    SpreadAngle = Vector2.new(44, 44),
}
v1[1] = v3
v1[2] = v4
v1[3] = Create("ParticleEmitter", v5)
return v1