-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.SnowDay
-- Decompile time: 3.07 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {
    Name = "WindStart",
    Axis = Vector3.new(0.9739999771118164, -0.22699999809265137, 0),
    CFrame = CFrame.new(1.70800781, 1.84730768, 0, 0.973796427, 0.227421433, -0, -0.227421433, 0.973796427, 0, 0, 0, 1),
    SecondaryAxis = Vector3.new(0.22699999809265137, 0.9739999771118164, 0),
}
v2[Children] = {
    Create("Beam", {
        Name = "Wind",
        Brightness = 3,
        CurveSize0 = 1,
        CurveSize1 = 1,
        LightEmission = 1,
        Texture = "rbxassetid://114208817139118",
        TextureLength = 0.15,
        TextureSpeed = 0.5,
        Width0 = 2.2,
        Width1 = 1.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(203, 250, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 136, 255))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.499, 0.719),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {
    Name = "WindEnd",
    Axis = Vector3.new(0.9879999756813049, -0.15399999916553497, 0),
    SecondaryAxis = Vector3.new(0.15399999916553497, 0.9879999756813049, 0),
    CFrame = CFrame.new(-1.85662842, 0.756128788, 0, 0.988094747, 0.153846607, -0, -0.153846607, 0.988094747, 0, 0, 0, 1),
})
v2 = Create("ParticleEmitter", {
    Name = "Flakes",
    Acceleration = Vector3.new(5, -8.100000381469727, 0),
    Brightness = 11,
    Drag = 9,
    LightEmission = 1,
    LockedToPart = true,
    Rate = 9,
    Texture = "rbxassetid://72734747209082",
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(153, 214, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 60, 255))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    Lifetime = NumberRange.new(1.8, 2.2),
    RotSpeed = NumberRange.new(-66, 66),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.192, 0),
        NumberSequenceKeypoint.new(0.2, 0.147, 0.0696),
        NumberSequenceKeypoint.new(0.3, 0.134, 0.0696),
        NumberSequenceKeypoint.new(0.4, 0.12, 0.0696),
        NumberSequenceKeypoint.new(0.5, 0.106, 0.0696),
        NumberSequenceKeypoint.new(0.6, 0.0902, 0.0696),
        NumberSequenceKeypoint.new(0.7, 0.0728, 0.0696),
        NumberSequenceKeypoint.new(0.8, 0.0529, 0.0529),
        NumberSequenceKeypoint.new(0.9, 0.0296, 0.0296),
        NumberSequenceKeypoint.new(1, 1.93e-17, 1.93e-17),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(11, 22),
    SpreadAngle = Vector2.new(11, 11),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.191, 1),
        NumberSequenceKeypoint.new(0.464, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
})
local v5 = Create("Attachment", {Name = "6", CFrame = CFrame.new(-1.75097656, 1.14929342, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v6 = {Name = "5", CFrame = CFrame.new(-0.171813965, 1.14929342, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v6[Children] = {
    Create("Beam", {
        Name = "Snowman",
        Brightness = 2.1,
        FaceCamera = true,
        LightEmission = 0.1,
        Segments = 25,
        Texture = "rbxassetid://120975604352473",
        TextureSpeed = 0,
        Width0 = 1.5,
        Width1 = 1.5,
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 229, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 229, 255))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
local v7 = Create("Attachment", v6)
local v8 = Create("Attachment", {Name = "4", CFrame = CFrame.new(-1.75097656, -0.0998668671, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v9 = {Name = "3", CFrame = CFrame.new(1.75061035, -0.0998668671, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v9[Children] = {
    Create("Beam", {
        Name = "Water",
        Brightness = 11,
        FaceCamera = true,
        Segments = 25,
        Texture = "rbxassetid://110113895765232",
        TextureSpeed = 0,
        Width0 = 3.5,
        Width1 = 3.5,
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(147, 154, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(147, 154, 255))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.4), (NumberSequenceKeypoint.new(1, 0.4))}),
    }),
}
v6 = Create("Attachment", v9)
local v10 = Create("Attachment", {Name = "2", CFrame = CFrame.new(-1.75097656, -0.147412777, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v11 = {Name = "1", CFrame = CFrame.new(1.75061035, -0.147412777, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v11[Children] = {
    Create("Beam", {
        Name = "Snow",
        Brightness = 2.1,
        FaceCamera = true,
        LightEmission = 0.1,
        Segments = 25,
        Texture = "rbxassetid://138197736187439",
        TextureSpeed = 0,
        Width0 = 3.5,
        Width1 = 3.5,
        ZOffset = 0.12,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(192, 193, 255)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(192, 193, 255))),
        }),
        Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 0))}),
    }),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v5
v1[5] = v7
v1[6] = v8
v1[7] = v6
v1[8] = v10
v1[9] = Create("Attachment", v11)
return v1