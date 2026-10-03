-- Script path: ReplicatedStorage.Content.Tower.Pulse Trooper.Animator
-- Decompile time: 6.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Shared = ReplicatedStorage.Shared
local Client = ReplicatedStorage.Client
local EasySound = require(Shared.Modules.EasySound)
local EmitterManager = require(Shared.Modules.EmitterManager)
local GameState = require(Shared.Modules.GameState)
local ServerTicks = require(Shared.Modules.ServerTicks)
local TweenService = require(Client.Modules.TweenService)
local Effects = require(script.Effects)
local Sounds = require(script.Sounds)
local v1 = {}
v1.__index = v1

local function getWeaponConfig(a1) -- Line: 23 -- types: a1: userdata
    local Weapon = a1:FindFirstChild("Weapon")
    return Weapon and Weapon:FindFirstChildWhichIsA("Configuration", true)
end

local function getSweeperProgress(a1, a2) -- Line: 28 -- upvalues: TweenService (val) -- types: a1: number, a2: number
    return TweenService:GetValue(a1 / a2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) * 6.283185307179586
end

function v1.Initialize(a1) -- Line: 36 -- upvalues: ServerTicks (val)
    a1._crystal = nil
    a1._sweeperLaserBeams = nil
    a1._sweeperLaserBeamsClosing = false
    a1._sweeperBone = nil
    a1._sweeperSpinConnection = nil
    a1._sweeperTrack = nil
    a1:_initSounds()
    a1:_playSound("Idle")
    a1:_updateCrystalVFX()
    a1.Maid:Mark((a1.OnUpgrade:Connect(function() -- Line: 48 -- upvalues: a1 (val)
        a1:_updateCrystalVFX()
    end)))
    a1.Maid:Mark(function() -- Line: 52 -- upvalues: a1 (val)
        a1._sweeperLaserBeams = nil
        a1._sweeperLaserBeamsClosing = false
        if a1._sweeperTrack then
            a1._sweeperTrack:Stop()
        end
        if a1._sweeperBone then
            a1._sweeperBone.Transform = CFrame.identity
        end
    end)
    a1.Executables = {
        Pulse = function() -- Line: 66 -- upvalues: a1 (val)
            a1:_playPulse()
        end,
        ActivateSweeper = function(a1_2) -- Line: 69 -- upvalues: ServerTicks (upval), a1 (val) -- types: a1_2: number
            if a1_2 <= ServerTicks.getTime() then
                return
            end
            a1:_playSweeper()
        end,
    }
end

function v1:_updateCrystalVFX() -- Line: 79 -- upvalues: EmitterManager (val)
    local v1 = self:_getWeaponConfigValue("CrystalVFX", true)
    if self._crystal == v1 then
        return
    end
    if self._crystal then
        EmitterManager.toggle(self._crystal, false)
    end
    self._crystal = v1
    EmitterManager.toggle(self._crystal, true)
end

function v1:_startSweeperSpin(a2, a3) -- Line: 93
    -- upvalues: RunService (val), GameState (val), TweenService (val)
    local SweeperDuration = self.Stats.Attributes.SweeperDuration
    local u6 = 0
    local v1 = RunService.PreSimulation:Connect(function(a1) -- Line: 96
        -- upvalues: u6 (ref), GameState (upval), SweeperDuration (val), a2 (val), TweenService (upval), a3 (val)
        u6 = math.min(u6 + a1 * GameState.TimeScale, SweeperDuration)
        local v1 = a2
        local Angles = CFrame.Angles
        local v2 = u6 / SweeperDuration
        v1.Transform = Angles(0, TweenService:GetValue(v2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut) * 6.283185307179586, 0)
        for i, j in a3 do
            j.update()
        end
    end)
    self._sweeperBone = a2
    self._sweeperSpinConnection = v1
    self.Maid:Mark(v1)
end

function v1:_stopSweeperSpin() -- Line: 110
    local _sweeperSpinConnection = self._sweeperSpinConnection
    self._sweeperSpinConnection = nil
    if _sweeperSpinConnection then
        self.Maid:Unmark(_sweeperSpinConnection)
        _sweeperSpinConnection:Disconnect()
    end
    if self._sweeperBone then
        self._sweeperBone.Transform = CFrame.identity
        self._sweeperBone = nil
    end
end

function v1:_closeSweeperLaserBeams(a2) -- Line: 125
    if self._sweeperLaserBeams == a2 and not self._sweeperLaserBeamsClosing then
        self._sweeperLaserBeamsClosing = true
        for i, j in a2 do
            j.close()
        end
        return
    end
end

