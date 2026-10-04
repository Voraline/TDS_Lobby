-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Spirit.Animator
-- Decompile time: 5.01 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local CurrentCamera = workspace.CurrentCamera
local u60 = Random.new()
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 19
    -- upvalues: StateManager (val), Animation (val), TimescaleUtilities (val), ReplicatedStorage (val), u60 (val)
    -- upvalues: ItemDrop (val), EmitterManager (val)
    local v1
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    a1._beamModel = nil
    a1._acceptBeamPositions = false
    for k, v in pairs((require(script:WaitForChild("FrostSpiritAnimatorStates")))) do
        a1._stateManager:addState(v)
    end
    for i, i2 in ipairs(Animations:GetChildren()) do
        v1 = Animation.new({
            Track = i2,
            Target = AnimationController,
            IgnorePriority = i2.Name == "LeapLoop",
            Entity = a1,
        })
        a1._animations[i2.Name] = v1
    end
    a1.Executables = {
        IceStorm = function(a1_2) -- Line: 46
            -- upvalues: TimescaleUtilities (upval), ReplicatedStorage (upval), u60 (upval), ItemDrop (upval), a1 (val)
            -- upvalues: EmitterManager (upval)
            for i, j in a1_2 do
                TimescaleUtilities.Delay(j.delay, function() -- Line: 48
                    -- upvalues: ReplicatedStorage (upval), u60 (upval), ItemDrop (upval), j (val), a1 (upval)
                    -- upvalues: TimescaleUtilities (upval), EmitterManager (upval)
                    local u18 = (ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.Shards:GetChildren())[u60:NextInteger(1, 2)]:Clone()
                    local v1 = (ItemDrop.GetTimeToDestinationWithGV(j.startPosition, j.endPosition, j.gravity, j.velocity)) / j.dtMultiplier
                    u18.CFrame = CFrame.new(j.startPosition)
                    u18.Parent = workspace
                    a1:_showAreaIndicator(0, j.radius, CFrame.new(j.endPosition), v1)
                    ;(ItemDrop.Drop(j.startPosition, j.endPosition, u18, j.dtMultiplier, j.gravity, j.velocity, function(a1, a2, a3) -- Line: 75
                        return CFrame.new(a3, a2).Rotation * CFrame.Angles(1.5707963267948966, 0, 0)
                    end)):andThen(function() -- Line: 79 -- upvalues: u18 (val), TimescaleUtilities (upval), EmitterManager (upval), j (upval)
                        for i, j2 in u18:GetDescendants() do
                            if j2:IsA("Beam") or j2:IsA("Trail") then
                                j2.Enabled = false
                            end
                        end
                        u18.Transparency = 1
                        TimescaleUtilities.CleanUp(u18, 3)
                        EmitterManager.Emit("FrostExplosion", CFrame.new(j.endPosition), 1)
                    end)
                end)
            end
        end,
        ChangeState = function(a1_2, ...) -- Line: 94 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, a1, ...)
        end,
        LaneSwap = function(a1_2, a2) -- Line: 97 -- upvalues: a1 (val) -- types: a1_2: string, a2: number
            a1.PathName = a1_2
            a1.PathDistance = a2
            a1:RefreshPath(nil, nil, true)
        end,
        AreaIndicator = function(a1_2, a2, a3, a4) -- Line: 102
            -- upvalues: a1 (val)
            a1:_showAreaIndicator(a1_2, a2, a3, a4)
        end,
        BeamPosition = function(a1_2) -- Line: 105 -- upvalues: a1 (val) -- types: a1_2: vector?
            a1:_setBeamPosition(a1_2)
        end,
    }
    local v2 = a1.Replicator:WaitForState("TimeSpawned")
    if workspace:GetServerTimeNow() - v2 < 0.5 then
        a1:changeState("Spawn")
        return
    end
    a1:changeState("Walk")
end

