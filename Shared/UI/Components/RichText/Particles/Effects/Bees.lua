-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Bees
-- Decompile time: 4.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("Attachment", {Name = "1", CFrame = CFrame.new(-2.001, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v3 = {Name = "2", CFrame = CFrame.new(2.00058, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v3[Children] = {
    Create("Beam", {
        Name = "Glow",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://128263884132195",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 189, 34)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 189, 34))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.491828, 0.4875),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Glow",
        Brightness = 6,
        LightEmission = 0.2,
        Segments = 25,
        Texture = "rbxassetid://78777525375557",
        TextureLength = 3,
        TextureSpeed = 0.2,
        ZOffset = -0.4,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 135, 30)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 135, 30))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.199161, 0),
            NumberSequenceKeypoint.new(0.799441, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v4 = Create("Attachment", v3)
local v5 = Create("ParticleEmitter", {
    Name = "DarkSmoke",
    Acceleration = Vector3.new(0, -0.7419809699058533, 0),
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 22,
    ShapePartial = 0.4,
    Texture = "rbxassetid://138210092362719",
    ZOffset = -0.8,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(168, 78, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(168, 78, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.838397, 0.419198),
        NumberSequenceKeypoint.new(0.1, 0.872778, 0.419198),
        NumberSequenceKeypoint.new(0.2, 0.905203, 0.419198),
        NumberSequenceKeypoint.new(0.3, 0.937679, 0.419198),
        NumberSequenceKeypoint.new(0.4, 0.97124, 0.419198),
        NumberSequenceKeypoint.new(0.5, 1.00669, 0.419198),
        NumberSequenceKeypoint.new(0.6, 1.04487, 0.419198),
        NumberSequenceKeypoint.new(0.7, 1.08682, 0.419198),
        NumberSequenceKeypoint.new(0.8, 1.13408, 0.419198),
        NumberSequenceKeypoint.new(0.9, 1.18924, 0.419198),
        NumberSequenceKeypoint.new(1, 1.25759, 0.419198),
        (NumberSequenceKeypoint.new(1, 1.25759, 0.419198)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.498514, 0.11875, 0.06875),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
v3 = Create("ParticleEmitter", {
    Name = "Drops",
    Acceleration = Vector3.new(0, -1, 0),
    Brightness = 4,
    Drag = 1,
    LightEmission = 0.2,
    LockedToPart = true,
    Rate = 5,
    Texture = "rbxassetid://13590153331",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(231, 96, 0))),
    }),
    Lifetime = NumberRange.new(1),
    Orientation = Enum.ParticleOrientation.VelocityParallel,
    Rotation = NumberRange.new(-90),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.19926, 0.224852, 0.025351),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-0.5, -0.1),
    Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, -0.375, 0.15),
        (NumberSequenceKeypoint.new(1, 0.25, 0.075)),
    }),
    Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.3), (NumberSequenceKeypoint.new(1, 0.3))}),
})
local v6 = Create("ParticleEmitter", {
    Name = "StarCluster",
    Acceleration = Vector3.new(0, -0.32899999618530273, 0),
    Brightness = 5,
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 0.2,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://17696603161",
    ZOffset = 0.6,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 170, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(1, 2),
    RotSpeed = NumberRange.new(-5, 5),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.686304, 0.228768),
        NumberSequenceKeypoint.new(0.1, 0.713519, 0.228768),
        NumberSequenceKeypoint.new(0.2, 0.739417, 0.228768),
        NumberSequenceKeypoint.new(0.3, 0.765432, 0.228768),
        NumberSequenceKeypoint.new(0.4, 0.792399, 0.228768),
        NumberSequenceKeypoint.new(0.5, 0.821005, 0.228768),
        NumberSequenceKeypoint.new(0.6, 0.851985, 0.228768),
        NumberSequenceKeypoint.new(0.7, 0.886277, 0.228768),
        NumberSequenceKeypoint.new(0.8, 0.925266, 0.228768),
        NumberSequenceKeypoint.new(0.9, 0.971327, 0.228768),
        NumberSequenceKeypoint.new(1, 1.02946, 0.228768),
        (NumberSequenceKeypoint.new(1, 1.02946, 0.228768)),
    }),
    Speed = NumberRange.new(0.114384, 0.57192),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497028, 0.46875, 0.1125),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v7 = Create("ParticleEmitter", {
    Name = "Stars",
    Brightness = 2,
    Drag = 6,
    LockedToPart = true,
    Rate = 14,
    Texture = "rbxassetid://134485543762077",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 224, 162)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 190, 111))),
    }),
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 3),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.3, 0),
        NumberSequenceKeypoint.new(0.4, 0.1998, 0.0999),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(0.7, 0),
        NumberSequenceKeypoint.new(0.8, 0.0999, 0.05994),
        NumberSequenceKeypoint.new(0.9, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(1.1988, 3.1968),
    SpreadAngle = Vector2.new(-360, 360),
})
local v8 = {
    Name = "TinyDots",
    Drag = 6,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LightInfluence = 1,
    LockedToPart = true,
    Rate = 4,
    Texture = "rbxassetid://11800717040",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 32)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 32))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.664273, 0.253169),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 2),
    SpreadAngle = Vector2.new(-360, 360),
}
v1[1] = v2
v1[2] = v4
v1[3] = v5
v1[4] = v3
v1[5] = v6
v1[6] = v7
v1[7] = Create("ParticleEmitter", v8)
return v1