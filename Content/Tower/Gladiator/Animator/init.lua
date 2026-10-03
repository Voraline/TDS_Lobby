-- Script path: ReplicatedStorage.Content.Tower.Gladiator.Animator
-- Decompile time: 7.12 ms

local destroySounds
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local GladiatorSounds = require(script.GladiatorSounds)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local getTime = ServerTicks.getTime
local Gladiator = ReplicatedStorage.Assets.Effects.Misc.Gladiator
local u60 = TweenInfo.new(1)
local v1 = {}
v1.__index = v1
local u62 = {Phantom = 2}
local u65 = Random.new()

local function getWeaponConfig(a1) -- Line: 31 -- types: a1: userdata
    local Weapon = a1:FindFirstChild("Weapon")
    if not Weapon then
        return nil
    end
    local Sword = Weapon:FindFirstChild("Sword")
    if not Sword then
        return nil
    end
    return Sword:FindFirstChildOfClass("Configuration")
end

function destroySounds(a1) -- Line: 45 -- upvalues: EasySound (val), destroySounds (val)
    if typeof(a1) == "AudioPlayer" then
        EasySound.Destroy(a1)
        return
    end
    if typeof(a1) == "table" then
        for i, j in a1 do
            destroySounds(j)
        end
    end
end

local function fadeAuraVisual(a1) -- Line: 55 -- upvalues: TweenService (val), u60 (val) -- types: a1: userdata
    if a1:IsA("ParticleEmitter") then
        a1.Enabled = false
        return
    end
    if a1:IsA("Beam") then
        TweenService:Create(a1, u60, {Width0 = 0, Width1 = 0}):Play()
    end
end

local function fadeWarCryAura(a1) -- Line: 66 -- upvalues: fadeAuraVisual (val) -- types: a1: userdata
    fadeAuraVisual(a1)
    for i, j in a1:GetDescendants() do
        fadeAuraVisual(j)
    end
    task.delay(1, function() -- Line: 72 -- upvalues: a1 (val)
        a1:Destroy()
    end)
end

