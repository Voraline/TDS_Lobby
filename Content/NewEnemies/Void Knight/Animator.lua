-- Script path: ReplicatedStorage.Content.NewEnemies.Void Knight.Animator
-- Decompile time: 1.53 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13
    -- upvalues: StateManager (val), Animation (val), TweenService (val), HttpService (val), AreaIndicatorStore (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, j in Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({Preload = true, Track = j, Target = AnimationController}))
    end

    function a1:_face(a2) -- Line: 27 -- upvalues: TweenService (upval) -- types: self: table, a2: vector
        local Position = self.Model.PrimaryPart.Position
        local v1 = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
        TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = v1}):Play()
        return v1
    end

    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 47 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "AttackLeft",
            onEnter = function(a1_2) -- Line: 53 -- upvalues: a1 (val)
                local v1 = a1:_face(a1_2)
                a1._animations.AttackLeft:Play()
                a1.Rotation = CFrame.new() * v1.Rotation
            end,
        },
        {
            name = "AttackRight",
            onEnter = function(a1_2) -- Line: 61 -- upvalues: a1 (val)
                local v1 = a1:_face(a1_2)
                a1._animations.AttackRight:Play()
                a1.Rotation = CFrame.new() * v1.Rotation
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 69 -- upvalues: a1 (val)
                a1._animations.Death:Play()
            end,
        },
    })
    a1.Executables = {
        AreaIndicator = function(a1_2, a2, a3, a4) -- Line: 76
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), a1 (val)
            local v1 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v1, {
                type = "normal",
                initialAngle = 0,
                radius = a2,
                color3 = Color3.fromRGB(255, 0, 64),
                desiredAngle = a1_2,
                cframe = a3 * CFrame.new(0, -3.5, 0),
                tweenInfo = TweenInfo.new(0.25),
                lifeTime = a4,
            })
            a1:Wait(a4 + 1)
            AreaIndicatorStore.remove(v1)
        end,
        ChangeState = function(a1_2, ...) -- Line: 94 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
    }
end

return v1