-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen Shield.Animator
-- Decompile time: 1.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

local function emitParticles(a1) -- Line: 10 -- types: a1: userdata
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

function v1.Initialize(a1) -- Line: 21
    -- upvalues: StateManager (val), Animation (val), TimescaleUtilities (val), emitParticles (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end
    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 38 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "DashStart",
            onEnter = function() -- Line: 44 -- upvalues: a1 (val), TimescaleUtilities (upval), emitParticles (upval)
                a1._animations.DashStart:Play()
                TimescaleUtilities.Wait(0.43)
                emitParticles(a1.Model.HumanoidRootPart.GroundImpactShield)
            end,
        },
        {
            name = "Dashing",
            onEnter = function() -- Line: 52 -- upvalues: a1 (val)
                a1._animations.Dashing:Play()
                a1.Model.HumanoidRootPart.Dash.Enabled = true
                a1.Model.Shield.Particles.Dirt.Enabled = true
                a1.Model.Shield.Particles.Dust.Enabled = true
            end,
            onLeave = function() -- Line: 58 -- upvalues: a1 (val)
                a1.Model.HumanoidRootPart.Dash.Enabled = false
                a1.Model.Shield.Particles.Dirt.Enabled = false
                a1.Model.Shield.Particles.Dust.Enabled = false
            end,
        },
        {
            name = "DashEnd",
            onEnter = function() -- Line: 66 -- upvalues: a1 (val)
                a1._animations.DashEnd:Play()
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 72 -- upvalues: a1 (val), TimescaleUtilities (upval), emitParticles (upval)
                a1._animations.Death:Play()
                TimescaleUtilities.Wait(1.5)
                emitParticles(a1.Model.HumanoidRootPart.GroundImpactDeath)
            end,
        },
    })
    a1.Executables = {
        StateChanged = function(a1_2) -- Line: 81 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2)
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1