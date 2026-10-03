-- Script path: ReplicatedStorage.Content.Unit.Humvee 3.Animator
-- Decompile time: 7.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1
local u43 = Random.new()

local function leftOrRight() -- Line: 20 -- upvalues: u43 (val)
    if u43:NextInteger(0, 1) then
        return 1
    end
    return -1
end

local u45 = {}
local u46 = {}

function v1:_getOrCreatePool(a2) -- Line: 33 -- upvalues: SoundPool (val) -- types: self: table, a2: userdata
    local _soundPools = self._soundPools or {}
    self._soundPools = _soundPools
    local u27 = self._soundPools[a2]
    if not u27 then
        local v1 = string.match(a2.SoundId or "", "%d+")
        local v2 = v1 and tonumber(v1) or nil
        if v2 then
            u27 = SoundPool.new({
                size = 4,
                audioGroup = "Towers",
                timeScaled = true,
                id = v2,
                parent = a2.Parent,
                volume = a2.Volume,
            })
            self._soundPools[a2] = u27
            if self.Maid then
                self.Maid:Mark(function() -- Line: 50 -- upvalues: u27 (ref)
                    u27:destroy()
                end)
            end
        end
    end
    return u27
end

function v1.Face(a1, a2, a3, a4) -- Line: 59
    -- upvalues: u46 (val), u45 (val), spr (val), RunService (val), GameState (val)
    local v1
    if not a3:IsA("Bone") then
        local lookVector_2 = a3.Part1.CFrame.lookVector
        local Unit_2 = (a2 - a3.Part1.Position).Unit
        v1 = math.deg((math.atan2(lookVector_2.Z, lookVector_2.X)) - (math.atan2(Unit_2.Z, Unit_2.X))) * 0.017453292519943295
        local C0 = a3.C0
        if not u46[a3] then
            u46[a3] = a3.C0
        end
        if u45[a3] then
            spr.stop(a3)
            u45[a3]:Disconnect()
        end
        a3.C0 = C0 * CFrame.Angles(0, v1, 0)
        local u122 = tick()
        u45[a3] = (RunService.Heartbeat:Connect(function(a1) -- Line: 115 -- upvalues: u122 (val), GameState (upval), spr (upval), a3 (val), u46 (upval), u45 (upval)
            if 4 < (tick() - u122) * GameState.TimeScale then
                spr.target(a3, 1, 0.5 * GameState.TimeScale, {C0 = u46[a3]})
                u45[a3]:Disconnect()
            end
        end))
        return
    end
    local lookVector = a3.WorldCFrame.lookVector
    local Unit = (a2 - a3.WorldPosition).Unit
    v1 = math.deg((math.atan2(lookVector.Z, lookVector.X)) - (math.atan2(Unit.Z, Unit.X))) * 0.017453292519943295
    local CFrame_2 = a3.CFrame
    if not u46[a3] then
        u46[a3] = a3.CFrame
    end
    if u45[a3] then
        spr.stop(a3)
        u45[a3]:Disconnect()
    end
    local v2 = CFrame_2 * CFrame.Angles(0, v1, 0)
    a3.CFrame = a4 and a4(v2) or v2
    local u65 = tick()
    u45[a3] = (RunService.Heartbeat:Connect(function(a1) -- Line: 83 -- upvalues: u65 (val), GameState (upval), spr (upval), a3 (val), u46 (upval), u45 (upval)
        if 4 < (tick() - u65) * GameState.TimeScale then
            spr.target(a3, 1, 0.5 * GameState.TimeScale, {CFrame = u46[a3]})
            u45[a3]:Disconnect()
        end
    end))
end

