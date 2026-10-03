-- Script path: ReplicatedStorage.Content.Tower.War Machine.Animator
-- Decompile time: 21.94 ms

local ContentProvider = game:GetService("ContentProvider")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sounds = require(script.Parent.Sounds)
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u61 = {}
local v1 = {}
v1.__index = v1

local function getWeaponConfiguration(a1) -- Line: 24 -- types: a1: userdata
    local Weapon = a1:FindFirstChild("Weapon")
    if not Weapon then
        return nil
    end
    local Configuration = Weapon:FindFirstChild("Configuration")
    if not Configuration then
        return nil
    end
    return Configuration
end

local function resolveAttachment(a1, a2) -- Line: 36 -- types: a1: userdata, a2: string
    local Attachments = a1:FindFirstChild("Attachments")
    local v1 = Attachments and Attachments:FindFirstChild(a2)
    if v1 and v1:IsA("ObjectValue") then
        local Value = v1.Value
        if Value and Value:IsA("Attachment") then
            return Value
        end
        return nil
    end
    return nil
end

local function resolveBone(a1, a2) -- Line: 49 -- types: a1: userdata, a2: string
    local Bones = a1:FindFirstChild("Bones")
    local v1 = Bones and Bones:FindFirstChild(a2)
    if v1 and v1:IsA("ObjectValue") then
        local Value = v1.Value
        if Value and Value:IsA("Bone") then
            return Value
        end
        return nil
    end
    return nil
end

function v1:_applyVisuals() -- Line: 62
    self._cachedMinigunBones = nil
    self._cachedMuzzles = nil
    self._cachedRocketMuzzle = nil
end

function v1:_getMuzzles() -- Line: 70 -- upvalues: resolveAttachment (val)
    local v1
    if self._cachedMuzzles then
        return self._cachedMuzzles
    end
    local Weapon = self.Model:FindFirstChild("Weapon")
    if Weapon then
        local Configuration = Weapon:FindFirstChild("Configuration")
        v1 = if Configuration then Configuration else nil
    else
        v1 = nil
    end
    if not v1 then
        self._cachedMuzzles = {}
        return {}
    end
    local v2 = {}
    local v3 = resolveAttachment(v1, "LeftCannon")
    if v3 then
        table.insert(v2, v3)
    end
    local v4 = resolveAttachment(v1, "RightCannon")
    if v4 then
        table.insert(v2, v4)
    end
    self._cachedMuzzles = v2
    return v2
end

function v1:_getRocketMuzzle() -- Line: 99 -- upvalues: resolveAttachment (val)
    local Weapon = self.Model:FindFirstChild("Weapon")
    local Weapon_2 = Weapon and Weapon:FindFirstChild("Weapon")
    local Configuration = Weapon_2 and Weapon_2:FindFirstChild("Configuration")
    if not Configuration then
        warn("[War Machine] Cannot find active weapon Configuration (Weapon/Weapon/Configuration)")
        return nil
    end
    self._rocketMuzzleIndex = (self._rocketMuzzleIndex or 0) + 1
    local v1 = resolveAttachment(Configuration, "RocketLauncher" .. tostring(self._rocketMuzzleIndex))
    if not v1 then
        self._rocketMuzzleIndex = 1
        v1 = resolveAttachment(Configuration, "RocketLauncher1")
    end
    if not v1 then
        v1 = resolveAttachment(Configuration, "RocketLauncher")
    end
    if not v1 then
        warn("[War Machine] No RocketLauncher ObjectValue in Weapon/Weapon/Configuration/Attachments")
    end
    return v1
end

