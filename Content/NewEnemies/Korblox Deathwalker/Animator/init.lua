-- Script path: ReplicatedStorage.Content.NewEnemies.Korblox Deathwalker.Animator
-- Decompile time: 2.08 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local v2 = RaycastParams.new()
v2.FilterType = Enum.RaycastFilterType.Include
v2.FilterDescendantsInstances = {workspace.Map, workspace.Ground}

local function createAreaIndicator(a1) -- Line: 24
    -- upvalues: HttpService (val), AreaIndicatorStore (val), TimescaleUtilities (val)
    local u5 = HttpService:GenerateGUID(false)
    local create = AreaIndicatorStore.create
    local v1 = {type = if not (a1.angle < 360) then "full" else "normal", radius = a1.radius}
    local v2 = false
    if a1.angle < 360 then
        v2 = 0
    end
    v1.initialAngle = v2
    local angle = false
    if a1.angle < 360 then
        angle = a1.angle
    end
    v1.desiredAngle = angle
    v1.color3 = Color3.fromRGB(255, 0, 64)
    local cframe = false
    if a1.angle < 360 then
        cframe = a1.cframe
    end
    v1.cframe = cframe
    local Position = false
    if a1.angle == 360 then
        Position = a1.cframe.Position
    end
    v1.position = Position
    v1.tweenInfo = TweenInfo.new(0.25)
    v1.lifeTime = a1.openTime
    create(u5, v1)
    TimescaleUtilities.Delay(a1.openTime + 1, function() -- Line: 37 -- upvalues: AreaIndicatorStore (upval), u5 (val)
        AreaIndicatorStore.remove(u5)
    end)
end

function v1.Initialize(a1) -- Line: 42 -- upvalues: StateManager (val), Animation (val), createAreaIndicator (val)
    local v1
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._animations = {}
    a1._stateManager = StateManager.new()
    for i, j in Animations:GetChildren() do
        v1 = Animation.new({Track = j, Target = AnimationController})
        a1._animations[j.Name] = v1
    end
    a1._stateManager:addStates((require(script:WaitForChild("KorbloxDeathwalkerAnimatorStates"))))
    a1.Executables = {
        AreaIndicators = function(a1) -- Line: 62 -- upvalues: createAreaIndicator (upval) -- types: a1: table
            for i, v in ipairs(a1) do
                createAreaIndicator(v)
            end
        end,
        ChangeState = function(a1_2, ...) -- Line: 67 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, a1, ...)
        end,
    }
end

function v1.animate(a1, a2) -- Line: 73 -- types: a1: table, a2: string
    local v1 = a1._animations[a2]
    if v1 then
        v1:Play()
        return
    end
    warn((("%* is not an animation"):format(a2)))
end

function v1.face(a1, a2, a3) -- Line: 82 -- upvalues: TweenService (val) -- types: a1: table, a2: vector, a3: number
    local PrimaryPart = a1.Model.PrimaryPart
    local v1 = CFrame.lookAt(PrimaryPart.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
    TweenService:Create(PrimaryPart, TweenInfo.new(a3 or 0.5), {CFrame = v1}):Play()
    return v1
end

return v1