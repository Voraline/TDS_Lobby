-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Frozen
-- Decompile time: 0.50 ms

return {
    require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)("ParticleEmitter", {
        Name = "Sparkles",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 10,
        ShapePartial = 0.25,
        Texture = "rbxassetid://1084970835",
        ZOffset = 0.002,
        Lifetime = NumberRange.new(0.4, 0.6),
        Rotation = NumberRange.new(-360, 360),
        Shape = Enum.ParticleEmitterShape.Disc,
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, 0.09, 0.03),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Speed = NumberRange.new(0),
    }),
}