function v1.Initialize(a1) -- Line: 77
    -- upvalues: destroySounds (val), EmitterManager (val), Gladiator (val), Debris (val), u65 (val)
    a1._attackNumber = 1
    a1._sounds = {}
    a1._warCryEndTimestamp = nil
    a1._warCryAura = nil
    a1._warCryAuraThread = nil
    a1._fireAspectReady = a1.Replicator:Get("FireAspectReady") == true
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("FireAspectReady")):Connect(function(a1_2) -- Line: 87 -- upvalues: a1 (val) -- types: a1_2: boolean?
        a1._fireAspectReady = a1_2 == true
    end)))
    a1.Maid:Mark(function() -- Line: 92 -- upvalues: a1 (val)
        a1:_stopWarCryAura()
    end)
    a1:_createSounds()
    a1.Maid:Mark(function() -- Line: 97 -- upvalues: destroySounds (upval), a1 (val)
        destroySounds(a1._sounds)
    end)
    a1.Maid:Mark(function() -- Line: 101 -- upvalues: a1 (val), EmitterManager (upval)
        local v1 = a1:_getConfigValue("FireAspectTrail")
        if v1 then
            EmitterManager.toggle(v1, false, "Trail")
        end
        v1 = a1:_getConfigValue("Trail")
        if v1 then
            EmitterManager.toggle(v1, false, "Trail")
        end
    end)
    local u47 = tick()
    a1.Executables = {
        WarCry = function(a1_2) -- Line: 115
            -- upvalues: a1 (val), Gladiator (upval), EmitterManager (upval), Debris (upval)
            local v1 = a1:_playAnimation("WarCry", Enum.AnimationPriority.Action2)
            local WarCryAttackCD = a1.Stats.Attributes.WarCryAttackCD
            if v1 and 0 < v1.Length and WarCryAttackCD and WarCryAttackCD > 0 then
                v1:AdjustSpeed(v1.Length / WarCryAttackCD)
            end
            a1:_playSound("WarCry", 1, a1_2)
            a1:_startWarCryAura()
            local v2 = a1:GetRange() * 2 * (a1.Stats.Attributes.WarCryRangeMult or 1)
            local v3 = Gladiator.WarCryCleanse:Clone()
            v3:ScaleTo(v2)
            v3:PivotTo((CFrame.new(a1.Model.PrimaryPart.HeightOffset.WorldPosition + Vector3.new(0, 0.10000000149011612, 0))))
            v3.Parent = workspace.Trash
            EmitterManager.manualEmit(v3)
            Debris:AddItem(v3)
        end,
        Parry = function() -- Line: 139 -- upvalues: a1 (val), EmitterManager (upval)
            local v1 = a1:_playAnimation("Parry", Enum.AnimationPriority.Action3)
            local ParryDuration = a1.Stats.Attributes.ParryDuration
            if v1 and 0 < v1.Length and ParryDuration and ParryDuration > 0 then
                v1:AdjustSpeed(v1.Length / ParryDuration)
            end
            a1:_playSound("Parry", 1)
            EmitterManager.Emit("GladiatorParry", a1.Model.PrimaryPart.CFrame)
        end,
        Hit = function(a1_2) -- Line: 150 -- upvalues: a1 (val), EmitterManager (upval), u65 (upval), u47 (ref) -- types: a1_2: vector
            local PrimaryPart = a1.Model.PrimaryPart
            if not PrimaryPart then
                return
            end
            local v1 = if not (5 <= (a1.Upgrade or 0)) then "GladiatorBaseHit" else "GladiatorMaxHit"
            local v2 = a1_2 - PrimaryPart.Position
            local v3 = if not (0 < v2.Magnitude) then CFrame.new(a1_2) else CFrame.lookAlong(a1_2, v2.Unit)
            EmitterManager.Emit(v1, v3)
            a1:_playSound("Hit", (u65:NextNumber(0.85, 1.15)))
            u47 = tick()
        end,
    }
    a1:Thread(function() -- Line: 173 -- upvalues: a1 (val), EmitterManager (upval)
        local v1
        if a1.Replicator:Get("CanAttack") == false then
            return
        end
        local v2 = a1:FindTarget()
        if not v2 then
            return
        end
        a1:Face((v2:GetPivot()).Position)
        local Cooldown = a1:GetCooldown()
        a1:_createAreaIndicator(a1:GetRange(), 165, 0.1)
        a1:_playNextAttackAnimation(Cooldown)
        if a1._fireAspectReady == true then
            a1._fireAspectReady = false
        end
        local v3 = v1 and a1:_getConfigValue("BloodStrikeTrail") or a1:_getConfigValue("Trail")
        if v3 then
            EmitterManager.toggle(v3, true)
        end
        a1:Wait(Cooldown)
        if v3 then
            EmitterManager.toggle(v3, false)
        end
    end)
end

function v1:_playNextAttackAnimation(a2) -- Line: 209
    -- upvalues: getTime (val), u62 (val), u65 (val)
    local v1 = getTime()
    if self._lastAttackTime and 2 < v1 - self._lastAttackTime then
        self._attackNumber = 1
    end
    self._lastAttackTime = v1
    local v2 = a2 * (u62[self.Model.Name] or 1.15)
    local _currentAttackTrack = self._currentAttackTrack
    if _currentAttackTrack and _currentAttackTrack.IsPlaying then
        _currentAttackTrack:Stop(0)
    end
    local v3 = self:_playAnimation("Attack" .. self._attackNumber, Enum.AnimationPriority.Action)
    if v3 and 0 < v3.Length and v2 then
        v3:AdjustSpeed(v3.Length / (math.max(v2, 0.35)))
    end
    self:_playSound("Swing", (u65:NextNumber(0.85, 1.15)))
    self._currentAttackTrack = v3
    self._attackNumber = self._attackNumber % 3 + 1
end

function v1:_stopWarCryAura() -- Line: 239 -- upvalues: fadeWarCryAura (val)
    if self._warCryAuraThread then
        task.cancel(self._warCryAuraThread)
        self._warCryAuraThread = nil
    end
    self._warCryEndTimestamp = nil
    if self._warCryAura then
        local _warCryAura = self._warCryAura
        self._warCryAura = nil
        fadeWarCryAura(_warCryAura)
    end
end

function v1:_createWarCryAura() -- Line: 254 -- upvalues: Gladiator (val)
    if self._warCryAura then
        return true
    end
    local v1 = Gladiator.WarCryAura:Clone()
    local RigidConstraint = v1:FindFirstChild("RigidConstraint", true)
    if RigidConstraint and RigidConstraint:IsA("RigidConstraint") then
        RigidConstraint.Attachment1 = self.Model.PrimaryPart.HeightOffset
        v1.Parent = workspace.Trash
        self._warCryAura = v1
        return true
    end
    v1:Destroy()
    return false
