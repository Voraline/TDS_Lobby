-- Script path: ReplicatedStorage.Content.Tower.Pyromancer.Animator
-- Decompile time: 5.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterUtil = require(ReplicatedStorage.Shared.Modules.EmitterUtil)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local PyromancerSkinConfigs = require(script.PyromancerSkinConfigs)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1

local function setEmitterDistance(a1, a2, a3) -- Line: 26 -- types: a1: userdata, a2: number, a3: number
    local Max = a1.Speed.Max
    local v1 = a3 / a2 * 50
    if Max ~= 0 then
        a1.Lifetime = NumberRange.new(a2 / Max)
    end
    a1.SpreadAngle = Vector2.new(v1, v1)
end

function v1:resolveWeaponConfig(a2) -- Line: 36 -- types: self: table, a2: string
    local Weapon = self.Model:FindFirstChild("Weapon")
    if not Weapon then
        return
    end
    local Handle = Weapon:FindFirstChild("Handle")
    local Configuration = Handle and Handle:FindFirstChild("Configuration") or Weapon:FindFirstChild("Configuration")
    if not Configuration then
        return
    end
    local v1 = Configuration:FindFirstChild(a2)
    if not v1 then
        local Attachments = Configuration:FindFirstChild("Attachments")
        v1 = Attachments and Attachments:FindFirstChild(a2)
    end
    if not v1 then
        local Sounds = Configuration:FindFirstChild("Sounds")
        v1 = Sounds and Sounds:FindFirstChild(a2)
    end
    if v1 and v1:IsA("ObjectValue") then
        return v1.Value
    end
    return v1
end

function v1:resolveAttachment(a2) -- Line: 68 -- types: self: table, a2: string
    local v1 = self:resolveWeaponConfig(a2)
    if v1 then
        return v1
    end
    local Weapon = self.Model:FindFirstChild("Weapon")
    local Handle = Weapon and Weapon:FindFirstChild("Handle")
    return Handle and Handle:FindFirstChild(a2)
end

function v1:resolveSound(a2) -- Line: 79 -- types: self: table, a2: string
    local v1 = self:resolveWeaponConfig(a2)
    if v1 then
        return v1
    end
    local PrimaryPart = self.Model.PrimaryPart
    return PrimaryPart and PrimaryPart:FindFirstChild(a2)
end

function v1:AppearFlames(a2) -- Line: 89 -- upvalues: EmitterUtil (val) -- types: self: table, a2: boolean
    local _flameStart = self._flameStart
    local _fireSound = self._fireSound
    if not self.skinConfig or not self.skinConfig.dontToggleEmitter then
        EmitterUtil.toggleEmitter(_flameStart, a2)
    end
    _fireSound.Playing = a2
end

function v1:ScaleFlamesToDistance(a2) -- Line: 99 -- upvalues: setEmitterDistance (val)
    local setEmitterDistance_2 = self.skinConfig and self.skinConfig.setEmitterDistance or setEmitterDistance
    for i, j in self._flameStart:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            setEmitterDistance_2(j, a2, self.Width)
        end
    end
end

function v1:AimAtPosition(a2, a3) -- Line: 112
    -- upvalues: SharedControllerFunctions (val)
    local PrimaryPart = self.Model.PrimaryPart
    local Magnitude = if not a3 then 0 else (a3 - a2).Magnitude
    if self.FBXModel then
        self.PivotLerp = self.PivotLerp:Lerp(a2, self.dt * self.TurningSpeed)
        PrimaryPart.CFrame = PrimaryPart.CFrame:Lerp(self:Face(a2, nil, false), self.dt * self.TurningSpeed)
        return
    end
    self.PivotLerp = self.PivotLerp:Lerp(a2, self.dt * self.TurningSpeed)
    PrimaryPart.CFrame = PrimaryPart.CFrame:Lerp(self:Face(a2, nil, false), self.dt * self.TurningSpeed)
    SharedControllerFunctions.AimArmsAt(self, self.PivotLerp)
    SharedControllerFunctions.AimHeadAt(self, self.PivotLerp + Vector3.new(0, Magnitude, 0))
end

function v1:Fire(a2) -- Line: 131
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso") or a2:FindFirstChild("UpperTorso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or PrimaryPart.Position
    self:AimAtPosition(Position, Position_2)
    if self.skinConfig and self.skinConfig.onFire then
        self.skinConfig.onFire(self, Position, Position_2, a2)
    end
end

function v1:FireAtPosition(a2) -- Line: 150 -- types: self: table, a2: vector
    self:AimAtPosition(a2, a2)
    if self.skinConfig and self.skinConfig.onFire then
        self.skinConfig.onFire(self, a2, a2)
    end
end

