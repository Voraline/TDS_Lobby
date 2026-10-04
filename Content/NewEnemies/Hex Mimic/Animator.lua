-- Script path: ReplicatedStorage.Content.NewEnemies.Hex Mimic.Animator
-- Decompile time: 0.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: StateManager (val), Animation (val)
    a1._animations = {}
    a1._stateManager = StateManager.new()
    local Animator = a1.Model.AnimationController.Animator
    local Transform = a1.Model.Animations:WaitForChild("Transform")
    a1._animations.Transform = Animation.new({Track = Transform, Target = Animator})
    local RunOpen = a1.Model.Animations:WaitForChild("RunOpen")
    a1._animations.Run = Animation.new({Track = RunOpen, Target = Animator})
    local _stateManager = a1._stateManager
    local v1 = {}
    local v2 = {
        name = "Transform",
        onEnter = function() -- Line: 33 -- upvalues: a1 (val)
            a1._animations.Transform:Play()
        end,
    }
    local v3 = {
        name = "Run",
        onEnter = function() -- Line: 39 -- upvalues: a1 (val)
            a1._animations.Run:Play()
        end,
    }
    v1[1] = {
        name = "Walk",
        onEnter = function() end,
    }
    v1[2] = v2
    v1[3] = v3
    _stateManager:addStates(v1)
    a1.Executables = {
        StateChanged = function(a1_2) -- Line: 46 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2)
        end,
    }
    a1._stateManager:changeState("Walk")
end

return v1