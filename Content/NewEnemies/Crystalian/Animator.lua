-- Script path: ReplicatedStorage.Content.NewEnemies.Crystalian.Animator
-- Decompile time: 7.03 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService_2 = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

local function openBeam(a1) -- Line: 20 -- upvalues: TweenService_2 (val) -- types: a1: userdata
    local Attribute = a1:GetAttribute("OriginalWidth0") or a1.Width0
    local Attribute_2 = a1:GetAttribute("OriginalWidth1") or a1.Width1
    a1.Enabled = true
    a1.Width0 = 0
    a1.Width1 = 0
    TweenService_2:Create(a1, TweenInfo.new(1), {Width0 = Attribute, Width1 = Attribute_2}):Play()
end

local function closeBeam(a1) -- Line: 33 -- upvalues: TweenService_2 (val) -- types: a1: userdata
    TweenService_2:Create(a1, TweenInfo.new(0.5), {Width0 = 0, Width1 = 0}):Play()
end

local function getCircleVFX() -- Line: 40 -- upvalues: ReplicatedStorage (val)
    local v1 = ReplicatedStorage.Assets.Effects.Mob.CrystalianCircle:Clone()
    v1.Anchored = true
    v1.CanCollide = false
    return v1
end

function v1.Initialize(a1) -- Line: 48 -- upvalues: Animation (val)
    local Width0, Width1
    local Model = a1.Model
    local Animations = Model:WaitForChild("Animations")
    a1._anims = {}
    for i, j in Animations:GetChildren() do
        if j:IsA("Animation") and j.Name ~= "Walk" then
            a1._anims[j.Name] = (Animation.new({Preload = true, Track = j, Target = Model.AnimationController.Animator}))
        end
    end
    local Configuration = Model.Configuration
    a1._beamStart = Configuration.Start.Value
    a1._beamEnd = Configuration.BeamEnd.Value
    for k, n in Model:GetDescendants() do
        if n:IsA("Beam") then
            Width0 = n.Width0
            Width1 = n.Width1
            n:SetAttribute("OriginalWidth0", Width0)
            n:SetAttribute("OriginalWidth1", Width1)
        end
    end
    a1.Executables = {
        Attack = function(a1_2) -- Line: 80 -- upvalues: a1 (val) -- types: a1_2: vector
            a1._attackCancelled = false
            local Windup = a1.Stats.Windup
            local v1 = a1:_playAnimation("Windup", Windup)
            a1:Face(a1_2, (TweenInfo.new(Windup)))
            a1:Wait(Windup)
            if not a1._attackCancelled and a1:IsAlive() then
                a1:_fireLaser(a1_2)
                if not a1._attackCancelled and a1:IsAlive() then
                    a1:_playAnimation("Recovery", a1.Stats.RecoveryTime)
                end
                return
            end
            if v1 then
                v1:Stop()
            end
        end,
        CancelAttack = function() -- Line: 104 -- upvalues: a1 (val)
            a1._attackCancelled = true
            if a1._laserAnimation then
                a1._laserAnimation:cancel()
            end
            a1:_toggleLaser(false)
            for k, v in pairs(a1._anims) do
                v:Stop()
            end
        end,
        Death = function() -- Line: 116 -- upvalues: a1 (val)
            if not a1._dead then
                a1._dead = true
                a1._attackCancelled = true
                if a1._laserAnimation then
                    a1._laserAnimation:cancel()
                end
                a1:_toggleLaser(false)
                for k, v in pairs(a1._anims) do
                    v:Stop()
                end
                a1:_playAnimation("Death")
            end
        end,
    }
end

function v1:_playAnimation(a2, a3) -- Line: 136 -- types: self: table, a2: string, a3: number?
    local v1 = self._anims[a2]
    if not v1 then
        return nil
    end
    local u7 = v1:Play()
    if a3 then
        task.spawn(function() -- Line: 142 -- upvalues: u7 (val), a3 (val)
            while u7.Length == 0 do
                task.wait()
            end
            u7:AdjustSpeed((0 < u7.Length and u7.Length or 1) / a3)
        end)
    end
    return u7
end

function v1:_toggleLaser(a2) -- Line: 155
    -- upvalues: openBeam (val), closeBeam (val)
    local u106
    if not a2 then
        u106 = closeBeam
    else
        u106 = openBeam
        if not u106 then
            u106 = closeBeam
        end
    end
    local _beamStart = self._beamStart
    local _beamEnd = self._beamEnd
    local u109 = {}

    local function toggleInst(a1) -- Line: 161 -- upvalues: u109 (val), a2 (val), u106 (val)
        if u109[a1] then
            return
        end
        u109[a1] = true
        if not a1:IsA("ParticleEmitter") and not a1:IsA("Trail") then
            if a1:IsA("Beam") then
                u106(a1)
            end
            return
        end
        a1.Enabled = a2
    end

    local function toggleRoot(a1) -- Line: 174 -- upvalues: u109 (val), a2 (val), u106 (val) -- types: a1: userdata
        if not u109[a1] then
            u109[a1] = true
            if a1:IsA("ParticleEmitter") or a1:IsA("Trail") then
                a1.Enabled = a2
            elseif a1:IsA("Beam") then
                u106(a1)
            end
        end
        for i, j in a1:GetDescendants() do
            if not u109[j] then
                u109[j] = true
                if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                    j.Enabled = a2
                elseif j:IsA("Beam") then
                    u106(j)
                end
            end
        end
    end

    if not u109[_beamStart] then
        u109[_beamStart] = true
        if _beamStart:IsA("ParticleEmitter") or _beamStart:IsA("Trail") then
            _beamStart.Enabled = a2
        elseif _beamStart:IsA("Beam") then
            u106(_beamStart)
        end
    end
    for i, j in _beamStart:GetDescendants() do
        if not u109[j] then
            u109[j] = true
            if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                j.Enabled = a2
            elseif j:IsA("Beam") then
                u106(j)
            end
        end
    end
    if not u109[_beamEnd] then
        u109[_beamEnd] = true
        if _beamEnd:IsA("ParticleEmitter") or _beamEnd:IsA("Trail") then
            _beamEnd.Enabled = a2
        elseif _beamEnd:IsA("Beam") then
            u106(_beamEnd)
        end
    end
    for k, n in _beamEnd:GetDescendants() do
        if not u109[n] then
            u109[n] = true
            if n:IsA("ParticleEmitter") or n:IsA("Trail") then
                n.Enabled = a2
            elseif n:IsA("Beam") then
                u106(n)
            end
        end
    end
