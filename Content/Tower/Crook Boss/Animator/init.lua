-- Script path: ReplicatedStorage.Content.Tower.Crook Boss.Animator
-- Decompile time: 5.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Cooldown = require(ReplicatedStorage.Client.Modules.Cooldown)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local v1 = {}
v1.__index = v1

local function adjustFireLvl(a1) -- Line: 26 -- types: a1: number
    if a1 <= 2 then
        return 0
    end
    return a1
end

function v1._playAnimation(a1, a2, a3) -- Line: 30 -- types: a1: table, a2: string
    return a1:Animate(a2, nil, {a3 or 0.1})
end

function v1:_aimAt(a2) -- Line: 34 -- upvalues: SharedControllerFunctions (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    self:Face(Position)
    if self.Model:FindFirstChild("Torso") then
        SharedControllerFunctions.AimArmsAt(self, Position)
        SharedControllerFunctions.AimHeadAt(self, Position_2)
    end
end

function v1:Fire(a2) -- Line: 52 -- upvalues: EmitterManager (val), SoundService (val), SoundPool (val), Animation (val)
    local v1
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Level = self:GetLevel()
    if self._skinEffects and self._skinEffects.fire then
        self._skinEffects.fire(self)
        return
    end
    local v2 = self:getWeapon()
    local v3 = self:getWeaponConfig()
    local Handle = v2:FindFirstChild("Handle") or self.Model.PrimaryPart:FindFirstChild("Handle", true)
    local Value = v3 and v3.Start.Value or Handle:FindFirstChild((("Start%*"):format(self.Upgrade))) or Handle:FindFirstChild("Start")
    local Value_2 = v3 and v3.Fire.Value or Handle:FindFirstChild(("Fire%*"):format((self:GetLevel())), true) or Handle:FindFirstChild("Fire", true)
    if Value then
        self:Bullet({
            Start = Value.WorldPosition,
            End = Position,
            Spread = 50,
            Speed = 140,
            Color = v2:GetAttribute("BulletColor") or nil,
        })
        EmitterManager.manualEmit(Value)
    end
    if Value_2 then
        if SoundService:FindFirstChild("Towers") then
            Value_2.SoundGroup = SoundService.Towers
        end
        local _soundPools = self._soundPools or {}
        self._soundPools = _soundPools
        v1 = self._soundPools[Value_2]
        if not v1 then
            local v4 = string.match(Value_2.SoundId or "", "%d+")
            local v5 = v4 and tonumber(v4)
            if v5 then
                if not Handle then
                    Handle = self.Model.PrimaryPart:FindFirstChildWhichIsA("Bone")
                end
                v1 = SoundPool.new({
                    size = 4,
                    audioGroup = "Towers",
                    id = v5,
                    parent = Handle,
                    volume = Value_2.Volume,
                })
                self._soundPools[Value_2] = v1
            end
        end
        if v1 then
            v1:play({
                playbackSpeed = (Random.new()):NextNumber(Value_2.PlaybackSpeed * 0.9, Value_2.PlaybackSpeed * 1.2),
                volume = Value_2.Volume,
            })
        end
    end
    v1 = if not (Level <= 2) then Level else 0
    if self._prevAttackAnimIndex ~= v1 then
        self._fireAnim = Animation.new({
            Track = self.Model.Animations.Fire[v1].Fire,
            Target = self.Model.AnimationController,
        })
    end
    self._fireAnim:Play()
end

function v1.Initialize(a1) -- Line: 133
    -- upvalues: SharedControllerFunctions (val), GameState (val), Cooldown (val), Animation (val)
    a1._callingBackup = false

    function a1:getWeapon() -- Line: 136
        local Weapon = self.Model:FindFirstChild("Weapon")
        return Weapon and Weapon:FindFirstChild("Weapon")
    end

    function a1:getWeaponConfig() -- Line: 141
        local v1 = self:getWeapon()
        return v1 and v1:FindFirstChild("Configuration")
    end

    local Torso = a1.Model:FindFirstChild("Torso")
    if not a1.FBXModel and Torso then
        SharedControllerFunctions.RegisterJoints(a1, {
            a1.Model.Torso["Left Shoulder"],
            a1.Model.Torso["Right Shoulder"],
            (a1.Model.HumanoidRootPart:FindFirstChild("Neck")),
        })
    end
    local v1 = script.SkinOverrides:FindFirstChild((a1.Model.Name:gsub(" ", "")) .. "Override")
    a1.skinOverride = v1 and require(v1)
    if a1.skinOverride and a1.skinOverride.init then
        a1.skinOverride.init(a1)
    end
    a1:Thread(function() -- Line: 163 -- upvalues: a1 (val), GameState (upval), Cooldown (upval)
        local v1
        if a1._callingBackup then
            v1 = a1.Stats.Attributes.BackupCallTime * GameState.TimeScale
            local v2 = Cooldown.new(v1)
            while v2:isActive() do
                a1:Wait()
            end
            v2:Destroy()
            a1._callingBackup = false
            return
        end
        v1 = a1:FindTarget()
        if not v1 then
            if a1.skinOverride and a1.skinOverride.idle then
                a1.skinOverride.idle(a1)
            end
            return
        end
        a1:_aimAt(v1)
        if not a1.skinOverride or not a1.skinOverride.fire then
            a1:Fire(v1)
        else
            a1.skinOverride.fire(a1, v1)
        end
        a1:Delay(a1.State.Cooldown)
    end)
    a1.Executables = {
        PiggyBank = function() -- Line: 195 -- upvalues: a1 (val)
            if a1.skinOverride and a1.skinOverride.piggyBank then
                a1.skinOverride.piggyBank(a1)
            end
        end,
        CallBackup = function() -- Line: 200 -- upvalues: a1 (val), Animation (upval)
            a1._callingBackup = true
            if a1.skinOverride and a1.skinOverride.backup then
                a1.skinOverride.backup(a1)
                return
            end
            local Level = a1:GetLevel()
            local v1 = if not (Level <= 2) then Level else 0
            if a1._prevAttackAnimIndex ~= v1 then
                a1._summonAnim = Animation.new({
                    Track = a1.Model.Animations.Fire[v1].Summon,
                    Target = a1.Model.AnimationController,
                })
            end
            a1._summonAnim:Play()
        end,
    }
    a1.Maid:Mark(function() -- Line: 221 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            a1._soundPools = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 231 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            for k in a1._soundPools do
                a1._soundPools[k] = nil
            end
        end
    end)
end

return v1