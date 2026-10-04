-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.BunnyEars
-- Decompile time: 1.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "1",
    Axis = Vector3.new(0, 1, 0),
    CFrame = CFrame.new(0.3, 2.14695072, 0, 0, -1, 0, 1, 0, -0, 0, 0, 1),
    SecondaryAxis = Vector3.new(-1, 0, 0),
    WorldAxis = Vector3.new(0, 1, 0),
    WorldSecondaryAxis = Vector3.new(-1, 0, 0),
}
v2[Children] = {
    Create("Beam", {
        Name = "Beam",
        Brightness = 1.1,
        FaceCamera = true,
        Segments = 12,
        Texture = "rbxassetid://109996811868945",
        TextureSpeed = 0,
        Width0 = 4,
        Width1 = 3.5,
        ZOffset = -0.55,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.663, Color3.fromRGB(253, 250, 255)),
            ColorSequenceKeypoint.new(0.933, Color3.fromRGB(239, 200, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 197, 255))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = {
    Name = "2",
    Axis = Vector3.new(0, 1, 0),
    SecondaryAxis = Vector3.new(-1, 0, 0),
    WorldAxis = Vector3.new(0, 1, 0),
    WorldSecondaryAxis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(0.3, -1.55125856, 0, 0, -1, 0, 1, 0, -0, 0, 0, 1),
}
v1[1] = v3
v1[2] = Create("Attachment", v4)
return v1