end

function v1:_fireLaser(a2) -- Line: 186
    -- upvalues: ReplicatedStorage (val), EmitterManager (val), EasySound (val), Shaker (val), Promise (val)
    -- upvalues: RunService (val), GameState (val), TweenService (val), Debris (val)
    local AttackTime = self.Stats.AttackTime
    local AttackRange = self.Stats.AttackRange
    local Position = self.Model.PrimaryPart.Position
    if self._laserAnimation then
        self._laserAnimation:cancel()
    end
    if self._circleVFX then
        self._circleVFX:Destroy()
        self._circleVFX = nil
    end
    local u28 = ReplicatedStorage.Assets.Effects.Mob.CrystalianCircle:Clone()
    u28.Anchored = true
    u28.CanCollide = false
    u28.Parent = workspace.Trash
    u28.Size = Vector3.new(AttackRange * 2, 0.0001, AttackRange * 2)
    u28.CFrame = CFrame.new(Position - Vector3.new(0, self.Height - 0.1, 0))
    EmitterManager.toggle(u28, true)
    EasySound.Play({
        id = "rbxassetid://82788670024044",
        volume = 0.6,
        destroyOnEnd = true,
        audioGroup = "Enemies",
        playbackSpeed = 2,
        parent = self.Model.PrimaryPart,
    })
    Shaker:Shake({1, 30.5, 0.25, 0.1}, 0.1, 3)
    local u80 = self:_playAnimation("Cast", AttackTime)
    local _beamEnd = self._beamEnd
    local u83 = RaycastParams.new()
    u83.FilterType = Enum.RaycastFilterType.Include
    u83.FilterDescendantsInstances = {workspace:WaitForChild("Map")}

    local function getBeamPosition(a1) -- Line: 229
        -- upvalues: Position (val), AttackRange (val), u83 (val)
        local v1, v2
        local v3 = Position + (Vector3.new(math.cos(a1), 0, (math.sin(a1)))) * AttackRange
        local v4 = v3 - Position
        if v4.Magnitude == 0 then
            return v3
        end
        local v5 = Position
        local Unit = v4.Unit
        for i = 1, 5 do
            v1 = v3 - v5
            if v1.Magnitude <= 0 then
                return v3
            end
            v2 = workspace:Raycast(v5, v1, u83)
            if not v2 then
                return v3
            end
            if v2.Instance:IsA("BasePart") and not (v2.Instance.Transparency < 1) then
                continue
            end
            return v2.Position
        end
        return v3
    end

    local u93 = false
    self._laserAnimation = (Promise.new(function(a1, a2_2, a3) -- Line: 261
        -- upvalues: AttackTime (val), a2 (val), Position (val), _beamEnd (val), getBeamPosition (val), self (val)
        -- upvalues: RunService (upval), GameState (upval), TweenService (upval), u93 (ref)
        local u3 = 0
        local u19 = 0
        local u9 = math.max(AttackTime - 0.5, 0)
        local v1 = a2 - Position
        if 0 < v1.Magnitude then
            u19 = math.atan2(v1.Z, v1.X)
        end
        _beamEnd.WorldPosition = getBeamPosition(u19)
        self:_toggleLaser(true)
        local u30 = nil
        a3(function() -- Line: 276 -- upvalues: u30 (ref)
            if u30 and u30.Connected then
                u30:Disconnect()
            end
        end)
        local v2 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 282
            -- upvalues: self (upval), u30 (ref), a1 (val), GameState (upval), u3 (ref), AttackTime (upval)
            -- upvalues: TweenService (upval), u19 (ref), _beamEnd (upval), getBeamPosition (upval), u93 (upval)
            -- upvalues: u9 (val)
            if not self:IsAlive() then
                u30:Disconnect()
                a1()
                return
            end
            local v1 = a1_2 * GameState.TimeScale
            u3 = math.min(u3 + v1, AttackTime)
            local v2 = u3 / AttackTime
            local Value = TweenService:GetValue(v2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            local v3 = u19 - 6.283185307179586 * Value
            _beamEnd.WorldPosition = getBeamPosition(v3)
            if not u93 and u9 <= u3 then
                u93 = true
                self:_toggleLaser(false)
            end
            if AttackTime <= u3 then
                _beamEnd.CFrame = CFrame.identity
                u30:Disconnect()
                a1()
            end
        end)
    end)):finally(function() -- Line: 309 -- upvalues: self (val), u93 (ref), u80 (val), EmitterManager (upval), u28 (val), Debris (upval)
        self._laserAnimation = nil
        if not u93 then
            self:_toggleLaser(false)
        end
        if u80 and u80.IsPlaying then
            u80:Stop()
        end
        EmitterManager.toggle(u28, false)
        Debris:AddItem(u28, 3)
    end)
    self:Wait(AttackTime)
end

return v1