-- Script path: ReplicatedStorage.Content.Unit.Grenadier.Animator
-- Decompile time: 5.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local u42 = Random.new()
local v1 = {}
v1.__index = v1
local u44 = {}

function u44.Graveyard(a1) -- Line: 18
    if a1 > 0 then
        return "GraveyardExplosion2"
    end
    return "GraveyardExplosion"
end

u44["Frost Legion"] = function(a1) -- Line: 21
    return "FrostExplosion"
end

function v1.Initialize(a1) -- Line: 26
    -- upvalues: Animation (val), EmitterManager (val), ItemDrop (val), u44 (val), EffectsController (val)
    local Animations = a1.Model:FindFirstChild("Animations")
    a1.animController = a1.Model:FindFirstChild("AnimationController")
    a1._walkAnim = Animation.new({Track = Animations.Walk, Target = a1.animController})
    a1._idleAnim = Animation.new({IgnorePriority = true, Track = Animations.Idle, Target = a1.animController})
    a1._idleTrack = nil
    a1._fireAnim = Animation.new({Track = Animations.Fire, Target = a1.animController})
    a1._firing = false
    a1._lastShot = tick()
    a1._soundPools = {}
    a1.Executables = {
        ShootState = function(a1_2) -- Line: 51 -- upvalues: a1 (val) -- types: a1_2: boolean
            if a1_2 then
                a1:_doIdle()
                return
            end
            a1:_doWalk()
        end,
        Death = function() -- Line: 58 -- upvalues: a1 (val), Animation (upval), Animations (val)
            a1.Dead = true
            Animation.new({Track = Animations.Death, Target = a1.animController}):Play()
            a1._walkAnim:Stop()
            a1._idleAnim:Stop()
            a1.Model.HumanoidRootPart.Death:Play()
        end,
        Face = function(a1_2) -- Line: 70 -- upvalues: a1 (val) -- types: a1_2: vector
            a1:Face(a1_2, (TweenInfo.new(0.3)))
        end,
        Shoot = function(a1_2) -- Line: 73 -- upvalues: a1 (val) -- types: a1_2: vector
            a1:fire(a1_2)
        end,
        Projectile = function(a1_2) -- Line: 76
            -- upvalues: a1 (val), EmitterManager (upval), ItemDrop (upval), u44 (upval), EffectsController (upval)
            local Handle = a1.Model.Weapon:FindFirstChild("Gun"):FindFirstChild("Handle")
            if not Handle then
                return
            end
            local u117 = a1:GetProjectileModel():Clone()
            u117.Anchored = true
            u117.Parent = workspace.CurrentCamera
            if not u117:GetAttribute("Transparent") then
                u117.Transparency = 0
            end
            for i, j in u117:GetDescendants() do
                if j:IsA("Weld") or j:IsA("WeldConstraint") then
                    j:Destroy()
                elseif j:IsA("Beam") or j:IsA("Trail") or j:IsA("ParticleEmitter") then
                    j.Enabled = true
                end
            end
            local Start = Handle:FindFirstChild("Start")
            local WorldPosition = Start and Start.WorldPosition or Handle.Position
            a1_2.start = WorldPosition
            EmitterManager.manualEmit(Start)
            a1._fireAnim:Play()
            a1:fire()
            ;(ItemDrop.Drop(a1_2.start, a1_2.goal, u117, a1_2.dtMultiplier, a1_2.gravity, a1_2.velocity, function(a1, a2, a3) -- Line: 114
                local v1 = CFrame.lookAt(a2, a3)
                return v1 - v1.Position
            end)):andThen(function(a1_3) -- Line: 119
                -- upvalues: u117 (val), u44 (upval), a1 (upval), EmitterManager (upval), a1_2 (val)
                -- upvalues: EffectsController (upval)
                u117:Destroy()
                if u44[a1.Model.Name] then
                    EmitterManager.Emit(u44[a1.Model.Name](a1.Upgrade), CFrame.new(a1_2.goal), a1_2.radius)
                    return
                end
                EffectsController.Explosion({Position = a1_2.goal, Radius = a1_2.radius})
            end)
        end,
    }
    local airdropData = a1.Replicator.State.airdropData
    if not airdropData then
        a1:_doWalk()
    else
        a1:spawnAnimation(airdropData)
    end
    a1.Maid:Mark(function() -- Line: 145 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            a1._soundPools = nil
        end
    end)
