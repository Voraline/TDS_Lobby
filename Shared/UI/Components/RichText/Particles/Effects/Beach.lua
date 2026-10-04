-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Beach
-- Decompile time: 3.81 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "WavesSlow0",
    CFrame = CFrame.new(-1.70074463, 0.0385780334, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
}
v2[Children] = {
    Create("Beam", {
        Name = "Waves",
        Brightness = 1.5,
        FaceCamera = true,
        LightEmission = 0.2,
        Texture = "rbxassetid://75873826465064",
        TextureLength = 3.5,
        TextureSpeed = 0.6,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -1.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 38, 154)),
            ColorSequenceKeypoint.new(0.499, Color3.fromRGB(0, 58, 145)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 38, 154))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.506, 0),
            NumberSequenceKeypoint.new(0.947, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {
    Name = "WavesSlow1",
    CFrame = CFrame.new(1.74017334, 0.0385780334, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local v5 = {
    Name = "WavesFast0",
    CFrame = CFrame.new(-1.70074463, 0.340256214, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
}
v5[Children] = {
    Create("Beam", {
        Name = "Waves",
        Brightness = 1.5,
        FaceCamera = true,
        LightEmission = 0.2,
        Texture = "rbxassetid://75873826465064",
        TextureLength = 3,
        Width0 = 1.25,
        Width1 = 1.25,
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 112, 234)),
            ColorSequenceKeypoint.new(0.499, Color3.fromRGB(0, 140, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 112, 234))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.506, 0),
            NumberSequenceKeypoint.new(0.947, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v2 = Create("Attachment", v5)
local v6 = Create("Attachment", {
    Name = "WavesFast1",
    CFrame = CFrame.new(1.74017334, 0.340256214, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local v7 = {Name = "Sand0", CFrame = CFrame.new(-1.5982666, -0.26558733, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1)}
v7[Children] = {
    Create("Beam", {
        Name = "Sand",
        Brightness = 2,
        FaceCamera = true,
        Texture = "rbxassetid://116064072797305",
        TextureSpeed = 0,
        Width0 = 0.8,
        Width1 = 0.8,
        ZOffset = -0.8,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(234, 193, 166)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 193, 166))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
v5 = Create("Attachment", v7)
local v8 = Create("Attachment", {Name = "Sand1", CFrame = CFrame.new(1.63769531, -0.26558733, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1)})
local v9 = {Name = "Dark0", CFrame = CFrame.new(1.74017334, -0.025595665, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v9[Children] = {
    Create("Beam", {
        Name = "DarkPixels",
        Brightness = 1.5,
        FaceCamera = true,
        LightEmission = 0.8,
        Texture = "rbxassetid://140439908944576",
        TextureLength = 9,
        TextureSpeed = 0.1,
        ZOffset = -0.9,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 28, 52)),
            ColorSequenceKeypoint.new(0.482, Color3.fromRGB(162, 206, 234)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(7, 16, 39))),
        }),
        TextureMode = Enum.TextureMode.Static,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.506, 0),
            NumberSequenceKeypoint.new(0.947, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v7 = Create("Attachment", v9)
local v10 = Create("Attachment", {Name = "Dark1", CFrame = CFrame.new(-1.70074463, -0.025595665, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v11 = {Name = "Sun", CFrame = CFrame.new(-1.05096436, 0.615302086, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v11[Children] = {
    Create("ParticleEmitter", {
        Name = "ParticleEmitter",
        Brightness = 2,
        LightEmission = 0.3,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://82514940894525",
        ZOffset = 1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 246, 144)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 246, 144))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.66), (NumberSequenceKeypoint.new(1, 0.66))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.496, 0.0575),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v9 = Create("Attachment", v11)
local v12 = Create("ParticleEmitter", {
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
local v13 = {
    Name = "Center",
    WorldCFrame = CFrame.new(-575.692261, 7.10001421, 77.4998779, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
v13[Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 89, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 89, 255))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.3), (NumberSequenceKeypoint.new(1, 1.3))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, -0.9), (NumberSequenceKeypoint.new(1, -0.9))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.881),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v6
v1[5] = v5
v1[6] = v8
v1[7] = v7
v1[8] = v10
v1[9] = v9
v1[10] = v12
v1[11] = Create("Attachment", v13)
return v1