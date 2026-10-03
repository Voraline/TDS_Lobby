-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.CultistRunes
-- Decompile time: 7.56 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "Attachment",
    CFrame = CFrame.new(0, 0, 0, 1, 0, 0, 0, -4.37113883e-08, 1, 0, -1, -4.37113883e-08),
    SecondaryAxis = Vector3.new(0, -4.3699998286683694e-08, -1),
}
v2[Children] = {
    Create("ParticleEmitter", {
        Name = "Runes",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 6,
        Texture = "rbxassetid://136418504927837",
        ZOffset = 0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 255))),
        }),
        Lifetime = NumberRange.new(1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.839),
            NumberSequenceKeypoint.new(0.1, 1.14),
            NumberSequenceKeypoint.new(0.2, 1.24),
            NumberSequenceKeypoint.new(0.3, 1.3),
            NumberSequenceKeypoint.new(0.4, 1.34),
            NumberSequenceKeypoint.new(0.5, 1.36),
            NumberSequenceKeypoint.new(0.6, 1.38),
            NumberSequenceKeypoint.new(0.7, 1.39),
            NumberSequenceKeypoint.new(0.8, 1.39),
            NumberSequenceKeypoint.new(0.9, 1.4),
            (NumberSequenceKeypoint.new(1, 1.4)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.897, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("ParticleEmitter", {
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
v2 = Create("Attachment", {
    Name = "BlackTop1",
    Axis = Vector3.new(0.7429999709129333, 0.6690000295639038, 0),
    SecondaryAxis = Vector3.new(-0.6690000295639038, 0.7429999709129333, 0),
    CFrame = CFrame.new(-1.74542236, 0.347700596, -1.09997559, 0.743309855, -0.668947339, 0, 0.668947339, 0.743309855, -0, 0, 0, 1.00000012),
})
local v5 = Create("Attachment", {
    Name = "BlackTop2",
    CFrame = CFrame.new(0.300048828, 1.54461384, 2.90002441, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v6 = Create("ParticleEmitter", {
    Name = "Clouds",
    Brightness = 3,
    Drag = 1,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://71678507878808",
    ZOffset = -0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(38, 0, 85)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 0, 85))),
    }),
    EmissionDirection = Enum.NormalId.Right,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-11, 11),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.599),
        NumberSequenceKeypoint.new(0.1, 0.68),
        NumberSequenceKeypoint.new(0.2, 0.763),
        NumberSequenceKeypoint.new(0.3, 0.847),
        NumberSequenceKeypoint.new(0.4, 0.928),
        NumberSequenceKeypoint.new(0.5, 1),
        NumberSequenceKeypoint.new(0.6, 1.07),
        NumberSequenceKeypoint.new(0.7, 1.13),
        NumberSequenceKeypoint.new(0.8, 1.17),
        NumberSequenceKeypoint.new(0.9, 1.19),
        NumberSequenceKeypoint.new(1, 1.2),
        (NumberSequenceKeypoint.new(1, 1.2)),
    }),
    Speed = NumberRange.new(0.0998),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.501, 0.494, 0.131),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v7 = {Name = "Core", CFrame = CFrame.new(-0.200012207, -5.93610382, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v7[Children] = {
    Create("Beam", {
        Name = "Core",
        Brightness = 6,
        CurveSize1 = -0.544,
        FaceCamera = true,
        Segments = 35,
        Texture = "rbxassetid://70380526685851",
        TextureLength = 0.3,
        TextureSpeed = 0.2,
        Width0 = 8.71,
        Width1 = 2.24,
        ZOffset = -2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 0, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0497, 1),
            NumberSequenceKeypoint.new(0.265, 0.569),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "Beam2",
        CurveSize1 = -0.729,
        FaceCamera = true,
        LightInfluence = 1,
        Segments = 35,
        Texture = "rbxassetid://94720726472761",
        TextureLength = 0.3,
        TextureSpeed = 0.4,
        Width0 = 2.19,
        Width1 = 6.56,
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(14, 0, 31)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(14, 0, 31))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.101, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Swiirl",
        Brightness = 2,
        CurveSize0 = -3.65,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://70528460332776",
        TextureLength = 0.5,
        TextureSpeed = 0.33,
        Width0 = 2.19,
        Width1 = 4,
        ZOffset = 0.002,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(157, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(157, 0, 255))),
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
local v8 = Create("Attachment", v7)
local v9 = Create("ParticleEmitter", {
    Name = "FollowSwirl",
    Acceleration = Vector3.new(0.3659999966621399, 0, 0),
    Brightness = 2,
    LightEmission = 0.54,
    LockedToPart = true,
    Rate = 15,
    Texture = "rbxassetid://76706965345981",
    ZOffset = 0.13,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(39, 9, 91)),
        ColorSequenceKeypoint.new(0.516, Color3.fromRGB(116, 22, 224)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 0, 255))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(1, 2),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Cylinder,
    ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.244, 0.061),
        NumberSequenceKeypoint.new(0.1, 0.304, 0.061),
        NumberSequenceKeypoint.new(0.2, 0.351, 0.061),
        NumberSequenceKeypoint.new(0.3, 0.388, 0.061),
        NumberSequenceKeypoint.new(0.4, 0.418, 0.061),
        NumberSequenceKeypoint.new(0.5, 0.441, 0.061),
        NumberSequenceKeypoint.new(0.6, 0.459, 0.061),
        NumberSequenceKeypoint.new(0.7, 0.473, 0.061),
        NumberSequenceKeypoint.new(0.8, 0.482, 0.061),
        NumberSequenceKeypoint.new(0.9, 0.487, 0.061),
        NumberSequenceKeypoint.new(1, 0.488, 0.061),
        (NumberSequenceKeypoint.new(1, 0.488, 0.061)),
    }),
    Speed = NumberRange.new(0),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.499, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
v7 = Create("Attachment", {Name = "Ground", CFrame = CFrame.new(1.28790283, -5.33610153, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v10 = Create("ParticleEmitter", {
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
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 75, 225)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 75, 225))),
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
local v11 = Create("Attachment", {
    Name = "Top1",
    CFrame = CFrame.new(0.352294922, 3.24556541, 0.0708618164, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v12 = Create("Attachment", {
    Name = "Top2",
    CFrame = CFrame.new(-0.488220215, -0.289416313, 0.399963379, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v13 = Create("Attachment", {
    Name = "Top3",
    CFrame = CFrame.new(0.364013672, 0.788176537, 0.399963379, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v14 = Create("Attachment", {
    Name = "Up",
    CFrame = CFrame.new(0.300048828, -0.536100388, 0.0708618164, 1, 0, 0, 0, 1, 0, 0, 0, 1),
})
local v15 = {
    Name = "Up1",
    Axis = Vector3.new(-0.9990000128746033, 0, -0.03759999945759773),
    CFrame = CFrame.new(-2.00189209, -0.536100388, -0.0859375, -0.999291301, 0, 0.0376441628, 0, 1, 0, -0.0376441628, 0, -0.999291301),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v5
v1[5] = v6
v1[6] = v8
v1[7] = v9
v1[8] = v7
v1[9] = v10
v1[10] = v11
v1[11] = v12
v1[12] = v13
v1[13] = v14
v1[14] = Create("Attachment", v15)
return v1