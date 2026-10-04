-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.MeltingIce
-- Decompile time: 1.98 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "Attachment", CFrame = CFrame.new(0, -1.00865602, 0)}
v2[Children] = {
    Create("ParticleEmitter", {
        Name = "Water",
        Brightness = 1.4,
        LightEmission = 0.4,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://106521794327983",
        ZOffset = 0.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 159, 255))),
        }),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(0.8),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.5), (NumberSequenceKeypoint.new(1, 1.5))}),
        Speed = NumberRange.new(0),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("ParticleEmitter", {
    Name = "ColdSparkles",
    Brightness = 3,
    Drag = 4,
    LightEmission = 1,
    Rate = 16,
    Texture = "rbxassetid://16797040962",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(96, 195, 249)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(96, 195, 249))),
    }),
    Lifetime = NumberRange.new(0.3, 0.6),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.347, 0.125, 0.0417),
        NumberSequenceKeypoint.new(0.501, 0.0209, 0.00186),
        NumberSequenceKeypoint.new(0.645, 0.125, 0.0417),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
})
local v5 = {
    Name = "Dots",
    Acceleration = Vector3.new(0, -22.600000381469727, 0),
    Drag = 4,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 14,
    Texture = "rbxassetid://74342064565852",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 249)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 116, 249))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(0.6, 1.7),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0.247, 0.18),
        NumberSequenceKeypoint.new(0.2, 0.193, 0.18),
        NumberSequenceKeypoint.new(0.3, 0.15, 0.15),
        NumberSequenceKeypoint.new(0.4, 0.114, 0.114),
        NumberSequenceKeypoint.new(0.5, 0.0833, 0.0833),
        NumberSequenceKeypoint.new(0.6, 0.057, 0.057),
        NumberSequenceKeypoint.new(0.7, 0.035, 0.035),
        NumberSequenceKeypoint.new(0.8, 0.0174, 0.0174),
        NumberSequenceKeypoint.new(0.9, 0.00505, 0.00505),
        NumberSequenceKeypoint.new(1, 4.55e-17, 4.55e-17),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 2.52),
    Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.2, 0.121, 0.104),
        NumberSequenceKeypoint.new(0.4, -0.0867, 0.0791),
        NumberSequenceKeypoint.new(0.6, 0.104, 0.0525),
        NumberSequenceKeypoint.new(0.8, -0.0867, 0.0782),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.201, 0.206, 0.0563),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = Create("ParticleEmitter", v5)
return v1