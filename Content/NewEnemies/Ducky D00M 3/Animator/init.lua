-- Script path: ReplicatedStorage.Content.NewEnemies.Ducky D00M 3.Animator
-- Decompile time: 2.06 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u37 = {
    ChainsawLoop = 111347561656148,
    MinigunLoop = 72489899845947,
    MissileLoop = 89426100983235,
    Drive = 16798941818,
}
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 39 -- upvalues: StateManager (val), Animation (val), u37 (val), EasySound (val)
    local v1
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.stateManager = StateManager.new()
    a1.animations = {}
    a1.sounds = {}
    for i, j in (Animations:GetChildren()) do
        v1 = Animation.new({IgnorePriority = true, Preload = true, Track = j, Target = AnimationController})
        a1.animations[j.Name] = v1
    end
    for k, n in u37 do
        v1 = EasySound.Create({
            volume = 0.5,
            looped = true,
            soundGroupName = "Enemies",
            id = n,
            name = k,
            parent = a1.Model.PrimaryPart,
        })
        a1.sounds[k] = v1
    end
    a1.Maid:Mark(function() -- Line: 70 -- upvalues: a1 (val), EasySound (upval)
        for k, v in pairs(a1.sounds) do
            EasySound.Destroy(v)
        end
        a1.sounds = {}
    end)
    a1.stateManager:addStates((require(script:WaitForChild("DuckyD00MAnimatorStates"))))
    a1.stateManager:changeState("Walk", a1)
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 82 -- upvalues: a1 (val) -- types: a1_2: string
            a1.stateManager:changeState(a1_2, a1, ...)
        end,
    }
end

function v1.CreateAreaIndicator(a1, a2) -- Line: 88
    -- upvalues: HttpService (val), AreaIndicatorStore (val), TimescaleUtilities (val)
    local u6 = HttpService:GenerateGUID(false)
    local create = AreaIndicatorStore.create
    local v1 = {type = if not (a2.angle < 360) then "full" else "normal", radius = a2.radius}
    local v2 = false
    if a2.angle < 360 then
        v2 = 0
    end
    v1.initialAngle = v2
    local angle = false
    if a2.angle < 360 then
        angle = a2.angle
    end
    v1.desiredAngle = angle
    v1.color3 = Color3.fromRGB(255, 0, 64)
    local cframe = false
    if a2.angle < 360 then
        cframe = a2.cframe
    end
    v1.cframe = cframe
    local Position = false
    if a2.angle == 360 then
        Position = a2.cframe.Position
    end
    v1.position = Position
    v1.tweenInfo = TweenInfo.new(0.25)
    v1.lifeTime = a2.openTime
    create(u6, v1)
    TimescaleUtilities.Delay(a2.openTime + 1, function() -- Line: 101 -- upvalues: AreaIndicatorStore (upval), u6 (val)
        AreaIndicatorStore.remove(u6)
    end)
    return u6
end

return v1