function v1:_playSweeper() -- Line: 136 -- upvalues: GameState (val), Effects (val)
    if self._sweeperLaserBeams then
        return
    end
    local SweeperDuration = self.Stats.Attributes.SweeperDuration
    local v1 = self:_getWeaponConfigValue("BarrelBone", true)
    local Left = v1:FindFirstChild("Left")
    local Right = v1:FindFirstChild("Right")
    local v2 = GameState.getPath(self.Team, 1)
    local Scalar = v2:GetScalar(0)
    local v3 = (v2:GetScalar(v2.PathDistance) - Scalar).Magnitude + 10

    local function createLaserBeamHandler(a1, a2) -- Line: 150
        -- upvalues: Effects (upval), self (val)
        local v1 = Effects.createLaserBeamHandler({
            openTime = 1,
            closeTime = 1,
            attachment = a1,
            length = a2,
            parent = workspace.Trash,
        })
        self.Maid:Mark(v1)
        v1.open()
        return v1
    end

    local u35 = {}
    u35[1] = (createLaserBeamHandler(Left, -v3))
    u35[2] = (createLaserBeamHandler(Right, v3))
    self._sweeperLaserBeams = u35
    self._sweeperLaserBeamsClosing = false
    self._sweeperTrack = self:_playAnimation("Sweep", Enum.AnimationPriority.Action)
    self:_startSweeperSpin(v1, u35)
    self:_playSound("Sweeper")
    for i, j in u35 do
        self:Delay(math.max(0, SweeperDuration - j.particleLifetime), function() -- Line: 176 -- upvalues: self (val), u35 (val), j (val)
            if self._sweeperLaserBeams == u35 then
                j.disableParticles()
            end
        end)
    end
    self:Delay(SweeperDuration - 1, function() -- Line: 183 -- upvalues: self (val), u35 (val)
        self:_closeSweeperLaserBeams(u35)
        self:_fadeOutSound("Sweeper", 1)
    end)
    self:Delay(SweeperDuration, function() -- Line: 187 -- upvalues: self (val), u35 (val)
        if self._sweeperLaserBeams == u35 then
            self:_stopSweeper()
        end
    end)
end

function v1:_stopSweeper() -- Line: 194
    local _sweeperLaserBeams = self._sweeperLaserBeams
    if self._sweeperTrack then
        self._sweeperTrack:Stop()
        self._sweeperTrack = nil
    end
    if not _sweeperLaserBeams then
        self:_stopSweeperSpin()
        return
    end
    self:_closeSweeperLaserBeams(_sweeperLaserBeams)
    self:_stopSweeperSpin()
    self:_stopSound("Sweeper")
    local v1 = 0
    for i, j in _sweeperLaserBeams do
        v1 = math.max(v1, (j.finish()))
    end
    task.delay(v1, function() -- Line: 217 -- upvalues: self (val), _sweeperLaserBeams (val)
        if self._sweeperLaserBeams ~= _sweeperLaserBeams then
            return
        end
        for i, j in _sweeperLaserBeams do
            self.Maid:Unmark(j)
            j.destroy()
        end
        self._sweeperLaserBeams = nil
        self._sweeperLaserBeamsClosing = false
    end)
end

function v1:_playPulse() -- Line: 232 -- upvalues: Effects (val)
    self:_playAnimation("Attack", Enum.AnimationPriority.Action)
    self:_playSound("Pulse")
    local v1 = self:_getWeaponConfigValue("CrystalVFX", true)
    local HeightOffset = self.Model.PrimaryPart:FindFirstChild("HeightOffset")
    Effects.emitPulse({
        impactSize = 5,
        range = self:GetRange(),
        pulseSpeed = self.Stats.Attributes.PulseSpeed * (1 + self:GetBuffCount("Cooldown") / 100),
        crystalAttachment = v1,
        heightAttachment = HeightOffset,
        parent = workspace.Trash,
        maid = self.Maid,
    })
end

function v1:_playSound(a2) -- Line: 251 -- upvalues: GameState (val) -- types: self: table, a2: string
    local v1 = self._sounds[a2]
    if not v1 then
        return
    end
    local v2 = Random.new():NextNumber(0.85, 1.15)
    v1:SetAttribute("PlaybackSpeed", v2)
    v1.PlaybackSpeed = v2 * GameState.TimeScale
    v1.Volume = 1
    v1.TimePosition = 0
    v1:Play()
end

function v1:_fadeOutSound(a2, a3) -- Line: 265
    -- upvalues: TweenService (val)
    local v1 = self._sounds[a2]
    if not v1 then
        return
    end
    TweenService:Create(v1, TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Volume = 0}):Play()
end

function v1:_stopSound(a2) -- Line: 278 -- types: self: table, a2: string
    local v1 = self._sounds[a2]
    if v1 then
        v1:Stop()
    end
end

function v1:_initSounds() -- Line: 285 -- upvalues: Sounds (val), EasySound (val)
    local Create, Default, v1, v2, v3
    local PrimaryPart = self.Model.PrimaryPart
    local Name = self.Model.Name
    self._sounds = {}
    local v4 = nil
    local v5 = nil
    for i, j in Sounds, v4, v5 do
        Default = j[Name] or j.Default
        if Default then
            Create = EasySound.Create
            v1 = {
                volume = 1,
                soundGroupName = "Towers",
                timeScaled = true,
                id = Default,
                parent = PrimaryPart,
                name = i,
            }
            v2 = true
            if i ~= "Idle" then
                v2 = i == "Sweeper"
            end
            v1.looped = v2
            v3 = Create(v1)
            if v3 then
                self._sounds[i] = v3
            end
        end
    end
    self.Maid:Mark(function() -- Line: 310 -- upvalues: self (val), EasySound (upval)
        for i, j in self._sounds do
            EasySound.Destroy(j)
        end
    end)
end

function v1:_playAnimation(a2, a3) -- Line: 317 -- types: self: table, a2: string
    local v1 = self:Animate(a2)
    if v1 and a3 then
        v1.Priority = a3
    end
    return v1
end

function v1:_getWeaponConfigValue(a2, a3) -- Line: 329 -- types: self: table, a2: string, a3: boolean?
    local Weapon = self.Model:FindFirstChild("Weapon")
    local v1 = Weapon and Weapon:FindFirstChildWhichIsA("Configuration", true)
    if not v1 then
        return nil
    end
    local v2 = v1:FindFirstChild(a2, a3 == true)
    return v2 and v2.Value
end

return v1