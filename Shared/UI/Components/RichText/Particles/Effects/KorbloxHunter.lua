-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.KorbloxHunter
-- Decompile time: 10.93 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "TinyRunes",
    Brightness = 6,
    Drag = 2,
    FlipbookStartRandom = true,
    LightEmission = 0.2,
    LockedToPart = true,
    Rate = 6,
    Texture = "rbxassetid://112943412840390",
    ZOffset = -0.3,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(142, 212, 255)),
        ColorSequenceKeypoint.new(0.481, Color3.fromRGB(19, 136, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 60, 255))),
    }),
    FlipbookFramerate = NumberRange.new(6),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(0.4, 3),
    RotSpeed = NumberRange.new(-66, 66),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.0811, 0.0405),
        NumberSequenceKeypoint.new(0.1, 0.0807, 0.0405),
        NumberSequenceKeypoint.new(0.2, 0.0797, 0.0405),
        NumberSequenceKeypoint.new(0.3, 0.0779, 0.0405),
        NumberSequenceKeypoint.new(0.4, 0.0752, 0.0405),
        NumberSequenceKeypoint.new(0.5, 0.0714, 0.0405),
        NumberSequenceKeypoint.new(0.6, 0.0663, 0.0405),
        NumberSequenceKeypoint.new(0.7, 0.0595, 0.0405),
        NumberSequenceKeypoint.new(0.8, 0.0502, 0.0405),
        NumberSequenceKeypoint.new(0.9, 0.0364, 0.0364),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-0.135, 0.135),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0),
        NumberSequenceKeypoint.new(0.2, 0),
        NumberSequenceKeypoint.new(0.3, 0),
        NumberSequenceKeypoint.new(0.4, 0),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(0.536, 0),
        NumberSequenceKeypoint.new(0.579, 1),
        NumberSequenceKeypoint.new(0.631, 0),
        NumberSequenceKeypoint.new(0.7, 0),
        NumberSequenceKeypoint.new(0.715, 0.869),
        NumberSequenceKeypoint.new(0.766, 0),
        NumberSequenceKeypoint.new(0.8, 0),
        NumberSequenceKeypoint.new(0.84, 0),
        NumberSequenceKeypoint.new(0.866, 0.631),
        NumberSequenceKeypoint.new(0.895, 0),
        NumberSequenceKeypoint.new(0.923, 0),
        NumberSequenceKeypoint.new(0.966, 1),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v3 = Create("ParticleEmitter", {
    Name = "BackgroundSmoke",
    Acceleration = Vector3.new(0, 0.11299999803304672, 0),
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 18,
    Texture = "rbxassetid://11881355186",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 12, 33)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 12, 33))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.282),
        NumberSequenceKeypoint.new(0.1, 0.434),
        NumberSequenceKeypoint.new(0.2, 0.528),
        NumberSequenceKeypoint.new(0.3, 0.601),
        NumberSequenceKeypoint.new(0.4, 0.66),
        NumberSequenceKeypoint.new(0.5, 0.71),
        NumberSequenceKeypoint.new(0.6, 0.751),
        NumberSequenceKeypoint.new(0.7, 0.786),
        NumberSequenceKeypoint.new(0.8, 0.813),
        NumberSequenceKeypoint.new(0.9, 0.834),
        NumberSequenceKeypoint.new(1, 0.847),
        (NumberSequenceKeypoint.new(1, 0.847)),
    }),
    Speed = NumberRange.new(0, 0.282),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.499, 0.075, 0.075),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v4 = Create("ParticleEmitter", {
    Name = "Clouds",
    Brightness = 3,
    Drag = 1,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://14458989443",
    ZOffset = -0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 15, 50)),
        ColorSequenceKeypoint.new(0.507, Color3.fromRGB(51, 51, 97)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(32, 15, 50))),
    }),
    EmissionDirection = Enum.NormalId.Right,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-11, 11),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.847),
        NumberSequenceKeypoint.new(0.1, 0.961),
        NumberSequenceKeypoint.new(0.2, 1.08),
        NumberSequenceKeypoint.new(0.3, 1.2),
        NumberSequenceKeypoint.new(0.4, 1.31),
        NumberSequenceKeypoint.new(0.5, 1.42),
        NumberSequenceKeypoint.new(0.6, 1.52),
        NumberSequenceKeypoint.new(0.7, 1.59),
        NumberSequenceKeypoint.new(0.8, 1.65),
        NumberSequenceKeypoint.new(0.9, 1.68),
        NumberSequenceKeypoint.new(1, 1.69),
        (NumberSequenceKeypoint.new(1, 1.69)),
    }),
    Speed = NumberRange.new(0.141),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.501, 0.494, 0.131),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v5 = Create("ParticleEmitter", {
    Name = "CommonSparkle",
    Brightness = 3,
    Drag = 7,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://103465492177044",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(118, 218, 249)),
        ColorSequenceKeypoint.new(0.533, Color3.fromRGB(0, 157, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 17, 249))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    Lifetime = NumberRange.new(0.6, 1.5),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.351, 0.212, 0.0356),
        NumberSequenceKeypoint.new(0.498, 0.0482, 0.0251),
        NumberSequenceKeypoint.new(0.654, 0.214, 0.0419),
        NumberSequenceKeypoint.new(0.8, 0.0714, 0.0243),
        NumberSequenceKeypoint.new(0.9, 0.122, 0.0122),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-1, 1),
    SpreadAngle = Vector2.new(-360, 360),
})
local v6 = Create("ParticleEmitter", {
    Name = "BrightSmoke",
    Acceleration = Vector3.new(0, 0.2540000081062317, 0),
    Brightness = 2,
    Drag = 9,
    LockedToPart = true,
    Rate = 2,
    Texture = "rbxassetid://15916065193",
    ZOffset = -0.3,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(49, 58, 189)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(49, 58, 189))),
    }),
    EmissionDirection = Enum.NormalId.Left,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 3),
    RotSpeed = NumberRange.new(-44, 44),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.02), (NumberSequenceKeypoint.new(1, 1.02))}),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(25, 180),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.195, 0.188, 0.0483),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v7 = Create("ParticleEmitter", {
    Name = "ParticleEmitter",
    Acceleration = Vector3.new(0, 0.2540000081062317, 0),
    Brightness = 6,
    LightEmission = 0.3,
    LockedToPart = true,
    Rate = 5,
    Texture = "rbxassetid://95675000698143",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 98, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 34, 255))),
    }),
    FlipbookFramerate = NumberRange.new(16, 18),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    Lifetime = NumberRange.new(1, 1.3),
    Orientation = Enum.ParticleOrientation.FacingCameraWorldUp,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0.092),
        NumberSequenceKeypoint.new(0.2, 0.103),
        NumberSequenceKeypoint.new(0.3, 0.11),
        NumberSequenceKeypoint.new(0.4, 0.116),
        NumberSequenceKeypoint.new(0.5, 0.12),
        NumberSequenceKeypoint.new(0.6, 0.123),
        NumberSequenceKeypoint.new(0.7, 0.125),
        NumberSequenceKeypoint.new(0.8, 0.126),
        NumberSequenceKeypoint.new(0.9, 0.127),
        NumberSequenceKeypoint.new(0.952, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 0.254),
    Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 3),
        NumberSequenceKeypoint.new(0.0312, 1.77),
        NumberSequenceKeypoint.new(0.0611, 0.954),
        NumberSequenceKeypoint.new(0.1, 0.404),
        NumberSequenceKeypoint.new(0.2, 0.508),
        NumberSequenceKeypoint.new(0.3, 0.583),
        NumberSequenceKeypoint.new(0.4, 0.638),
        NumberSequenceKeypoint.new(0.5, 0.679),
        NumberSequenceKeypoint.new(0.6, 0.708),
        NumberSequenceKeypoint.new(0.7, 0.729),
        NumberSequenceKeypoint.new(0.8, 0.741),
        NumberSequenceKeypoint.new(0.874, 0.919),
        NumberSequenceKeypoint.new(0.933, 1.53),
        NumberSequenceKeypoint.new(0.971, 2.13),
        (NumberSequenceKeypoint.new(1, 3)),
    }),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.128, 0),
        NumberSequenceKeypoint.new(0.864, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v8 = {Name = "Root", CFrame = CFrame.new()}
local v9 = {}
local v10 = {
    Name = "Attachment",
    CFrame = CFrame.new(0, 0, 0, 1, 0, 0, 0, -4.37113883e-08, 1, 0, -1, -4.37113883e-08),
}
v10[Children] = {
    Create("ParticleEmitter", {
        Name = "RingEff",
        Brightness = 12,
        LightEmission = 0.2,
        LockedToPart = true,
        Rate = 1,
        Texture = "rbxassetid://102459832427948",
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 204, 255)),
            ColorSequenceKeypoint.new(0.474, Color3.fromRGB(25, 106, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 7, 53))),
        }),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(1.5),
        RotSpeed = NumberRange.new(45),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.93), (NumberSequenceKeypoint.new(1, 0.93))}),
        Speed = NumberRange.new(0.000194),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.503, 0.05),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v11 = Create("Attachment", v10)
