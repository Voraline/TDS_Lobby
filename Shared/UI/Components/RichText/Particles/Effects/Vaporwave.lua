-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Vaporwave
-- Decompile time: 2.10 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "SunBottom",
    Axis = Vector3.new(0, 1, 0),
    CFrame = CFrame.new(0, -0.321341515, -1.18887234, 0, -1, 0, 1, 0, -0, 0, 0, 1),
    SecondaryAxis = Vector3.new(-1, 0, 0),
}
v2[Children] = {
    Create("Beam", {
        Name = "Beam",
        Brightness = 3,
        LightEmission = 1,
        Texture = "rbxassetid://119518320490240",
        TextureLength = 0.5,
        TextureSpeed = 0.75,
        Width0 = 3,
        Width1 = 2,
        ZOffset = -1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(81, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(81, 0, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0171, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Beam",
        Texture = "rbxassetid://119518320490240",
        TextureLength = 0.5,
        TextureSpeed = 0.75,
        Width0 = 3,
        Width1 = 2,
        ZOffset = -1.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(81, 0, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(81, 0, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.0171, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {
    Name = "SunTop",
    Axis = Vector3.new(0, 1, 0),
    SecondaryAxis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(0, 0.0613641739, 0.765605211, 0, -1, 0, 1, 0, -0, 0, 0, 1),
})
local v5 = {
    Name = "GridBottom",
    Axis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(0, -0.478247643, 0, 0, 1, -0, -1, 0, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(1, 0, 0),
}
v5[Children] = {
    Create("Beam", {
        Name = "Beam",
        LightEmission = 1,
        Texture = "rbxassetid://75303603084035",
        TextureLength = 0.1,
        Width0 = 4,
        Width1 = 4,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(191, 0, 255)),
            ColorSequenceKeypoint.new(0.498, Color3.fromRGB(255, 0, 132)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.49, 0.306),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Beam",
        Texture = "rbxassetid://75303603084035",
        TextureLength = 0.5,
        Width0 = 4,
        Width1 = 4,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(191, 0, 255)),
            ColorSequenceKeypoint.new(0.498, Color3.fromRGB(255, 0, 132)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.49, 0.306),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v2 = Create("Attachment", v5)
local v6 = Create("Attachment", {
    Name = "GridTop",
    Axis = Vector3.new(0, -1, 0),
    SecondaryAxis = Vector3.new(1, 0, 0),
    CFrame = CFrame.new(0, 0.553530693, 0, 0, 1, -0, -1, 0, 0, 0, 0, 1),
})
local v7 = {Name = "Attachment", CFrame = CFrame.new(0, 0.729023457, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v7[Children] = {
    Create("ParticleEmitter", {
        Name = "Core",
        Brightness = 2,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://133654053196968",
        ZOffset = -1,
        Lifetime = NumberRange.new(2),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.501, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v6
v1[5] = Create("Attachment", v7)
return v1