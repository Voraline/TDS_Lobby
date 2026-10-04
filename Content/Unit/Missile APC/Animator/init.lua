-- Script path: ReplicatedStorage.Content.Unit.Missile APC.Animator
-- Decompile time: 4.44 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Sift = require(ReplicatedStorage.Packages.Sift)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u52 = require("@self/MissileApcSkinConfig")
local v1 = {}
v1.__index = v1

function v1:_getModelConfig() -- Line: 32
    return self.Model:FindFirstChild("Configuration")
end

function v1:_aimJoint(a2, a3) -- Line: 36
    -- upvalues: TimescaleUtilities (val), TweenService (val)
    local u13 = self._originalCFrames[a2]
    if not u13 then
        u13 = a2:IsA("Bone") and a2.CFrame or a2.C0
        self._originalCFrames[a2] = u13
    end
    if self._resetAimThreads[a2] then
        task.cancel(self._resetAimThreads[a2])
        self._resetAimThreads[a2] = nil
    end
    if self._resetTweens[a2] then
        self._resetTweens[a2]:Cancel()
        self._resetTweens[a2] = nil
    end
    local v1 = u13 * a3
    if a2:IsA("Bone") then
        a2.CFrame = v1
    elseif a2:IsA("Motor6D") then
        a2.C0 = v1
    end
    self._resetAimThreads[a2] = (TimescaleUtilities.Delay(4, function() -- Line: 60 -- upvalues: self (val), a2 (val), u13 (ref), TweenService (upval)
        if self:IsAlive() then
            local v1 = a2:IsA("Bone") and {CFrame = u13} or {C0 = u13}
            local v2 = TweenService:Create(a2, TweenInfo.new(1), v1)
            v2:Play()
            self._resetTweens[a2] = v2
        end
    end))
end

function v1:_aimHorizontal(a2, a3) -- Line: 72
    local PrimaryPart = self.Model.PrimaryPart
    local lookVector = PrimaryPart.CFrame.lookVector
    local Unit = (a2 - PrimaryPart.Position).Unit
    self:_aimJoint(
        a3,
        (CFrame.Angles(0, (math.deg((math.atan2(lookVector.Z, lookVector.X)) - (math.atan2(Unit.Z, Unit.X)))) * 0.017453292519943295, 0))
    )
end

function v1:_aimVertical(a2, a3) -- Line: 85 -- upvalues: ItemDrop (val) -- types: self: table, a2: table
    self:_aimJoint(a3, (CFrame.Angles(math.atan2((self.Model.PrimaryPart.Position - (ItemDrop.StepWithGV(
        a2.start,
        a2.goal,
        0.5,
        a2.gravity,
        a2.velocity,
        ItemDrop.GetTimeToDestinationWithGV(a2.start, a2.goal, a2.gravity, a2.velocity)
    ))).magnitude, (a2.start - a2.goal).magnitude) * 2, 0, 0)))
end

