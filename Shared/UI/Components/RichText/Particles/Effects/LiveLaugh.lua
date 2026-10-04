-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.LiveLaugh
-- Decompile time: 0.57 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("Attachment", {
    Name = "2",
    Axis = Vector3.new(0, 1, 0),
    SecondaryAxis = Vector3.new(-1, 0, 0),
    CFrame = CFrame.new(-0.326660156, -0.272819519, 0, 0, -1, 0, 1, 0, -0, 0, 0, 1),
})
local v3 = {
    Name = "1",
    Axis = Vector3.new(0, 1, 0),
    CFrame = CFrame.new(-0.326660156, 1.42130423, 0, 0, -1, 0, 1, 0, -0, 0, 0, 1),
    SecondaryAxis = Vector3.new(-1, 0, 0),
}
v3[Children] = {
    Create("Beam", {
        Name = "Beam",
        Brightness = 1.2,
        FaceCamera = true,
        Segments = 12,
        Texture = "rbxassetid://77526905476167",
        TextureSpeed = 0,
        Width0 = 2,
        Width1 = 2,
        ZOffset = -0.55,
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
v1[1] = v2
v1[2] = Create("Attachment", v3)
return v1