function v1:_getMinigunBones() -- Line: 131 -- upvalues: resolveBone (val)
    local MinigunRotateBoneL, MinigunRotateBoneR, u19, v1, v2
    local Level = self:GetLevel()
    if self._cachedMinigunBones and self._cachedMinigunBonesLevel == Level then
        return self._cachedMinigunBones
    end
    local Weapon = self.Model:FindFirstChild("Weapon")
    if Weapon then
        local Configuration = Weapon:FindFirstChild("Configuration")
        u19 = if Configuration then Configuration else nil
    else
        u19 = nil
    end

    local function findBone(a1) -- Line: 139
        -- upvalues: u19 (val), resolveBone (upval), self (val)
        local v1
        if u19 then
            v1 = resolveBone(u19, a1)
            if v1 then
                return v1
            end
        end
        v1 = self.Model:FindFirstChild(a1, true)
        if v1 and v1:IsA("Bone") then
            return v1
        end
        return nil
    end

    local v3 = {}
    if not u19 then
        MinigunRotateBoneL = self.Model:FindFirstChild("MinigunRotateBoneL", true)
        v1 = if not MinigunRotateBoneL then nil else if not MinigunRotateBoneL:IsA("Bone") then nil else MinigunRotateBoneL
    else
        v2 = resolveBone(u19, "MinigunRotateBoneL")
        if not v2 then
            MinigunRotateBoneL = self.Model:FindFirstChild("MinigunRotateBoneL", true)
            v1 = if not MinigunRotateBoneL then nil else if not MinigunRotateBoneL:IsA("Bone") then nil else MinigunRotateBoneL
        else
            v1 = v2
        end
    end
    v3.left = v1
    if not u19 then
        MinigunRotateBoneR = self.Model:FindFirstChild("MinigunRotateBoneR", true)
        v1 = if not MinigunRotateBoneR then nil else if not MinigunRotateBoneR:IsA("Bone") then nil else MinigunRotateBoneR
    else
        v2 = resolveBone(u19, "MinigunRotateBoneR")
        if not v2 then
            MinigunRotateBoneR = self.Model:FindFirstChild("MinigunRotateBoneR", true)
            v1 = if not MinigunRotateBoneR then nil else if not MinigunRotateBoneR:IsA("Bone") then nil else MinigunRotateBoneR
        else
            v1 = v2
        end
    end
    v3.right = v1
    self._cachedMinigunBonesLevel = Level
    self._cachedMinigunBones = v3
    return v3
end

function v1:_resolveSoundId(a2) -- Line: 165 -- upvalues: Sounds (val) -- types: self: table, a2: string
    local v1 = Sounds[a2]
    if type(v1) ~= "table" then
        return v1
    end
    local Attribute = self.Model:GetAttribute("Skin") or self.Model.Name
    return v1[Attribute] or v1.Default
end

function v1:_applyMinigunSound(a2) -- Line: 175 -- upvalues: EasySound (val) -- types: self: table, a2: string
    local PrimaryPart = self.Model.PrimaryPart
    if not PrimaryPart then
        return
    end
    if not self._minigunSounds then
        local function makeSound(a1, a2) -- Line: 183
            -- upvalues: EasySound (upval), PrimaryPart (val)
            return EasySound.Create({
                volume = 0.6,
                audioGroup = "Towers",
                id = a1,
                looped = a2,
                parent = PrimaryPart,
                emitter = {RollOffMaxDistance = 80},
            })
        end

        self._minigunSounds = {
            start = makeSound(self:_resolveSoundId("MinigunStart") or 5590319547, true),
            spin = makeSound(self:_resolveSoundId("MinigunSpin") or 5590320285, true),
            finish = makeSound(self:_resolveSoundId("MinigunEnd") or 5590319988, false),
        }
        self.Maid:Mark(function() -- Line: 203 -- upvalues: self (val), EasySound (upval)
            if self._minigunSounds then
                EasySound.Destroy(self._minigunSounds.start)
                EasySound.Destroy(self._minigunSounds.spin)
                EasySound.Destroy(self._minigunSounds.finish)
            end
        end)
    end
    local _minigunSounds = self._minigunSounds
    if a2 == "Intro" then
        _minigunSounds.spin:Stop()
        _minigunSounds.finish:Stop()
        local v1 = 1.2
        local Stats = self.Stats and self.Stats.Attributes
        if Stats then
            v1 = if not ((self:GetLevel() or 0) < (Stats.MinUpgradeForMinigunRevSpool or 4)) then (Stats.RevTime or 4) / (1 + (self:GetBuffCount("Cooldown") or 0) / 100) else 0
        end
        if not (v1 > 0) then
            self._soundP0 = 1
            self._soundP1 = 1
            _minigunSounds.start:SetAttribute("PlaybackSpeed", 1)
        else
            local v2 = math.clamp(1 - v1 * 0.15, 0.45, 0.8)
            self._soundP0 = v2
            self._soundP1 = 1.05
            _minigunSounds.start:SetAttribute("PlaybackSpeed", v2)
        end
        _minigunSounds.start:Play()
        return
    end
    if a2 == "Shoot" then
        _minigunSounds.start:Stop()
        _minigunSounds.finish:Stop()
        if _minigunSounds.spin.IsPlaying then
            return
        end
        _minigunSounds.spin:Play()
        return
    end
    if a2 ~= "Outro" and a2 ~= "ADS" then
        if a2 == "Idle" or a2 == "Placement" then
            _minigunSounds.start:Stop()
            _minigunSounds.spin:Stop()
            _minigunSounds.finish:Stop()
        end
        return
    end
    _minigunSounds.spin:Stop()
    _minigunSounds.start:Stop()
    if _minigunSounds.finish.IsPlaying then
        return
    end
    _minigunSounds.finish:Play()
