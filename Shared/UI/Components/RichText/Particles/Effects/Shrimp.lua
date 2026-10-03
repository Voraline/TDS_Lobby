-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.Shrimp
-- Decompile time: 1.29 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = Create("ParticleEmitter", {
    Name = "Shrimp",
    Brightness = 2.3,
    FlipbookStartRandom = true,
    LightEmission = 0.1,
    LockedToPart = true,
    Rate = 1.35,
    Texture = "rbxassetid://127661153530638",
    ZOffset = 1,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(249, 158, 130)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(249, 158, 130))),
    }),
    EmissionDirection = Enum.NormalId.Left,
    FlipbookFramerate = NumberRange.new(0),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid2x2,
    Lifetime = NumberRange.new(2, 3),
    RotSpeed = NumberRange.new(-33, 33),
    Rotation = NumberRange.new(-22, 22),
    Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.1, 0.406, 0.181),
        NumberSequenceKeypoint.new(0.899, 0.451, 0.181),
        (NumberSequenceKeypoint.new(1, 0)),
    }),
    Speed = NumberRange.new(-0.298, 0.298),
    SpreadAngle = Vector2.new(-5, 5),
})
local v3 = {Name = "Center"}
v3[Children] = {
    Create("ParticleEmitter", {
        Name = "Glow",
        LightEmission = 1,
        LockedToPart = true,
        Rate = 2,
        Texture = "rbxassetid://16788448905",
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 32, 32)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 32, 32))),
        }),
        Lifetime = NumberRange.new(2),
        Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.3), (NumberSequenceKeypoint.new(1, 1.3))}),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new({NumberSequenceKeypoint.new(0, -0.9), (NumberSequenceKeypoint.new(1, -0.9))}),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.498, 0.762),
            (NumberSequenceKeypoint.new(1, 1)),
        }),
    }),
}
v1[1] = v2
v1[2] = Create("Attachment", v3)
return v1