-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.CandyCorn
-- Decompile time: 1.00 ms

return {
    require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)("ParticleEmitter", {
        Name = "CandyCorn",
        Acceleration = Vector3.new(0, -12.199999809265137, 0),
        Brightness = 1.11,
        FlipbookStartRandom = true,
        LockedToPart = true,
        Rate = 12,
        Texture = "rbxassetid://89658260583816",
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.304, Color3.fromRGB(255, 244, 241)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 60, 0))),
        }),
        FlipbookFramerate = NumberRange.new(0),
        Lifetime = NumberRange.new(1, 1.5),
        RotSpeed = NumberRange.new(-66, 66),
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
        Speed = NumberRange.new(2, 6),
        SpreadAngle = Vector2.new(45, 45),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.302, 0),
            NumberSequenceKeypoint.new(0.897, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}