end

function v1:_applyPhase(a2) -- Line: 270 -- upvalues: TimescaleUtilities (val)
    if self._wmPhase == a2 then
        return
    end
    self._wmPhase = a2
    self:_stopTracks("Intro", 0.15)
    self:_stopTracks("Loop", 0.15)
    self:_stopTracks("ADS", 0.15)
    self:_stopTracks("Outro", 0.15)
    if self._animations and self._animations.Placement then
        pcall(function() -- Line: 281 -- upvalues: self (val)
            self._animations.Placement:Stop(0.15)
        end)
    end
    self:_applyMinigunSound(a2)
    if a2 == "Intro" then
        self._introElapsed = 0
        self._minigunSpeedNorm = 0
        self:_playStance("Intro")
        return
    end
    if a2 == "Shoot" then
        self._leftMuzzle = true
        self:_playStance("Loop")
        return
    end
    if a2 == "Outro" then
        self:_stopTracks("Loop", 0.15)
        self:_playStance("Outro", 0.15)
        return
    end
    if a2 ~= "ADS" then
        if a2 == "Placement" then
            local Placement = self._animations.Placement
            if Placement then
                Placement:Play()
                TimescaleUtilities.Delay(1.6500000000000001, function() -- Line: 324 -- upvalues: self (val), a2 (val)
                    if not self:IsAlive() then
                        return
                    end
                    if self._wmPhase == a2 then
                        self._wmPhase = "Idle"
                    end
                end)
                return
            end
            self._wmPhase = "Idle"
        end
        return
    end
    local v1 = self:PlayAnimation("ADS", {Looped = true}, {0.15})
    if v1 then
        v1.TimePosition = 0
        v1:Play(0.15)
        return
    end
    local v2 = self:PlayAnimation("Outro", {Looped = false}, nil, "ADS") or self:PlayAnimation("Intro", {Looped = false}, nil, "ADS")
    if v2 then
        v2:Play(0.15)
        v2:AdjustSpeed(0)
        if 0 < v2.Length then
            v2.TimePosition = v2.Length - 0.05
            return
        end
    end
end

function v1:_stopTracks(a2, a3) -- Line: 339
    if self._playingStances and self._playingStances[a2] then
        self._playingStances[a2]:Stop(a3)
    end
end

function v1:PlayAnimation(a2, a3, a4, a5) -- Line: 345
    -- upvalues: 
    local v1 = self:Animate(a2, a3, a4)
    if not v1 then
        return nil
    end
    local _playingStances = self._playingStances or {}
    self._playingStances = _playingStances
    self._playingStances[a5 or a2] = v1
    return v1
end

