-- Script path: ReplicatedStorage.Content.Unit.Riot Guard.Animator
-- Decompile time: 4.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 17 -- upvalues: Animation (val), EmitterManager (val)
    local Animations = a1.Model:FindFirstChild("Animations")
    a1.animController = a1.Model:FindFirstChild("AnimationController")
    a1._walkAnim = Animation.new({Track = Animations:WaitForChild("Walk"), Target = a1.animController})
    a1._runAnim = Animation.new({Track = Animations:WaitForChild("Run"), Target = a1.animController})
    a1._attackAnim = Animation.new({Track = Animations:WaitForChild("Attack"), Target = a1.animController})
    a1._idleAnim = Animation.new({
        IgnorePriority = true,
        Track = Animations:WaitForChild("Idle"),
        Target = a1.animController,
    })
    a1._animBlendConn = nil
    a1.Executables = {
        AttackState = function(a1_2) -- Line: 42 -- upvalues: a1 (val) -- types: a1_2: boolean
            if a1_2 then
                a1:_doIdle()
                return
            end
            a1:_doWalk()
        end,
        Death = function() -- Line: 49 -- upvalues: a1 (val), Animation (upval), Animations (val)
            a1.Dead = true
            if a1._animBlendConn then
                a1._animBlendConn:Disconnect()
                a1._animBlendConn = nil
            end
            a1._walkAnim:Stop()
            a1._runAnim:Stop()
            a1._idleAnim:Stop()
            a1:_toggleDashParticles(false)
            Animation.new({Track = Animations.Death, Target = a1.animController}):Play()
            a1.Model.HumanoidRootPart.Death:Play()
        end,
        Attack = function(a1_2, a2) -- Line: 67 -- upvalues: a1 (val), EmitterManager (upval) -- types: a1_2: vector, a2: boolean
            a1:_attack(a1_2)
            if a2 then
                local ChargedHit = a1.Model.HumanoidRootPart.ChargedHit
                EmitterManager.manualEmit(ChargedHit)
                a1.Model.HumanoidRootPart.ChargedHit.Sound:Play()
            end
        end,
    }
    local airdropData = a1.Replicator.State.airdropData
    if airdropData then
        a1:spawnAnimation(airdropData)
        return
    end
    a1:_doWalk()
end

function v1:spawnAnimation(a2) -- Line: 87 -- upvalues: Animation (val), NewTween (val)
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
    NewTween(self.Model, TweenInfo.new(landTime - v2, Enum.EasingStyle.Quad), function(a1) -- Line: 116 -- upvalues: u50 (val), u39 (val), self (val), Magnitude (val)
        local v1 = u50:Lerp(u39, a1)
        local v2 = math.acos((v1.LookVector:Dot(u39.LookVector))) * 0.5
        if v2 ~= v2 then
            v2 = 0
        end
        self.Model:PivotTo(v1 * CFrame.Angles(0, 0, v2) * (CFrame.Angles(math.rad(Magnitude * (1 - a1) * 0.5), 0, 0)))
    end, function() -- Line: 132 -- upvalues: Parachute (val), u73 (val)
        if Parachute then
            Parachute.Transparency = 1
            Parachute.Land:Play()
        end
        u73:Stop()
    end)
end

function v1:_doIdle() -- Line: 149
    if self._animBlendConn then
        self._animBlendConn:Disconnect()
        self._animBlendConn = nil
    end
    self._walkAnim:AdjustWeight(0.0001)
    self._walkAnim:Stop()
    self._runAnim:AdjustWeight(0.0001)
    self._runAnim:Stop()
    self._idleAnim:Play()
    self:_toggleDashParticles(false)
end

function v1:_doWalk() -- Line: 167 -- upvalues: RunService (val)
    if self._animBlendConn then
        return
    end
    self._idleAnim:Stop()
    self._walkAnim:Play()
    self._runAnim:Play()
    self._animBlendConn = RunService.RenderStepped:Connect(function() -- Line: 176 -- upvalues: self (val)
        local v1 = math.clamp(self.Speed / 7, 0.0001, 0.9999)
        self._walkAnim:AdjustSpeed(v1)
        self._runAnim:AdjustSpeed(v1)
        local v2 = self.Speed / self.Stats.Attributes.MaxSpeed
        self._walkAnim:AdjustWeight(1 - v2)
        self._runAnim:AdjustWeight(v2)
        self:_toggleDashParticles(v2 > 0.9)
    end)
end

function v1:_attack(a2) -- Line: 196 -- types: self: table, a2: vector
    self:Face(a2, (TweenInfo.new(0.3)))
    self._attackAnim:Play()
end

function v1:_toggleDashParticles(a2) -- Line: 202 -- types: self: table, a2: boolean
    if not self.Model.PrimaryPart then
        return
    end
    if self.Model.PrimaryPart:FindFirstChild("Dash") then
        self.Model.PrimaryPart.Dash.Enabled = a2
        return
    end
    if not self.Model.PrimaryPart:FindFirstChild("DashUpgrades") then
        return
    end
    local v1 = self.Model.PrimaryPart.DashUpgrades:FindFirstChild(self.Upgrade)
    if v1 then
        for i, j in v1:GetDescendants() do
            if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                j.Enabled = a2
            end
        end
    end
end

function v1.Remove(a1) -- Line: 227
    if a1._animBlendConn then
        a1._animBlendConn:Disconnect()
        a1._animBlendConn = nil
    end
end

return v1