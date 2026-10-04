-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.GuidingStar
-- Decompile time: 9.01 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "1",
    Axis = Vector3.new(0.3230000138282776, 0.3540000021457672, 0.8769999742507935),
    CFrame = CFrame.new(
        -3.1050415,
        -2.01860714,
        2.42602539,
        0.323311776,
        0.0829157755,
        -0.942652941,
        0.354462951,
        0.913016617,
        0.201882929,
        0.87739706,
        -0.399406642,
        0.26579845
    ),
    SecondaryAxis = Vector3.new(0.08290000259876251, 0.9129999876022339, -0.39899998903274536),
}
v2[Children] = {
    Create("Beam", {
        Name = "aurora",
        Brightness = 5,
        CurveSize0 = 1.85,
        CurveSize1 = 2.01,
        LightEmission = 1,
        Segments = 44,
        Texture = "rbxassetid://113929761496028",
        TextureLength = 99,
        TextureSpeed = 0.1,
        Width0 = 2.01,
        Width1 = 2.01,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(128, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 242, 255))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.495, 0.731),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {
    Name = "2",
    Axis = Vector3.new(0.5649999976158142, 0.1459999978542328, 0.8119999766349792),
    SecondaryAxis = Vector3.new(-0.42800000309944153, 0.8939999938011169, 0.13699999451637268),
    CFrame = CFrame.new(
        2.2795105,
        1.11505365,
        -0.840576172,
        0.56532383,
        -0.427554637,
        -0.70541203,
        0.14622651,
        0.893581212,
        -0.424417883,
        0.811804712,
        0.136783585,
        0.567682624
    ),
})
local v5 = {
    Name = "3",
    Axis = Vector3.new(0.29600000381469727, 0.3540000021457672, -0.8870000243186951),
    CFrame = CFrame.new(
        2.67570496,
        -2.12378764,
        4.13525391,
        0.296440154,
        -0.314487755,
        0.901787519,
        0.354462922,
        0.913016617,
        0.201882899,
        -0.886836648,
        0.25980404,
        0.382129043
    ),
    SecondaryAxis = Vector3.new(-0.3140000104904175, 0.9129999876022339, 0.25999999046325684),
}
v5[Children] = {
    Create("Beam", {
        Name = "aurora",
        Brightness = 5,
        CurveSize0 = 1.85,
        CurveSize1 = 2.01,
        LightEmission = 1,
        Segments = 44,
        Texture = "rbxassetid://113929761496028",
        TextureLength = 78,
        TextureSpeed = 0.05,
        Width0 = 2.01,
        Width1 = 2.01,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 213, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 115))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.495, 0.731),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v2 = Create("Attachment", v5)
