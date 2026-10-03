-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Classic
-- Decompile time: 1.51 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Tix",
    Acceleration = Vector3.new(0, -5, 0),
    Drag = 6,
    LightEmission = 0.5,
    LockedToPart = true,
    Rate = 15,
    Texture = "rbxassetid://8843720132",
    ZOffset = -0.1,
    Lifetime = NumberRange.new(0.4, 0.75),
    Orientation = Enum.ParticleOrientation.VelocityParallel,
    RotSpeed = NumberRange.new(300),
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), (NumberSequenceKeypoint.new(1, 0.1))}),
    Speed = NumberRange.new(3, 4),
    SpreadAngle = Vector2.new(60, 60),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.701, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v3 = Create("ParticleEmitter", {
    Name = "Sparkle",
    Acceleration = Vector3.new(0, -5, 0),
    Brightness = 5,
    Drag = 6,
    LightEmission = 0.5,
    LockedToPart = true,
    Rate = 15,
    ZOffset = -0.1,
    Lifetime = NumberRange.new(0.4, 0.75),
    Orientation = Enum.ParticleOrientation.VelocityParallel,
    RotSpeed = NumberRange.new(300),
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), (NumberSequenceKeypoint.new(1, 0.1))}),
    Speed = NumberRange.new(3, 4),
    SpreadAngle = Vector2.new(60, 60),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.701, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v4 = {Name = "ForcefieldAttachment", CFrame = CFrame.new(0, 0, 0)}
v4[Children] = {
    Create("ParticleEmitter", {
        Name = "ForceField",
        Enabled = false,
        LockedToPart = true,
        LightEmission = 1,
        Rate = 1,
        Texture = "rbxassetid://5775174333",
        ZOffset = 0.2,
        Lifetime = NumberRange.new(8),
        Rotation = NumberRange.new(100),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1.5),
            NumberSequenceKeypoint.new(0.25, 1.5, 0.1),
            NumberSequenceKeypoint.new(0.492, 1.41),
            NumberSequenceKeypoint.new(0.75, 1.5, 0.1),
            (NumberSequenceKeypoint.new(1, 1.5)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.702, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v1[1] = v2
v1[2] = v3
v1[3] = Create("Attachment", v4)
return v1