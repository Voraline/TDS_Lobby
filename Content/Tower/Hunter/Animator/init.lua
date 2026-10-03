-- Script path: ReplicatedStorage.Content.Tower.Hunter.Animator
-- Decompile time: 4.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local HunterSkinConfigs = require(script.HunterSkinConfigs)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1
local u41 = Random.new()

function v1:resolveWeaponConfig() -- Line: 17
    local Weapon = self.Model:FindFirstChild("Weapon")
    if not Weapon then
        return
    end
    local Gun = Weapon:FindFirstChild("Gun")
    if not Gun then
        return
    end
    return Gun:FindFirstChildOfClass("Configuration")
end

function v1:resolveAttachment(a2) -- Line: 32 -- types: self: table, a2: string
    local v1 = self:resolveWeaponConfig()
    if not v1 then
        return self.Model.Weapon.Gun.Handle:FindFirstChild(a2)
    end
    local Attachments = v1:FindFirstChild("Attachments")
    if not Attachments then
        return
    end
    local v2 = Attachments:FindFirstChild(a2)
    return v2 and v2.Value
end

function v1:resolveSound(a2) -- Line: 50 -- types: self: table, a2: string
    local v1 = self:resolveWeaponConfig()
    if not v1 then
        return self.Model.Weapon.Gun.Handle:FindFirstChild(a2)
    end
    local Sounds = v1:FindFirstChild("Sounds")
    if not Sounds then
        return
    end
    local v2 = Sounds:FindFirstChild(a2)
    return v2 and v2.Value
end

function v1:Fire(a2) -- Line: 68
    -- upvalues: SharedControllerFunctions (val), GameState (val), u41 (val), EasySound (val), EmitterManager (val)
    -- upvalues: ServerTicks (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    self:Face(Position)
    SharedControllerFunctions.AimArmsAt(self, Position)
    SharedControllerFunctions.AimHeadAt(self, Position_2)
    self.fireAnim:Play(1 * GameState.TimeScale)
    if self.skinConfig and self.skinConfig.onFire then
        self.skinConfig.onFire(self)
    end
    local v1 = self:resolveSound("Fire")
    if v1 then
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = v1.SoundId,
            parent = self.Model.PrimaryPart,
            playbackSpeed = u41:NextNumber(v1.PlaybackSpeed * 0.9, v1.PlaybackSpeed * 1.2),
            volume = v1.Volume,
        })
    end
    local v2 = self:resolveAttachment("Start")
    if v2 then
        EmitterManager.manualEmit(v2)
        self:Bullet({Start = v2.WorldPosition, End = Position, Spread = 30, Speed = 180})
    end
    self:Delay(self.State.Cooldown)
    self.lastStance = ServerTicks.getTime()
end

function v1.Initialize(a1) -- Line: 121
    -- upvalues: ServerTicks (val), HunterSkinConfigs (val), SharedControllerFunctions (val), Animation (val)
    -- upvalues: EasySound (val), GameState (val)
    local PrimaryPart = a1.Model.PrimaryPart
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    local u15 = ServerTicks.getTime()
    a1.lastStance = ServerTicks.getTime()
    a1.aiming = false
    a1.skinConfig = HunterSkinConfigs[a1.Model.Name]
    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {
            a1.Model.Torso["Right Shoulder"],
            a1.Model.Torso["Left Shoulder"],
            a1.Model.PrimaryPart.Handle,
        })
    end
    a1.stanceAnim = Animation.new({
        IgnorePriority = true,
        Track = Animations.Stance.Stance,
        Target = AnimationController,
    })
    a1.fireAnim = Animation.new({Preload = true, Track = Animations.Fire.Fire, Target = AnimationController})
    ;(a1.fireAnim.Controller:GetMarkerReachedSignal("Sound")):Connect(function(a1_2) -- Line: 157 -- upvalues: a1 (val), EasySound (upval), GameState (upval)
        local v1 = a1.Model.Head:FindFirstChild(a1_2)
        if v1 and v1:IsA("Sound") then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = v1.SoundId,
                parent = a1.Model.Head,
                playbackSpeed = GameState.TimeScale,
            })
        end
    end)

    local function v1() -- Line: 171 -- upvalues: a1 (val)
        return a1.stanceAnim.Controller and a1.stanceAnim.Controller.IsPlaying == true
    end

    local function v2() -- Line: 175 -- upvalues: a1 (val), GameState (upval)
        local Controller = a1.stanceAnim.Controller and a1.stanceAnim.Controller.IsPlaying == true
        if not Controller then
            a1.stanceAnim:Play(0.5 * GameState.TimeScale)
        end
    end

    a1:Thread(function() -- Line: 181 -- upvalues: a1 (val), ServerTicks (upval), u15 (ref), GameState (upval), PrimaryPart (val)
        local v1 = a1:FindTarget()
        local v2 = ServerTicks.getTime()
        local v3 = v2 - u15
        u15 = v2
        if not v1 then
            a1.aiming = false
        else
            local PrimaryPart_2 = v1.PrimaryPart
            if a1.aiming == false then
                a1.aiming = true
                local Controller = a1.stanceAnim.Controller and a1.stanceAnim.Controller.IsPlaying == true
                if not Controller then
                    a1.stanceAnim:Play(0.5 * GameState.TimeScale)
                end
            end
            if PrimaryPart_2 and a1.aiming then
                PrimaryPart.CFrame = PrimaryPart.CFrame:Lerp(a1:Face(PrimaryPart_2.Position, nil, false), v3 * 4)
                local Controller_2 = a1.stanceAnim.Controller and a1.stanceAnim.Controller.IsPlaying == true
                if not Controller_2 then
                    a1.stanceAnim:Play(0.5 * GameState.TimeScale)
                end
            end
        end
        if a1.aiming == false and 5 <= v2 - a1.lastStance then
            local Controller_3 = a1.stanceAnim.Controller and a1.stanceAnim.Controller.IsPlaying == true
            if Controller_3 then
                a1.stanceAnim:Stop(0.4 * GameState.TimeScale)
            end
        end
    end)
    a1.Executables = {
        Fire = function(a1_2) -- Line: 215 -- upvalues: a1 (val)
            a1:Fire(a1_2)
        end,
    }
    if a1.skinConfig and a1.skinConfig.onInit then
        a1.skinConfig.onInit(a1)
    end
end

return v1