-- Script path: ReplicatedStorage.Content.Tower.Commander.Animator
-- Decompile time: 7.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local EmitterUtil = require(ReplicatedStorage.Shared.Modules.EmitterUtil)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u37 = require("@self/CommanderSkinConfig")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 32
    -- upvalues: Animation (val), SharedControllerFunctions (val), SoundPool (val), EmitterManager (val), u37 (val)
    -- upvalues: EmitterUtil (val), TweenService (val)
    local PrimaryPart = a1.Model.PrimaryPart
    local Rotation = PrimaryPart.CFrame.Rotation
    local AnimationController = a1.Model.AnimationController
    a1._currentState = ""
    a1._animations = {}

    function a1:_loadAnimations() -- Line: 40 -- upvalues: Animation (upval), AnimationController (val)
        local Animations = self.Model:WaitForChild("Animations")
        local v1 = self.Replicator:Get("Upgrade")

        local function loadAnimation(a1, a2) -- Line: 44
            -- upvalues: self (val), Animation (upval), AnimationController (upval)
            local v1 = self._animations[a1]
            local v2 = Animation.new({
                Preload = true,
                Track = a2,
                Target = AnimationController,
                IgnorePriority = a1 == "Stance",
            })
            self._animations[a1] = v2
            if v1 and v1.Controller.IsPlaying then
                if v1.Controller.Looped then
                    v2:Play()
                end
                v1:Stop()
            end
        end

        local Fire = Animations:FindFirstChild("Fire")
        local v2 = Fire and Fire:FindFirstChild((tostring(v1)))
        if v2 then
            for i, j in v2:GetChildren() do
                if j:IsA("Animation") then
                    loadAnimation(j.Name, j)
                end
            end
        end
    end

    function a1:_fire(a2) -- Line: 77
        -- upvalues: SharedControllerFunctions (upval), SoundPool (upval), EmitterManager (upval), u37 (upval)
        local Value, Value_2, v1, v2, v3, v4
        local v5 = self:_getWeaponConfig()
        local PrimaryPart = a2.PrimaryPart
        if not PrimaryPart then
            return
        end
        local Torso = a2:FindFirstChild("Torso")
        local Head = a2:FindFirstChild("Head")
        local Position = Torso and Torso.Position or PrimaryPart.Position
        local Position_2 = Head and Head.Position or Position
        self:Face(Position)
        if not self.FBXModel then
            SharedControllerFunctions.AimArmsAt(self, Position)
            SharedControllerFunctions.AimHeadAt(self, Position_2)
        end
        if not v5 then
            local Gun = self.Model.Weapon:FindFirstChild("Gun")
            local Handle = if not Gun then self.Model.Weapon:FindFirstChild("Revolver1") else Gun:FindFirstChild("Handle") or Gun:FindFirstChild("Gun2")
            Value_2 = Handle:FindFirstChild("Fire")
            v1 = (self.Model:FindFirstChild("Head") or self.PrimaryPart):FindFirstChild("ExtraSound")
            Value = Handle:FindFirstChild("Start")
        else
            Value = v5.FireEffect.Value
            Value_2 = v5.FireSound.Value
            v1 = v5:FindFirstChild("ExtraSound") and v5.ExtraSound.Value
        end
        if Value_2 and Value_2:IsA("Sound") then
            v2 = string.match(Value_2.SoundId or "", "%d+")
            v3 = v2 and tonumber(v2)
            if v3 then
                local _fireSoundPools = self._fireSoundPools or {}
                self._fireSoundPools = _fireSoundPools
                v4 = self._fireSoundPools[v3]
                if not v4 then
                    v4 = SoundPool.new({
                        size = 6,
                        audioGroup = "Towers",
                        id = v3,
                        parent = self.Model.PrimaryPart,
                        volume = Value_2.Volume,
                    })
                    self._fireSoundPools[v3] = v4
                end
                v4:play({
                    playbackSpeed = Random.new():NextNumber(0.8, 1.2),
                    volume = Value_2.Volume,
                })
            end
        end
        if v1 and v1:IsA("Sound") then
            v2 = string.match(v1.SoundId or "", "%d+")
            v3 = v2 and tonumber(v2)
            if v3 then
                local _fireSoundPools_2 = self._fireSoundPools or {}
                self._fireSoundPools = _fireSoundPools_2
                v4 = self._fireSoundPools[v3]
                if not v4 then
                    v4 = SoundPool.new({
                        size = 4,
                        audioGroup = "Towers",
                        id = v3,
                        parent = self.Model.PrimaryPart,
                        volume = v1.Volume,
                    })
                    self._fireSoundPools[v3] = v4
                end
                v4:play({
                    playbackSpeed = Random.new():NextNumber(0.8, 1.2),
                    volume = v1.Volume,
                })
            end
        end
        EmitterManager.manualEmit(Value)
        local WorldPosition = Value:IsA("Attachment") and Value.WorldPosition or Value.Position
        v3 = u37.Overrides.Bullet[self.Model.Name]
        if not v3 then
            self:Bullet({Start = WorldPosition, End = Position, Spread = 40, Speed = 100})
        else
            v3(self, WorldPosition, Position)
        end
        self._animations.Fire:Play()
    end

    function a1:_registerJoints() -- Line: 184 -- upvalues: PrimaryPart (val), SharedControllerFunctions (upval)
        if self.FBXModel then
            return
        end
        local Torso = self.Model:WaitForChild("Torso")
        local v1 = {Torso:WaitForChild("Left Shoulder"), (Torso:WaitForChild("Right Shoulder"))}
        local Gun = PrimaryPart:FindFirstChild("Gun")
        if Gun then
            table.insert(v1, Gun)
        end
        SharedControllerFunctions.RegisterJoints(self, v1)
    end

    function a1:_getModelConfig() -- Line: 202
        return self.Model:FindFirstChild("Configuration")
    end

    function a1:_getWeaponConfig() -- Line: 206
        local Gun = self.Model.Weapon:FindFirstChild("Gun")
        return Gun and Gun:FindFirstChild("Configuration")
    end

    function a1:_changeFace(a2) -- Line: 211
        -- upvalues: EmitterManager (upval), EmitterUtil (upval)
        local v1 = self:_getModelConfig()
        if a2 and self.Model:FindFirstChild("CallOfArmsEffect") then
            EmitterManager.manualEmit(self.Model.CallOfArmsEffect)
        end
        local Head = self.Model:FindFirstChild("Head")
        local v2 = nil
        local v3 = nil
        local Value = nil
        if v1 then
            v2 = v1:FindFirstChild("DefaultFace") and v1.DefaultFace.Value
            v3 = v1:FindFirstChild("AbilityFace") and v1.AbilityFace.Value
            Value = v1.ScreamEffect.Value
        elseif Head then
            v2 = Head:FindFirstChild("face")
            v3 = Head:FindFirstChild("face2")
            Value = Head:FindFirstChild("Scream")
        end
        if not a2 then
            if v2 then
                v2.Transparency = 0
            end
            if v3 then
                v3.Transparency = 1
            end
            if Value then
                EmitterUtil.toggleEmitter(Value, false)
            end
            return
        end
        if v2 then
            v2.Transparency = 1
        end
        if v3 then
            v3.Transparency = 0
        end
        if not Value then
            return
        end
        EmitterUtil.toggleEmitter(Value, true)
    end

    a1.states = {
        Idle = {
            onEnter = function() end,
        },
        ["Call To Arms"] = {
            onEnter = function() -- Line: 264 -- upvalues: a1 (val), SharedControllerFunctions (upval)
                local Equip
                if a1.FBXModel then
                    SharedControllerFunctions.ResetJoints(a1)
                end
                ;(if a1._animations.Equip1 then a1._animations.Equip1 else a1._animations.Equip):Play()
                a1:_changeFace(true)
                a1:Wait(Equip.Controller.Length * 0.95)
                if a1._currentState == "Call To Arms" then
                    a1:_changeState("FireIdle")
                end
            end,
        },
        ["Backup Call"] = {
            onEnter = function() -- Line: 286 -- upvalues: SharedControllerFunctions (upval), a1 (val)
                local Equip
                SharedControllerFunctions.ResetJoints(a1)
                ;(if a1._animations.Equip2 then a1._animations.Equip2 else a1._animations.Equip):Play()
                a1:_changeFace(true)
                a1:Wait(Equip.Controller.Length * 0.95)
                if a1._currentState == "Backup Call" then
                    a1:_changeState("FireIdle")
                end
            end,
        },
        Unequip = {
            onEnter = function() -- Line: 303 -- upvalues: u37 (upval), a1 (val), TweenService (upval), PrimaryPart (val), Rotation (val)
                local v1 = u37.Effects.Unequip[a1.Model.Name]
                if v1 then
                    task.spawn(v1, a1)
                end
                a1._animations.Unequip:Play()
                a1._animations.Stance:Stop()
                a1:_changeFace(false)
                TweenService:Create(PrimaryPart, TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    CFrame = (CFrame.new(a1.Model.PrimaryPart.Position)) * Rotation,
                }):Play()
                a1:Wait(a1._animations.Unequip.Controller.Length)
                if a1._currentState == "Unequip" then
                    a1:_changeState("Idle")
                end
            end,
        },
        Fire = {
            onEnter = function(a1_2) -- Line: 329 -- upvalues: a1 (val)
                a1:_fire(a1_2)
                a1:Wait(a1._animations.Fire.Controller.Length)
                if a1._currentState == "Fire" then
                    a1:_changeState("FireIdle")
                end
            end,
        },
        FireIdle = {
            onEnter = function() -- Line: 338 -- upvalues: a1 (val)
                if not a1._animations.Stance.Controller.IsPlaying then
                    a1._animations.Stance:Play()
                end
            end,
        },
    }

    function a1:_changeState(a2, ...) -- Line: 346 -- types: self: table, a2: string
        local v1 = {...}
        local v2 = self.states[self._currentState]
        self._currentState = a2
        if v2 then
            local onLeave = v2.onLeave
            if onLeave then
                onLeave()
            end
        end
        local v3 = self.states[a2]
        if v3 then
            local onEnter = v3.onEnter
            if onEnter then
                onEnter(table.unpack(v1))
            end
        end
    end

    a1.Executables = {
        Command = function() -- Line: 369 -- upvalues: a1 (val)
            a1:_changeState("Call To Arms")
        end,
        BackupCall = function() -- Line: 372 -- upvalues: a1 (val)
            a1:_changeState("Backup Call")
        end,
        Shoot = function(a1_2) -- Line: 375 -- upvalues: a1 (val)
            if not a1_2 then
                return
            end
            a1:_changeState("Fire", a1_2)
        end,
        Unequip = function() -- Line: 381 -- upvalues: a1 (val)
            a1:_changeState("Unequip")
        end,
    }
    a1:_loadAnimations()
    a1:_registerJoints()
    a1:_changeState("Idle")
    a1.Maid:Mark(function() -- Line: 391 -- upvalues: a1 (val)
        if a1._fireSoundPools then
            for i, j in a1._fireSoundPools do
                j:destroy()
            end
            a1._fireSoundPools = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 400 -- upvalues: a1 (val)
        if a1._fireSoundPools then
            for i, j in a1._fireSoundPools do
                j:destroy()
            end
            table.clear(a1._fireSoundPools)
        end
        a1:_loadAnimations()
    end)
end

return v1