end

function v1:_startWarCryAura() -- Line: 273 -- upvalues: getTime (val)
    local WarCryDuration = self.Stats.Attributes.WarCryDuration
    if WarCryDuration and WarCryDuration > 0 then
        self._warCryEndTimestamp = getTime() + WarCryDuration
        if not self:_createWarCryAura() then
            self:_stopWarCryAura()
            return
        end
        if self._warCryAuraThread then
            return
        end
        self._warCryAuraThread = task.spawn(function() -- Line: 290 -- upvalues: self (val), getTime (upval)
            while self._warCryEndTimestamp do
                if not (getTime() < self._warCryEndTimestamp) then
                    break
                end
                task.wait()
            end
            self._warCryAuraThread = nil
            self:_stopWarCryAura()
        end)
        return
    end
    self:_stopWarCryAura()
end

function v1:_playAnimation(a2, a3) -- Line: 300 -- types: self: table, a2: string
    local v1 = self:Animate(a2)
    if v1 and a3 then
        v1.Priority = a3
    end
    return v1
end

function v1:_createSounds() -- Line: 312 -- upvalues: GladiatorSounds (val), EasySound (val)
    local Default, v1
    local PrimaryPart = self.Model.PrimaryPart
    if not PrimaryPart then
        return
    end
    local v2 = nil
    local v3 = nil
    for i, j in GladiatorSounds, v2, v3 do
        Default = j[self.Model.Name] or j.Default
        if Default then
            if typeof(Default) ~= "table" then
                v4._sounds[i] = (EasySound.Create({audioGroup = "Towers", timeScaled = true, id = Default, parent = PrimaryPart}))
            elseif #Default ~= 0 then
                v4._sounds[i] = {}
                for i2, v in ipairs(Default) do
                    v1 = v4._sounds[i]
                    v1[i2] = (EasySound.Create({audioGroup = "Towers", timeScaled = true, id = v, parent = PrimaryPart}))
                end
            end
        end
    end
end

function v1:_playSound(a2, a3, a4) -- Line: 352 -- types: self: table, a2: string, a3: number?, a4: number?
    local v1 = self._sounds[a2]
    if not v1 then
        return
    end
    if typeof(v1) == "table" then
        v1 = v1[if not a4 then 1 else (math.floor(a4) - 1) % #v1 + 1]
        if not v1 then
            return
        end
    end
    v1.TimePosition = 0
    if a2 == "Swing" then
        v1.Volume = 0.5
    end
    v1.PlaybackSpeed = a3 or 1
    v1:Play()
end

function v1:_getConfigValue(a2, a3) -- Line: 374 -- types: self: table, a2: string, a3: boolean?
    local v1
    local Weapon = self.Model:FindFirstChild("Weapon")
    if Weapon then
        local Sword = Weapon:FindFirstChild("Sword")
        v1 = if Sword then Sword:FindFirstChildOfClass("Configuration") else nil
    else
        v1 = nil
    end
    if not v1 then
        return nil
    end
    local v2 = v1:FindFirstChild(a2, a3 == true)
    return v2 and v2.Value
end

function v1:_createAreaIndicator(a2, a3, a4) -- Line: 385
    -- upvalues: UpgradesStore (val), HttpService (val), AreaIndicatorStore (val)
    if UpgradesStore.getState().model ~= self.Model then
        return
    end
    local PrimaryPart = self.Model.PrimaryPart
    if not PrimaryPart then
        return
    end
    local HeightOffset = PrimaryPart:FindFirstChild("HeightOffset")
    local Position = if not HeightOffset then Vector3.new(0, 0, 0) else HeightOffset.Position
    local u21 = HttpService:GenerateGUID(false)
    AreaIndicatorStore.create(u21, {
        type = "normal",
        initialAngle = 0,
        radius = a2,
        desiredAngle = a3,
        color3 = Color3.fromRGB(255, 255, 255),
        cframe = CFrame.new(-Position),
        tweenInfo = TweenInfo.new(0.25),
        lifeTime = a4,
        basePart = PrimaryPart,
    })
    self:Delay(a4 + 1, function() -- Line: 409 -- upvalues: AreaIndicatorStore (upval), u21 (val)
        AreaIndicatorStore.remove(u21)
    end)
end

return v1