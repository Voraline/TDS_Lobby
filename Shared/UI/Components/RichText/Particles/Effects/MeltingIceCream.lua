-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.MeltingIceCream
-- Decompile time: 4.10 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "1",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(0.828979492, 1.92578697, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1),
}
v2[Children] = {
    Create("Beam", {
        Name = "Beam",
        FaceCamera = true,
        Texture = "rbxassetid://81196749258773",
        TextureSpeed = 0,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 243, 212)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 243, 212))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.116, 0),
            NumberSequenceKeypoint.new(0.922, 0),
            NumberSequenceKeypoint.new(0.973, 1),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {
    Name = "2",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(0.828979492, 0.226993561, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1),
})
local v5 = {
    Name = "Attachment",
    CFrame = CFrame.new(0.708129883, -1.32640266, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v5[Children] = {
    Create("ParticleEmitter", {
        Name = "Water",
        Brightness = 2.3,
        LightEmission = 0.1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://82981113960634",
        ZOffset = 0.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 255, 174)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(79, 255, 91))),
        }),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(0.8),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.5), (NumberSequenceKeypoint.new(1, 1.5))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.3), (NumberSequenceKeypoint.new(1, 0.3))}),
    }),
}
v2 = Create("Attachment", v5)
local v6 = {
    Name = "Attachment",
    CFrame = CFrame.new(0.118774414, -1.06316471, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v6[Children] = {
    Create("ParticleEmitter", {
        Name = "Water2",
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://113102237868063",
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(149, 214, 139)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(149, 214, 139))),
        }),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(0.8),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.29), (NumberSequenceKeypoint.new(1, 1.29))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), (NumberSequenceKeypoint.new(1, 0.1))}),
    }),
}
local v7 = Create("Attachment", v6)
v5 = Create("ParticleEmitter", {
    Name = "Biots",
    Acceleration = Vector3.new(0, -22.200000762939453, 0),
    Brightness = 2,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 22,
    Texture = "rbxassetid://72390273040987",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(54, 25, 4)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(54, 25, 4))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(0.5, 1),
    RotSpeed = NumberRange.new(-234, 234),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0.097, 0.0627),
        NumberSequenceKeypoint.new(0.117, 0.157, 0.0627),
        NumberSequenceKeypoint.new(0.134, 0.0445, 0.0445),
        NumberSequenceKeypoint.new(0.15, 0.0861, 0.0627),
        NumberSequenceKeypoint.new(0.2, 0.075, 0.0627),
        NumberSequenceKeypoint.new(0.3, 0.0568, 0.0568),
        NumberSequenceKeypoint.new(0.4, 0.0416, 0.0416),
        NumberSequenceKeypoint.new(0.5, 0.0289, 0.0289),
        NumberSequenceKeypoint.new(0.6, 0.0186, 0.0186),
        NumberSequenceKeypoint.new(0.7, 0.0105, 0.0105),
        NumberSequenceKeypoint.new(0.8, 0.00473, 0.00473),
        NumberSequenceKeypoint.new(0.9, 0.0012, 0.0012),
        NumberSequenceKeypoint.new(1, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(1, 3.01),
    SpreadAngle = Vector2.new(22, 22),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.302, 0),
        NumberSequenceKeypoint.new(0.897, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
v6 = Create("ParticleEmitter", {
    Name = "ColdSparkles",
    Brightness = 3,
    Drag = 4,
    LightEmission = 1,
    Rate = 16,
    Texture = "rbxassetid://16797040962",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(144, 249, 132)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(144, 249, 132))),
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
local v8 = {
    Name = "Dots",
    Acceleration = Vector3.new(0, -22.600000381469727, 0),
    Brightness = 2,
    Drag = 4,
    FlipbookStartRandom = true,
    LightEmission = 0.4,
    LockedToPart = true,
    Rate = 14,
    Texture = "rbxassetid://70479317841342",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(148, 249, 157)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 249, 157))),
    }),
    EmissionDirection = Enum.NormalId.Bottom,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(0.6, 1.4),
    Rotation = NumberRange.new(180),
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
    Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), (NumberSequenceKeypoint.new(1, 1))}),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.201, 0.206, 0.0563),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v7
v1[5] = v5
v1[6] = v6
v1[7] = Create("ParticleEmitter", v8)
return v1