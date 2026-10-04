-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Lava
-- Decompile time: 0.49 ms

return {
    require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)("ParticleEmitter", {
        Name = "Bits",
        Acceleration = Vector3.new(0, -1.5, 0),
        Drag = 10,
        LightEmission = 1,
        Rate = 6,
        Texture = "http://www.roblox.com/asset/?id=118322059",
        ZOffset = 0.4,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 85, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 85, 0))),
        }),
        Lifetime = NumberRange.new(0.5, 3),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.05, 0.035),
            (NumberSequenceKeypoint.new(1, 0.05, 0.035)),
        }),
        Speed = NumberRange.new(0, 0.5),
        SpreadAngle = Vector2.new(20, 20),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.799, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}