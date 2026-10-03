-- Script path: ReplicatedStorage.Content.Tower.Militant.Animator
-- Decompile time: 4.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local MilitantSkinConfig = require(script.MilitantSkinConfig)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1
local u36 = Random.new()

local function extractNumericId(a1) -- Line: 18
    if typeof(a1) == "number" then
        return a1
    end
    local v1 = tostring(a1)
    local v2 = tonumber((v1:match("(%d+)$")))
    assert(v2, "Animator: could not extract numeric sound id from " .. v1)
    return v2
end

local function getWeaponHandle(a1, a2) -- Line: 28 -- types: a1: userdata, a2: boolean?
    if a2 then
        return a1.Weapon.Gun.Configuration.Handle.Value
    end
    return a1.Weapon.Gun.Handle
end

local function getWeaponStart(a1, a2) -- Line: 36 -- types: a1: userdata, a2: boolean?
    if a2 then
        return a1.Weapon.Gun.Configuration.Start.Value
    end
    return a1.Weapon.Gun.Handle.Start
end

function v1:Fire(a2) -- Line: 44 -- upvalues: SharedControllerFunctions (val), u36 (val), EmitterManager (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Model = self.Model
    local Value = if not self.FBXModel then Model.Weapon.Gun.Handle else Model.Weapon.Gun.Configuration.Handle.Value
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    self:Face(Position)
    if not self.FBXModel then
        SharedControllerFunctions.AimArmsAt(self, Position)
        SharedControllerFunctions.AimHeadAt(self, Position_2)
    end
    if self.FireAnim then
        self.FireAnim:Play()
    end
    if self.Stance then
        self.Stance:Play()
    end
    local Model_2 = self.Model
    local Value_2 = if not self.FBXModel then Model_2.Weapon.Gun.Handle.Start else Model_2.Weapon.Gun.Configuration.Start.Value
    if not self.skinConfig or not self.skinConfig.onFire then
        local Fire = Value:FindFirstChild((("Fire%*"):format((self:GetLevel())))) or Value:FindFirstChild("Fire")
        if Fire and Fire:IsA("Sound") then
            if not self._firePool then
                self:_initFireSoundPool(Fire, Value)
            end
            self._firePool:play({playbackSpeed = u36:NextNumber(0.9, 1.1), volume = Fire.Volume})
        end
        EmitterManager.manualEmit(Value_2)
        self:Bullet({Start = Value_2.WorldPosition, End = Position, Spread = 50, Speed = 100})
    else
        self.skinConfig.onFire(self, Value_2.WorldPosition, Position)
    end
    self:Delay((self:GetCooldown()))
    self.LastStance = tick()
end

function v1:_initFireSoundPool(a2, a3) -- Line: 106
    -- upvalues: SoundPool (val)
    local v1
    local SoundId = a2.SoundId
    if typeof(SoundId) ~= "number" then
        local v2 = tostring(SoundId)
        local v3 = tonumber((v2:match("(%d+)$")))
        assert(v3, "Animator: could not extract numeric sound id from " .. v2)
        v1 = v3
    else
        v1 = SoundId
    end
    self._firePool = SoundPool.new({
        size = 4,
        audioGroup = "Towers",
        timeScaled = true,
        id = v1,
        parent = a3,
        volume = a2.Volume,
    })
    self.Maid:Mark(function() -- Line: 117 -- upvalues: self (val)
        if self._firePool then
            self._firePool:destroy()
            self._firePool = nil
        end
    end)
end

function v1.Initialize(a1) -- Line: 125
    -- upvalues: MilitantSkinConfig (val), Animation (val), SharedControllerFunctions (val), GameState (val)
    a1.LastStance = tick()
    a1.skinConfig = MilitantSkinConfig[a1.Model.Name]
    if not a1.skinConfig then
        if not a1.skinConfig then
            a1.FireAnim = Animation.new({
                Preload = true,
                Track = a1.Model.Animations.Fire[0].Fire,
                Target = a1.Model.AnimationController,
            })
            a1.Stance = Animation.new({
                IgnorePriority = true,
                Preload = true,
                Track = a1.Model.Animations.Stance[0],
                Target = a1.Model.AnimationController,
            })
        end
    elseif not a1.skinConfig.dontLoadAnimations or not a1.skinConfig then
        a1.FireAnim = Animation.new({
            Preload = true,
            Track = a1.Model.Animations.Fire[0].Fire,
            Target = a1.Model.AnimationController,
        })
        a1.Stance = Animation.new({
            IgnorePriority = true,
            Preload = true,
            Track = a1.Model.Animations.Stance[0],
            Target = a1.Model.AnimationController,
        })
    end
    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {
            a1.Model.Torso["Left Shoulder"],
            a1.Model.Torso["Right Shoulder"],
            a1.Model.PrimaryPart.Handle,
        })
    end
    local v1 = nil
    if not a1.skinConfig then
        if not a1.skinConfig then
            v1 = a1.Model.Animations.Fire[0]:FindFirstChild("Outro")
        end
    elseif not a1.skinConfig.dontLoadAnimations or not a1.skinConfig then
        v1 = a1.Model.Animations.Fire[0]:FindFirstChild("Outro")
    end
    if v1 then
        a1._outroAnimation = Animation.new({Preload = true, Track = v1, Target = a1.Model.AnimationController})
    end
    local Model = a1.Model
    local Fire = (if not a1.FBXModel then Model.Weapon.Gun.Handle else Model.Weapon.Gun.Configuration.Handle.Value):FindFirstChild("Fire")
    if Fire and Fire:IsA("Sound") then
        local Value
        a1:_initFireSoundPool(Fire, Value)
    end
    a1.OnUpgrade:Connect(function() -- Line: 172 -- upvalues: a1 (val)
        local Model = a1.Model
        local Fire = (if not a1.FBXModel then Model.Weapon.Gun.Handle else Model.Weapon.Gun.Configuration.Handle.Value):FindFirstChild("Fire")
        if a1._firePool then
            a1._firePool:destroy()
            a1._firePool = nil
        end
        if Fire and Fire:IsA("Sound") then
            local Value
            a1:_initFireSoundPool(Fire, Value)
        end
    end)
    a1:Thread(function() -- Line: 184 -- upvalues: a1 (val), GameState (upval)
        local v1 = a1:FindTarget()
        if v1 then
            a1:Fire(v1)
            return
        end
        if a1.skinConfig and a1.skinConfig.onIdle then
            a1.skinConfig.onIdle(a1)
            return
        end
        if a1.Stance.Controller.IsPlaying == true and 5 <= (tick() - a1.LastStance) * GameState.TimeScale then
            if a1._outroAnimation then
                a1._outroAnimation:Play()
                a1.Stance:Stop()
                return
            end
            a1.Stance:Stop(0.8)
        end
    end)
    if a1.skinConfig and a1.skinConfig.onInit then
        a1.skinConfig.onInit(a1)
    end
end

return v1