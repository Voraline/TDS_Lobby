-- Script path: ReplicatedStorage.Content.Tower.Ace Pilot.Animator
-- Decompile time: 13.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local OverideSkins = require(script.OverideSkins)
local SkinEffects = require(script.SkinEffects)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local v1 = {}
v1.__index = v1
local u71 = {"DoorLeft", "DoorRight"}

local function figure8(a1, a2, a3) -- Line: 43 -- upvalues: math (val)
    return a1 * math.cos(a3) / (1 + math.sin(a3) ^ 2), a2 * math.sin(a3) * math.cos(a3) / (1 + math.sin(a3) ^ 2)
end

local function giveShake(a1) -- Line: 49 -- upvalues: math (val) -- types: a1: number
    return math.sin(a1 * 3) / 2 * 5, math.cos(a1 * 3) * 5
end

local u76 = {}

function u76.Default(a1) -- Line: 56 -- upvalues: math (val)
    local _rotationValue = a1._rotationValue
    local _height = a1._height
    local _flightRange = a1._flightRange
    local _overRide = a1._overRide or a1.Replicator:Get("CurrentMode") or "Default"
    a1._cfs = {}
    a1._parts = {}
    if a1.Model.Weapon:FindFirstChild("Propeller") then
        local Motor = a1.Model.Weapon.Propeller.Motor
        Motor.Transform = Motor.Transform * CFrame.Angles(0, 0, math.rad(-1800 * a1._delta))
    end
    if _overRide ~= "Default" and a1.allowed ~= false then
        local v1 = a1:_getTime()
        local SplineFromT, SplineFromT_2 = a1._spline:GetSplineFromT(v1)
        local v2 = SplineFromT:SolveUniformAcceleration(SplineFromT_2)
        local v3 = SplineFromT:SolveUniformCFrame(SplineFromT_2)
        local v4 = -v3:VectorToObjectSpace(v2).X * 100
        if v1 <= 0.05 or v1 >= 0.98 then
            v4 = -0.3
        end
        return v3 * CFrame.Angles(0, 0, v4)
    end
    return a1.Model.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(-_rotationValue), 0) * ((CFrame.new(0, 0, -_flightRange)) + _height * 1.5) * CFrame.Angles(math.rad(12), math.rad(-90), 0)
end

function v1:_overideName() -- Line: 96 -- upvalues: OverideSkins (val)
    return OverideSkins[self.Model.Name] or self.Model.Name
end

function v1:_shootSound(a2) -- Line: 100 -- upvalues: SoundPool (val), GameState (val)
    local Fire = a2:FindFirstChild("Fire")
    if Fire and Fire:IsA("Sound") then
        local v1 = string.match(Fire.SoundId or "", "%d+")
        local v2 = v1 and tonumber(v1)
        if not v2 then
            return
        end
        local _fireSoundPools = self._fireSoundPools or {}
        self._fireSoundPools = _fireSoundPools
        local v3 = self._fireSoundPools[a2]
        if not v3 then
            v3 = SoundPool.new({
                size = 6,
                audioGroup = "Towers",
                id = v2,
                parent = a2.Parent,
                volume = Fire.Volume,
            })
            self._fireSoundPools[a2] = v3
        end
        v3:play({
            playbackSpeed = (1 + Random.new():NextNumber(-0.2, 0.2)) * GameState.TimeScale,
            volume = Fire.Volume,
        })
        return
    end
end

function v1:_getTime() -- Line: 131
    local v1 = self._spline:SolveLength() / 9.3
    return self._elaspedTime % v1 / v1
end

