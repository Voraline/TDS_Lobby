-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Pastel
-- Decompile time: 3.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(-2.00057983, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v2[Children] = {
    Create("Beam", {
        Name = "Beam",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://80767134413815",
        TextureLength = 0.5,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 53, 174)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(84, 255, 65))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Beam",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://120746873590589",
        TextureLength = 0.5,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 53, 174)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(84, 255, 65))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {Name = "2", CFrame = CFrame.new(2.00099993, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
v2 = Create("ParticleEmitter", {
    Name = "Circle",
    Brightness = 4,
    Drag = 4,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 2,
    Texture = "rbxassetid://16880774135",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 0, 133)),
        ColorSequenceKeypoint.new(0.336, Color3.fromRGB(249, 0, 133)),
        ColorSequenceKeypoint.new(0.585, Color3.fromRGB(87, 180, 37)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 249, 0))),
    }),
    Lifetime = NumberRange.new(0.6, 1.2),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.25, 0.15),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.9), (NumberSequenceKeypoint.new(1, 0.9))}),
})
local v5 = Create("ParticleEmitter", {
    Name = "GreenDots",
    Brightness = 3,
    Drag = 2,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 7,
    Texture = "rbxassetid://75257337824466",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(115, 255, 0)),
        ColorSequenceKeypoint.new(0.138, Color3.fromRGB(255, 230, 0)),
        ColorSequenceKeypoint.new(0.317, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.458, Color3.fromRGB(255, 0, 234)),
        ColorSequenceKeypoint.new(0.621, Color3.fromRGB(0, 34, 255)),
        ColorSequenceKeypoint.new(0.817, Color3.fromRGB(0, 208, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 17))),
    }),
    Lifetime = NumberRange.new(0.5, 2),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.501, 0.26, 0.107),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 1.29),
    SpreadAngle = Vector2.new(-360, 360),
})
local v6 = {
    Name = "Smoke",
    Drag = 6,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://138210092362719",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 239, 90)),
        ColorSequenceKeypoint.new(0.303, Color3.fromRGB(91, 227, 97)),
        ColorSequenceKeypoint.new(0.438, Color3.fromRGB(231, 75, 182)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(239, 66, 187))),
    }),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-22, 22),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.254),
        NumberSequenceKeypoint.new(0.1, 0.423),
        NumberSequenceKeypoint.new(0.2, 0.54),
        NumberSequenceKeypoint.new(0.3, 0.632),
        NumberSequenceKeypoint.new(0.4, 0.705),
        NumberSequenceKeypoint.new(0.5, 0.764),
        NumberSequenceKeypoint.new(0.6, 0.811),
        NumberSequenceKeypoint.new(0.7, 0.846),
        NumberSequenceKeypoint.new(0.8, 0.87),
        NumberSequenceKeypoint.new(0.9, 0.885),
        NumberSequenceKeypoint.new(1, 0.89),
        (NumberSequenceKeypoint.new(1, 0.89)),
    }),
    Speed = NumberRange.new(-0.254, 0.254),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.137, 0.131, 0.1),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v5
v1[5] = Create("ParticleEmitter", v6)
return v1