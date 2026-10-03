-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Necromancer.Animator
-- Decompile time: 1.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11
    -- upvalues: StateManager (val), Animation (val), TimescaleUtilities (val), EmitterManager (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Track = v, Target = AnimationController}))
    end
    a1._stateManager:addStates({
        {name = "Walking"},
        {
            name = "Summoning",
            onEnter = function() -- Line: 30 -- upvalues: a1 (val), TimescaleUtilities (upval), EmitterManager (upval)
                local Value = a1.Model.Configuration.VFX.SpawnEffect.Value
                a1._animations.Summon:Play()
                TimescaleUtilities.Wait(0.8)
                EmitterManager.manualEmit(Value)
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 42 -- upvalues: a1 (val)
                a1._animations.Death:Play()
            end,
        },
    })
    a1.Executables = {
        StateChanged = function(a1_2, ...) -- Line: 49 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1