function v1:Fire(a2) -- Line: 123 -- upvalues: u43 (val), GameState (val), EmitterManager (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Position = PrimaryPart.Position
    if self.FBXModel then
        self.Animations.Fire:Play()
        local Fire = self.Model.TurretFire.Fire
        local v1 = self:_getOrCreatePool(Fire)
        local v2 = (u43:NextNumber(0.88, 1)) * GameState.TimeScale
        if not v1 then
            Fire.PlaybackSpeed = v2
            Fire:Play()
        else
            v1:play({playbackSpeed = v2, volume = Fire.Volume})
        end
        EmitterManager.manualEmit(self.Model.TurretFire.Start)
        local TurretBone = self.Model:FindFirstChild("TurretBone")
        local GunnerBone = self.Model:FindFirstChild("GunnerBone")
        if TurretBone and TurretBone.Value then
            self:Face(Position, TurretBone.Value)
        end
        if GunnerBone and GunnerBone.Value then
            self:Face(Position, GunnerBone.Value, function(a1) -- Line: 150 -- upvalues: TurretBone (val)
                return TurretBone.Value.CFrame * CFrame.new(0, 0, 0.2)
            end)
        end
        self:Bullet({
            Start = self.Model.TurretFire.Position,
            End = Position,
            Spread = 50,
            Speed = 140,
        })
        self:Delay(self.Cooldown)
        return
    end
    local Torso = self.Model.Chasis:FindFirstChild("Torso")
    local Rotate = self.Model.Chasis:FindFirstChild("Rotate")
    if Torso then
        self:Face(Position, self.Model.Chasis.Torso)
    end
    if Rotate then
        self:Face(Position, self.Model.Chasis.Rotate)
    end
    self.Animations.Fire:Play()
    local Handle = self.Model.Weapon.Gun.Handle
    local Fire_2 = Handle.Fire
    local Start = Handle.Start
    local v3 = self:_getOrCreatePool(Fire_2)
    local v4 = u43:NextNumber(0.88, 1)
    if not v3 then
        Fire_2.PlaybackSpeed = v4
        Fire_2:Play()
    else
        v3:play({playbackSpeed = v4, volume = Fire_2.Volume})
    end
    EmitterManager.manualEmit(Start)
    self:Bullet({Start = Start.WorldPosition, End = Position, Spread = 50, Speed = 140})
    self:Delay(self.Cooldown)
end

function v1.Initialize(a1) -- Line: 203
    -- upvalues: u43 (val), Animation (val), EffectsController (val), ReplicatedStorage (val), spr (val)
    -- upvalues: RunService (val)
    local v1
    a1.Model.PrimaryPart:WaitForChild("Drive"):Play()
    a1.Replicator:Set("Name", "Humvee")
    local u20 = a1.Replicator:Get("Health")
    ;(a1.Replicator:GetStateChangedSignal("Health")):Connect(function() -- Line: 208 -- upvalues: a1 (val), u20 (val), u43 (upval)
        if (a1.Replicator:Get("Health")) < u20 then
            local Hit = a1.Model.PrimaryPart.Hit
            local v1 = a1:_getOrCreatePool(Hit)
            local v2 = u43:NextNumber(0.88, 1)
            if v1 then
                v1:play({playbackSpeed = v2, volume = Hit.Volume})
                return
            end
            Hit.PlaybackSpeed = v2
            Hit:Play()
        end
    end)
    a1.Animations = {}
    for i, j in {"Fire", "Walk"} do
        v1 = Animation.new({
            IgnorePriority = true,
            Track = a1.Model.Animations:WaitForChild(j),
            Target = (a1.Model:WaitForChild("AnimationController")):WaitForChild("Animator"),
        })
        a1.Animations[j] = v1
    end
    a1.Animations.Walk:Play()
    if a1.Maid then
        a1.Maid:Mark(function() -- Line: 239 -- upvalues: a1 (val)
            if a1._soundPools then
                for k, v in pairs(a1._soundPools) do
                    v:destroy()
                end
                a1._soundPools = nil
            end
        end)
    end
    a1.Executables = {
        Death = function(a1_2) -- Line: 250
            -- upvalues: a1 (val), u43 (upval), EffectsController (upval), ReplicatedStorage (upval), spr (upval)
            -- upvalues: RunService (upval)
            local v1
            a1.Animations.Walk:Stop()
            local Death = a1.Model.PrimaryPart.Death
            local v2 = a1:_getOrCreatePool(Death)
            local PlaybackSpeed = not (Death.PlaybackSpeed == 0) and Death.PlaybackSpeed or 1
            if not v2 then
                Death.PlaybackSpeed = PlaybackSpeed
                Death:Play()
            else
                v2:play({playbackSpeed = PlaybackSpeed, volume = Death.Volume})
            end
            a1.Dead = true
            local v3 = u43:NextNumber(-40, 40)
            local CFrame_2 = a1.Model.PrimaryPart.CFrame
            local new = CFrame.new
            local v4 = CFrame_2 * new((if not u43:NextInteger(0, 1) then -1 else 1) * 2.5, -0.5, 0) * CFrame.Angles(0, math.rad(v3), 0)
            for k, v in pairs(a1.Model:GetDescendants()) do
                if v:IsA("SpecialMesh") then
                    v.TextureId = ""
                elseif v:IsA("BasePart") then
                    v.BrickColor = BrickColor.new("Black")
                    v.Material = Enum.Material.CorrodedMetal
                    if v:IsA("MeshPart") then
                        v.TextureID = ""
                    end
                end
            end
            EffectsController.Explosion({Radius = 3, Position = a1.Model.Hitbox.Position})
            for i, j in ReplicatedStorage.Assets.Effects.Client.VehicleFlames:GetChildren() do
                v1 = j:Clone()
                v1.Parent = a1.Model.Hitbox
            end
            a1.Model.PrimaryPart:WaitForChild("Drive"):Stop()
            local NumberValue = Instance.new("NumberValue")
            NumberValue.Value = 1
            spr.target(a1.Model.PrimaryPart, 0.36, 2, {CFrame = v4})
            spr.target(NumberValue, 1, 3, {Value = 0.8})
            local v5 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 305 -- upvalues: a1 (upval), NumberValue (val)
                a1.Model:ScaleTo(NumberValue.Value)
            end)
            a1:Delay(a1_2)
            NumberValue:Destroy()
            spr.stop(NumberValue)
            if a1.Model and a1.Model.Parent and a1.Model.PrimaryPart then
                spr.stop(a1.Model.PrimaryPart)
            end
            v5:Disconnect()
        end,
    }
    a1:Thread(function() -- Line: 319 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 and a1:IsAlive() then
            a1:Fire(v1)
        end
    end)
end

return v1