function v1:_playStance(a2, a3) -- Line: 361 -- upvalues: RunService (val)
    local v1
    local v2 = a3 or 0.15
    local Idle = if a2 ~= "ADS" then nil else Enum.AnimationPriority.Idle
    local v3 = true
    if a2 ~= "Loop" then
        v3 = a2 == "ADS"
    end
    local u24 = self:PlayAnimation(a2, {Priority = Idle, Looped = v3}, {v2})
    if not u24 then
        return
    end
    u24.TimePosition = 0
    u24:Play(v2)
    if a2 == "Loop" then
        u24.Looped = true
        v1 = self.Replicator:Get("Cooldown") or 0.265
        u24:AdjustSpeed((math.clamp((self.Stats.Attributes.AnimatedFireLoopPeriod or 0.265) / v1, 0.05, 40)))
        return
    end
    if a2 == "Outro" then
        v1 = self.Replicator:Get("Cooldown") or 0.265
        local u64 = math.clamp((self.Stats.Attributes.AnimatedFireLoopPeriod or 0.265) / v1, 0.05, 40)
        u24:AdjustSpeed(u64)
        task.spawn(function() -- Line: 386 -- upvalues: u64 (val), RunService (upval), u24 (val), self (val)
            local u0 = u64
            local u1 = nil
            u1 = RunService.Heartbeat:Connect(function(a1) -- Line: 389 -- upvalues: u24 (upval), self (upval), u1 (ref), u0 (ref), u64 (upval)
                if u24.IsPlaying and self._wmPhase == "Outro" and self:IsAlive() then
                    local v1 = a1 / 0.016666666666666666
                    u0 = math.max(1, u0 - u64 * 0.05 * v1)
                    u24:AdjustSpeed(u0)
                    if u0 <= 1 then
                        u1:Disconnect()
                    end
                    return
                end
                u1:Disconnect()
            end)
            self.Maid:Mark(function() -- Line: 404 -- upvalues: u1 (ref)
                if u1 and u1.Connected then
                    u1:Disconnect()
                end
            end)
        end)
        return
    end
    if a2 == "Intro" then
        u24.Looped = false
        v1 = 1.2
        local Stats_3 = self.Stats and self.Stats.Attributes
        if Stats_3 then
            v1 = if not ((self:GetLevel() or 0) < (Stats_3.MinUpgradeForMinigunRevSpool or 4)) then (Stats_3.RevTime or 4) / (1 + (self:GetBuffCount("Cooldown") or 0) / 100) else 0
        end
        if 0 < u24.Length then
            if v1 <= 0 then
                u24.TimePosition = u24.Length - 0.01
                u24:AdjustSpeed(0)
                return
            end
            u24:AdjustSpeed(u24.Length / v1)
            self.Maid:Mark((u24.Stopped:Connect(function() -- Line: 433 -- upvalues: self (val), u24 (val)
                if self._wmPhase == "Intro" then
                    u24:Play(0)
                    u24.TimePosition = u24.Length - 0.01
                    u24:AdjustSpeed(0)
                end
            end)))
        end
    end
end

