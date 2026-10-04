-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.NullAndVoid
-- Decompile time: 8.22 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "1",
    Axis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(0.000244140625, 1.50770187, 0, 0, 1, -0, -1, 0, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(1, 0, 0),
}
v2[Children] = {
    Create("Beam", {
        Name = "Frame",
        Brightness = 2.5,
        FaceCamera = true,
        LightEmission = 0.1,
        Texture = "rbxassetid://71308966413528",
        TextureSpeed = 0,
        Width0 = 5,
        Width1 = 5,
        ZOffset = 0.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(241, 192, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(241, 192, 255))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {
    Name = "2",
    Axis = Vector3.new(0, -1, 0),
    SecondaryAxis = Vector3.new(1, 0, 0),
    CFrame = CFrame.new(0.000244140625, -1.02178383, 0, 0, 1, -0, -1, 0, 0, 0, 0, 1),
})
local v5 = {Name = "3", CFrame = CFrame.new(-2.00057983, -0.0999999046, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v5[Children] = {
    Create("Beam", {
        Name = "SmokeSwirl2",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://88311189594792",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        Width0 = 2,
        Width1 = 2,
        ZOffset = 0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 119, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "Glow",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://128263884132195",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(119, 0, 255)),
            ColorSequenceKeypoint.new(0.52, Color3.fromRGB(255, 102, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(119, 0, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.492, 0.488),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "SmokeSwirl2",
        Segments = 25,
        Texture = "rbxassetid://89312442586625",
        TextureLength = 0.5,
        Width0 = 2,
        Width1 = 2,
        ZOffset = -2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(19, 0, 48)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(19, 0, 48))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v2 = Create("Attachment", v5)
local v6 = Create("Attachment", {Name = "4", CFrame = CFrame.new(2.00100708, -0.0999999046, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v7 = {Name = "Attachment", CFrame = CFrame.new(0, 0.74625206, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
local v8 = {}
local v9 = Create("ParticleEmitter", {
    Name = "BgGlow",
    Brightness = 6,
    LockedToPart = true,
    Rate = 3,
    Texture = "rbxassetid://91069079826822",
    ZOffset = 0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(106, 0, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(106, 0, 255))),
    }),
    Lifetime = NumberRange.new(1),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.759),
        NumberSequenceKeypoint.new(0.1, 0.788),
        NumberSequenceKeypoint.new(0.2, 0.817),
        NumberSequenceKeypoint.new(0.3, 0.845),
        NumberSequenceKeypoint.new(0.4, 0.875),
        NumberSequenceKeypoint.new(0.5, 0.906),
        NumberSequenceKeypoint.new(0.6, 0.941),
        NumberSequenceKeypoint.new(0.7, 0.979),
        NumberSequenceKeypoint.new(0.8, 1.02),
        NumberSequenceKeypoint.new(0.9, 1.07),
        NumberSequenceKeypoint.new(1, 1.14),
        (NumberSequenceKeypoint.new(1, 1.14)),
    }),
    Speed = NumberRange.new(0),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0.688),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v10 = Create("ParticleEmitter", {
    Name = "BgGlow",
    LockedToPart = true,
    Rate = 3,
    Texture = "rbxassetid://91069079826822",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(9, 0, 45)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(9, 0, 45))),
    }),
    Lifetime = NumberRange.new(1),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1.16),
        NumberSequenceKeypoint.new(0.1, 1.21),
        NumberSequenceKeypoint.new(0.2, 1.25),
        NumberSequenceKeypoint.new(0.3, 1.3),
        NumberSequenceKeypoint.new(0.4, 1.34),
        NumberSequenceKeypoint.new(0.5, 1.39),
        NumberSequenceKeypoint.new(0.6, 1.44),
        NumberSequenceKeypoint.new(0.7, 1.5),
        NumberSequenceKeypoint.new(0.8, 1.57),
        NumberSequenceKeypoint.new(0.9, 1.65),
        NumberSequenceKeypoint.new(1, 1.75),
        (NumberSequenceKeypoint.new(1, 1.75)),
    }),
    Speed = NumberRange.new(0),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.275),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v11 = {Name = "Attachment", CFrame = CFrame.new(0, 0.090379715, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v11[Children] = {
    Create("ParticleEmitter", {
        Name = "BrightFG",
        Brightness = 6,
        LockedToPart = true,
        Rate = 3,
        Texture = "rbxassetid://82752695908838",
        ZOffset = 2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(193, 92, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(193, 92, 255))),
        }),
        FlipbookFramerate = NumberRange.new(22, 28),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        Lifetime = NumberRange.new(0.7, 1.3),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1.19, 0.149),
            NumberSequenceKeypoint.new(0.1, 1.17, 0.149),
            NumberSequenceKeypoint.new(0.2, 1.15, 0.149),
            NumberSequenceKeypoint.new(0.3, 1.12, 0.149),
            NumberSequenceKeypoint.new(0.4, 1.1, 0.149),
            NumberSequenceKeypoint.new(0.5, 1.08, 0.149),
            NumberSequenceKeypoint.new(0.6, 1.05, 0.149),
            NumberSequenceKeypoint.new(0.7, 1.02, 0.149),
            NumberSequenceKeypoint.new(0.8, 0.985, 0.149),
            NumberSequenceKeypoint.new(0.9, 0.945, 0.149),
            NumberSequenceKeypoint.new(1, 0.896, 0.149),
            (NumberSequenceKeypoint.new(1, 0.896, 0.149)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.825, 0.0332),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v8[1] = v9
v8[2] = v10
v8[3] = Create("Attachment", v11)
v7[Children] = v8
v5 = Create("Attachment", v7)
local v12 = Create("ParticleEmitter", {
    Name = "BackgroundSmoke",
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 16,
    Texture = "rbxassetid://11881355186",
    ZOffset = -3,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 0, 100)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 0, 100))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 3),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.518, 0.173),
        NumberSequenceKeypoint.new(0.1, 0.676, 0.173),
        NumberSequenceKeypoint.new(0.2, 0.786, 0.173),
        NumberSequenceKeypoint.new(0.3, 0.872, 0.173),
        NumberSequenceKeypoint.new(0.4, 0.942, 0.173),
        NumberSequenceKeypoint.new(0.5, 0.999, 0.173),
        NumberSequenceKeypoint.new(0.6, 1.04, 0.173),
        NumberSequenceKeypoint.new(0.7, 1.08, 0.173),
        NumberSequenceKeypoint.new(0.8, 1.1, 0.173),
        NumberSequenceKeypoint.new(0.9, 1.12, 0.173),
        NumberSequenceKeypoint.new(1, 1.12, 0.173),
        (NumberSequenceKeypoint.new(1, 1.12, 0.173)),
    }),
    Speed = NumberRange.new(0.0432, 0.216),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.469, 0.113),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
