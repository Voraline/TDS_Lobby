-- Script path: ReplicatedStorage.Content.Unit.Rifleman.Animator
-- Decompile time: 4.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local u31 = Random.new()
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 19 -- upvalues: Animation (val)
    local Animations = a1.Model:WaitForChild("Animations")
    a1.animController = a1.Model:WaitForChild("AnimationController")
    a1._walkAnim = Animation.new({Track = Animations.Walk, Target = a1.animController})
    a1._idleAnim = Animation.new({IgnorePriority = true, Track = Animations.Idle, Target = a1.animController})
    a1._idleTrack = nil
    a1._fireAnim = Animation.new({Track = Animations.Fire, Target = a1.animController})
    a1._firing = false
    a1._lastShot = tick()
    a1._soundPools = {}
    a1.Executables = {
        ShootState = function(a1_2) -- Line: 44 -- upvalues: a1 (val)
            if a1_2 then
                a1:_doIdle()
                return
            end
            a1:_doWalk()
        end,
        Death = function() -- Line: 51 -- upvalues: a1 (val), Animation (upval), Animations (val)
            a1.Dead = true
            Animation.new({Track = Animations.Death, Target = a1.animController}):Play()
            a1._walkAnim:Stop()
            a1._idleAnim:Stop()
            a1._fireAnim:Stop()
            a1.Model.HumanoidRootPart.Death:Play()
        end,
        Face = function(a1_2) -- Line: 64 -- upvalues: a1 (val)
            a1:Face(a1_2, (TweenInfo.new(0.3)))
        end,
        Shoot = function(a1_2) -- Line: 67 -- upvalues: a1 (val)
            a1:_fire(a1_2)
        end,
    }
    local airdropData = a1.Replicator.State.airdropData
    if not airdropData then
        a1:_doWalk()
    else
        a1:spawnAnimation(airdropData)
    end
    a1.Maid:Mark(function() -- Line: 79 -- upvalues: a1 (val)
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            a1._soundPools = nil
        end
    end)
end

function v1:spawnAnimation(a2) -- Line: 89 -- upvalues: Animation (val), EasySound (val), NewTween (val)
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
        local Deploy = Parachute:FindFirstChild("Deploy")
        if Deploy and Deploy:IsA("Sound") then
            EasySound.Play({
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = Deploy.SoundId,
                parent = Parachute,
                volume = Deploy.Volume,
            })
        end
    end
    local Magnitude = (u50.Position - u39.Position).Magnitude
    local v2 = (workspace:GetServerTimeNow()) - a2.spawnTime
    NewTween(self.Model, TweenInfo.new(landTime - v2, Enum.EasingStyle.Quad), function(a1) -- Line: 127 -- upvalues: u50 (val), u39 (val), self (val), Magnitude (val)
        local v1 = u50:Lerp(u39, a1)
        local v2 = math.acos((v1.LookVector:Dot(u39.LookVector))) * 0.5
        if v2 ~= v2 then
            v2 = 0
        end
        self.Model:PivotTo(v1 * CFrame.Angles(0, 0, v2) * (CFrame.Angles(math.rad(Magnitude * (1 - a1) * 0.5), 0, 0)))
    end, function() -- Line: 143 -- upvalues: Parachute (val), EasySound (upval), u73 (val)
        if Parachute then
            Parachute.Transparency = 1
            local Land = Parachute:FindFirstChild("Land")
            if Land and Land:IsA("Sound") then
                EasySound.Play({
                    destroyOnEnd = true,
                    audioGroup = "Towers",
                    id = Land.SoundId,
                    parent = Parachute,
                    volume = Land.Volume,
                })
            end
        end
        u73:Stop()
    end)
end

function v1:_doWalk() -- Line: 169
    self._idleAnim:Stop()
    self._walkAnim:Play()
    self._walkAnim:AdjustSpeed(self.Speed / 3.5)
end

function v1:_doIdle() -- Line: 179
    self._walkAnim:Stop()
    if self._idleTrack == nil or not self._idleTrack.IsPlaying then
        self._idleTrack = self._idleAnim:Play()
    end
end

function v1:_fire(a2) -- Line: 190 -- upvalues: SoundPool (val), u31 (val), EasySound (val), EmitterManager (val)
    local v1
    local Handle = self.Model.Weapon.MercRifle.Handle
    local Start = Handle.Start
    local Fire = Handle.Fire
    self:Face(a2, (TweenInfo.new(0.3)))
    local v2 = self._soundPools[Fire]
    if not v2 then
        v1 = string.match(Fire.SoundId or "", "%d+")
        local v3 = v1 and tonumber(v1)
        if v3 then
            v2 = SoundPool.new({
                size = 5,
                audioGroup = "Towers",
                timeScaled = true,
                id = v3,
                parent = Handle,
            })
            self._soundPools[Fire] = v2
        end
    end
    v1 = u31:NextNumber(0.8, 1.2)
    if not v2 then
        EasySound.Play({
            destroyOnEnd = true,
            audioGroup = "Towers",
            id = Fire.SoundId,
            parent = Handle,
            volume = Fire.Volume,
            playbackSpeed = v1,
        })
    else
        v2:play({playbackSpeed = v1, volume = Fire.Volume})
    end
    self._fireAnim:Play()
    EmitterManager.manualEmit(Start)
    local v4 = {Spread = 50, Speed = 140, Start = Start.WorldPosition, End = a2}
    local v5 = false
    if self.Model.Name == "Frost Legion" then
        v5 = Color3.fromRGB(73, 196, 253)
    end
    v4.Color = v5
    self:Bullet(v4)
end

return v1