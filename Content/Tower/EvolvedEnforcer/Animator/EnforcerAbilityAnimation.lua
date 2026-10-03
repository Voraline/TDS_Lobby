-- Script path: ReplicatedStorage.Content.Tower.EvolvedEnforcer.Animator.EnforcerAbilityAnimation
-- Decompile time: 9.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local BSpline = require(ReplicatedStorage.Shared.Modules.BSpline)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local FractalitySpring = require(ReplicatedStorage.Packages.FractalitySpring)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Sounds = require(script.Parent.Sounds)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local EvolvedEnforcer = ReplicatedStorage.Assets.ExtraTowerModels.EvolvedEnforcer
local u48 = Random.new()
local u52 = NumberRange.new(-0.6108652381980153, 0.6108652381980153)
local u56 = NumberRange.new(-0.7853981633974483, 0.7853981633974483)
local u57 = {}
u57.__index = u57

local function createFlightPath(a1) -- Line: 38
    -- upvalues: u48 (val), u52 (val), u56 (val), BSpline (val)
    local v1 = Vector3.new(a1.dropoffPos.X - a1.pickupPos.X, 0, a1.dropoffPos.Z - a1.pickupPos.Z)
    local Magnitude = v1.Magnitude
    local Unit = if not (0.001 < v1.Magnitude) then Vector3.new(1, 0, 0) else v1.Unit
    local v2 = a1.pickupPos + Vector3.new(0, 7, 0)
    local v3 = a1.dropoffPos + Vector3.new(0, 7, 0)
    local v4 = v2.Y + 18
    local v5 = v3.Y + 18
    local fromAxisAngle = CFrame.fromAxisAngle
    local v6 = u48
    local Min = u52.Min
    local Max = u52.Max
    local v7 = (fromAxisAngle(Vector3.new(0, 1, 0), v6:NextNumber(Min, Max))):VectorToWorldSpace(-Unit)
    local fromAxisAngle_2 = CFrame.fromAxisAngle
    local v8 = u48
    local Min_2 = u56.Min
    local Max_2 = u56.Max
    local v9 = (fromAxisAngle_2(Vector3.new(0, 1, 0), v8:NextNumber(Min_2, Max_2))):VectorToWorldSpace(Unit)
    v6 = v2 + v7 * a1.approachDistance
    v6 = Vector3.new(v6.X, v4, v6.Z)
    v8 = v3 + v9 * a1.exitDistance
    v8 = Vector3.new(v8.X, v5, v8.Z)
    local v10 = v2.Y + (v4 - v2.Y) * 0.8
    local v11 = v3.Y + (v5 - v3.Y) * 0.8
    local v12 = v6:Lerp(v2, 0.85)
    v12 = Vector3.new(v12.X, v10, v12.Z)
    local v13 = v3:Lerp(v8, 0.15)
    v13 = Vector3.new(v13.X, v11, v13.Z)
    local v14 = math.min(Magnitude * 0.15, 11.700000000000001)
    local new = BSpline.new
    local v15 = {}
    local v16 = (v2:Lerp(v3, 0.15)) + Vector3.new(0, 1, 0) * v14
    local v17 = (v2:Lerp(v3, 0.85)) + Vector3.new(0, 1, 0) * v14
    v15[1] = v6
    v15[2] = v12
    v15[3] = v2
    v15[4] = v2
    v15[5] = v2
    v15[6] = v16
    v15[7] = v17
    v15[8] = v3
    v15[9] = v3
    v15[10] = v3
    v15[11] = v13
    v15[12] = v8
    return new(v15, 3, 96)
end

local function createHelicopterModel(a1) -- Line: 89 -- upvalues: EvolvedEnforcer (val) -- types: a1: string
    local v1 = (EvolvedEnforcer:FindFirstChild(a1) or EvolvedEnforcer.Default):Clone()
    v1.Parent = workspace.CurrentCamera
    return v1
end

local function createSounds(a1) -- Line: 96 -- upvalues: Sounds (val), EasySound (val) -- types: a1: userdata
    local Create, Default, v1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    local v5 = a1
    for i, j in Sounds.Helicopter, v3, v4 do
        Default = j[v5.Name] or j.Default
        if Default then
            Create = EasySound.Create
            v1 = {
                audioGroup = "Towers",
                timeScaled = true,
                id = Default,
                parent = v5.PrimaryPart,
                name = i,
                looped = i == "FlightLoop",
            }
            v2[i] = (Create(v1))
        end
    end
    return v2
end

