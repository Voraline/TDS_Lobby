-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.CherryBlossom
-- Decompile time: 5.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1", CFrame = CFrame.new(-2.00057983, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v2[Children] = {
    Create("Beam", {
        Name = "Flowy",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://120746873590589",
        TextureLength = 0.2,
        TextureSpeed = 0.025,
        ZOffset = -0.3,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 152, 228)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 152, 228))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "branch",
        Brightness = 2,
        LightEmission = 0.2,
        Segments = 25,
        Texture = "rbxassetid://112048666210941",
        TextureSpeed = 0.05,
        Width0 = 2,
        Width1 = 2,
        ZOffset = -0.993,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 152, 228)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 152, 228))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.502, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
local v3 = Create("Attachment", v2)
local v4 = Create("Attachment", {Name = "2", CFrame = CFrame.new(2.00099993, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v5 = {Name = "Attachment", CFrame = CFrame.new(0, -3.40000057, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v5[Children] = {
    Create("ParticleEmitter", {
        Name = "Flare",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 4,
        Texture = "rbxassetid://16791538193",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 69, 230)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 69, 230))),
        }),
        Lifetime = NumberRange.new(1),
        Rotation = NumberRange.new(-360, 360),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3.35), (NumberSequenceKeypoint.new(1, 3.35))}),
        Speed = NumberRange.new(0),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.762),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        ZOffset = -0.1,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 194, 245)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 194, 245))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 4.37), (NumberSequenceKeypoint.new(1, 4.37))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), (NumberSequenceKeypoint.new(1, 0.2))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.762),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v2 = Create("Attachment", v5)
local v6 = Create("ParticleEmitter", {
    Name = "ErodeSmoke",
    Acceleration = Vector3.new(0, 0.628000020980835, 0),
    Brightness = 12,
    Drag = 3,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://100955035693286",
    ZOffset = -0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(241, 89, 183)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(241, 89, 183))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-360, 360),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.628, 0.209),
        (NumberSequenceKeypoint.new(1, 1.65, 0.419)),
    }),
    Speed = NumberRange.new(-0.628, 0.628),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.403, 0.287, 0.156),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
v5 = Create("ParticleEmitter", {
    Name = "Leaves",
    Acceleration = Vector3.new(0, -3.309999942779541, 0.21899999678134918),
    Brightness = 2,
    Drag = 2,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 11,
    Texture = "rbxassetid://15298353824",
    ZOffset = -0.5,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 134, 227)),
        ColorSequenceKeypoint.new(0.225, Color3.fromRGB(250, 123, 216)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(207, 26, 120))),
    }),
    FlipbookFramerate = NumberRange.new(32, 56),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid8x8,
    Lifetime = NumberRange.new(1, 3),
    RotSpeed = NumberRange.new(-111, 111),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.046, 0.254, 0.0693),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(1.2, 2.41),
    SpreadAngle = Vector2.new(88, 88),
})
local v7 = Create("ParticleEmitter", {
    Name = "Sakura",
    Brightness = 2,
    FlipbookStartRandom = true,
    LockedToPart = true,
    Rate = 3,
    Texture = "rbxassetid://94043805670941",
    ZOffset = -0.45,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(239, 168, 206)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(239, 168, 206))),
    }),
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-12, 12),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.6, 0.25),
        (NumberSequenceKeypoint.new(1, 0.7, 0.25)),
    }),
    Speed = NumberRange.new(-0.03, 0.03),
    SpreadAngle = Vector2.new(-360, 360),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.137, 0.131, 0.1),
        NumberSequenceKeypoint.new(0.799, 0),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v8 = Create("ParticleEmitter", {
    Name = "Smoke",
    Drag = 6,
    LockedToPart = true,
    Rate = 12,
    Texture = "rbxassetid://138210092362719",
    ZOffset = -1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(234, 168, 239)),
        ColorSequenceKeypoint.new(0.438, Color3.fromRGB(239, 11, 124)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(239, 0, 116))),
    }),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 4),
    RotSpeed = NumberRange.new(-22, 22),
    Rotation = NumberRange.new(-360, 360),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.301),
        NumberSequenceKeypoint.new(0.1, 0.502),
        NumberSequenceKeypoint.new(0.2, 0.641),
        NumberSequenceKeypoint.new(0.3, 0.749),
        NumberSequenceKeypoint.new(0.4, 0.836),
        NumberSequenceKeypoint.new(0.5, 0.906),
        NumberSequenceKeypoint.new(0.6, 0.961),
        NumberSequenceKeypoint.new(0.7, 1),
        NumberSequenceKeypoint.new(0.8, 1.03),
        NumberSequenceKeypoint.new(0.9, 1.05),
        NumberSequenceKeypoint.new(1, 1.06),
        (NumberSequenceKeypoint.new(1, 1.06)),
    }),
    Speed = NumberRange.new(-0.301, 0.301),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.137, 0.131, 0.1),
        (NumberSequenceKeypoint.new(1, 1)),
    }),
})
local v9 = {
    Name = "Stars",
    Brightness = 4,
    Drag = 6,
    LockedToPart = true,
    Rate = 10,
    Texture = "rbxassetid://100235720010709",
    ZOffset = 0.1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 0, 255)),
        ColorSequenceKeypoint.new(0.202, Color3.fromRGB(254, 3, 120)),
        ColorSequenceKeypoint.new(0.208, Color3.fromRGB(239, 0, 247)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(252, 160, 255)),
        ColorSequenceKeypoint.new(0.507, Color3.fromRGB(255, 0, 115)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(232, 103, 255))),
    }),
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(2, 3),
    Shape = Enum.ParticleEmitterShape.Sphere,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.3, 0),
        NumberSequenceKeypoint.new(0.4, 0.159, 0.0796),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(0.7, 0),
        NumberSequenceKeypoint.new(0.8, 0.0796, 0.0477),
        NumberSequenceKeypoint.new(0.9, 0),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(0.955, 2.55),
    SpreadAngle = Vector2.new(-360, 360),
}
v1[1] = v3
v1[2] = v4
v1[3] = v2
v1[4] = v6
v1[5] = v5
v1[6] = v7
v1[7] = v8
v1[8] = Create("ParticleEmitter", v9)
return v1