local v6 = Create("Attachment", {
    Name = "4",
    Axis = Vector3.new(0.20100000500679016, -0.19300000369548798, -0.9599999785423279),
    SecondaryAxis = Vector3.new(3.000000026176508e-09, 0.9800000190734863, -0.19699999690055847),
    CFrame = CFrame.new(
        -2.5534668,
        1.17084217,
        -0.190307617,
        0.201219559,
        2.99840508e-09,
        0.979546249,
        -0.192903921,
        0.980417192,
        0.0396265537,
        -0.960363925,
        -0.196931943,
        0.197279111
    ),
})
local v7 = {
    Name = "5",
    Axis = Vector3.new(0.7990000247955322, 0, 0.6019999980926514),
    CFrame = CFrame.new(-0.376434326, -1.21691465, -2.20877719, 0.798792005, 0, -0.601607323, 0, 1, 0, 0.601607323, 0, 0.798792005),
}
v7[Children] = {
    Create("Beam", {
        Name = "aurora",
        Brightness = 5,
        CurveSize0 = 1.85,
        CurveSize1 = 2.01,
        LightEmission = 1,
        Segments = 44,
        Texture = "rbxassetid://113929761496028",
        TextureLength = 123,
        TextureSpeed = 0.087,
        Width0 = 2.01,
        Width1 = 2.01,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(162, 0, 255))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.495, 0.731),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v5 = Create("Attachment", v7)
local v8 = {Name = "Attachment", CFrame = CFrame.new(0, 1.04296398, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v8[Children] = {
    Create("ParticleEmitter", {
        Name = "Star",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://91799157309882",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 119, 0))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.96), (NumberSequenceKeypoint.new(1, 0.96))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("ParticleEmitter", {
        Name = "BaseSmoke",
        Acceleration = Vector3.new(0, -6.360000133514404, 0),
        Drag = 5,
        FlipbookStartRandom = true,
        LockedToPart = true,
        Rate = 6,
        ShapePartial = 0.4,
        Texture = "rbxassetid://111406574946592",
        ZOffset = -2.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 13, 31)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(43, 0, 81))),
        }),
        FlipbookFramerate = NumberRange.new(0),
        Lifetime = NumberRange.new(2),
        RotSpeed = NumberRange.new(-33, 33),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1.92),
            NumberSequenceKeypoint.new(0.1, 2.34),
            NumberSequenceKeypoint.new(0.2, 2.63),
            NumberSequenceKeypoint.new(0.3, 2.82),
            NumberSequenceKeypoint.new(0.4, 2.95),
            NumberSequenceKeypoint.new(0.5, 3.04),
            NumberSequenceKeypoint.new(0.6, 3.11),
            NumberSequenceKeypoint.new(0.7, 3.15),
            NumberSequenceKeypoint.new(0.8, 3.18),
            NumberSequenceKeypoint.new(0.9, 3.2),
            NumberSequenceKeypoint.new(1, 3.2),
            (NumberSequenceKeypoint.new(1, 3.2)),
        }),
        Speed = NumberRange.new(0),
        SpreadAngle = Vector2.new(-360, 360),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.531, 0.575),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "Beam1",
        Brightness = 5,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://118490352865235",
        TextureLength = 0.1,
        TextureSpeed = 0.1,
        Width0 = 0.64,
        Width1 = 0.64,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 0)),
            ColorSequenceKeypoint.new(0.471, Color3.fromRGB(255, 106, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0966, 0),
            NumberSequenceKeypoint.new(0.203, 0),
            NumberSequenceKeypoint.new(0.507, 0.875),
            NumberSequenceKeypoint.new(0.804, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Beam2",
        Brightness = 5,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://118490352865235",
        TextureLength = 0.1,
        TextureSpeed = 0.1,
        Width0 = 0.64,
        Width1 = 0.64,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 0)),
            ColorSequenceKeypoint.new(0.471, Color3.fromRGB(255, 106, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0966, 0),
            NumberSequenceKeypoint.new(0.203, 0),
            NumberSequenceKeypoint.new(0.507, 0.875),
            NumberSequenceKeypoint.new(0.804, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v9 = Create("Attachment", v8)
local v10 = {
    Name = "Star1",
    CFrame = CFrame.new(-1.86424255, -0.526779652, -0.587890625, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v10[Children] = {
    Create("ParticleEmitter", {
        Name = "Star",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://96080136077173",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 119, 0))),
        }),
        Lifetime = NumberRange.new(1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.41),
            NumberSequenceKeypoint.new(0.499, 0.422, 0.121),
            (NumberSequenceKeypoint.new(1, 0.41)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v7 = Create("Attachment", v10)
local v11 = {
    Name = "Star2",
    CFrame = CFrame.new(0.70501709, -0.10255146, -1.66987324, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v11[Children] = {
    Create("ParticleEmitter", {
        Name = "Star",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://96080136077173",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 119, 0))),
        }),
        Lifetime = NumberRange.new(1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.544),
            NumberSequenceKeypoint.new(0.499, 0.56, 0.16),
            (NumberSequenceKeypoint.new(1, 0.544)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Beam",
        Brightness = 5,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://118490352865235",
        TextureLength = 0.1,
        TextureSpeed = 0.1,
        Width0 = 0.64,
        Width1 = 0.64,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 0)),
            ColorSequenceKeypoint.new(0.471, Color3.fromRGB(255, 106, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0966, 0),
            NumberSequenceKeypoint.new(0.203, 0),
            NumberSequenceKeypoint.new(0.507, 0.875),
            NumberSequenceKeypoint.new(0.804, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v8 = Create("Attachment", v11)
local v12 = {
    Name = "Star3",
    CFrame = CFrame.new(1.65997314, -0.424964428, -0.91558075, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v12[Children] = {
    Create("ParticleEmitter", {
        Name = "Star",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://125076037702902",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 119, 0))),
        }),
        Lifetime = NumberRange.new(1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.544),
            NumberSequenceKeypoint.new(0.499, 0.56, 0.16),
            (NumberSequenceKeypoint.new(1, 0.544)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "Beam1",
        Brightness = 5,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://118490352865235",
        TextureLength = 0.1,
        TextureSpeed = 0.1,
        Width0 = 0.64,
        Width1 = 0.64,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 0)),
            ColorSequenceKeypoint.new(0.471, Color3.fromRGB(255, 106, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0966, 0),
            NumberSequenceKeypoint.new(0.203, 0),
            NumberSequenceKeypoint.new(0.507, 0.875),
            NumberSequenceKeypoint.new(0.804, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Beam2",
        Brightness = 5,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://118490352865235",
        TextureLength = 0.1,
        TextureSpeed = 0.1,
        Width0 = 0.64,
        Width1 = 0.64,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 0)),
            ColorSequenceKeypoint.new(0.471, Color3.fromRGB(255, 106, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0966, 0),
            NumberSequenceKeypoint.new(0.203, 0),
            NumberSequenceKeypoint.new(0.507, 0.875),
            NumberSequenceKeypoint.new(0.804, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v10 = Create("Attachment", v12)
local v13 = {
    Name = "Star4",
    CFrame = CFrame.new(-0.0578613281, -0.59332037, 1.42102051, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v13[Children] = {
    Create("ParticleEmitter", {
        Name = "Star",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://125076037702902",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 119, 0))),
        }),
        Lifetime = NumberRange.new(1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.783),
            NumberSequenceKeypoint.new(0.499, 0.807, 0.231),
            (NumberSequenceKeypoint.new(1, 0.783)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Beam",
        Brightness = 5,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://118490352865235",
        TextureLength = 0.1,
        TextureSpeed = 0.1,
        Width0 = 0.64,
        Width1 = 0.64,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 136, 0)),
            ColorSequenceKeypoint.new(0.471, Color3.fromRGB(255, 106, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 136, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0966, 0),
            NumberSequenceKeypoint.new(0.203, 0),
            NumberSequenceKeypoint.new(0.507, 0.875),
            NumberSequenceKeypoint.new(0.804, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v11 = Create("Attachment", v13)
local v14 = {
    Name = "Star5",
    CFrame = CFrame.new(-1.19338989, 0.920497417, -0.314941406, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v14[Children] = {
    Create("ParticleEmitter", {
        Name = "Star",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://96080136077173",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 119, 0))),
        }),
        Lifetime = NumberRange.new(1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.262),
            NumberSequenceKeypoint.new(0.499, 0.27, 0.0772),
            (NumberSequenceKeypoint.new(1, 0.262)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v12 = Create("Attachment", v14)
local v15 = {
    Name = "Star6",
    Axis = Vector3.new(0.6010000109672546, 0, 0.7990000247955322),
    CFrame = CFrame.new(1.1, 1.5, 1.89941406, 0.60118109, 0, -0.799112797, 0, 1, 0, 0.799112797, 0, 0.60118109),
}
v15[Children] = {
    Create("ParticleEmitter", {
        Name = "Star",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://96080136077173",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 119, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 119, 0))),
        }),
        Lifetime = NumberRange.new(1),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.544),
            NumberSequenceKeypoint.new(0.499, 0.56, 0.16),
            (NumberSequenceKeypoint.new(1, 0.544)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v6
v1[5] = v5
v1[6] = v9
v1[7] = v7
v1[8] = v8
v1[9] = v10
v1[10] = v11
v1[11] = v12
v1[12] = Create("Attachment", v15)
return v1