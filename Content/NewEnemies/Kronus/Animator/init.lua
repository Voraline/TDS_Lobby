-- Script path: ReplicatedStorage.Content.NewEnemies.Kronus.Animator
-- Decompile time: 3.20 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u48 = Random.new()
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 16
    -- upvalues: StateManager (val), Animation (val), ReplicatedStorage (val), u48 (val), TimescaleUtilities (val)
    -- upvalues: ItemDrop (val), EmitterManager (val), HttpService (val), AreaIndicatorStore (val)
    local v1
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    a1._beamEnabled = false
    for k, v in pairs((require(script:WaitForChild("KronusAnimatorStates")))) do
        a1._stateManager:addState(v)
    end
    for i, i2 in ipairs(Animations:GetChildren()) do
        v1 = Animation.new({
            IgnorePriority = true,
            Preload = true,
            Track = i2,
            Target = AnimationController,
            Entity = a1,
        })
        a1._animations[i2.Name] = v1
    end
    a1.Executables = {
        IceStorm = function(a1) -- Line: 43
            -- upvalues: ReplicatedStorage (upval), u48 (upval), TimescaleUtilities (upval), ItemDrop (upval)
            -- upvalues: EmitterManager (upval)
            for i, j in a1 do
                local u29 = (ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.Shards:GetChildren())[u48:NextInteger(1, 2)]:Clone()
                u29.CFrame = CFrame.new(j.startPosition)
                u29.Parent = workspace
                TimescaleUtilities.Delay(j.delay, function() -- Line: 52
                    -- upvalues: ItemDrop (upval), j (val), u29 (val), TimescaleUtilities (upval)
                    -- upvalues: EmitterManager (upval)
                    (ItemDrop.Drop(j.startPosition, j.endPosition, u29, j.dtMultiplier, j.gravity, j.velocity, function(a1, a2, a3) -- Line: 60
                        return CFrame.new(a3, a2).Rotation * CFrame.Angles(1.5707963267948966, 0, 0)
                    end)):andThen(function() -- Line: 64 -- upvalues: u29 (upval), TimescaleUtilities (upval), EmitterManager (upval), j (upval)
                        for i, j2 in u29:GetDescendants() do
                            if j2:IsA("Beam") or j2:IsA("Trail") then
                                j2.Enabled = false
                            end
                        end
                        u29.Transparency = 1
                        TimescaleUtilities.CleanUp(u29, 3)
                        EmitterManager.Emit("FrostExplosion", CFrame.new(j.endPosition), 1)
                    end)
                end)
            end
        end,
        ChangeState = function(a1_2, ...) -- Line: 79 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, a1, ...)
        end,
        AreaIndicator = function(a1_2, a2, a3, a4) -- Line: 83
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), a1 (val)
            local v1 = HttpService:GenerateGUID(false)
            local create = AreaIndicatorStore.create
            local v2 = {type = if not (a1_2 > 0) then "full" else "normal", radius = a2}
            local v3 = false
            if a1_2 > 0 then
                v3 = 0
            end
            v2.initialAngle = v3
            v3 = false
            if a1_2 > 0 then
                v3 = a1_2
            end
            v2.desiredAngle = v3
            v2.color3 = Color3.fromRGB(255, 0, 64)
            v3 = false
            if a1_2 > 0 then
                v3 = a3
            end
            v2.cframe = v3
            local Position = false
            if a1_2 == 0 then
                Position = a3.Position
            end
            v2.position = Position
            v2.tweenInfo = TweenInfo.new(0.25)
            v2.lifeTime = a4
            create(v1, v2)
            a1:Wait(a4 + 1)
            AreaIndicatorStore.remove(v1)
        end,
    }
    a1:changeState("Walk")
end

function v1:changeState(a2, ...) -- Line: 104 -- types: self: table, a2: string
    self._stateManager:changeState(a2, self, ...)
end

function v1.playAnimation(a1, a2, a3) -- Line: 108 -- types: a1: table, a2: string, a3: number?
    local v1 = a1._animations[a2]
    if v1 then
        return v1:Play(a3)
    end
    warn((("%* is not a valid animation of Frost Spirit"):format(a2)))
    return nil
end

function v1.face(a1, a2, a3) -- Line: 119 -- upvalues: TweenService (val) -- types: a1: table, a2: vector, a3: number
    if not a2 then
        return a1.Model.PrimaryPart.CFrame
    end
    local Position = a1.Model.PrimaryPart.Position
    local v1 = CFrame.lookAt(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
    TweenService:Create(a1.Model.PrimaryPart, TweenInfo.new(a3 or 0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = v1}):Play()
    return v1
end

function v1.getCurrentStateName(a1) -- Line: 141
    return a1._stateManager.currentState.name
end

return v1