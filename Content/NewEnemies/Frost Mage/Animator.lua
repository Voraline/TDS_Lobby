-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Mage.Animator
-- Decompile time: 2.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local CurrentCamera = workspace.CurrentCamera
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14
    -- upvalues: StateManager (val), Animation (val), TimescaleUtilities (val), EmitterManager (val), TweenService (val)
    -- upvalues: ReplicatedStorage (val), CurrentCamera (val), ItemDrop (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Track = v, Target = AnimationController}))
    end
    a1._stateManager:addStates({
        {
            name = "Fire",
            onEnter = function(a1_2) -- Line: 30
                -- upvalues: a1 (val), TimescaleUtilities (upval), EmitterManager (upval)
                local v1 = a1:_face(a1_2)
                a1.Rotation = CFrame.new() * v1.Rotation
                a1._animations.Fire:Play()
                TimescaleUtilities.Delay(0.7, function() -- Line: 35 -- upvalues: EmitterManager (upval), a1 (upval)
                    EmitterManager.manualEmit(a1.Model.RuneRoot.MagicCircle)
                end)
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 42 -- upvalues: a1 (val), TweenService (upval)
                local PrimaryPart = a1.Model.PrimaryPart
                a1._animations.Death:Play()
                TweenService:Create(PrimaryPart, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                    CFrame = PrimaryPart.CFrame + Vector3.new(0, 1, 0) * (PrimaryPart.Node.CFrame.Y + 1.6),
                }):Play()
            end,
        },
    })
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 55 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
        FireProjectile = function(a1_2) -- Line: 58
            -- upvalues: ReplicatedStorage (upval), CurrentCamera (upval), a1 (val), ItemDrop (upval)
            -- upvalues: EmitterManager (upval)
            local u8 = ReplicatedStorage.Assets.Effects.Mob.FrostSpiritBomb:Clone()
            u8.Parent = CurrentCamera
            a1_2.start = a1.Model.RuneRoot.Position
            ;(ItemDrop.Drop(a1_2.start, a1_2.goal, u8, a1_2.dtMultiplier, a1_2.gravity, a1_2.velocity, function(a1, a2, a3) -- Line: 71
                return CFrame.lookAt(a3, a2).Rotation * CFrame.Angles(1.5707963267948966, 0, 0)
            end)):andThen(function() -- Line: 74 -- upvalues: u8 (val), EmitterManager (upval), a1_2 (val)
                u8:Destroy()
                EmitterManager.Emit("FrostExplosion", CFrame.new(a1_2.goal))
            end)
        end,
    }
end

function v1:_face(a2, a3) -- Line: 83 -- upvalues: TweenService (val) -- types: self: table, a2: vector, a3: number
    local Position = self.Model.PrimaryPart.Position
    local v1 = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
    TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(a3 or 0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {CFrame = v1}):Play()
    return v1
end

return v1