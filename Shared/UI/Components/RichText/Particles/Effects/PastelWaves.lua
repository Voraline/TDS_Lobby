-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.PastelWaves
-- Decompile time: 2.38 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "Waves0",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(2.00097656, -0.43250227, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
}
v2[Children] = {
    Create("Beam", {
        Name = "Beam",
        Segments = 25,
        Texture = "rbxassetid://17103466366",
        TextureLength = 0.5,
        TextureSpeed = 0.2,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(169, 215, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(169, 215, 255))),
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
    Name = "Waves1",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-2.00061035, -0.43250227, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local v5 = {
    Name = "Waves2",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(2.00097656, -0.410000324, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
}
v5[Children] = {
    Create("Beam", {
        Name = "Beam",
        Segments = 25,
        Texture = "rbxassetid://17103466366",
        TextureLength = 0.32,
        TextureSpeed = -0.112,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.6,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(198, 176, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(198, 176, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v2 = Create("Attachment", v5)
local v6 = Create("Attachment", {
    Name = "Waves3",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-2.00061035, -0.410000324, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local v7 = {
    Name = "Waves4",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(2.00097656, -0.208989143, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
}
v7[Children] = {
    Create("Beam", {
        Name = "Beam",
        Segments = 25,
        Texture = "rbxassetid://17103466366",
        TextureLength = 0.4,
        TextureSpeed = 0.125,
        Width0 = 1.6,
        Width1 = 1.6,
        ZOffset = -0.7,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 156, 199)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 156, 199))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v5 = Create("Attachment", v7)
local v8 = Create("Attachment", {
    Name = "Waves5",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-2.00061035, -0.208989143, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
})
local v9 = {
    Name = "Waves6",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(2.00097656, -0.14093399, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
}
v9[Children] = {
    Create("Beam", {
        Name = "Beam",
        Segments = 25,
        Texture = "rbxassetid://17103466366",
        TextureLength = 0.64,
        TextureSpeed = 0.125,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.8,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(158, 164, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(158, 164, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0996, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v7 = Create("Attachment", v9)
local v10 = {
    Name = "Waves7",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-2.00061035, -0.14093399, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v6
v1[5] = v5
v1[6] = v8
v1[7] = v7
v1[8] = Create("Attachment", v10)
return v1