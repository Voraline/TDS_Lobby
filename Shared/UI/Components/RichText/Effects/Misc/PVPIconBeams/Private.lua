-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.PVPIconBeams.Private
-- Decompile time: 0.83 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "Attachment",
    CFrame = CFrame.new(1.56390381, -0.0753259659, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
}
local v3 = {}
local v4 = {Name = "Attachment", CFrame = CFrame.new(-4.1, 0.0123000145, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v4[Children] = {
    Create("ParticleEmitter", {
        Name = "RankUp",
        LightInfluence = 1,
        LockedToPart = true,
        Rate = 1,
        ZOffset = 0.1,
        Texture = "rbxassetid://124366459969448",
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(0.5),
        Speed = NumberRange.new(0),
    }),
}
local v5 = Create("Attachment", v4)
local v6 = {
    Name = "Beam",
    Axis = Vector3.new(-4.099999904632568, 0, 0),
    CFrame = CFrame.new(-4.1, 0.670518875, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0, -1, 0),
    WorldAxis = Vector3.new(-1, 0, 0),
    WorldSecondaryAxis = Vector3.new(0, -1, 0),
}
v6[Children] = {
    Create("Beam", {
        Name = "Beam",
        FaceCamera = true,
        LightInfluence = 1,
        Texture = "rbxassetid://118572289381269",
        TextureSpeed = 0,
        Width0 = 1.3,
        Width1 = 1.3,
        ZOffset = 0.01,
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
local v7 = Create("Attachment", v6)
local v8 = {
    Name = "Up",
    Axis = Vector3.new(-1, 0, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
    WorldAxis = Vector3.new(-1, 0, 0),
    WorldSecondaryAxis = Vector3.new(0, -1, 0),
    CFrame = CFrame.new(-4.1, -0.657129288, 0, -1, 0, 0, 0, -1, 0, 0, 0, 1),
}
v3[1] = v5
v3[2] = v7
v3[3] = Create("Attachment", v8)
v2[Children] = v3
v1[1] = Create("Attachment", v2)
return v1