local v12 = Create("Attachment", {
    Name = "BlackTop1",
    Axis = Vector3.new(0.7429999709129333, 0.6690000295639038, 0),
    CFrame = CFrame.new(-1.74542236, 0.347700596, -1.09997559, 0.743309855, -0.668947339, 0, 0.668947339, 0.743309855, -0, 0, 0, 1.00000012),
})
v10 = Create("Attachment", {
    Name = "BlackTop2",
    CFrame = CFrame.new(0.300048828, 1.54461384, 2.90002441, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v13 = {Name = "Core", CFrame = CFrame.new(-0.200012207, -5.93610382, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v13[Children] = {
    Create("Beam", {
        Name = "FarkMainBeam",
        Brightness = 3,
        CurveSize1 = -0.729,
        FaceCamera = true,
        Segments = 35,
        Texture = "rbxassetid://11120914657",
        TextureLength = 0.3,
        TextureSpeed = 0.2,
        Width0 = 11.7,
        Width1 = 3,
        ZOffset = -2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 17, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 187, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0497, 1),
            NumberSequenceKeypoint.new(0.265, 0.569),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "PitchBlack1",
        CurveSize0 = 1.46,
        CurveSize1 = -1.46,
        FaceCamera = true,
        LightEmission = 1,
        Segments = 35,
        Texture = "rbxassetid://16807287897",
        TextureLength = 0.9,
        TextureSpeed = 0.8,
        Width0 = 1.46,
        Width1 = 6,
        ZOffset = -1.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 9, 58)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 195, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.2, 0),
            NumberSequenceKeypoint.new(0.901, 1),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "BigCoreBeam",
        Brightness = 3,
        CurveSize1 = -0.729,
        FaceCamera = true,
        LightEmission = 1,
        Segments = 35,
        Texture = "rbxassetid://16816084324",
        TextureLength = 0.3,
        TextureSpeed = 0.12,
        Width0 = 2.92,
        Width1 = 6,
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 68, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 187, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.488, 0.575),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "Beam2",
        CurveSize1 = -0.729,
        FaceCamera = true,
        LightInfluence = 1,
        Segments = 35,
        Texture = "rbxassetid://11120914657",
        TextureLength = 0.3,
        TextureSpeed = 0.4,
        Width0 = 2.19,
        Width1 = 6.56,
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 4, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 208, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.101, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Sidebeam2",
        Brightness = 2,
        CurveSize0 = -3.65,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://16944549841",
        TextureLength = 0.5,
        TextureSpeed = 0.33,
        Width0 = 2.19,
        Width1 = 4,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 110, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 110, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0581, 1),
            NumberSequenceKeypoint.new(0.0983, 0.0625),
            NumberSequenceKeypoint.new(0.937, 1),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v14 = Create("Attachment", v13)
local v15 = Create("Attachment", {Name = "Ground", CFrame = CFrame.new(1.28790283, -5.33610153, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
v13 = Create("Attachment", {
    Name = "Top1",
    CFrame = CFrame.new(0.352294922, 3.24556541, 0.0708618164, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v16 = Create("Attachment", {
    Name = "Top2",
    CFrame = CFrame.new(-0.488220215, -0.289416313, 0.399963379, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v17 = Create("Attachment", {
    Name = "Top3",
    CFrame = CFrame.new(0.364013672, 0.788176537, 0.399963379, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v18 = Create("Attachment", {
    Name = "Up",
    CFrame = CFrame.new(0.300048828, -0.536100388, 0.0708618164, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v19 = {
    Name = "Up1",
    Axis = Vector3.new(-0.9990000128746033, 0, -0.03759999945759773),
    CFrame = CFrame.new(-2.00189209, -0.536100388, -0.0859375, -0.999291301, 0, 0.0376441628, 0, 1, 0, -0.0376441628, 0, -0.999291301),
}
v9[1] = v11
v9[2] = v12
v9[3] = v10
v9[4] = v14
v9[5] = v15
v9[6] = v13
v9[7] = v16
v9[8] = v17
v9[9] = v18
v9[10] = Create("Attachment", v19)
v8[Children] = v9
v1[1] = v2
v1[2] = v3
v1[3] = v4
v1[4] = v5
v1[5] = v6
v1[6] = v7
v1[7] = Create("Attachment", v8)
return v1