function v1._showAreaIndicator(a1, a2, a3, a4, a5) -- Line: 118
    -- upvalues: HttpService (val), AreaIndicatorStore (val), TimescaleUtilities (val)
    local u9 = HttpService:GenerateGUID(false)
    local create = AreaIndicatorStore.create
    local v1 = {type = if not (a2 > 0) then "full" else "normal", radius = a3}
    local v2 = false
    if a2 > 0 then
        v2 = 0
    end
    v1.initialAngle = v2
    v2 = false
    if a2 > 0 then
        v2 = a2
    end
    v1.desiredAngle = v2
    v1.color3 = Color3.fromRGB(255, 0, 64)
    v2 = false
    if a2 > 0 then
        v2 = a4
    end
    v1.cframe = v2
    local Position = false
    if a2 == 0 then
        Position = a4.Position
    end
    v1.position = Position
    v1.tweenInfo = TweenInfo.new(0.25)
    v1.lifeTime = a5
    create(u9, v1)
    TimescaleUtilities.Delay(a5 + 1, function() -- Line: 132 -- upvalues: AreaIndicatorStore (upval), u9 (val)
        AreaIndicatorStore.remove(u9)
    end)
end

function v1:_createBeam() -- Line: 137 -- upvalues: ReplicatedStorage (val)
    local Value = self.Model.Configuration.Attachments.BeamStart.Value
    local v1 = ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.FrostBeam:Clone()
    v1:PivotTo(Value.WorldCFrame * (CFrame.new(0, -0.1, -0.5)))
    v1.Start.Head.Part1 = self.Model.HeadPart
    v1.End.Position = v1.Start.Position
    v1.Parent = self.Model
    self._beamModel = v1
    self.Maid:Mark(v1)
    return v1
end

function v1._beginBeam(a1) -- Line: 152
    a1:_cleanupBeam(true)
    a1:_stopLaserSweepLoopSound()
    a1._acceptBeamPositions = true
end

function v1:_cleanupBeam(a2) -- Line: 158
    -- upvalues: CurrentCamera (val), EmitterManager (val), TimescaleUtilities (val)
    self._acceptBeamPositions = false
    local _beamModel = self._beamModel
    self._beamModel = nil
    if not _beamModel then
        return
    end
    if not _beamModel.Parent or a2 then
        self.Maid:Unmark(_beamModel)
        _beamModel:Destroy()
        return
    end
    _beamModel.Parent = CurrentCamera
    local Head = _beamModel.Start:FindFirstChild("Head")
    if Head then
        Head:Destroy()
    end
    _beamModel.Start.Anchored = true
    EmitterManager.toggle(_beamModel, false)
    TimescaleUtilities.Delay(3, function() -- Line: 186 -- upvalues: self (val), _beamModel (val)
        self.Maid:Unmark(_beamModel)
        _beamModel:Destroy()
    end)
end

function v1:_stopLaserSweepLoopSound() -- Line: 192
    local _laserSweepLoopSound = self._laserSweepLoopSound
    self._laserSweepLoopSound = nil
    if _laserSweepLoopSound then
        _laserSweepLoopSound:Stop()
    end
end

function v1:_setBeamPosition(a2) -- Line: 201
    -- upvalues: spr (val), TweenService (val), Shaker (val)
    if not a2 then
        self:_cleanupBeam()
        return
    end
    if not self._acceptBeamPositions then
        return
    end
    local _beamModel = self._beamModel
    if not _beamModel or not _beamModel.Parent then
        if _beamModel then
            self:_cleanupBeam(true)
        end
        _beamModel = self:_createBeam()
    end
    local PrimaryPart = self.Model.PrimaryPart
    local Position = PrimaryPart.Position
    spr.target(_beamModel.End, 1, 2.5, {Position = a2})
    TweenService:Create(PrimaryPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
        CFrame = CFrame.lookAt(Position, (Vector3.new(a2.X, Position.Y, a2.Z))),
    }):Play()
    Shaker:Shake({0.5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = a2})
end

function v1:changeState(a2, ...) -- Line: 237 -- types: self: table, a2: string
    self._stateManager:changeState(a2, self, ...)
end

function v1.playAnimation(a1, a2, a3) -- Line: 241 -- types: a1: table, a2: string, a3: number?
    local v1 = a1._animations[a2]
    if v1 then
        return v1:Play(a3)
    end
    warn((("%* is not a valid animation of Frost Spirit"):format(a2)))
    return nil
end

function v1.face(a1, a2, a3) -- Line: 252 -- upvalues: TweenService (val) -- types: a1: table, a2: vector, a3: number
    local Position = a1.Model.PrimaryPart.Position
    local v1 = CFrame.lookAt(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
    TweenService:Create(a1.Model.PrimaryPart, TweenInfo.new(a3 or 0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = v1}):Play()
    return v1
end

function v1.getCurrentStateName(a1) -- Line: 270
    return a1._stateManager.currentState.name
end

return v1