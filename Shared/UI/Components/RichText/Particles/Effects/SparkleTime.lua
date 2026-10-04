-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.SparkleTime
-- Decompile time: 0.27 ms

return {
    require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)("ParticleEmitter", {
        Name = "Sparkles",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 10,
        Texture = "http://www.roblox.com/asset/?id=298984512",
        Lifetime = NumberRange.new(0.4, 0.6),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, 0.125, 0.0625),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Speed = NumberRange.new(0),
    }),
}