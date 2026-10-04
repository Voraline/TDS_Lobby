-- Script path: ReplicatedStorage.Content.NewEnemies.Snow Minion.Animator
-- Decompile time: 1.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local v1 = {}
v1.__index = v1

function v1:_face(a2) -- Line: 11
    local HumanoidRootPart = self.Model.HumanoidRootPart
    local Position = HumanoidRootPart.Position
    HumanoidRootPart.CFrame = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
end

function v1.Initialize(a1) -- Line: 19
    -- upvalues: StateManager (val), Animation (val), ItemDrop (val), EmitterManager (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, v in ipairs(Animations:GetChildren()) do
        a1._animations[v.Name] = (Animation.new({Preload = true, Track = v, Target = AnimationController}))
    end
    a1._stateManager:addStates({
        {
            name = "Throw",
            onEnter = function() -- Line: 36 -- upvalues: a1 (val)
                a1._animations.Throw:Play()
            end,
        },
        {
            name = "ThrowWind",
            onEnter = function() -- Line: 42 -- upvalues: a1 (val)
                a1.Model.Handle.Transparency = 0
                a1._animations.Windup:Play()
                local Length = a1._animations.Windup.Length
                if Length then
                    a1._animations.Windup:AdjustSpeed(Length / a1.Stats.WindUpTime)
                end
            end,
        },
        {name = "Walking"},
    })
    a1.Executables = {
        StateChanged = function(a1_2) -- Line: 60 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2)
        end,
        Projectile = function(a1_2) -- Line: 63 -- upvalues: a1 (val), ItemDrop (upval), EmitterManager (upval)
            a1.Model.Handle.Transparency = 1
            a1_2.endPosition = a1_2.endPosition + Vector3.new(math.random(), 0, (math.random()))
            a1:_face(a1_2.endPosition)
            local u24 = a1.Model.Handle:Clone()
            u24.Transparency = 0
            u24.Anchored = true
            ;(ItemDrop.Drop(a1_2.startPosition, a1_2.endPosition, u24, a1_2.dtMultiplier, a1_2.gravity, a1_2.velocity, function(a1, a2, a3) -- Line: 80
                return CFrame.new(a3, a2).Rotation
            end)):andThen(function() -- Line: 86 -- upvalues: EmitterManager (upval), a1_2 (val), u24 (val)
                EmitterManager.Emit("SnowballHit", CFrame.new(a1_2.endPosition), 2)
                u24:Destroy()
            end)
            u24.Parent = workspace
        end,
    }
    a1._stateManager:changeState("Walking")
end

return v1