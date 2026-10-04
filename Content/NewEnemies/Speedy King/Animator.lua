-- Script path: ReplicatedStorage.Content.NewEnemies.Speedy King.Animator
-- Decompile time: 0.90 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local SpeedyKing = ReplicatedStorage.Assets.Effects.Mob.SpeedyKing
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12
    -- upvalues: Animation (val), SpeedyKing (val), EmitterManager (val), Debris (val)
    a1.Executables = {
        Death = function() -- Line: 14
            -- upvalues: a1 (val), Animation (upval), SpeedyKing (upval), EmitterManager (upval), Debris (upval)
            local Death = a1.Model.Animations:FindFirstChild("Death")
            if Death then
                Animation.new({Track = Death, Target = a1.Model.AnimationController}):Play()
            end
            local PrimaryPart = a1.Model.PrimaryPart
            local v1 = SpeedyKing.DeathEffect:Clone()
            v1.Position = PrimaryPart.Position - Vector3.new(0, a1.Height - 0.05, 0)
            v1.Parent = workspace.Trash
            EmitterManager.toggle(v1, true)
            a1:Wait(a1.Stats.BuffDisplayDuration)
            EmitterManager.toggle(v1, false)
            Debris:AddItem(v1, 3)
        end,
    }
end

return v1