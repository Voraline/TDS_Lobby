-- Script path: ReplicatedStorage.Content.Tower.Cryomancer.Animator
-- Decompile time: 5.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1

local function lerp(a1, a2, a3) -- Line: 15
    return (1 - a3) * a1 + a3 * a2
end

function v1:_refreshLoopSound(a2) -- Line: 22 -- upvalues: EasySound (val) -- types: self: table, a2: boolean?
    local v1
    if self._loopPlayer then
        EasySound.Destroy(self._loopPlayer)
        self._loopPlayer = nil
    end
    local Handle = self.Model.Weapon.Gun:FindFirstChild("Handle")
    if not Handle then
        return
    end
    local v2 = {("Fire%*"):format((self:GetLevel())), "FireMax", "Fire"}
    local v3 = nil
    for i, v in ipairs(v2) do
        v1 = Handle:FindFirstChild(v)
        if v1 and v1:IsA("Sound") then
            v3 = v1
            break
        end
    end
    if not v3 then
        return
    end
    local v4 = string.match(v3.SoundId or "", "%d+")
    self._loopPlayer = EasySound.Create({
        looped = true,
        audioGroup = "Towers",
        id = v4 and tonumber(v4) or v3.SoundId,
        parent = Handle,
        volume = if not a2 then 0 else self.currentSFXVolume or 0.5,
    })
    self._loopPlayer:Play()
end

function v1:FireSound(a2) -- Line: 60
    if a2 then
        self.goalSFXVolume = 0
        return
    end
    if not self._loopPlayer then
        self:_refreshLoopSound(true)
    end
    self.currentSFXVolume = 0.5
    self.goalSFXVolume = 0.5
end

function v1:Fire(a2) -- Line: 72 -- upvalues: SharedControllerFunctions (val)
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
    self:FireSound(false)
    self:SetStanceAnimation(if not (3 <= (self:GetLevel())) then 0 else 3, "Fire")
    self:Delay(0.05)
end

function v1:EmitBeam() -- Line: 95
    local Attribute, v1, v2, v3
    local _beamStart = self._beamStart
    if not _beamStart then
        return
    end
    local v4 = self
    for k, v in pairs(_beamStart:GetChildren()) do
        if v:IsA("ParticleEmitter") then
            v3 = v:GetAttribute("EmitCount") or 1
            Attribute = v:GetAttribute("CanAdjust")
            if v3 then
                if Attribute then
                    v1 = v4.regionLength / v.Speed.Max
                    v.Lifetime = NumberRange.new(v1, v1)
                    v2 = math.deg((math.atan2(v4.Stats.Attributes.Width / 2, v4.regionLength)))
                    v.SpreadAngle = Vector2.new(v2, v2)
                end
                v:Emit(v3)
            end
        end
    end
end

function v1:UpdateLoopSoundVolume(a2) -- Line: 122 -- upvalues: GameState (val) -- types: self: table, a2: number
    local currentSFXVolume = self.currentSFXVolume
    local goalSFXVolume = self.goalSFXVolume
    local v1 = a2 * 10 * GameState.TimeScale
    self.currentSFXVolume = (1 - v1) * currentSFXVolume + v1 * goalSFXVolume
    if self._loopPlayer then
        self._loopPlayer.Volume = self.currentSFXVolume
    end
end

function v1:SetStanceAnimation(a2, a3, a4) -- Line: 131
    local v1 = nil
    local v2 = 0
    if a2 and a3 and a3 ~= "" then
        v1 = self.animationStances[a2][a3]
        if v1 then
            if self.currentAnimation == v1 then
                return
            end
            v1:Play()
            if a4 then
                if v1.Looped then
                    a4 = math.clamp(a4 - 0.1, 0, (1 / 0))
                end
                v1:AdjustSpeed(a4)
            end
        end
    end
    for k, v in pairs(self.animationStances) do
        for k2, i in pairs(v) do
            if i.IsPlaying and k2 == a3 then
                v2 = v1.Length * (i.TimePosition / i.Length)
            end
            if v1 == "" or i ~= v1 then
                i:Stop()
            end
        end
    end
    if v1 then
        v1.TimePosition = v2
        self.currentAnimation = v1
    end
    self.currentStance = a3
end

function v1.Initialize(a1) -- Line: 177
    -- upvalues: SharedControllerFunctions (val), EasySound (val), RunService (val), GameState (val)
    local v1, v2
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Handle = a1.Model.Weapon:WaitForChild("Gun"):WaitForChild("Handle")
    a1.firing = false
    a1.reloading = false
    a1.regionLength = 0
    a1._beamStart = Handle:WaitForChild("Start")
    a1.currentSFXVolume = 0
    a1.goalSFXVolume = 0
    SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Shoulder"], a1.Model.Torso["Right Shoulder"]})
    a1.currentStance = ""
    a1.currentAnimation = nil
    a1.animationStances = {}
    for k, v in pairs(a1.Model.Animations:WaitForChild("Fire"):GetChildren()) do
        v2 = tonumber(v.Name)
        a1.animationStances[v2] = {}
        for k2, i in pairs(v:GetChildren()) do
            v1 = a1.animationStances[v2]
            v1[i.Name] = (AnimationController:LoadAnimation(i))
        end
    end
    a1.Maid:Mark(function() -- Line: 210 -- upvalues: a1 (val), EasySound (upval)
        if a1._loopPlayer then
            EasySound.Destroy(a1._loopPlayer)
            a1._loopPlayer = nil
        end
    end)
    a1.Maid:Mark((RunService.RenderStepped:Connect(function(a1_2) -- Line: 216 -- upvalues: a1 (val) -- types: a1_2: number
        a1:UpdateLoopSoundVolume(a1_2)
        if a1.firing then
            a1:EmitBeam()
        end
    end)))

    function a1.OnStepFunction(a1_2) -- Line: 223 -- upvalues: a1 (val), GameState (upval) -- types: a1_2: number
        if not a1.firing then
            a1.regionLength = 0
            return
        end
        local Range = a1:GetRange()
        local HitboxSpeed = a1.Stats.Attributes.HitboxSpeed
        local v1 = a1
        local regionLength = a1.regionLength
        local v2 = a1_2 * HitboxSpeed * GameState.TimeScale
        v1.regionLength = (1 - v2) * regionLength + v2 * Range
    end

    a1.Executables = {
        Reload = function(a1_2) -- Line: 235 -- upvalues: a1 (val)
            a1.reloading = true
            local Handle = a1.Model.Weapon.Gun:FindFirstChild("Handle")
            a1:SetStanceAnimation(if not (3 <= (a1:GetLevel())) then 0 else 3, "Reload")
            Handle.Reload:Play()
            a1:Delay(a1_2)
            a1.reloading = false
        end,
    }
    a1:Thread(function() -- Line: 249 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if not a1.reloading and v1 then
            a1.firing = true
            a1:Fire(v1)
            return
        end
        a1.firing = false
        a1:FireSound(true)
        if not a1.reloading then
            a1:SetStanceAnimation(nil, "")
        end
    end)
    if a1.OnUpgrade then
        a1.OnUpgrade:Connect(function() -- Line: 266 -- upvalues: a1 (val)
            a1:_refreshLoopSound(a1.firing)
        end)
    end
end

return v1