end

function v1:spawnAnimation(a2) -- Line: 155 -- upvalues: Animation (val), NewTween (val)
    local landTime = a2.landTime
    local Path = self.Path
    local Scalar = Path:GetScalar(self.PathDistance)
    local Scalar_2 = Path:GetScalar(self.PathDistance - 0.1)
    local HumanoidRootPart = self.Model:WaitForChild("HumanoidRootPart")
    local Parachute = false
    if self.Model.Name ~= "Frost Legion" then
        Parachute = self.Model:FindFirstChild("Parachute")
    end
    local v1 = -HumanoidRootPart.HeightOffset.Position
    local u39 = (CFrame.lookAt(Scalar, Scalar_2)) * CFrame.new(v1)
    local Position_2 = u39.Position
    local u50 = CFrame.lookAt(a2.dropPosition, (Vector3.new(Position_2.X, a2.dropPosition.Y, Position_2.Z)))
    self.Model:PivotTo(u50)
    local u73 = Animation.new({
        Track = (self.Model:WaitForChild("Animations")):WaitForChild("Parachute"),
        Target = self.animController,
    }):Play()
    if Parachute then
        Parachute.Transparency = 0
        Parachute.Deploy:Play()
    end
    local Magnitude = (u50.Position - u39.Position).Magnitude
    local v2 = (workspace:GetServerTimeNow()) - a2.spawnTime
    NewTween(self.Model, TweenInfo.new(landTime - v2, Enum.EasingStyle.Quad), function(a1) -- Line: 184 -- upvalues: u50 (val), u39 (val), self (val), Magnitude (val)
        local v1 = u50:Lerp(u39, a1)
        local v2 = math.acos((v1.LookVector:Dot(u39.LookVector))) * 0.5
        if v2 ~= v2 then
            v2 = 0
        end
        self.Model:PivotTo(v1 * CFrame.Angles(0, 0, v2) * (CFrame.Angles(math.rad(Magnitude * (1 - a1) * 0.5), 0, 0)))
    end, function() -- Line: 200 -- upvalues: Parachute (val), u73 (val)
        if Parachute then
            Parachute.Transparency = 1
            Parachute.Land:Play()
        end
        u73:Stop()
    end)
end

function v1:_doWalk() -- Line: 217
    self._idleAnim:Stop()
    self._walkAnim:Play()
    self._walkAnim:AdjustSpeed(self.Speed / 3.5)
end

function v1:_doIdle() -- Line: 227
    self._walkAnim:Stop()
    if self._idleTrack == nil or not self._idleTrack.IsPlaying then
        self._idleTrack = self._idleAnim:Play()
    end
end

function v1:fire() -- Line: 238 -- upvalues: SoundPool (val), u42 (val), GameState (val), EmitterManager (val)
    local Handle = self.Model.Weapon.Gun.Handle
    local Start = Handle.Start
    local Fire = Handle.Fire
    if Fire and Fire:IsA("Sound") then
        local _soundPools = self._soundPools or {}
        self._soundPools = _soundPools
        local v1 = self._soundPools[Fire]
        if not v1 then
            local v2 = string.match(Fire.SoundId or "", "%d+")
            local v3 = v2 and tonumber(v2)
            if v3 then
                v1 = SoundPool.new({
                    size = 5,
                    audioGroup = "Towers",
                    timeScaled = true,
                    id = v3,
                    parent = Fire.Parent,
                    volume = Fire.Volume,
                })
                self._soundPools[Fire] = v1
            end
        end
        if not v1 then
            Fire.PlaybackSpeed = (u42:NextNumber(0.8, 1.2)) * GameState.TimeScale
            Fire:Play()
        else
            local Attribute = Fire:GetAttribute("PlaybackSpeed") or Fire.PlaybackSpeed or 1
            v1:play({
                playbackSpeed = (u42:NextNumber(Attribute * 0.9, Attribute * 1.2)) * GameState.TimeScale,
                volume = Fire.Volume,
            })
        end
    end
    self._fireAnim:Play()
    EmitterManager.manualEmit(Start)
end

function v1:GetProjectileModel() -- Line: 278
    return self.Model.Weapon:FindFirstChild("Gun"):WaitForChild("Shell")
end

return v1