function v1:_fireMissile(a2, a3) -- Line: 107
    -- upvalues: EasySound (val), EmitterManager (val), ItemDrop (val), Debris (val), u52 (val), EffectsController (val)
    -- upvalues: Sift (val)
    local Value, Value_2, Value_3, Value_4, Value_5
    local Name = self.Model.Name
    local v1 = self:_getModelConfig()
    if not v1 then
        Value = self.Model.Chasis.HeadRotate
        Value_2 = self.Model.Weapon.Head.AimAt
        Value_3 = self.Model.Weapon.Head.Fire
        Value_4 = self.Model.Weapon.Head:FindFirstChild("Start" .. a3)
        Value_5 = self.Model.Weapon.Rockets["Rocket" .. a3]
    else
        Value = v1.Y_Pivot.Value
        Value_2 = v1.X_Pivot.Value
        Value_3 = v1.FireSound.Value
        Value_4 = v1.FireEffects[tostring(a3)].Value
        Value_5 = v1.Missiles[tostring(a3)].Value
    end
    self:_aimHorizontal(a2.goal, Value)
    self:_aimVertical(a2, Value_2)
    EasySound.Play({
        destroyOnEnd = true,
        audioGroup = "Towers",
        id = Value_3.SoundId,
        parent = Value_3.Parent,
        volume = Value_3.Volume,
    })
    EmitterManager.manualEmit(Value_4)
    local u90 = Value_5:Clone()
    if self.Model.Name == "Werewolf" then
        u90.Head:Destroy()
    end
    EmitterManager.toggle(u90, true, "Trail")
    u90.Parent = workspace.Trash
    u90.Anchored = true
    u90.CFrame = CFrame.new(a2.start)
    u90.CanCollide = false
    u90.CanQuery = false
    ;(ItemDrop.Drop(Value_4.WorldPosition, a2.goal, u90, a2.dtMultiplier, a2.gravity, a2.velocity, function(a1, a2, a3) -- Line: 164
        CFrame.new()
        local v1 = CFrame.lookAt(a2, a3)
        return (v1 - v1.Position) * CFrame.Angles(0, 3.141592653589793, 0)
    end)):andThen(function() -- Line: 170
        -- upvalues: a2 (val), u90 (val), Debris (upval), u52 (upval), Name (val), self (val), EmitterManager (upval)
        -- upvalues: EffectsController (upval)
        local goal = a2.goal
        u90.Transparency = 1
        Debris:AddItem(u90, 1)
        local v1 = u52.Overrides.MissileExplosion[Name]
        if v1 then
            v1(self, a2.radius, a2.goal)
            return
        end
        local v2 = u52.MissileExplosions[Name]
        if v2 then
            EmitterManager.Emit(v2.Name or "ImpactExplosion", CFrame.new(goal), a2.radius * (v2.Scale or 1))
            return
        end
        EffectsController.Explosion({Position = goal, Radius = a2.radius})
    end)
    if not u52.IgnoreReload[Name] then
        Value_5.Transparency = 1
        if a3 == 4 then
            self:Delay(1)
            if not self:IsAlive() then
                return
            end
            for i, j in if not v1 then self.Model.Weapon.Rockets:GetChildren() else Sift.Array.map(v1.Missiles:GetChildren(), function(a1) -- Line: 209 -- types: a1: table
                return a1.Value
            end) do
                j.Transparency = 0
            end
        end
    end
end

function v1.Initialize(a1) -- Line: 224 -- upvalues: EasySound (val), Animation (val), u52 (val), EmitterManager (val)
    local Name = a1.Model.Name
    local PrimaryPart = a1.Model.PrimaryPart
    local Drive = PrimaryPart:FindFirstChild("Drive")
    a1._originalCFrames = {}
    a1._resetTweens = {}
    a1._resetAimThreads = {}
    if Drive then
        EasySound.Play({
            looped = true,
            audioGroup = "Towers",
            id = Drive.SoundId,
            parent = a1.Model.HumanoidRootPart,
            volume = Drive.Volume,
            playbackSpeed = Drive.PlaybackSpeed or 1,
        })
    end
    Animation.new({
        Track = (a1.Model:WaitForChild("Animations")):WaitForChild("Walk"),
        Target = a1.Model:WaitForChild("AnimationController"),
    }):Play()
    a1.Executables = {
        Missile = function(a1_2, a2) -- Line: 250 -- upvalues: a1 (val) -- types: a2: number
            if not a1:IsAlive() then
                return
            end
            a1:_fireMissile(a1_2, a2)
        end,
        Death = function() -- Line: 256 -- upvalues: u52 (upval), Name (val), a1 (val), EmitterManager (upval), PrimaryPart (val)
            local v1 = u52.Overrides.DeathExplosion[Name]
            if not v1 then
                local v2 = u52.DeathExplosion[Name]
                EmitterManager.Emit(v2 and v2.Name or "LargeExplosion", PrimaryPart.CFrame, v2 and v2.Scale or 4)
            else
                v1(a1)
            end
            for i, j in a1._resetAimThreads do
                task.cancel(j)
            end
            for k, n in a1._resetTweens do
                n:Cancel()
            end
        end,
    }
end

return v1