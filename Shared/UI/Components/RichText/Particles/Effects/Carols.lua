-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Carols
-- Decompile time: 2.13 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Notes",
    Acceleration = Vector3.new(1.5, 0, 0),
    Drag = 1,
    FlipbookStartRandom = true,
    LightEmission = 0.5,
    Rate = 6,
    Texture = "rbxassetid://71864892108744",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 182, 79)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 182, 79))),
    }),
    EmissionDirection = Enum.NormalId.Left,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(1, 2),
    RotSpeed = NumberRange.new(-22, 22),
    Rotation = NumberRange.new(-12, 12),
    ShapeStyle = Enum.ParticleEmitterShapeStyle.Surface,
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.5, 0.332, 0.127),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-3, -1),
})
local v3 = Create("Attachment", {Name = "2", CFrame = CFrame.new(-2.00099993, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)})
local v4 = {Name = "1", CFrame = CFrame.new(2.00057983, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v4[Children] = {
    Create("Beam", {
        Name = "Glow",
        LightEmission = 1,
        Segments = 25,
        Texture = "rbxassetid://128263884132195",
        TextureLength = 0.1,
        TextureSpeed = 0.2,
        ZOffset = -0.5,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 189, 34)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 189, 34))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.492, 0.488),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    Create("Beam", {
        Name = "Beam",
        Brightness = 3,
        FaceCamera = true,
        LightEmission = 0.2,
        Texture = "rbxassetid://74431883720884",
        Width0 = 0.8,
        Width1 = 0.8,
        ZOffset = -0.2,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 92, 16)),
            ColorSequenceKeypoint.new(0.572, Color3.fromRGB(255, 179, 49)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 92, 16))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.103, 0),
            NumberSequenceKeypoint.new(0.898, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
    (Create("Beam", {
        Name = "Beam",
        Brightness = 2,
        FaceCamera = true,
        LightEmission = 0.1,
        Texture = "rbxassetid://70528460332776",
        TextureLength = 0.4,
        Width0 = 0.8,
        Width1 = 0.8,
        ZOffset = -0.21,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 75, 15)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 75, 15))),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.103, 0),
            NumberSequenceKeypoint.new(0.898, 0),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    })),
}
v1[1] = v2
v1[2] = v3
v1[3] = Create("Attachment", v4)
return v1