function u57.new(a1) -- Line: 114
    -- upvalues: u57 (val), Maid (val), createFlightPath (val), FractalitySpring (val)
    local u4 = setmetatable({}, u57)
    u4._params = a1
    u4._animationMaid = Maid.new()
    u4._startPivot = a1.towerModel:GetPivot()
    u4._towerRotation = u4._startPivot.Rotation
    u4._destinationPivot = (CFrame.new(a1.dropoffPos)) * u4._towerRotation
    u4._flightPath = createFlightPath(a1)
    local v1 = u4._flightPath:SolveLength()
    local v2 = v1 * u4._flightPath:GetUniformProgress(0.2222222222222222)
    local v3 = v1 * u4._flightPath:GetUniformProgress(0.7777777777777778)
    u4._approachDuration = v2 / a1.helicopterSpeed
    u4._transportDuration = math.max((v3 - v2) / (a1.helicopterSpeed * a1.transportSpeedMultiplier), a1.minTransportDuration)
    u4._exitDuration = (v1 - v3) / a1.helicopterSpeed
    u4._animationProgress = 0
    u4._hookProgress = 0
    u4._noiseClock = 0
    u4._lastPathPosition = nil
    u4._lastFlatDirection = nil
    u4._helicopterPositioned = false
    u4._carryingTower = false
    u4._landed = false
    u4._destroyed = false
    u4._animationThread = nil
    u4._helicopterSpring = FractalitySpring.new(1, 3, CFrame.identity, CFrame.identity)
    u4._towerSpring = FractalitySpring.new(1, 2.5, u4._startPivot, u4._startPivot)
    u4:_setupHelicopter()
    u4._animationMaid:Mark(u4._flightPath)
    u4._animationMaid:Mark((a1.towerModel.Destroying:Connect(function() -- Line: 150 -- upvalues: u4 (val)
        u4:destroy()
    end)))
    return u4
end

function u57:_setupHelicopter() -- Line: 157 -- upvalues: EvolvedEnforcer (val), createSounds (val), EasySound (val)
    local u14 = (EvolvedEnforcer:FindFirstChild(self._params.skinName) or EvolvedEnforcer.Default):Clone()
    u14.Parent = workspace.CurrentCamera
    self._model = u14
    self._hookMotor = u14.Hook.HookMotor6D
    self._hookMotorInitialC0 = self._hookMotor.C0
    self._hookAttachmentOffset = u14:GetAttribute("HookAttachmentOffset") or Vector3.new(0, 0, 0)
    self._audioPlayers = createSounds(u14)
    self._flightTrack = u14.AnimationController.Animator:LoadAnimation(u14.Animations.Fly)
    self._flightTrack.Looped = true
    self._flightTrack.Priority = Enum.AnimationPriority.Movement
    self._flightTrack:Play(0.2)
    self._animationMaid:Mark(function() -- Line: 170 -- upvalues: self (val), EasySound (upval), u14 (val)
        self._flightTrack:Stop(0.1)
        self._flightTrack:Destroy()
        for i, j in self._audioPlayers do
            j:Stop()
            EasySound.Destroy(j)
        end
        u14:Destroy()
    end)
end

function u57:playSound(a2) -- Line: 181 -- types: self: table, a2: string
    local v1 = self._audioPlayers[a2]
    v1.TimePosition = 0
    v1:Play()
end

function u57:_stepPath() -- Line: 187
    local v1
    local v2 = self._flightPath:SolvePosition(self._animationProgress)
    local v3 = self._lastPathPosition ~= nil
    local v4 = Vector3.new((if not self._lastPathPosition then Vector3.new(0, 0, 0) else v2 - self._lastPathPosition).X, 0, v1.Z)
    local v5 = self._flightPath:SolveTangent(self._animationProgress)
    local v6 = Vector3.new(v5.X, 0, v5.Z)
    local Unit = if not (0.01 < v4.Magnitude) then if not self._lastFlatDirection then if not (1e-05 < v6.Magnitude) then Vector3.new(0, 0, 1) else v6.Unit else self._lastFlatDirection else v4.Unit
    self._hadPathPosition = v3
    self._pathPosition = v2
    self._pathDelta = v1
    self._pathDirection = Unit
    self._lastPathPosition = v2
    self._lastFlatDirection = Unit
end

function u57:_stepHelicopter(a2) -- Line: 210 -- types: self: table, a2: number
    local v1 = if not self._hadPathPosition then 0 else math.clamp(1 - self._pathDelta.Magnitude / 0.5, 0, 1)
    self._noiseClock = self._noiseClock + a2 * 0.9
    local _pathPosition = self._pathPosition
    local v2 = CFrame.lookAt(Vector3.new(0, 0, 0), self._pathDirection, (Vector3.new(0, 1, 0)))
    local v3 = v2:VectorToObjectSpace(self._pathDelta)
    local v4 = math.clamp(math.max(0, -v3.Z) * 2.5 - v3.Y * 0.5 * 2.5, -0.20943951023931956, 0.20943951023931956)
    local v5 = math.clamp(v3.X * 2.5, -0.20943951023931956, 0.20943951023931956)
    local v6 = v2.Rotation * CFrame.Angles(-v4, 0, -v5)
    if not self._helicopterPositioned then
        self._helicopterPositioned = true
        self._helicopterSpring:setPosition(v6)
    end
    self._helicopterSpring:setGoal(v6)
    self._helicopterCFrame = (CFrame.new(_pathPosition + Vector3.new(math.noise(self._noiseClock, 0, 0), math.noise(0, self._noiseClock, 31), (math.noise(47, 0, self._noiseClock))) * 0.45 * v1)) * self._helicopterSpring:step(a2).Rotation
    self._model:PivotTo(self._helicopterCFrame)
