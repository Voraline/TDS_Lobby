-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Glitchy
-- Decompile time: 1.94 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    Create("ParticleEmitter", {
        Name = "GlitchEmitter1",
        ZOffset = -0.12,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 10,
        Texture = "rbxassetid://3137971517",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 89, 89)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 89, 89))),
        }),
        Lifetime = NumberRange.new(0.05, 0.1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.3, 0.182),
            (NumberSequenceKeypoint.new(1, 0.3)),
        }),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({
            NumberSequenceKeypoint.new(0, -0.998),
            NumberSequenceKeypoint.new(0.4, -0.0647),
            (NumberSequenceKeypoint.new(1, -0.098)),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.0543, 0.0987),
            NumberSequenceKeypoint.new(0.334, 0.364, 0.173),
            (NumberSequenceKeypoint.new(1, 0.0277, 0.0453)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "GlitchEmitter2",
        ZOffset = -0.12,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 10,
        Texture = "rbxassetid://3137971859",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(116, 207, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(116, 207, 255))),
        }),
        Lifetime = NumberRange.new(0.05, 0.1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.3, 0.182),
            (NumberSequenceKeypoint.new(1, 0.3)),
        }),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({
            NumberSequenceKeypoint.new(0, -0.998),
            NumberSequenceKeypoint.new(0.4, -0.0647),
            (NumberSequenceKeypoint.new(1, -0.098)),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.0543, 0.0987),
            NumberSequenceKeypoint.new(0.334, 0.364, 0.173),
            (NumberSequenceKeypoint.new(1, 0.0277, 0.0453)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "GlitchEmitter3",
        ZOffset = -0.12,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 10,
        Texture = "rbxassetid://3137971975",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 127)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 170, 127))),
        }),
        Lifetime = NumberRange.new(0.05, 0.1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.3, 0.182),
            (NumberSequenceKeypoint.new(1, 0.3)),
        }),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({
            NumberSequenceKeypoint.new(0, -0.998),
            NumberSequenceKeypoint.new(0.4, -0.0647),
            (NumberSequenceKeypoint.new(1, -0.098)),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.0543, 0.0987),
            NumberSequenceKeypoint.new(0.334, 0.364, 0.173),
            (NumberSequenceKeypoint.new(1, 0.0277, 0.0453)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "GlitchEmitter4",
        ZOffset = -0.12,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 10,
        Texture = "rbxassetid://3137972144",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 85, 127)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 85, 127))),
        }),
        Lifetime = NumberRange.new(0.05, 0.1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.3, 0.182),
            (NumberSequenceKeypoint.new(1, 0.3)),
        }),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({
            NumberSequenceKeypoint.new(0, -0.998),
            NumberSequenceKeypoint.new(0.4, -0.0647),
            (NumberSequenceKeypoint.new(1, -0.098)),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.0543, 0.0987),
            NumberSequenceKeypoint.new(0.334, 0.364, 0.173),
            (NumberSequenceKeypoint.new(1, 0.0277, 0.0453)),
        }),
    })),
}