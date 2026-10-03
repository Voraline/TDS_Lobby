-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Particles.Effects.PVPTag
-- Decompile time: 0.94 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
local v1 = {}
local v2 = {Name = "1"}
local v3 = {}
local v4 = {Name = "2", CFrame = CFrame.new(0.10345459, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)}
v4[Children] = {
    Create("ParticleEmitter", {
        Name = "Lightning",
        Brightness = 2.1,
        LockedToPart = true,
        Rate = 2.1,
        Texture = "rbxassetid://97847087059912",
        ZOffset = -0.99,
        FlipbookFramerate = NumberRange.new(24),
        FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
        FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
        Lifetime = NumberRange.new(0.5),
        Size = NumberSequence.new(0.6),
        Speed = NumberRange.new(0),
        Squash = NumberSequence.new(-0.5),
    }),
}
local v5 = Create("Attachment", v4)
local v6 = Create("ParticleEmitter", {
    Name = "Base",
    Brightness = 2.3,
    LockedToPart = true,
    Rate = 1.5,
    Texture = "rbxassetid://127497052538390",
    ZOffset = -0.98,
    FlipbookFramerate = NumberRange.new(24),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(0.4, 0.7),
    Size = NumberSequence.new(1),
    Speed = NumberRange.new(0),
    Squash = NumberSequence.new(-1.5),
})
local v7 = {
    Name = "Base",
    Brightness = 2.1,
    LockedToPart = true,
    Rate = 2.1,
    Texture = "rbxassetid://71319542969553",
    ZOffset = -1,
    FlipbookFramerate = NumberRange.new(24),
    FlipbookLayout = Enum.ParticleFlipbookLayout.Grid4x4,
    FlipbookMode = Enum.ParticleFlipbookMode.OneShot,
    Lifetime = NumberRange.new(0.5),
    Size = NumberSequence.new(1),
    Speed = NumberRange.new(0),
    Squash = NumberSequence.new(-1.5),
}
v3[1] = v5
v3[2] = v6
v3[3] = Create("ParticleEmitter", v7)
v2[Children] = v3
v1[1] = Create("Attachment", v2)
return v1