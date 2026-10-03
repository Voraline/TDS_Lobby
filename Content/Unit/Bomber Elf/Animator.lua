-- Script path: ReplicatedStorage.Content.Unit.Bomber Elf.Animator
-- Decompile time: 0.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val), EasySound (val), EffectsController (val)
    Animation.new({
        IsPersistent = true,
        Track = a1.Model.Animations.Walk,
        Target = a1.Model.AnimationController,
    }):Play()
    local Fuse = a1.Model.Bomb:FindFirstChild("Fuse")
    if Fuse and Fuse:IsA("Sound") then
        a1._fuseLoop = EasySound.Create({
            looped = true,
            audioGroup = "Towers",
            id = Fuse.SoundId,
            parent = a1.Model.Bomb,
            volume = Fuse.Volume,
            playbackSpeed = Fuse.PlaybackSpeed or 1,
        })
        a1._fuseLoop:Play()
    end
    a1.OnDestroy:Connect(function() -- Line: 31 -- upvalues: EffectsController (upval), a1 (val)
        EffectsController.Explosion({
            Position = a1.Model.PrimaryPart.Position,
            Radius = a1.Stats.Attributes.ExplosionRadius,
            Color = BrickColor.new("Br. yellowish orange"),
            Sound = 4725504496,
            Material = Enum.Material.Neon,
            Particles = false,
            Visible = true,
        })
    end)
end

return v1