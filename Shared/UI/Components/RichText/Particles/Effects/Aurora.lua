-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Aurora
-- Decompile time: 3.81 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "Root", CFrame = CFrame.new()}
local v3 = {}
local v4 = {Name = "Attachment", CFrame = CFrame.new(0, -3.32622981, 0)}
v4[Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        Brightness = 3,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 1,
        Texture = "rbxassetid://16788448905",
        ZOffset = -2.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(119, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(119, 0, 255))),
        }),
        Lifetime = NumberRange.new(2),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3), (NumberSequenceKeypoint.new(1, 3))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.501, 0.556, 0.0562),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v5 = Create("Attachment", v4)
local v6 = {
    Name = "1",
    Axis = Vector3.new(0.4059999883174896, 0.10300000011920929, 0.9079999923706055),
    CFrame = CFrame.new(2.21020508, 0.506885529, -2.95019531),
    SecondaryAxis = Vector3.new(-0.0786999985575676, 0.9940000176429749, -0.07769999653100967),
}
v6[Children] = {
    Create("Beam", {
        Name = "Beam",
        Brightness = 3,
        CurveSize0 = 5,
        CurveSize1 = 7,
        LightEmission = 0.3,
        Segments = 55,
        Texture = "rbxassetid://113035313554320",
        TextureSpeed = 0.025,
        Width0 = 4,
        Width1 = 2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 0, 255)),
            ColorSequenceKeypoint.new(0.285, Color3.fromRGB(0, 114, 220)),
            ColorSequenceKeypoint.new(0.618, Color3.fromRGB(0, 177, 94)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 21))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.108, 1),
            NumberSequenceKeypoint.new(0.5, 0.125),
            NumberSequenceKeypoint.new(0.938, 1),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v7 = Create("Attachment", v6)
v4 = Create("Attachment", {
    Name = "2",
    Axis = Vector3.new(0.7170000076293945, -0.15399999916553497, 0.6800000071525574),
    SecondaryAxis = Vector3.new(0.10300000011920929, 0.9879999756813049, 0.11599999666213989),
    CFrame = CFrame.new(-0.834899902, -1.36138821, 3.5645752),
})
v6 = Create("Attachment", {
    Name = "4",
    Axis = Vector3.new(0.6129999756813049, -0.09179999679327011, -0.7850000262260437),
    SecondaryAxis = Vector3.new(0.06880000233650208, 0.9959999918937683, -0.06270000338554382),
    CFrame = CFrame.new(2.90618896, -2.73728323, -0.595092773),
})
local v8 = {
    Name = "3",
    Axis = Vector3.new(0.1979999989271164, 0.020400000736117363, -0.9800000190734863),
    CFrame = CFrame.new(-2.08294678, -1.81069517, 2.19030762),
    SecondaryAxis = Vector3.new(-0.025499999523162842, 1, 0.015599999576807022),
}
v8[Children] = {
    Create("Beam", {
        Name = "Beam",
        Brightness = 3,
        CurveSize0 = 5,
        CurveSize1 = 7,
        LightEmission = 0.3,
        Segments = 55,
        Texture = "rbxassetid://113035313554320",
        TextureSpeed = 0.025,
        Width0 = 4,
        Width1 = 2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(38, 255, 0)),
            ColorSequenceKeypoint.new(0.161, Color3.fromRGB(0, 229, 255)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(128, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 213, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.108, 1),
            NumberSequenceKeypoint.new(0.5, 0.125),
            NumberSequenceKeypoint.new(0.938, 1),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v9 = Create("Attachment", v8)
local v10 = Create("Attachment", {
    Name = "6",
    Axis = Vector3.new(0.8809999823570251, -0.09179999679327011, 0.46399998664855957),
    SecondaryAxis = Vector3.new(0.0738999992609024, 0.9959999918937683, 0.05660000070929527),
    CFrame = CFrame.new(-0.0435791016, -6.04295731, 2.36218262),
})
local v11 = {
    Name = "5",
    Axis = Vector3.new(-0.828000009059906, 0.020400000736117363, -0.5600000023841858),
    CFrame = CFrame.new(2.46240234, -2.64719725, -0.537231445),
    SecondaryAxis = Vector3.new(0.004610000178217888, 1, 0.029500000178813934),
}
v11[Children] = {
    Create("Beam", {
        Name = "Beam",
        Brightness = 3,
        CurveSize0 = 5,
        CurveSize1 = 7,
        LightEmission = 0.3,
        Segments = 55,
        Texture = "rbxassetid://113035313554320",
        TextureSpeed = 0.025,
        Width0 = 4,
        Width1 = 2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(38, 255, 0)),
            ColorSequenceKeypoint.new(0.161, Color3.fromRGB(0, 229, 255)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(128, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 213, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.108, 1),
            NumberSequenceKeypoint.new(0.5, 0.125),
            NumberSequenceKeypoint.new(0.938, 1),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v8 = Create("Attachment", v11)
local v12 = {
    Name = "CommonSparkle",
    Acceleration = Vector3.new(0, -4.010000228881836, 0),
    Brightness = 3,
    Drag = 2,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://103465492177044",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(118, 218, 249)),
        ColorSequenceKeypoint.new(0.18, Color3.fromRGB(4, 249, 0)),
        ColorSequenceKeypoint.new(0.455, Color3.fromRGB(0, 157, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(199, 0, 249))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    Lifetime = NumberRange.new(0.6, 1.5),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.351, 0.674, 0.113),
        NumberSequenceKeypoint.new(0.498, 0.153, 0.0801),
        NumberSequenceKeypoint.new(0.654, 0.681, 0.133),
        NumberSequenceKeypoint.new(0.8, 0.228, 0.0773),
        NumberSequenceKeypoint.new(0.9, 0.388, 0.0388),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(2.4, 7.2),
    Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5),
        NumberSequenceKeypoint.new(0.1, 0.336),
        NumberSequenceKeypoint.new(0.2, 0.224),
        NumberSequenceKeypoint.new(0.3, 0.149),
        NumberSequenceKeypoint.new(0.4, 0.0981),
        NumberSequenceKeypoint.new(0.5, 0.0619),
        NumberSequenceKeypoint.new(0.6, 0.0364),
        NumberSequenceKeypoint.new(0.7, 0.019),
        NumberSequenceKeypoint.new(0.8, 0.00792),
        NumberSequenceKeypoint.new(0.9, 0.00186),
        NumberSequenceKeypoint.new(1, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
}
v3[1] = v5
v3[2] = v7
v3[3] = v4
v3[4] = v6
v3[5] = v9
v3[6] = v10
v3[7] = v8
v3[8] = Create("ParticleEmitter", v12)
v2[Children] = v3
v1[1] = Create("Attachment", v2)
return v1