v7 = Create("ParticleEmitter", {
    Name = "Dots",
    Brightness = 5,
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 4,
    ShapePartial = 0.4,
    Texture = "rbxassetid://11800717040",
    ZOffset = 1.2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 128, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 128, 0))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(3, 6),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.13, 0.359, 0.0578),
        NumberSequenceKeypoint.new(0.3, 0.193, 0.0805),
        NumberSequenceKeypoint.new(0.4, 0.663, 0.109),
        NumberSequenceKeypoint.new(0.5, 0.497, 0.138),
        NumberSequenceKeypoint.new(0.6, 0.111, 0.11),
        NumberSequenceKeypoint.new(0.698, 0.221, 0.0826),
        NumberSequenceKeypoint.new(0.799, 0.608, 0.112),
        NumberSequenceKeypoint.new(0.895, 0.415, 0.143),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-3, 3),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.462, 0.137),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
v8 = Create("ParticleEmitter", {
    Name = "FgSmoke",
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 16,
    Texture = "rbxassetid://17285277195",
    ZOffset = -2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(54, 31, 225)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(54, 31, 225))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 3),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.54, 0.18),
        NumberSequenceKeypoint.new(0.1, 0.704, 0.18),
        NumberSequenceKeypoint.new(0.2, 0.818, 0.18),
        NumberSequenceKeypoint.new(0.3, 0.908, 0.18),
        NumberSequenceKeypoint.new(0.4, 0.981, 0.18),
        NumberSequenceKeypoint.new(0.5, 1.04, 0.18),
        NumberSequenceKeypoint.new(0.6, 1.09, 0.18),
        NumberSequenceKeypoint.new(0.7, 1.12, 0.18),
        NumberSequenceKeypoint.new(0.8, 1.15, 0.18),
        NumberSequenceKeypoint.new(0.9, 1.16, 0.18),
        NumberSequenceKeypoint.new(1, 1.17, 0.18),
        (NumberSequenceKeypoint.new(1, 1.17, 0.18)),
    }),
    Speed = NumberRange.new(0.045, 0.225),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.469, 0.113),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v13 = {Name = "FireAtt", CFrame = CFrame.new(0, 1.16675329, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v13[Children] = {
    Create("ParticleEmitter", {
        Name = "Fire",
        Brightness = 2,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://77358660325022",
        ZOffset = -1.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 251)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 251))),
        }),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(0.52),
        Orientation = Enum.ParticleOrientation.FacingCameraWorldUp,
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.801), (NumberSequenceKeypoint.new(1, 0.801))}),
        Speed = NumberRange.new(0),
    }),
    (Create("ParticleEmitter", {
        Name = "Fire",
        FlipbookStartRandom = true,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://77358660325022",
        ZOffset = -1.3,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(84, 0, 186)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(84, 0, 186))),
        }),
        FlipbookFramerate = NumberRange.new(22, 33),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        Lifetime = NumberRange.new(0.52),
        Orientation = Enum.ParticleOrientation.FacingCameraWorldUp,
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.915), (NumberSequenceKeypoint.new(1, 0.915))}),
        Speed = NumberRange.new(0),
    })),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v6
v1[5] = v5
v1[6] = v12
v1[7] = v7
v1[8] = v8
v1[9] = Create("Attachment", v13)
return v1