function v1.Initialize(a1) -- Line: 158
    -- upvalues: PyromancerSkinConfigs (val), SpringClass (val), EmitterUtil (val), EasySound (val)
    -- upvalues: SharedControllerFunctions (val), NewTween (val), GameState (val)
    local u2 = tick()
    local u3 = false
    a1.skinConfig = PyromancerSkinConfigs[a1.Model.Name]
    a1.dt = 0
    a1.Width = 1
    a1.TurningSpeed = 4
    a1.PivotLerp = (a1.Model.PrimaryPart.CFrame * CFrame.new(0, 0, -2)).Position
    a1._forcedFlameUntil = 0
    a1._forcedFlamePosition = nil
    a1._forcedFlameDistance = nil
    a1._flameStart = nil
    a1._fireSound = nil
    a1.firingWeightSpr = SpringClass.new(0)
    a1.firingWeightSpr.d = 1
    a1.firingWeightSpr.s = 10
    a1.firingWeightSprLastUpdated = tick()
    local u39 = a1:Animate("Fire")
    a1.FireAnim = u39

    local function onUpgrade() -- Line: 181 -- upvalues: u39 (ref), a1 (val), EmitterUtil (upval)
        local v1 = u39
        u39 = a1:Animate("Fire")
        a1.FireAnim = u39
        if u39 ~= v1 and v1 then
            v1:Stop()
        end
        local v2 = a1:resolveAttachment("Start")
        a1._flameStart = v2
        a1._fireSound = a1:resolveSound("Fire")
        if v2 then
            for i, j in v2.Parent:GetChildren() do
                if j:IsA("Attachment") and j ~= v2 then
                    EmitterUtil.toggleEmitter(j, false)
                end
            end
        end
        if not a1.FBXModel and v2 then
            local Flame = v2:FindFirstChild("Flame")
            if Flame then
                local Attachment = Instance.new("Attachment")
                Attachment.Name = "FlameAtt"
                Attachment.Parent = v2.Parent
                Attachment.CFrame = v2.CFrame
                Flame.Parent = Attachment
            end
        end
    end

    onUpgrade()
    a1.Maid:Mark(function() -- Line: 220 -- upvalues: a1 (val), EasySound (upval)
        if a1._loopFirePlayer then
            a1._loopFirePlayer:Stop()
            EasySound.Destroy(a1._loopFirePlayer)
            a1._loopFirePlayer = nil
        end
    end)
    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Shoulder"], a1.Model.Torso["Right Shoulder"]})
    end
    a1.OnUpgrade:Connect(onUpgrade)

    local function startFiring() -- Line: 237 -- upvalues: u3 (ref), a1 (val), NewTween (upval)
        if u3 then
            return
        end
        u3 = true
        a1.firingWeightSpr.t = 1
        local PointLight = a1.Model:FindFirstChild("PointLight", true)
        if PointLight then
            local Brightness = PointLight.Brightness
            NewTween(PointLight, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), function(a1) -- Line: 253 -- upvalues: PointLight (val), Brightness (val)
                PointLight.Brightness = math.lerp(Brightness, 9, a1)
            end)
        end
    end

    local function stopFiring() -- Line: 260 -- upvalues: u3 (ref), a1 (val), NewTween (upval)
        if not u3 then
            return
        end
        u3 = false
        a1.firingWeightSpr.t = 0
        if a1.skinConfig and a1.skinConfig.onFiringStopped then
            a1.skinConfig.onFiringStopped(a1)
        end
        local PointLight = a1.Model:FindFirstChild("PointLight", true)
        if PointLight then
            local Brightness = PointLight.Brightness
            NewTween(PointLight, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), function(a1) -- Line: 280 -- upvalues: PointLight (val), Brightness (val)
                PointLight.Brightness = math.lerp(Brightness, 0, a1)
            end)
        end
    end

    a1:Thread(function() -- Line: 287
        -- upvalues: a1 (val), u2 (ref), GameState (upval), startFiring (val), stopFiring (val), u39 (ref), u3 (ref)
        local v1 = tick()
        a1.dt = (v1 - u2) * GameState.TimeScale
        u2 = v1
        local v2 = a1:FindTarget()
        local _forcedFlamePosition = a1._forcedFlamePosition and v1 <= a1._forcedFlameUntil
        if v2 then
            startFiring()
            a1:ScaleFlamesToDistance(a1.Range)
            a1:Fire(v2)
        elseif not _forcedFlamePosition then
            stopFiring()
        else
            startFiring()
            a1:ScaleFlamesToDistance(a1._forcedFlameDistance or a1.Range)
            a1:FireAtPosition(a1._forcedFlamePosition)
        end
        local v3 = (v1 - a1.firingWeightSprLastUpdated) * GameState.TimeScale
        if v3 >= 0.041666666666666664 then
            a1.firingWeightSprLastUpdated = v1
            v3 = math.max(a1.firingWeightSpr.p, 0.01)
            if u39 then
                u39:AdjustWeight(v3)
            end
        end
        a1:AppearFlames(u3)
    end)
    a1.Executables = {
        FlameVisual = function(a1_2, a2, a3) -- Line: 319
            -- upvalues: a1 (val), GameState (upval)
            a1._forcedFlamePosition = a1_2
            a1._forcedFlameDistance = a2
            local v1 = math.max((a3 or a1.State.Cooldown or a1.Cooldown or 0) + 0.2, 0.2)
            a1._forcedFlameUntil = (tick()) + v1 / math.max(GameState.TimeScale, 0.001)
        end,
    }
    if a1.skinConfig and a1.skinConfig.onInit then
        a1.skinConfig.onInit(a1)
    end
end

return v1