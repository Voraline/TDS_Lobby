-- Script path: ReplicatedStorage.Content.Tower.Shotgunner.Animator
-- Decompile time: 4.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1

function v1:Fire(a2) -- Line: 13
    -- upvalues: SoundPool (val), GameState (val), EmitterManager (val), SharedControllerFunctions (val)
    local v1, v2
    _, v1, v2 = self._getWeapon()
    local Value = v1 and v1.Start.Value or v2.Start
    local Value_2 = v1 and v1.Fire.Value or v2:FindFirstChild("Fire")
    if Value_2 and Value_2:IsA("Sound") then
        local _soundPools = self._soundPools or {}
        self._soundPools = _soundPools
        local v3 = self._soundPools[Value_2]
        if not v3 then
            local v4 = string.match(Value_2.SoundId or "", "%d+")
            local v5 = v4 and tonumber(v4)
            if v5 then
                v3 = SoundPool.new({
                    size = 5,
                    audioGroup = "Towers",
                    timeScaled = true,
                    id = v5,
                    parent = self.Model.PrimaryPart,
                    volume = Value_2.Volume,
                })
                self._soundPools[Value_2] = v3
            end
        end
        if v3 then
            v3:play({
                playbackSpeed = (Random.new()):NextNumber(Value_2.PlaybackSpeed * 0.9, Value_2.PlaybackSpeed * 1.2),
                volume = Value_2.Volume,
            })
        end
    end
    self._fireAnim:Play()
    local Length = self._fireAnim.Controller.Length
    if Length then
        local Cooldown = self.State.Cooldown
        if Cooldown < Length then
            self._fireAnim.Controller:AdjustSpeed(1 / (Cooldown / Length) * GameState.TimeScale)
        end
    end
    if Value then
        EmitterManager.manualEmit(Value)
    end
    self:Face(a2)
    SharedControllerFunctions.AimArmsAt(self, a2)
    SharedControllerFunctions.AimHeadAt(self, a2)
end

function v1.Initialize(a1) -- Line: 71 -- upvalues: Animation (val), SoundPool (val), SharedControllerFunctions (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._fireAnim = nil

    function a1._getWeapon() -- Line: 77 -- upvalues: a1 (val)
        local Gun = a1.Model.Weapon.Gun
        local Configuration = Gun:FindFirstChild("Configuration")
        return Gun, Configuration, not Configuration and Gun:FindFirstChild("Handle")
    end

    local function updateFireAnim(a1_2) -- Line: 85
        -- upvalues: Animations (val), Animation (upval), AnimationController (val), a1 (val), SoundPool (upval)
        if a1_2 == 0 or a1_2 == 2 then
            local v1 = Animations.Fire:FindFirstChild(a1_2)
            if v1 then
                local v2 = Animation.new({Preload = true, Track = v1.Fire, Target = AnimationController})
                ;(v2.Controller:GetMarkerReachedSignal("Sound")):Connect(function(a1_2) -- Line: 94 -- upvalues: a1 (upval), SoundPool (upval)
                    local v1, v2
                    _, v1, v2 = a1._getWeapon()
                    local Value = v1 and v1[a1_2].Value or v2:FindFirstChild(a1_2)
                    if Value and Value:IsA("Sound") then
                        local v3 = a1
                        local _soundPools = a1._soundPools or {}
                        v3._soundPools = _soundPools
                        v3 = a1._soundPools[Value]
                        if not v3 then
                            local v4 = string.match(Value.SoundId or "", "%d+")
                            local v5 = v4 and tonumber(v4)
                            if v5 then
                                v3 = SoundPool.new({
                                    size = 3,
                                    audioGroup = "Towers",
                                    timeScaled = true,
                                    id = v5,
                                    parent = a1.Model.PrimaryPart,
                                    volume = Value.Volume,
                                })
                                a1._soundPools[Value] = v3
                            end
                        end
                        if v3 then
                            v3:play({playbackSpeed = Value.PlaybackSpeed, volume = Value.Volume})
                        end
                    end
                end)
                a1._fireAnim = v2
            end
        end
    end

    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {
            a1.Model.Torso["Left Shoulder"],
            a1.Model.Torso["Right Shoulder"],
            a1.Model.HumanoidRootPart.Gun,
        })
    end
    a1.OnUpgrade:Connect(updateFireAnim)
    updateFireAnim(0)
    a1.Maid:Mark(function() -- Line: 140 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            a1._soundPools = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 149 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            for k in a1._soundPools do
                a1._soundPools[k] = nil
            end
        end
    end)
    a1.Executables = {
        Gun = function(a1_2, a2) -- Line: 161 -- upvalues: a1 (val)
            if a1.Model and a1.Model:FindFirstChild("Weapon") then
                local v1, v2
                _, v1, v2 = a1._getWeapon()
                local Value = v1 and v1.Start.Value or v2.Start
                if not Value then
                    return
                end
                a1:Fire(a1_2)
                local Attribute = v1 and v1:GetAttribute("BulletType") or "Normal"
                for k, v in pairs(a2) do
                    a1:Bullet({
                        Start = Value.WorldPosition,
                        End = v,
                        Spread = 50,
                        Speed = 140,
                        Bullet = Attribute,
                    })
                end
                return
            end
        end,
    }
end

return v1