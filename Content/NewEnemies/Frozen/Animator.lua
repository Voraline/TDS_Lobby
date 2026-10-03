-- Script path: ReplicatedStorage.Content.NewEnemies.Frozen.Animator
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: StateManager (val), Animation (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end
    a1._stateManager:addStates({{name = "Walking"}})
    a1.Executables = {
        StateChanged = function(a1_2) -- Line: 30 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2)
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1