-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Lunar
-- Decompile time: 3.29 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "DarkBits",
    Acceleration = Vector3.new(0, -2, 1),
    Brightness = 2,
    Drag = 6,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://88026868689452",
    ZOffset = -0.15,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(58, 58, 58))),
    }),
    EmissionDirection = Enum.NormalId.Front,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(1, 2),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0.336),
        NumberSequenceKeypoint.new(0.2, 0.256),
        NumberSequenceKeypoint.new(0.3, 0.193),
        NumberSequenceKeypoint.new(0.4, 0.14),
        NumberSequenceKeypoint.new(0.5, 0.0973),
        NumberSequenceKeypoint.new(0.6, 0.0625),
        NumberSequenceKeypoint.new(0.7, 0.0354),
        NumberSequenceKeypoint.new(0.8, 0.0159),
        NumberSequenceKeypoint.new(0.9, 0.00403),
        NumberSequenceKeypoint.new(1, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-5, 5),
    SpreadAngle = Vector2.new(-360, 360),
})
local v3 = Create("ParticleEmitter", {
    Name = "Bobux",
    Acceleration = Vector3.new(0, -12.699999809265137, 0),
    Brightness = 3,
    Drag = 5,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 9,
    Texture = "rbxassetid://90118611513324",
    ZOffset = -0.13,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 157, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 157, 0))),
    }),
    FlipbookFramerate = NumberRange.new(88),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8,
    Lifetime = NumberRange.new(0.5, 1.4),
    RotSpeed = NumberRange.new(-222, 222),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.187, 0.0934),
        NumberSequenceKeypoint.new(0.1, 0.182, 0.0934),
        NumberSequenceKeypoint.new(0.2, 0.167, 0.0934),
        NumberSequenceKeypoint.new(0.3, 0.144, 0.0934),
        NumberSequenceKeypoint.new(0.4, 0.116, 0.0934),
        NumberSequenceKeypoint.new(0.5, 0.0855, 0.0855),
        NumberSequenceKeypoint.new(0.6, 0.0569, 0.0569),
        NumberSequenceKeypoint.new(0.7, 0.0326, 0.0326),
        NumberSequenceKeypoint.new(0.8, 0.0146, 0.0146),
        NumberSequenceKeypoint.new(0.9, 0.00362, 0.00362),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0, 4.53),
    SpreadAngle = Vector2.new(44, 44),
})
local v4 = Create("ParticleEmitter", {
    Name = "Spark",
    Brightness = 4,
    Drag = 4,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://96080136077173",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 116, 0)),
        ColorSequenceKeypoint.new(0.484, Color3.fromRGB(249, 218, 63)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 116, 0))),
    }),
    Lifetime = NumberRange.new(0.6, 1.2),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.346, 0.203, 0.0375),
        NumberSequenceKeypoint.new(0.5, 0.0676),
        NumberSequenceKeypoint.new(0.647, 0.188, 0.0375),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
})
local v5 = {Name = "1", CFrame = CFrame.new(-2, 0, 0)}
v5[Children] = {
    Create("Beam", {
        Name = "Detail",
        Brightness = 4,
        FaceCamera = true,
        LightEmission = 1,
        Texture = "rbxassetid://100112521729057",
        TextureSpeed = 0.15,
        ZOffset = -0.11,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 189, 76)),
            ColorSequenceKeypoint.new(0.464, Color3.fromRGB(255, 200, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 189, 76))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.103, 0),
            NumberSequenceKeypoint.new(0.898, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "SmokeBase",
        FaceCamera = true,
        Texture = "rbxassetid://127081737176866",
        TextureSpeed = 0.15,
        ZOffset = -0.12,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(152, 0, 0)),
            ColorSequenceKeypoint.new(0.45, Color3.fromRGB(255, 0, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 0, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.103, 0),
            NumberSequenceKeypoint.new(0.898, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v6 = Create("Attachment", v5)
local v7 = {Name = "2", CFrame = CFrame.new(2, 0, 0)}
v1[1] = v2
v1[2] = v3
v1[3] = v4
v1[4] = v6
v1[5] = Create("Attachment", v7)
return v1