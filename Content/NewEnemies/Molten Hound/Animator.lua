-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Hound.Animator
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val), GameState (val), EmitterManager (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._deathAnimation = Animation.new({Track = Animations:WaitForChild("Death"), Target = AnimationController})
    a1.Maid:Mark(a1._deathAnimation)
    a1.Executables = {
        Death = function() -- Line: 21 -- upvalues: a1 (val), GameState (upval), EmitterManager (upval)
            a1._deathAnimation:Play()
            local Sound = a1.Model.PrimaryPart:FindFirstChild("Sound")
            if Sound then
                Sound.PlaybackSpeed = GameState.TimeScale
                Sound:Play()
            end
            EmitterManager.Emit("EnergyExplosion", CFrame.new(a1.Model.PrimaryPart.Position), 1.5)
        end,
    }
end

return v1