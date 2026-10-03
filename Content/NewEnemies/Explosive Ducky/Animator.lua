-- Script path: ReplicatedStorage.Content.NewEnemies.Explosive Ducky.Animator
-- Decompile time: 0.74 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1
local ExplosiveDucky = ReplicatedStorage.Assets.Effects.Mob.ExplosiveDucky

function v1.Initialize(a1) -- Line: 12
    -- upvalues: EasySound (val), Animation (val), ExplosiveDucky (val), EmitterManager (val), Debris (val)
    local u6 = EasySound.Create({
        id = 88344811726025,
        destroyOnEnd = true,
        soundGroupName = "Enemies",
        parent = a1.Model.RootPart,
    })
    local u15 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController,
    })
    a1.Executables = {
        Death = function(a1_2, a2) -- Line: 26
            -- upvalues: u15 (val), u6 (val), a1 (val), ExplosiveDucky (upval), EmitterManager (upval), Debris (upval)
            u15:Play()
            u6:Play()
            a1:Wait(a1_2)
            local v1 = ExplosiveDucky.Explosion:Clone()
            v1.Position = a2
            v1.Parent = workspace.CurrentCamera
            EmitterManager.manualEmit(v1)
            Debris:AddItem(v1, 3)
            u6.Parent = v1
        end,
    }
end

return v1