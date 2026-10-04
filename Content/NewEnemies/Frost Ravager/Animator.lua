-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Ravager.Animator
-- Decompile time: 1.71 ms

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
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end
    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 28 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "DashStart",
            onEnter = function() -- Line: 34 -- upvalues: a1 (val)
                a1._animations.DashStart:Play()
            end,
        },
        {
            name = "Dashing",
            onEnter = function() -- Line: 40 -- upvalues: a1 (val)
                a1._animations.Dashing:Play()
            end,
        },
        {
            name = "DashEnd",
            onEnter = function() -- Line: 46 -- upvalues: a1 (val)
                a1._animations.DashEnd:Play()
            end,
        },
        {
            name = "ShieldBreak",
            onEnter = function() -- Line: 52 -- upvalues: a1 (val)
                local v1 = a1._animations.Break:Play()
                local u15 = (v1:GetMarkerReachedSignal("CloneShield")):Connect(function(a1_2) -- Line: 56 -- upvalues: a1 (upval)
                    local ShieldPart = a1.Model:FindFirstChild("ShieldPart")
                    ShieldPart.Transparency = 1
                end)
                v1.Ended:Connect(function() -- Line: 60 -- upvalues: u15 (ref)
                    u15:Disconnect()
                end)
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 67 -- upvalues: a1 (val), TimescaleUtilities (upval), EmitterManager (upval)
                local Value = a1.Model.Configuration.VFX.GroundImpactDeath.Value
                a1._animations.Death:Play()
                TimescaleUtilities.Wait(2.33)
                EmitterManager.manualEmit(Value)
            end,
        },
    })
    a1.Executables = {
        StateChanged = function(a1_2) -- Line: 79 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2)
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1