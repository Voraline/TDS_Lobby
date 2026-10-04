-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.SandCastle
-- Decompile time: 2.79 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(1.68255615, 1.92811584, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v2[Children] = {
    Create("Beam", {
        Name = "Sand",
        Brightness = 1.6,
        FaceCamera = true,
        Segments = 25,
        Texture = "rbxassetid://71525256650623",
        TextureSpeed = 0,
        Width0 = 3.5,
        Width1 = 3.5,
        ZOffset = 0.12,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 241, 212)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 241, 212))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {Name = "2", CFrame = CFrame.new(-1.79156494, 1.92811584, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v5 = {
    Name = "3",
    Axis = Vector3.new(1, -0.01269999984651804, 0),
    CFrame = CFrame.new(1.20385742, 1.38435888, 0, 0.999919534, 0.012685935, -0, -0.012685935, 0.999919534, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0.01269999984651804, 1, 0),
}
v5[Children] = {
    Create("Beam", {
        Name = "Castle",
        Brightness = 1.5,
        FaceCamera = true,
        Segments = 25,
        Texture = "rbxassetid://104873849093388",
        TextureSpeed = 0,
        Width0 = 2,
        Width1 = 2,
        ZOffset = -1,
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
v2 = Create("Attachment", v5)
local v6 = Create("Attachment", {
    Name = "4",
    Axis = Vector3.new(1, -0.01269999984651804, 0),
    SecondaryAxis = Vector3.new(0.01269999984651804, 1, 0),
    CFrame = CFrame.new(-0.969543457, 1.3567853, 0, 0.999919534, 0.012685935, -0, -0.012685935, 0.999919534, 0, 0, 0, 1),
})
v5 = Create("ParticleEmitter", {
    Name = "StarCluster",
    Acceleration = Vector3.new(0, -0.11599999666213989, 0),
    Brightness = 8,
    Drag = 3,
    FlipbookStartRandom = true,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://17696603161",
    ZOffset = -0.05,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 229, 124)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 229, 124))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(1, 2),
    RotSpeed = NumberRange.new(-5, 5),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.347, 0.116),
        NumberSequenceKeypoint.new(0.1, 0.36, 0.116),
        NumberSequenceKeypoint.new(0.2, 0.373, 0.116),
        NumberSequenceKeypoint.new(0.3, 0.387, 0.116),
        NumberSequenceKeypoint.new(0.4, 0.4, 0.116),
        NumberSequenceKeypoint.new(0.5, 0.415, 0.116),
        NumberSequenceKeypoint.new(0.6, 0.43, 0.116),
        NumberSequenceKeypoint.new(0.7, 0.448, 0.116),
        NumberSequenceKeypoint.new(0.8, 0.467, 0.116),
        NumberSequenceKeypoint.new(0.9, 0.491, 0.116),
        NumberSequenceKeypoint.new(1, 0.52, 0.116),
        (NumberSequenceKeypoint.new(1, 0.52, 0.116)),
    }),
    Speed = NumberRange.new(0.0578, 0.289),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.497, 0.469, 0.113),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v7 = Create("ParticleEmitter", {
    Name = "Spark",
    Brightness = 2.5,
    Drag = 4,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 2,
    Texture = "rbxassetid://138328151143120",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 158, 130)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 158, 130))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 3),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.499, 0.281, 0.0669),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
})
local v8 = {
    Name = "Spark",
    Brightness = 4,
    Drag = 4,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://16845939768",
    ZOffset = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 116, 0)),
        ColorSequenceKeypoint.new(0.484, Color3.fromRGB(249, 218, 63)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 116, 0))),
    }),
    Lifetime = NumberRange.new(0.6, 1.2),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.346, 0.107, 0.0197),
        NumberSequenceKeypoint.new(0.5, 0.0355),
        NumberSequenceKeypoint.new(0.647, 0.0986, 0.0197),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
    SpreadAngle = Vector2.new(-360, 360),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v6
v1[5] = v5
v1[6] = v7
v1[7] = Create("ParticleEmitter", v8)
return v1