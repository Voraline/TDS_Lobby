-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Necromancer.Animator
-- Decompile time: 1.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

local function emitParticles(a1) -- Line: 11 -- types: a1: userdata
    local Attribute
    for i, v in ipairs(a1:GetChildren()) do
        if v:IsA("ParticleEmitter") then
            Attribute = v:GetAttribute("EmitCount")
            if Attribute then
                v:Emit(Attribute)
            end
        end
    end
end

function v1.Initialize(a1) -- Line: 22
    -- upvalues: StateManager (val), Animation (val), TimescaleUtilities (val), EmitterManager (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end
    a1._stateManager:addStates({
        {name = "Walking"},
        {
            name = "Summoning",
            onEnter = function() -- Line: 42 -- upvalues: a1 (val), TimescaleUtilities (upval), EmitterManager (upval)
                a1._animations.Summon:Play()
                TimescaleUtilities.Wait(0.8)
                EmitterManager.Emit("MoltenSummon", a1.Model.PrimaryPart.Node.WorldCFrame)
            end,
        },
    })
    a1.Executables = {
        StateChanged = function(a1_2, ...) -- Line: 51 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1