end

function u57:_stepTower(a2) -- Line: 243 -- types: self: table, a2: number
    local _hookProgress
    local towerModel = self._params.towerModel
    if not towerModel.Parent then
        return
    end
    if self._carryingTower then
        self._towerSpring:setGoal((CFrame.new(self._helicopterCFrame.Position + Vector3.new(-0, -7, -0))) * self._towerRotation)
        towerModel:PivotTo((self._towerSpring:step(a2)))
    end
    if (if not self._carryingTower then self._hookProgress else 1) <= 0 then
        return
    end
    local Part0 = self._hookMotor.Part0
    local Transform = self._hookMotor.Transform
    local Rotation = (Part0.CFrame * self._hookMotorInitialC0 * Transform * (self._hookMotor.C1:Inverse())).Rotation
    local v1 = self._helicopterCFrame:VectorToWorldSpace(self._hookAttachmentOffset)
    local v2 = (Part0.CFrame:ToObjectSpace((CFrame.new((towerModel:GetPivot()).Position + v1)) * Rotation)) * self._hookMotor.C1 * Transform:Inverse()
    local v3 = _hookProgress * _hookProgress * (3 - 2 * _hookProgress)
    self._hookMotor.C0 = self._hookMotorInitialC0:Lerp(v2, v3)
end

function u57:_stepAnimation(a2) -- Line: 281 -- types: self: table, a2: number
    self:_stepPath()
    self:_stepHelicopter(a2)
    self:_stepTower(a2)
end

function u57:_advanceAnimation(a2, a3, a4) -- Line: 287
    -- upvalues: RunService (val), TimescaleUtilities (val)
    local v1, v2
    local _animationProgress = self._animationProgress
    local v3 = 0
    local v4 = a3
    repeat
        v1 = (RunService.RenderStepped:Wait()) / TimescaleUtilities.GetScaledTime(1)
        v3 = math.min(v3 + v1, v4)
        v2 = if not (v4 > 0) then 1 else v3 / v4
        v5._animationProgress = _animationProgress + (v6 - _animationProgress) * v2
        v5:_stepAnimation(v1)
    until v4 <= v3
end

function u57:_advanceHook(a2, a3) -- Line: 304
    -- upvalues: RunService (val), TimescaleUtilities (val), TweenService (val)
    local InOut, Sine, Value, v1, v2
    local _hookProgress = self._hookProgress
    local v3 = 0
    local v4 = a3
    repeat
        v1 = (RunService.RenderStepped:Wait()) / TimescaleUtilities.GetScaledTime(1)
        v3 = math.min(v3 + v1, v4)
        v2 = TweenService
        Sine = Enum.EasingStyle.Sine
        InOut = Enum.EasingDirection.InOut
        Value = v2:GetValue(if not (v4 > 0) then 1 else v3 / v4, Sine, InOut)
        v5._hookProgress = _hookProgress + (v6 - _hookProgress) * Value
        v5:_stepAnimation(v1)
    until v4 <= v3
end

function u57._run(a1) -- Line: 319
    a1:_stepAnimation(0)
    a1:playSound("FlightLoop")
    a1:_advanceAnimation(0.2222222222222222, a1._approachDuration)
    a1:playSound("RopeDrop")
    a1:_advanceHook(1, a1._params.hoverDuration)
    a1:playSound("TowerPickUp")
    a1._carryingTower = true
    a1:_advanceAnimation(0.7777777777777778, a1._transportDuration)
    a1._carryingTower = false
    a1._params.towerModel:PivotTo(a1._destinationPivot)
    a1._landed = true
    a1:playSound("TowerDropOff")
    a1:_advanceHook(0, a1._params.hoverDuration)
    a1:_advanceAnimation(1, a1._exitDuration)
end

function u57.play(a1) -- Line: 341
    a1._animationThread = coroutine.create(function() -- Line: 342 -- upvalues: a1 (val)
        local success, result = pcall(a1._run, a1)
        if not success then
            warn("[EvolvedEnforcer.EnforcerAbilityAnimation] Animation failed", result)
        end
        a1:destroy()
    end)
    task.spawn(a1._animationThread)
end

function u57:cancel() -- Line: 352
    local _animationThread = self._animationThread
    if _animationThread
        and _animationThread ~= coroutine.running()
        and coroutine.status(_animationThread) ~= "dead" then
        task.cancel(_animationThread)
    end
end

function u57:destroy() -- Line: 363
    if self._destroyed then
        return
    end
    self._destroyed = true
    self:cancel()
    local towerModel = self._params.towerModel
    if not self._landed and towerModel.Parent then
        towerModel:PivotTo(self._startPivot)
    end
    if self._hookMotor.Parent then
        self._hookMotor.C0 = self._hookMotorInitialC0
    end
    self._animationMaid:Sweep()
end

return u57