-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Biologist
-- Decompile time: 7.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(-2.20062256, 0.134145737, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v2[Children] = {
    Create("Beam", {
        Name = "BaseGrass",
        Brightness = 2,
        Segments = 25,
        Texture = "rbxassetid://97617334764765",
        TextureSpeed = 0,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 255, 90)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 255, 90))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {
    Name = "10",
    CFrame = CFrame.new(1.73461914, -0.0376253128, 0.0220947266, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
v2 = Create("Attachment", {Name = "2", CFrame = CFrame.new(2.10095215, 0.134145737, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v5 = {
    Name = "3",
    CFrame = CFrame.new(-1.46630859, 0.45472002, 0.0220947266, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v5[Children] = {
    Create("Beam", {
        Name = "GrassBunch",
        Brightness = 1.5,
        Segments = 25,
        Texture = "rbxassetid://84124301872066",
        TextureSpeed = 0,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.3,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(114, 189, 34)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(114, 189, 34))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v6 = Create("Attachment", v5)
local v7 = Create("Attachment", {
    Name = "4",
    CFrame = CFrame.new(3.10766602, 0.45472002, 0.0220947266, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v8 = {
    Name = "5",
    CFrame = CFrame.new(-3.32537842, 0.460958481, 0.0220947266, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v8[Children] = {
    Create("Beam", {
        Name = "GrassBunch",
        Brightness = 1.5,
        Segments = 25,
        Texture = "rbxassetid://98362816836554",
        TextureSpeed = 0,
        Width0 = 2,
        Width1 = 2,
        ZOffset = -0.35,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(114, 189, 34)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(114, 189, 34))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v5 = Create("Attachment", v8)
local v9 = Create("Attachment", {
    Name = "6",
    CFrame = CFrame.new(1.47619629, 0.460958481, 0.0220947266, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v10 = {
    Name = "7",
    CFrame = CFrame.new(-2.89910889, 0.680747509, 0.0220947266, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v10[Children] = {
    Create("Beam", {
        Name = "GrassBunch",
        Segments = 25,
        Texture = "rbxassetid://84124301872066",
        TextureSpeed = 0,
        Width0 = 2,
        Width1 = 2,
        ZOffset = -0.6,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(96, 162, 9)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(96, 162, 9))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v8 = Create("Attachment", v10)
local v11 = Create("Attachment", {
    Name = "8",
    CFrame = CFrame.new(2.20245361, 0.680747509, 0.0220947266, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v12 = {
    Name = "9",
    CFrame = CFrame.new(-2.46691895, -0.0376253128, 0.0220947266, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v12[Children] = {
    Create("Beam", {
        Name = "GrassBunch",
        Brightness = 3,
        Segments = 25,
        Texture = "rbxassetid://108910008401184",
        TextureSpeed = 0,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = 0.25,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(121, 212, 61)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(121, 212, 61))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), (NumberSequenceKeypoint.new(1, 0.1))}),
    }),
}
v10 = Create("Attachment", v12)
local v13 = {Name = "Beam1", CFrame = CFrame.new(-2.00061035, -0.156191826, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v13[Children] = {
    Create("Beam", {
        Name = "Flowy",
        Brightness = 2,
        LightEmission = 0.3,
        Segments = 25,
        Texture = "rbxassetid://70528460332776",
        TextureLength = 0.2,
        TextureSpeed = 0.025,
        ZOffset = 0.7,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(136, 255, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(136, 255, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v14 = Create("Attachment", v13)
v12 = Create("Attachment", {Name = "Beam2", CFrame = CFrame.new(2.00097656, -0.156191826, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
v13 = Create("ParticleEmitter", {
    Name = "BigSpecs",
    Acceleration = Vector3.new(1, 0, 0),
    Brightness = 2,
    Drag = 9,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 1,
    ShapePartial = 0.4,
    Texture = "rbxassetid://71424211461657",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 255, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 51))),
    }),
    EmissionDirection = Enum.NormalId.Right,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-22, 22),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.237),
        NumberSequenceKeypoint.new(0.1, 0.348),
        NumberSequenceKeypoint.new(0.2, 0.425),
        NumberSequenceKeypoint.new(0.3, 0.479),
        NumberSequenceKeypoint.new(0.4, 0.518),
        NumberSequenceKeypoint.new(0.5, 0.545),
        NumberSequenceKeypoint.new(0.6, 0.565),
        NumberSequenceKeypoint.new(0.7, 0.578),
        NumberSequenceKeypoint.new(0.8, 0.587),
        NumberSequenceKeypoint.new(0.9, 0.592),
        NumberSequenceKeypoint.new(1, 0.593),
        (NumberSequenceKeypoint.new(1, 0.593)),
    }),
    Speed = NumberRange.new(1),
    SpreadAngle = Vector2.new(88, 88),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.208, 0),
        NumberSequenceKeypoint.new(0.404, 0.5, 0.0562),
        NumberSequenceKeypoint.new(0.606, 0.431, 0.175),
        NumberSequenceKeypoint.new(0.799, 0.856, 0.05),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v15 = Create("ParticleEmitter", {
    Name = "Flecks",
    Acceleration = Vector3.new(0, -3.559999942779541, 0),
    Brightness = 4,
    Drag = 9,
    FlipbookStartRandom = true,
    LightEmission = 1,
    Rate = 12,
    Texture = "rbxassetid://13327042963",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 250, 175)),
        ColorSequenceKeypoint.new(0.22, Color3.fromRGB(166, 255, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(34, 255, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(0.6, 2),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.101, 0.119, 0.0529),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(1.33, 3.99),
    SpreadAngle = Vector2.new(88, 88),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.398, 0),
        NumberSequenceKeypoint.new(0.796, 0.903),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v16 = Create("ParticleEmitter", {
    Name = "Leaves",
    Acceleration = Vector3.new(0, -1.309999942779541, 0.21899999678134918),
    Brightness = 2,
    Drag = 2,
    FlipbookStartRandom = true,
    LightEmission = 0.4,
    LockedToPart = true,
    Rate = 6,
    Texture = "rbxassetid://129003547130533",
    ZOffset = -1.12,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 240, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(1, 3),
    RotSpeed = NumberRange.new(-111, 111),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.046, 0.254, 0.0693),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(1.2, 2.41),
    SpreadAngle = Vector2.new(88, 88),
})
local v17 = {
    Name = "Sparkles",
    Acceleration = Vector3.new(0, 0.5649999976158142, 0),
    Brightness = 3,
    Drag = 9,
    FlipbookStartRandom = true,
    LightEmission = 1,
    Rate = 3,
    Texture = "rbxassetid://75257337824466",
    ZOffset = 1.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 255, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(26, 255, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(0.5, 1.25),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.169, 0.113),
        NumberSequenceKeypoint.new(0.399, 0.083, 0.0448),
        NumberSequenceKeypoint.new(0.6, 0.187, 0.0583),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(55, 55),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.0375, 1),
        NumberSequenceKeypoint.new(0.0988, 0),
        NumberSequenceKeypoint.new(0.7, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v6
v1[5] = v7
v1[6] = v5
v1[7] = v9
v1[8] = v8
v1[9] = v11
v1[10] = v10
v1[11] = v14
v1[12] = v12
v1[13] = v13
v1[14] = v15
v1[15] = v16
v1[16] = (Create("ParticleEmitter", v17))
v1[17] = Create("ParticleEmitter", {
    Name = "StarCluster",
    Acceleration = Vector3.new(0, -0.21299999952316284, 0),
    Brightness = 8,
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://17696603161",
    ZOffset = -0.05,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(181, 255, 125)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(195, 255, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(1, 2),
    RotSpeed = NumberRange.new(-5, 5),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.639, 0.213),
        NumberSequenceKeypoint.new(0.1, 0.665, 0.213),
        NumberSequenceKeypoint.new(0.2, 0.689, 0.213),
        NumberSequenceKeypoint.new(0.3, 0.713, 0.213),
        NumberSequenceKeypoint.new(0.4, 0.738, 0.213),
        NumberSequenceKeypoint.new(0.5, 0.765, 0.213),
        NumberSequenceKeypoint.new(0.6, 0.794, 0.213),
        NumberSequenceKeypoint.new(0.7, 0.826, 0.213),
        NumberSequenceKeypoint.new(0.8, 0.862, 0.213),
        NumberSequenceKeypoint.new(0.9, 0.905, 0.213),
        NumberSequenceKeypoint.new(1, 0.959, 0.213),
        (NumberSequenceKeypoint.new(1, 0.959, 0.213)),
    }),
    Speed = NumberRange.new(0.107, 0.533),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.469, 0.113),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
return v1