function v1:_getProjectile() -- Line: 138 -- upvalues: math (val), TimescaleUtilities (val)
    local v1
    if self.Model.Weapon:FindFirstChild("Bombs") then
        local u24 = (self.Model.Weapon.Bombs:GetChildren())[math.random(1, #self.Model.Weapon.Bombs:GetChildren())]
        u24.Transparency = 1
        local v2 = u24:Clone()
        v2.Transparency = 0
        v2.Anchored = true
        TimescaleUtilities.Delay(1, function() -- Line: 148 -- upvalues: u24 (val)
            u24.Transparency = 0
        end)
        return v2, v2.Position
    end
    if not self.Model.Weapon:FindFirstChild("DropBomb") then
        v1 = self._currentProjectile:Clone()
        v1.Transparency = 0
        return v1
    end
    self.Model.Weapon.DropBomb.Transparency = 1
    v1 = self.Model.Weapon.DropBomb:Clone()
    v1.Transparency = 0
    v1.Anchored = true
    TimescaleUtilities.Delay(1, function() -- Line: 159 -- upvalues: self (val)
        self.Model.Weapon.DropBomb.Transparency = 0
    end)
    return v1
end

function v1:_toggleDoors(a2) -- Line: 171
    -- upvalues: u71 (val), TweenService (val), math (val)
    local Angles, Motor, Transform, v1, v2, v3, v4
    local v5 = nil
    local v6 = nil
    local v7, v8 = self, a2
    for i, j in u71, v5, v6 do
        if v7.Model.Weapon:FindFirstChild(j) then
            Motor = v7.Model.Weapon[j].Motor
            v4 = 1
            if j == "DoorLeft" then
                v4 = -1
            end
            v1 = TweenInfo.new(0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
            v2 = {}
            Transform = Motor.Transform
            Angles = CFrame.Angles
            v3 = if not v8 then -1 else 1
            v2.Transform = Transform * Angles(0, 0, (math.rad(v4 * 90)) * v3)
            TweenService:Create(Motor, v1, v2):Play()
        end
    end
end

function v1:_fireEnded(a2) -- Line: 191 -- upvalues: SkinEffects (val) -- types: self: table, a2: number
    if SkinEffects.EXTRA_FIRE_END_SOUNDS[self:_overideName()]
        and SkinEffects.EXTRA_FIRE_END_SOUNDS[self:_overideName()][self:GetLevel()] then
        SkinEffects.EXTRA_FIRE_END_SOUNDS[self:_overideName()][self:GetLevel()](self, a2)
    end
end

function v1:_fireEffect(a2, a3) -- Line: 200 -- upvalues: SkinEffects (val)
    local Attribute
    if not SkinEffects.SHOOT_SOUNDS[self:_overideName()]
        or not SkinEffects.SHOOT_SOUNDS[self:_overideName()][self:GetLevel()] then
        self:_shootSound(a2)
    else
        SkinEffects.SHOOT_SOUNDS[self:_overideName()][self:GetLevel()](self, a2)
    end
    self:Bullet({Start = a2.WorldPosition, End = a3, Spread = 50, Speed = 140})
    for i, j in a2:GetChildren() do
        if j:IsA("ParticleEmitter") then
            Attribute = j:GetAttribute("EmitCount")
            j:Emit(Attribute or 1)
        end
    end
end

function v1:_fire(a2) -- Line: 224
    self._fireNum = self._fireNum + 1
    if self._limit < self._fireNum then
        self._fireNum = 1
    end
    self:_fireEffect(self.Model.Weapon.Main[("Gun-Shoot%*"):format(self._fireNum)], a2.PrimaryPart.Position)
    self:Delay(self.State.Cooldown)
end

function v1:_bomb(a2) -- Line: 238
    -- upvalues: EasySound (val), GameState (val), ItemDrop (val), EffectsController (val), TimescaleUtilities (val)
    self:_toggleDoors(true)
    local u8, v1 = self:_getProjectile()
    if v1 then
        a2.startPosition = u8.Position
    end
    local v2 = self.Model.Weapon.Main:FindFirstChild("Bomb Drop")
    if v2 and v2:IsA("Sound") then
        local v3 = string.match(v2.SoundId or "", "%d+")
        local v4 = v3 and tonumber(v3)
        if v4 then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                id = v4,
                parent = self.Model.Weapon.Main,
                volume = v2.Volume,
                playbackSpeed = (1 + Random.new():NextNumber(-0.1, 0.1)) * GameState.TimeScale,
            })
        end
    end
    u8:PivotTo((CFrame.new(a2.startPosition)))
    u8.Parent = workspace
    ;(ItemDrop.Drop(a2.startPosition, a2.endPosition, u8, a2.dtMultiplier, a2.gravity, a2.velocity, function(a1, a2, a3) -- Line: 271
        return CFrame.new(a3, a2).Rotation
    end)):andThen(function() -- Line: 277
        -- upvalues: u8 (val), EffectsController (upval), a2 (val), TimescaleUtilities (upval), self (val)
        u8:Destroy()
        EffectsController.Explosion({Position = a2.endPosition, Radius = a2.raidus})
        TimescaleUtilities.Delay(1, function() -- Line: 284 -- upvalues: self (upval)
            if not self.Model.Parent then
                return
            end
            self:_toggleDoors(false)
        end)
    end)
end

function v1:_transitionMode(a2) -- Line: 293 -- upvalues: RunService (val)
    local function v1() -- Line: 294 -- upvalues: self (val), a2 (val), RunService (upval)
        local v1 = self.Model.FlightPos.Position * Vector3.new(1, 0, 1)
        local v2 = (self._spline:SolveUniformPosition(0)) * Vector3.new(1, 0, 1)
        local Magnitude = (v1 - v2).Magnitude
        while Magnitude > 1 do
            if a2 == self.Replicator:Get("FullyIn") then
                break
            end
            Magnitude = (self.Model.FlightPos.Position * Vector3.new(1, 0, 1) - v2).Magnitude
            RunService.Stepped:Wait()
        end
    end

    self:toggleFigure8(a2 == "Figure8")
    if a2 == "Default" then
        self._overRide = "Figure8"
        v1()
        self._elaspedTime = 1.9
        self._overRide = nil
    end
    if a2 == "Figure8" then
        self.allowed = false
        v1()
        self._elaspedTime = 0
        self.allowed = true
    end
end

function v1:_initializePoints() -- Line: 327 -- upvalues: math (val), figure8 (val), CatRom (val)
    local v1, v2
    if self._spline then
        self._spline:Destroy()
        self._spline = nil
    end
    local v3 = {}
    local v4 = math.pi * 2
    for i = 0, v4, 0.01 do
        v1, v2 = figure8(10, 15, i)
        table.insert(v3, (self.Model:GetPivot()) * CFrame.new(v1, 0, v2) + self._height * 1.5)
    end
    self._spline = CatRom.new(v3, 0.5, 0)
end

function v1:_updateProjectile() -- Line: 342
    local Bomb = self.Model.Weapon:FindFirstChild("Bomb")
    if Bomb then
        self._currentProjectile = Bomb:Clone()
        Bomb:Destroy()
    end
end

function v1.Initialize(a1) -- Line: 350
    -- upvalues: Animation (val), math (val), GameState (val), EasySound (val), RunService (val), u76 (val)
    a1._propRotation = CFrame.new()
    a1._rotationValue = 0
    a1._fireNum = 0
    a1._limit = 0
    a1._speedMultiplier = 1
    a1._targetSpeedMultiplier = 1
    a1._lastElasped = 0
    a1._fireTime = 0
    a1._firing = false
    a1._flightRange = a1.Replicator:Get("FlightRange") / 2
    a1._height = a1.Replicator:Get("Height")
    a1:_initializePoints()
    if a1.FBXModel then
        local Fly = a1.Model.Animations:FindFirstChild("Fly")
        local Animator = a1.Model:FindFirstChildWhichIsA("Animator", true)
        if Fly and Fly:IsA("Animation") and Animator then
            Animation.new({
                IgnorePriority = true,
                IsPersistent = true,
                Target = Animator,
                Track = Fly,
                Entity = {TimeScaled = true},
                Properties = {Looped = true},
            }):Play()
        end
    end

    function a1:_setFlightCFrame(a2) -- Line: 385 -- upvalues: math (upval) -- types: self: table, a2: userdata
        local _elaspedTime = self._elaspedTime
        local v1 = math.sin(_elaspedTime * 3) / 2 * 5
        local v2 = math.cos(_elaspedTime * 3) * 5
        local v3 = a2 * ((CFrame.new(0, v2 / 50, 0)) * CFrame.Angles(math.rad(v1), 0, math.rad(v2)))
        if self._elaspedTime - self._lastElasped < 0 then
            v3 = v3 * CFrame.Angles(0, math.rad(180), 0)
        end
        table.insert(self._cfs, v3)
        table.insert(self._parts, self.Model.FlightPos)
        workspace:BulkMoveTo(self._parts, self._cfs, Enum.BulkMoveMode.FireCFrameChanged)
    end

    a1.Maid:Mark(((GameState.Replicator:GetStateChangedSignal("TimeScale")):Connect(function() -- Line: 398 -- upvalues: a1 (val), GameState (upval)
        if a1._idleLoop and a1._idleLoop.SetPlaybackSpeed then
            a1._idleLoop:SetPlaybackSpeed(1 * GameState.TimeScale)
        end
    end)))

    function a1:_updateLevel(a2) -- Line: 405 -- upvalues: EasySound (upval)
        local Decal, v1
        self._limit = 0
        if self._idleLoop then
            EasySound.Destroy(self._idleLoop)
            self._idleLoop = nil
        end
        local Idle = self.Model.Weapon.Main:FindFirstChild("Idle")
        if Idle and Idle:IsA("Sound") then
            local v2 = string.match(Idle.SoundId or "", "%d+")
            local v3 = v2 and tonumber(v2)
            if v3 then
                self._idleLoop = EasySound.Create({
                    playbackSpeed = 1,
                    looped = true,
                    audioGroup = "Towers",
                    id = v3,
                    parent = self.Model.Weapon.Main,
                    volume = Idle.Volume,
                })
                self._idleLoop:Play()
            end
        end
        local v4 = self
        for i, j in self.Model.Upgrades:GetDescendants() do
            v1 = string.find(j.Name, "Face") and j:IsA("BasePart")
            Decal = v1 and j:FindFirstChildWhichIsA("Decal")
            if v1 and Decal then
                if j:GetAttribute("Level") ~= v5 then
                    Decal.Transparency = 1
                else
                    Decal.Transparency = 0
                end
            end
        end
        for k, n in v4.Model.Weapon.Main:GetDescendants() do
            if string.find(string.lower(n.Name), "gun-") and n:IsA("Attachment") then
                v4._limit = v4._limit + 1
            end
            if n:IsA("Light") or n:IsA("ParticleEmitter") and n.Parent.Name == "Effect" then
                n.Enabled = true
            end
        end
        v4:_updateProjectile()
    end

    a1.OnUpgrade:Connect(function() -- Line: 453 -- upvalues: a1 (val)
        if a1._fireSoundPools then
            for i, j in a1._fireSoundPools do
                j:destroy()
            end
            for k in a1._fireSoundPools do
                a1._fireSoundPools[k] = nil
            end
        end
        a1:_updateLevel((a1:GetLevel()))
    end)
    a1:_updateLevel((a1:GetLevel()))
    local v1 = a1.Replicator:Get("SpawnTime")
    a1._elaspedTime = 0 + (workspace:GetServerTimeNow() - v1) * GameState.TimeScale
    a1.Maid:Mark((RunService.Stepped:Connect(function(a1_2, a2) -- Line: 472 -- upvalues: a1 (val), GameState (upval), math (upval), u76 (upval)
        local v1
        local v2 = a2 * (a1._speedMultiplier * GameState.TimeScale)
        a1._delta = v2
        if not a1.Replicator:Get("Reversed") then
            v1 = a1
            v1._elaspedTime = v1._elaspedTime + v2
        else
            v1 = a1
            v1._elaspedTime = v1._elaspedTime - v2
        end
        a1._speedMultiplier = math.lerp(a1._speedMultiplier, a1._targetSpeedMultiplier, 1.5 * v2)
        a1._rotationValue = a1._elaspedTime * 45 % 360
        a1:_setFlightCFrame(if not u76[a1.Model.Name] then u76.Default(a1) else u76[a1.Model.Name](a1))
        a1._lastCFrame = v1
        a1._lastElasped = a1._elaspedTime
    end)))
    ;(a1.Replicator:GetStateChangedSignal("currentElasped")):Connect(function() -- Line: 497 -- upvalues: a1 (val), math (upval), GameState (upval)
        task.defer(function() -- Line: 498 -- upvalues: a1 (upval), math (upval), GameState (upval)
            local v1 = a1.Replicator:Get("currentElasped")
            if 0.2 < (math.abs(v1 - a1._elaspedTime)) then
                a1._elaspedTime = v1 + ((workspace:GetServerTimeNow()) - a1.Replicator:Get("started")) * GameState.TimeScale
            end
        end)
    end)
    ;(a1.Replicator:GetStateChangedSignal("SpeedMultiplier")):Connect(function() -- Line: 510 -- upvalues: a1 (val)
        a1._targetSpeedMultiplier = a1.Replicator:Get("SpeedMultiplier")
    end)
    a1._targetSpeedMultiplier = a1.Replicator:Get("SpeedMultiplier")
    a1.Executables = {
        Bomb = function(a1_2) -- Line: 517 -- upvalues: a1 (val)
            a1:_bomb(a1_2)
        end,
    }
    ;(a1.Replicator:GetStateChangedSignal("CurrentMode")):Connect(function() -- Line: 522 -- upvalues: a1 (val)
        if a1._thread then
            task.cancel(a1._thread)
        end
        a1._thread = task.spawn(function() -- Line: 526 -- upvalues: a1 (upval)
            a1:_transitionMode((a1.Replicator:Get("CurrentMode")))
        end)
    end)
    ;(a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 531 -- upvalues: a1 (val)
        a1:_initializePoints()
    end)
    a1:Thread(function() -- Line: 535 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if not v1 then
            if a1._firing then
                a1._firing = false
                a1:_fireEnded(tick() - a1._fireTime)
            end
            return
        end
        if not a1._firing then
            a1._firing = true
            a1._fireTime = tick()
        end
        a1:_fire(v1)
    end)
end

function v1.PreviewPlacement(a1, a2) -- Line: 554
    -- upvalues: RunService (val), math (val), GameState (val)
    local u2 = 0
    local u4 = CFrame.new()
    if a2.model.Weapon:FindFirstChild("Bomb") then
        a2.model.Weapon.Bomb:Destroy()
    end
    a2.maid:Mark((RunService.Stepped:Connect(function(a1, a2_2) -- Line: 563 -- upvalues: u2 (ref), math (upval), GameState (upval), u4 (ref), a2 (val)
        local v1 = u2
        local v2 = math.sin(v1 * 3) / 2 * 5
        local v3 = math.cos(v1 * 3) * 5
        v1 = {}
        local v4 = {}
        local v5 = a2_2 * GameState.TimeScale
        u2 = u2 + v5
        local v6 = u2 * 45 % 360
        u4 = u4 * CFrame.Angles(0, 0, math.rad(-1800 * v5))
        if a2.model.Weapon:FindFirstChild("Propeller") then
            local Motor = a2.model.Weapon.Propeller.Motor
            Motor.Transform = Motor.Transform * CFrame.Angles(0, 0, math.rad(1440 * v5))
        end
        table.insert(
            v1,
            (CFrame.new(a2.model.PrimaryPart.Position)) * CFrame.Angles(0, math.rad(-v6), 0) * ((CFrame.new(0, 0, -10)) + Vector3.new(0, 9, 0)) * CFrame.Angles(math.rad(12), math.rad(-90), 0) * CFrame.Angles(math.rad(v2), 0, math.rad(v3))
        )
        table.insert(v4, a2.model.FlightPos)
        workspace:BulkMoveTo(v4, v1, Enum.BulkMoveMode.FireCFrameChanged)
    end)))
end

function v1.Remove(a1) -- Line: 598 -- upvalues: EasySound (val)
    a1._spline:Destroy()
    if a1._idleLoop then
        EasySound.Destroy(a1._idleLoop)
        a1._idleLoop = nil
    end
    if a1._fireSoundPools then
        for i, j in a1._fireSoundPools do
            j:destroy()
        end
        a1._fireSoundPools = nil
    end
end

return v1