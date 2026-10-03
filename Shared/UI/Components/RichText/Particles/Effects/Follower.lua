-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Follower
-- Decompile time: 2.29 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    Create("ParticleEmitter", {
        Name = "Retweet",
        Acceleration = Vector3.new(0, 0.5, 0),
        Drag = 5,
        LightInfluence = 1,
        Rate = 0.25,
        LockedToPart = true,
        Texture = "http://www.roblox.com/asset/?id=12279340257",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 127)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 255, 127))),
        }),
        EmissionDirection = Enum.NormalId.Bottom,
        Lifetime = NumberRange.new(2, 4),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.035, 0.2),
            NumberSequenceKeypoint.new(0.0766, 0.125),
            NumberSequenceKeypoint.new(0.131, 0.152),
            NumberSequenceKeypoint.new(0.799, 0.152),
            NumberSequenceKeypoint.new(0.861, 0.179),
            NumberSequenceKeypoint.new(0.947, 0.119, 0.0133),
            NumberSequenceKeypoint.new(1, 0),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Speed = NumberRange.new(0.4, 0.8),
        SpreadAngle = Vector2.new(360, 360),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.853, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "Like",
        Acceleration = Vector3.new(0, 0.5, 0),
        Drag = 5,
        LightInfluence = 1,
        Rate = 0.5,
        LockedToPart = true,
        Texture = "http://www.roblox.com/asset/?id=12279341296",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 106, 106)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 106, 106))),
        }),
        EmissionDirection = Enum.NormalId.Bottom,
        Lifetime = NumberRange.new(2, 4),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.035, 0.2),
            NumberSequenceKeypoint.new(0.0766, 0.125),
            NumberSequenceKeypoint.new(0.131, 0.152),
            NumberSequenceKeypoint.new(0.799, 0.152),
            NumberSequenceKeypoint.new(0.861, 0.179),
            NumberSequenceKeypoint.new(0.947, 0.119, 0.0133),
            NumberSequenceKeypoint.new(1, 0),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Speed = NumberRange.new(0.4, 0.8),
        SpreadAngle = Vector2.new(360, 360),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.853, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}