function v1.Initialize(a1, a2) -- Line: 445
    -- upvalues: u61 (val), ReplicatedStorage (val), Animation (val), ContentProvider (val), Shaker (val)
    -- upvalues: TimescaleUtilities (val), RunService (val), EmitterManager (val), EasySound (val), Projectile (val)
    -- upvalues: EffectsController (val), GameState (val)
    u61[a1] = true
    local Maid = a1.Maid or require(ReplicatedStorage.Shared.Modules.Maid).new()
    a1.Maid = Maid
    a1.Maid:Mark(function() -- Line: 448 -- upvalues: u61 (upval), a1 (val)
        u61[a1] = nil
    end)
    local v1 = a1.Model:GetAttribute("WarMachinePhase") == "Placement"
    local u31 = true
    if a2 ~= true then
        u31 = v1
    end
    a1._fireTracks = {}
    a1._animations = {}
    a1._cachedMuzzles = nil
    a1._leftMuzzle = true
    a1._wmPhase = nil
    a1._lastTracerWarningAt = 0
    a1._minigunSounds = nil
    a1._cachedMinigunBones = nil
    a1._minigunAngleX = 0
    a1._minigunSpeedNorm = 0
    local Model = a1.Model
    local AnimationController = Model:FindFirstChild("AnimationController")
    if AnimationController and a1:IsAlive() then
        local u231
        local Placement_2 = nil
        local Animations = Model:FindFirstChild("Animations")
        local Placement = Animations and Animations:FindFirstChild("Placement")
        if Placement then
            local Animation_2 = Placement:FindFirstChildWhichIsA("Animation", true)
            if Animation_2 then
                a1._animations.Placement = Animation.new({IgnorePriority = true, Track = Animation_2, Target = AnimationController})
                if u31 then
                    task.spawn(function() -- Line: 482 -- upvalues: ContentProvider (upval), Animation_2 (val)
                        ContentProvider:PreloadAsync({Animation_2})
                    end)
                end
                Placement_2 = a1._animations.Placement
            end
        end
        a1:_applyVisuals()
        local u94 = Model:GetAttribute("WarMachinePhase") or "Idle"

        local function syncInitialPhase() -- Line: 493 -- upvalues: u31 (val), a1 (val), u94 (val)
            if u31 then
                a1._wmPhase = "Placement"
            end
            a1:_applyPhase(u94)
        end

        if u31 and Placement_2 then
            local v2
            local PrimaryPart = Model.PrimaryPart
            if PrimaryPart then
                Shaker:ShakePreset("Thump", 0.2, 0.12, {radius = 120, position = PrimaryPart.Position})
            end
            Placement_2:Play(0.15)
            local Controller = Placement_2.Controller
            if not Controller then
                if u31 then
                    a1._wmPhase = "Placement"
                end
                a1:_applyPhase(u94)
                return
            end
            a1._wmPhase = "Placement"

            local function completePlacement() -- Line: 518 -- upvalues: a1 (val), u31 (val), u94 (val)
                if a1._wmPhase == "Placement" and a1:IsAlive() then
                    if u31 then
                        a1._wmPhase = "Placement"
                    end
                    a1:_applyPhase(u94)
                end
            end

            local function tryScheduleByRemainingTime() -- Line: 524
                -- upvalues: Controller (val), a1 (val), u31 (val), u94 (val), TimescaleUtilities (upval)
                -- upvalues: completePlacement (val)
                if Controller.Length <= 0 then
                    return false
                end
                if Controller.IsPlaying then
                    local v1 = math.max(0, Controller.Length - Controller.TimePosition)
                    TimescaleUtilities.Delay(v1, completePlacement)
                    return true
                end
                if a1._wmPhase == "Placement" and a1:IsAlive() then
                    if u31 then
                        a1._wmPhase = "Placement"
                    end
                    a1:_applyPhase(u94)
                end
                return true
            end

            if Controller.Length <= 0 then
                v2 = false
            else
                if Controller.IsPlaying then
                    local v3 = math.max(0, Controller.Length - Controller.TimePosition)
                    TimescaleUtilities.Delay(v3, completePlacement)
                elseif a1._wmPhase == "Placement" and a1:IsAlive() then
                    if u31 then
                        a1._wmPhase = "Placement"
                    end
                    a1:_applyPhase(u94)
                end
                v2 = true
            end
            if not v2 then
                local u158 = 0
                local u159 = nil
                u159 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 544
                    -- upvalues: a1 (val), u159 (ref), u158 (ref), Controller (val), u31 (val), u94 (val)
                    -- upvalues: TimescaleUtilities (upval), completePlacement (val)
                    if a1._wmPhase == "Placement" and a1:IsAlive() then
                        local v1
                        u158 = u158 + a1_2
                        if Controller.Length <= 0 then
                            v1 = false
                        else
                            if Controller.IsPlaying then
                                local v2 = math.max(0, Controller.Length - Controller.TimePosition)
                                TimescaleUtilities.Delay(v2, completePlacement)
                            elseif a1._wmPhase == "Placement" and a1:IsAlive() then
                                if u31 then
                                    a1._wmPhase = "Placement"
                                end
                                a1:_applyPhase(u94)
                            end
                            v1 = true
                        end
                        if v1 then
                            u159:Disconnect()
                            return
                        end
                        if u158 >= 1 then
                            u159:Disconnect()
                            TimescaleUtilities.Delay(1, completePlacement)
                        end
                        return
                    end
                    u159:Disconnect()
                end)
                a1.Maid:Mark(function() -- Line: 562 -- upvalues: u159 (ref)
                    if u159 and u159.Connected then
                        u159:Disconnect()
                    end
                end)
            end
            a1.Maid:Mark(((a1.Model:GetAttributeChangedSignal("WarMachinePhase")):Connect(function() -- Line: 572 -- upvalues: a1 (val)
                a1:_applyPhase((a1.Model:GetAttribute("WarMachinePhase")) or "Idle")
            end)))
            a1.Maid:Mark((a1.OnUpgrade:Connect(function() -- Line: 576 -- upvalues: a1 (val)
                a1._cachedMuzzles = nil
                a1._cachedRocketMuzzle = nil
                a1:_applyVisuals()
            end)))
            a1.Executables = {
                Projectile = function(a1_2, a2, a3) -- Line: 583
                    -- upvalues: a1 (val), EmitterManager (upval), EasySound (upval), ReplicatedStorage (upval)
                    -- upvalues: Projectile (upval), TimescaleUtilities (upval), EffectsController (upval)
                    local v1 = a1:_getRocketMuzzle()
                    if v1 then
                        EmitterManager.manualEmit(v1)
                    end
                    EasySound.Play({
                        audioGroup = "Towers",
                        timeScaled = true,
                        destroyOnEnd = true,
                        id = a1:_resolveSoundId("Cannon"),
                        parent = a1.Model.PrimaryPart,
                    })
                    local v2 = a1:Animate("Rocket", {Looped = false})
                    if v2 then
                        v2:Play(0.15)
                    end
                    a2.Part = ReplicatedStorage.Assets.Effects.Projectile:FindFirstChild("FastRocket")
                    Projectile:Throw(a2)
                    local End = a2.End
                    TimescaleUtilities.Delay(Projectile:CalcDuration(a2), function() -- Line: 607 -- upvalues: EffectsController (upval), End (val), a3 (val), a1 (upval)
                        EffectsController.Explosion({
                            Visible = true,
                            Position = End,
                            Radius = a3 or 5,
                            Color = a1.Stats.Attributes.MissileTracerColor,
                            Sound = a1:_resolveSoundId("MissileExplosion"),
                        })
                    end)
                end,
                Convoy = function() -- Line: 617 -- upvalues: a1 (val), Shaker (upval)
                    local PrimaryPart = a1.Model.PrimaryPart
                    if PrimaryPart then
                        Shaker:ShakePreset("Thump", 0.15, 0.1, {radius = 120, position = PrimaryPart.Position})
                    end
                end,
            }
            a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 633 -- upvalues: a1 (val), GameState (upval)
                local v1
                if not a1:IsAlive() then
                    return
                end
                local _wmPhase = a1._wmPhase
                local v2 = 1.2
                local Stats = a1.Stats and a1.Stats.Attributes
                if Stats then
                    v2 = if not ((a1:GetLevel() or 0) < (Stats.MinUpgradeForMinigunRevSpool or 4)) then (Stats.RevTime or 4) / (1 + (a1:GetBuffCount("Cooldown") or 0) / 100) else 0
                end
                local v3 = math.max(GameState.TimeScale or 1, 0.0001)
                if _wmPhase ~= "Intro" then
                    if _wmPhase ~= "Shoot" then
                        a1._introElapsed = nil
                        a1._minigunSpeedNorm = math.max(0, a1._minigunSpeedNorm - a1_2 * v3 / 1)
                    else
                        a1._minigunSpeedNorm = 1
                        a1._introElapsed = nil
                    end
                elseif not (v2 <= 0) then
                    a1._introElapsed = (a1._introElapsed or 0) + a1_2 * v3
                    v1 = math.clamp(a1._introElapsed / v2, 0, 1)
                    a1._minigunSpeedNorm = v1 * v1 * v1 * v1 * 0.8125 + 0.1875
                    if a1._minigunSounds and a1._minigunSounds.start and a1._soundP0 and a1._soundP1 then
                        a1._minigunSounds.start:SetAttribute("PlaybackSpeed", a1._soundP0 + (a1._soundP1 - a1._soundP0) * v1)
                    end
                else
                    a1._minigunSpeedNorm = 1
                    a1._introElapsed = nil
                end
                if a1._minigunSpeedNorm <= 0 then
                    return
                end
                a1._minigunAngleX = (a1._minigunAngleX + 50.26548245743669 * a1._minigunSpeedNorm * a1_2 * v3) % 6.283185307179586
                v1 = CFrame.Angles(0, a1._minigunAngleX, 0)
                local v4 = a1:_getMinigunBones()
                if v4.left then
                    v4.left.Transform = v1
                end
                if v4.right then
                    v4.right.Transform = v1
                end
            end)))
            u231 = 0
            a1:Thread(function() -- Line: 710 -- upvalues: a1 (val), GameState (upval), u231 (ref), EmitterManager (upval), EasySound (upval)
                if not a1:IsAlive() then
                    return
                end
                if a1._wmPhase == "Shoot" then
                    local v1 = tick()
                    local v2 = a1.Replicator:Get("Cooldown") or 0.265
                    local v3 = math.max(GameState.TimeScale or 1, 0.0001)
                    if v2 <= (v1 - u231) * v3 then
                        u231 = v1
                        local v4 = a1:FindTarget()
                        if not v4 then
                            return
                        end
                        local Position = v4.PrimaryPart and v4.PrimaryPart.Position or v4:GetPivot().Position
                        local v5 = a1:_getMuzzles()
                        local v6 = v5[if not a1._leftMuzzle then 2 else 1] or v5[1]
                        a1._leftMuzzle = not a1._leftMuzzle
                        if not v6 then
                            return
                        end
                        EmitterManager.manualEmit(v6)
                        EasySound.Play({
                            audioGroup = "Towers",
                            timeScaled = true,
                            destroyOnEnd = true,
                            id = a1:_resolveSoundId("Gun"),
                            parent = v6.Parent,
                        })
                        a1:Bullet({
                            Size = 0.06,
                            Spread = 8,
                            Speed = 140,
                            Start = v6.WorldPosition,
                            End = Position,
                        })
                    end
                end
            end)
            return
        end
        if u31 then
            a1._wmPhase = "Placement"
        end
        a1:_applyPhase(u94)
        a1.Maid:Mark(((a1.Model:GetAttributeChangedSignal("WarMachinePhase")):Connect(function() -- Line: 572 -- upvalues: a1 (val)
            a1:_applyPhase((a1.Model:GetAttribute("WarMachinePhase")) or "Idle")
        end)))
        a1.Maid:Mark((a1.OnUpgrade:Connect(function() -- Line: 576 -- upvalues: a1 (val)
            a1._cachedMuzzles = nil
            a1._cachedRocketMuzzle = nil
            a1:_applyVisuals()
        end)))
        a1.Executables = {
            Projectile = function(a1_2, a2, a3) -- Line: 583
                -- upvalues: a1 (val), EmitterManager (upval), EasySound (upval), ReplicatedStorage (upval)
                -- upvalues: Projectile (upval), TimescaleUtilities (upval), EffectsController (upval)
                local v1 = a1:_getRocketMuzzle()
                if v1 then
                    EmitterManager.manualEmit(v1)
                end
                EasySound.Play({
                    audioGroup = "Towers",
                    timeScaled = true,
                    destroyOnEnd = true,
                    id = a1:_resolveSoundId("Cannon"),
                    parent = a1.Model.PrimaryPart,
                })
                local v2 = a1:Animate("Rocket", {Looped = false})
                if v2 then
                    v2:Play(0.15)
                end
                a2.Part = ReplicatedStorage.Assets.Effects.Projectile:FindFirstChild("FastRocket")
                Projectile:Throw(a2)
                local End = a2.End
                TimescaleUtilities.Delay(Projectile:CalcDuration(a2), function() -- Line: 607 -- upvalues: EffectsController (upval), End (val), a3 (val), a1 (upval)
                    EffectsController.Explosion({
                        Visible = true,
                        Position = End,
                        Radius = a3 or 5,
                        Color = a1.Stats.Attributes.MissileTracerColor,
                        Sound = a1:_resolveSoundId("MissileExplosion"),
                    })
                end)
            end,
            Convoy = function() -- Line: 617 -- upvalues: a1 (val), Shaker (upval)
                local PrimaryPart = a1.Model.PrimaryPart
                if PrimaryPart then
                    Shaker:ShakePreset("Thump", 0.15, 0.1, {radius = 120, position = PrimaryPart.Position})
                end
            end,
        }
        a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 633 -- upvalues: a1 (val), GameState (upval)
            local v1
            if not a1:IsAlive() then
                return
            end
            local _wmPhase = a1._wmPhase
            local v2 = 1.2
            local Stats = a1.Stats and a1.Stats.Attributes
            if Stats then
                v2 = if not ((a1:GetLevel() or 0) < (Stats.MinUpgradeForMinigunRevSpool or 4)) then (Stats.RevTime or 4) / (1 + (a1:GetBuffCount("Cooldown") or 0) / 100) else 0
            end
            local v3 = math.max(GameState.TimeScale or 1, 0.0001)
            if _wmPhase ~= "Intro" then
                if _wmPhase ~= "Shoot" then
                    a1._introElapsed = nil
                    a1._minigunSpeedNorm = math.max(0, a1._minigunSpeedNorm - a1_2 * v3 / 1)
                else
                    a1._minigunSpeedNorm = 1
                    a1._introElapsed = nil
                end
            elseif not (v2 <= 0) then
                a1._introElapsed = (a1._introElapsed or 0) + a1_2 * v3
                v1 = math.clamp(a1._introElapsed / v2, 0, 1)
                a1._minigunSpeedNorm = v1 * v1 * v1 * v1 * 0.8125 + 0.1875
                if a1._minigunSounds and a1._minigunSounds.start and a1._soundP0 and a1._soundP1 then
                    a1._minigunSounds.start:SetAttribute("PlaybackSpeed", a1._soundP0 + (a1._soundP1 - a1._soundP0) * v1)
                end
            else
                a1._minigunSpeedNorm = 1
                a1._introElapsed = nil
            end
            if a1._minigunSpeedNorm <= 0 then
                return
            end
            a1._minigunAngleX = (a1._minigunAngleX + 50.26548245743669 * a1._minigunSpeedNorm * a1_2 * v3) % 6.283185307179586
            v1 = CFrame.Angles(0, a1._minigunAngleX, 0)
            local v4 = a1:_getMinigunBones()
            if v4.left then
                v4.left.Transform = v1
            end
            if v4.right then
                v4.right.Transform = v1
            end
        end)))
        u231 = 0
        a1:Thread(function() -- Line: 710 -- upvalues: a1 (val), GameState (upval), u231 (ref), EmitterManager (upval), EasySound (upval)
            if not a1:IsAlive() then
                return
            end
            if a1._wmPhase == "Shoot" then
                local v1 = tick()
                local v2 = a1.Replicator:Get("Cooldown") or 0.265
                local v3 = math.max(GameState.TimeScale or 1, 0.0001)
                if v2 <= (v1 - u231) * v3 then
                    u231 = v1
                    local v4 = a1:FindTarget()
                    if not v4 then
                        return
                    end
                    local Position = v4.PrimaryPart and v4.PrimaryPart.Position or v4:GetPivot().Position
                    local v5 = a1:_getMuzzles()
                    local v6 = v5[if not a1._leftMuzzle then 2 else 1] or v5[1]
                    a1._leftMuzzle = not a1._leftMuzzle
                    if not v6 then
                        return
                    end
                    EmitterManager.manualEmit(v6)
                    EasySound.Play({
                        audioGroup = "Towers",
                        timeScaled = true,
                        destroyOnEnd = true,
                        id = a1:_resolveSoundId("Gun"),
                        parent = v6.Parent,
                    })
                    a1:Bullet({
                        Size = 0.06,
                        Spread = 8,
                        Speed = 140,
                        Start = v6.WorldPosition,
                        End = Position,
                    })
                end
            end
        end)
        return
    end
end

function v1.Remove(a1) -- Line: 762
    a1.Maid:Destroy()
end

return v1