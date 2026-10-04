-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Reindeer
-- Decompile time: 1.83 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("Attachment", {
    Name = "2",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = (CFrame.Angles(0, 3.141592653589793, 0)) * CFrame.new(2.19999695, 0.995732307, 0),
})
local v3 = {
    Name = "1",
    Axis = Vector3.new(-1, 0, 0),
    CFrame = (CFrame.Angles(0, 3.141592653589793, 0)) * CFrame.new(-2.19999695, 0.995732307, 0),
    SecondaryAxis = Vector3.new(0, -1, 0),
}
v3[Children] = {
    Create("Beam", {
        Name = "Beam",
        FaceCamera = true,
        Segments = 12,
        Texture = "rbxassetid://107706234440515",
        TextureSpeed = 0,
        Width0 = 4.5,
        Width1 = 4.5,
        ZOffset = -1.2,
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
local v4 = Create("Attachment", v3)
local v5 = {Name = "Attachment", CFrame = CFrame.new(0, -0.517131805, 0)}
v5[Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        Brightness = 3,
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://120456349828727",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 62, 62)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 62, 62))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.8), (NumberSequenceKeypoint.new(1, 0.8))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, -0.2), (NumberSequenceKeypoint.new(1, -0.2))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0.775),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 3,
        Texture = "rbxassetid://17241618949",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))),
        }),
        Lifetime = NumberRange.new(1),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.512, 0.256),
            NumberSequenceKeypoint.new(0.1, 0.687, 0.256),
            NumberSequenceKeypoint.new(0.2, 0.812, 0.256),
            NumberSequenceKeypoint.new(0.3, 0.914, 0.256),
            NumberSequenceKeypoint.new(0.4, 1, 0.256),
            NumberSequenceKeypoint.new(0.5, 1.07, 0.256),
            NumberSequenceKeypoint.new(0.6, 1.13, 0.256),
            NumberSequenceKeypoint.new(0.7, 1.19, 0.256),
            NumberSequenceKeypoint.new(0.8, 1.23, 0.256),
            NumberSequenceKeypoint.new(0.9, 1.26, 0.256),
            NumberSequenceKeypoint.new(1, 1.28, 0.256),
            (NumberSequenceKeypoint.new(1, 1.28, 0.256)),
        }),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0.775),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v1[1] = v2
v1[2] = v4
v1[3] = Create("Attachment", v5)
return v1