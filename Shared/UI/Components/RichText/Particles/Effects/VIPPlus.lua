-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.VIPPlus
-- Decompile time: 3.78 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Spread",
    Acceleration = Vector3.new(0, -5, 0),
    Drag = 6,
    LightEmission = 0.5,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://131637335676840",
    ZOffset = -0.1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.524, Color3.fromRGB(255, 170, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 115, 0))),
    }),
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
    Name = "Spread",
    Acceleration = Vector3.new(0, -5, 0),
    Drag = 6,
    LightEmission = 0.5,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://80540700708777",
    ZOffset = -0.1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.524, Color3.fromRGB(255, 170, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 115, 0))),
    }),
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
local v4 = Create("ParticleEmitter", {
    Name = "Specs",
    Brightness = 5,
    LockedToPart = true,
    Drag = 7.5,
    Rate = 10,
    Texture = "rbxassetid://8030760338",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(253, 163, 66)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 163, 66))),
    }),
    Lifetime = NumberRange.new(0.5, 0.7),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.35, 0.281),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(2.81, 5.62),
    SpreadAngle = Vector2.new(-360, 360),
})
local v5 = Create("ParticleEmitter", {
    Name = "Sparks",
    Brightness = 6,
    LockedToPart = true,
    Drag = 7.5,
    Rate = 4,
    Texture = "rbxassetid://8535194548",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(253, 158, 88)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 158, 88))),
    }),
    Lifetime = NumberRange.new(0.85, 1),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.35, 0.4),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(2.81, 5.62),
    SpreadAngle = Vector2.new(-360, 360),
})
local v6 = Create("ParticleEmitter", {
    Name = "Glow",
    Brightness = 0.075,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 40,
    Texture = "rbxassetid://8708637750",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 239, 11)),
        ColorSequenceKeypoint.new(0.384, Color3.fromRGB(244, 159, 22)),
        ColorSequenceKeypoint.new(0.747, Color3.fromRGB(227, 31, 241)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 76, 216))),
    }),
    EmissionDirection = Enum.NormalId.Front,
    Lifetime = NumberRange.new(0.8),
    Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1.03),
        NumberSequenceKeypoint.new(0.201, 1.15),
        NumberSequenceKeypoint.new(0.557, 1.03),
        (NumberSequenceKeypoint.new(1, 0.848)),
    }),
    Speed = NumberRange.new(0.001),
    Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.501, -0.5, 0.4),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.13, 0.815),
        NumberSequenceKeypoint.new(0.506, 0.815),
        NumberSequenceKeypoint.new(0.758, 0.865),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v7 = {Name = "CrownAttachment", CFrame = CFrame.new(0, 0.65, 0)}
v7[Children] = {
    Create("ParticleEmitter", {
        Name = "Crown",
        Brightness = 1.5,
        LockedToPart = true,
        Rate = 1,
        Texture = "rbxassetid://17409640887",
        EmissionDirection = Enum.NormalId.Front,
        Lifetime = NumberRange.new(1.2),
        Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), (NumberSequenceKeypoint.new(1, 0.5))}),
        Speed = NumberRange.new(0.01),
        Squash = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, -0.1),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.1, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v1[1] = v2
v1[2] = v3
v1[3] = v4
v1[4] = v5
v1[5] = v6
v1[6] = Create("Attachment", v7)
return v1