-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Champion
-- Decompile time: 5.84 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Specs",
    Brightness = 5,
    Drag = 7.5,
    LockedToPart = true,
    Rate = 10,
    Texture = "rbxassetid://8030760338",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(253, 163, 66)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 163, 66))),
    }),
    Lifetime = NumberRange.new(0.5, 0.7),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.35, 0.281),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(2.81, 5.62),
    SpreadAngle = Vector2.new(-360, 360),
})
local v3 = Create("ParticleEmitter", {
    Name = "Sparks",
    Brightness = 6,
    Drag = 7.5,
    Rate = 4,
    LockedToPart = true,
    Texture = "rbxassetid://8535194548",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(253, 158, 88)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 158, 88))),
    }),
    Lifetime = NumberRange.new(0.85, 1),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.35, 0.4),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(2.81, 5.62),
    SpreadAngle = Vector2.new(-360, 360),
})
local v4 = Create("ParticleEmitter", {
    Name = "Sparkles",
    LightEmission = 1,
    LockedToPart = true,
    Rate = 15,
    Texture = "http://www.roblox.com/asset/?id=298984512",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 229, 167)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 229, 167))),
    }),
    Lifetime = NumberRange.new(0.4, 0.6),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.125, 0.0625),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0),
})
local v5 = Create("ParticleEmitter", {
    Name = "Slash1",
    Brightness = 0.2,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 8,
    Texture = "rbxassetid://9181667895",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 176, 96)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 176, 96))),
    }),
    FlipbookFramerate = NumberRange.new(30),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(0.3, 1),
    Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
    RotSpeed = NumberRange.new(425),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2, 0.5), (NumberSequenceKeypoint.new(1, 0.5))}),
    Speed = NumberRange.new(0.003),
    SpreadAngle = Vector2.new(50, 50),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.259, 0),
        NumberSequenceKeypoint.new(0.859, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v6 = Create("ParticleEmitter", {
    Name = "Glow",
    Brightness = 0.1,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 40,
    Texture = "rbxassetid://8708637750",
    ZOffset = -2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(242, 92, 42)),
        ColorSequenceKeypoint.new(0.24, Color3.fromRGB(244, 87, 28)),
        ColorSequenceKeypoint.new(0.462, Color3.fromRGB(255, 201, 165)),
        ColorSequenceKeypoint.new(0.663, Color3.fromRGB(255, 172, 56)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 201, 86))),
    }),
    EmissionDirection = Enum.NormalId.Front,
    Lifetime = NumberRange.new(0.8),
    Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1.03),
        NumberSequenceKeypoint.new(0.201, 1.15),
        NumberSequenceKeypoint.new(0.557, 1.03),
        (NumberSequenceKeypoint.new(1, 0.848)),
    }),
    Speed = NumberRange.new(0.001),
    Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.501, -0.5, 0.4),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.13, 0.815),
        NumberSequenceKeypoint.new(0.506, 0.815),
        NumberSequenceKeypoint.new(0.758, 0.865),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v7 = {Name = "LeftCrown", CFrame = CFrame.new(-2, 0, 0)}
v7[Children] = {
    Create("ParticleEmitter", {
        Name = "Crown",
        Brightness = 2,
        LockedToPart = true,
        Rate = 1,
        Texture = "rbxassetid://5547588029",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 198, 25)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 198, 25))),
        }),
        EmissionDirection = Enum.NormalId.Front,
        Lifetime = NumberRange.new(1.2),
        Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.3), (NumberSequenceKeypoint.new(1, 0.3))}),
        Speed = NumberRange.new(0.01),
        Squash = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, -0.1),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.1, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v8 = Create("Attachment", v7)
local v9 = {Name = "RightCrown", CFrame = CFrame.new(2, 0, 0)}
v9[Children] = {
    Create("ParticleEmitter", {
        Name = "Crown",
        Brightness = 2,
        LockedToPart = true,
        Rate = 1,
        Texture = "rbxassetid://5547588029",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 198, 25)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 198, 25))),
        }),
        EmissionDirection = Enum.NormalId.Front,
        Lifetime = NumberRange.new(1.2),
        Orientation = Enum.ParticleOrientation.VelocityPerpendicular,
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.3), (NumberSequenceKeypoint.new(1, 0.3))}),
        Speed = NumberRange.new(0.01),
        Squash = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(0.5, -0.1),
            (NumberSequenceKeypoint.new(1, 0)),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.1, 0),
            NumberSequenceKeypoint.new(0.9, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v10 = Create("Attachment", v9)
v7 = Create("Attachment", {Name = "BeamEnd", CFrame = CFrame.new(-3, 0, 0)})
v9 = Create("Attachment", {Name = "BeamStart", CFrame = CFrame.new(3, 0, 0)})
local v11 = Create("Beam", {
    Name = "Beam",
    Brightness = 1,
    LightEmission = 0.5,
    Segments = 25,
    Texture = "rbxassetid://12385355989",
    TextureLength = 0.1,
    TextureSpeed = 0.75,
    Width0 = 2,
    Width1 = 2,
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 169, 98)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 169, 98))),
    }),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.202, 0),
        NumberSequenceKeypoint.new(0.794, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v12 = Create("Beam", {
    Name = "Beam",
    Brightness = 0.2,
    LightEmission = 0.6,
    Segments = 25,
    Texture = "http://www.roblox.com/asset/?id=13576015697",
    TextureLength = 0.1,
    TextureSpeed = 0.5,
    Width0 = 2.75,
    Width1 = 3,
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 198, 106)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 198, 106))),
    }),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.202, 0),
        NumberSequenceKeypoint.new(0.794, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v13 = {
    Name = "Beam",
    Brightness = 1,
    LightEmission = 0.5,
    Segments = 25,
    Texture = "rbxassetid://13296730934",
    TextureLength = 0.1,
    TextureSpeed = 0.5,
    ZOffset = -0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 157, 87)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 157, 87))),
    }),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.202, 0),
        NumberSequenceKeypoint.new(0.794, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
}
v1[1] = v2
v1[2] = v3
v1[3] = v4
v1[4] = v5
v1[5] = v6
v1[6] = v8
v1[7] = v10
v1[8] = v7
v1[9] = v9
v1[10] = v11
v1[11] = v12
v1[12] = Create("Beam", v13)
return v1