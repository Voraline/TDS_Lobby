-- Script path: ReplicatedStorage.Content.NewEnemies.Void Reaper.Animator
-- Decompile time: 2.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
require(ReplicatedStorage.Shared.Modules.ItemDrop)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local VoidReaper = ReplicatedStorage.Assets.Effects.Mob.VoidReaper

function v1.Initialize(a1) -- Line: 15
    -- upvalues: StateManager (val), Animation (val), TweenService (val), TimescaleUtilities (val), VoidReaper (val)
    -- upvalues: EmitterManager (val), ReplicatedStorage (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end

    function a1:_face(a2) -- Line: 29 -- upvalues: TweenService (upval) -- types: self: table, a2: vector
        local Position = self.Model.PrimaryPart.Position
        TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            CFrame = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z))),
        }):Play()
    end

    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 46 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "Summoning",
            onEnter = function() -- Line: 52 -- upvalues: a1 (val), TimescaleUtilities (upval), VoidReaper (upval), EmitterManager (upval)
                a1._animations.Summon:Play()
                TimescaleUtilities.Wait(0.8)
                local v1 = VoidReaper.NewSummonVFX:Clone()
                v1.CFrame = CFrame.new(a1.Model.SpawnEffect.Value.WorldPosition + Vector3.new(0, 0.05000000074505806, 0))
                EmitterManager.manualEmit(v1)
                v1.Parent = workspace
                TimescaleUtilities.CleanUp(v1, 3)
                a1.Model.SpawnEffect.Value.Sound:Play()
            end,
        },
        {
            name = "Attacking",
            onEnter = function(a1_2) -- Line: 69 -- upvalues: a1 (val)
                a1._animations.SpellThrow:Play()
                a1:_face(a1_2)
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 76 -- upvalues: a1 (val)
                a1._animations.Death:Play()
            end,
        },
    })
    a1.Executables = {
        SummonCircle = function(a1) -- Line: 83 -- upvalues: ReplicatedStorage (upval), TimescaleUtilities (upval)
            if not a1 then
                return
            end
            local u9 = ReplicatedStorage.Assets.Effects.Mob.VoidReaper.SummonCircle:Clone()
            task.delay(0.1, function() -- Line: 90 -- upvalues: u9 (val)
                for i, j in u9:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = true
                    end
                end
            end)
            local RigidConstraint = Instance.new("RigidConstraint")
            RigidConstraint.Attachment0 = u9.VFX
            RigidConstraint.Attachment1 = a1.PrimaryPart.Node
            RigidConstraint.Parent = u9
            u9.Parent = a1
            TimescaleUtilities.Delay(4, function() -- Line: 104 -- upvalues: u9 (val), TimescaleUtilities (upval)
                for i, j in u9:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.CleanUp(u9, 3)
            end)
        end,
        StateChanged = function(a1_2, ...) -- Line: 114 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1