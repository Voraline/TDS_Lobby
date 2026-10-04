-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Rich
-- Decompile time: 0.64 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    Create("ParticleEmitter", {
        Name = "CashDown",
        Acceleration = Vector3.new(0, -3, 0),
        Drag = 10,
        LightInfluence = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://3134212398",
        VelocityInheritance = 1,
        ZOffset = -0.15,
        Lifetime = NumberRange.new(0.5, 1),
        Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
        RotSpeed = NumberRange.new(-200, 200),
        Rotation = NumberRange.new(0, 360),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.25), (NumberSequenceKeypoint.new(1, 0.25))}),
        Speed = NumberRange.new(2, 6),
        SpreadAngle = Vector2.new(360, 360),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.7, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "CashFront",
        Acceleration = Vector3.new(0, -3, 0),
        Drag = 10,
        LightInfluence = 1,
        LockedToPart = true,
        Rate = 3,
        Texture = "rbxassetid://3134212398",
        VelocityInheritance = 1,
        ZOffset = -0.15,
        Lifetime = NumberRange.new(0.5, 1),
        Orientation = Enum.ParticleOrientation.VelocityParallel,
        RotSpeed = NumberRange.new(-200, 200),
        Rotation = NumberRange.new(0, 360),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), (NumberSequenceKeypoint.new(1, 0.2))}),
        Speed = NumberRange.new(2, 6),
        SpreadAngle = Vector2.new(45, 45),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.7, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}