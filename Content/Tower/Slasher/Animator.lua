-- Script path: ReplicatedStorage.Content.Tower.Slasher.Animator
-- Decompile time: 5.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local Slash = ReplicatedStorage.Assets.Effects.Particles.Slash
local Part = Instance.new("Part")
Part.Size = Vector3.new(1, 1, 1)
Part.Anchored = true
Part.CanCollide = false
Part.CanTouch = false
Part.Transparency = 1
local Model = Instance.new("Model")
Model.Name = "Crit"
Part.Parent = Model
local u42 = Random.new()
local v1 = {}
v1.__index = v1

function v1:resolveWeaponConfig() -- Line: 26
    return self.Model.Weapon.Knife:FindFirstChildOfClass("Configuration")
end

function v1:getWeaponConfigValue(a2) -- Line: 30 -- types: self: table, a2: string
    local v1 = self:resolveWeaponConfig()
    if not v1 then
        return
    end
    local v2 = v1:FindFirstChild(a2, true)
    if v2 and v2:IsA("ObjectValue") then
        return v2.Value
    end
    return v2
end

function v1:resolveSound(a2, a3) -- Line: 44 -- types: self: table, a2: string, a3: string?
    local v1 = self:getWeaponConfigValue(a2)
    if v1 and v1:IsA("Sound") then
        return v1
    end
    local Weapon = self.Model:FindFirstChild("Weapon")
    local v2 = Weapon and Weapon:FindFirstChild(a3 or a2, true)
    if v2 and v2:IsA("Sound") then
        return v2
    end
end

function v1:resolveTrail() -- Line: 60
    return (self:getWeaponConfigValue("Trail"))
end

function v1:resolveParry() -- Line: 64
    local v1 = self:getWeaponConfigValue("Parry")
    if v1 then
        return v1
    end
    local HumanoidRootPart = self.Model:FindFirstChild("HumanoidRootPart")
    return HumanoidRootPart and HumanoidRootPart:FindFirstChild("Parry")
end

function v1:disableActiveTrails() -- Line: 75 -- upvalues: EmitterManager (val)
    if not self._activeTrails then
        return
    end
    for i, j in self._activeTrails do
        if j.Parent then
            EmitterManager.toggle(j, false)
        end
    end
    table.clear(self._activeTrails)
end

function v1:toggleTrail(a2) -- Line: 88 -- upvalues: EmitterManager (val) -- types: self: table, a2: boolean
    if not a2 then
        self:disableActiveTrails()
        return
    end
    self:disableActiveTrails()
    local v1 = {}
    local v2 = self:resolveTrail()
    if v2 then
        EmitterManager.toggle(v2, true)
        table.insert(v1, v2)
        self._activeTrails = v1
        return
    end
    local Weapon = self.Model:FindFirstChild("Weapon")
    if not Weapon then
        return
    end
    for i, j in Weapon:GetDescendants() do
        if j:GetAttribute("Trail") then
            EmitterManager.toggle(j, true)
            table.insert(v1, j)
        end
    end
    self._activeTrails = v1
end

function v1:_loadAnimations(a2) -- Line: 120 -- upvalues: Animation (val) -- types: self: table, a2: number
    for k, v in pairs(self._animations) do
        v:Stop(0)
    end
    table.clear(self._animations)
    local v1 = 0
    local v2 = self
    for i = 1, a2 do
        if (v2._animationFolder:WaitForChild("Fire")):FindFirstChild(i) then
            v1 = i
        end
    end
    for j, k2 in v2._animationFolder:WaitForChild("Fire")[v1]:GetChildren() do
        v2._animations[k2.Name] = (Animation.new({
            Preload = true,
            IgnorePriority = true,
            IsPersistent = true,
            Speed = 1.8,
            Target = v2._animator,
            Track = k2,
        }))
    end
    local v3 = v2._animationFolder:WaitForChild("Idle")[v1]
    v2._animations.Idle = Animation.new({IgnorePriority = true, IsPersistent = true, Target = v2._animator, Track = v3}):Play(0)
end

function v1.Initialize(a1) -- Line: 155
    -- upvalues: EasySound (val), TimescaleUtilities (val), Model (val), EmitterManager (val), u42 (val), Slash (val)
    a1._animator = (a1.Model:WaitForChild("AnimationController")):WaitForChild("Animator")
    a1._animationFolder = a1.Model:WaitForChild("Animations")
    a1._animations = {}
    a1._activeTrails = {}
    a1:_loadAnimations((a1:GetLevel()))
    a1.Maid:Mark((a1.OnUpgrade:Connect(function() -- Line: 163 -- upvalues: a1 (val)
        a1:_loadAnimations((a1:GetLevel()))
    end)))

    local function swingVFX(a1_2) -- Line: 167 -- upvalues: a1 (val), EasySound (upval), TimescaleUtilities (upval)
        local v1 = a1:resolveSound("Swing" .. a1_2)
        if v1 then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = v1.SoundId,
                parent = v1.Parent,
                playbackSpeed = v1.PlaybackSpeed,
            })
        end
        if a1._swingThread then
            task.cancel(a1._swingThread)
        end
        a1:toggleTrail(true)
        a1._swingThread = task.spawn(function() -- Line: 184 -- upvalues: TimescaleUtilities (upval), a1 (upval)
            TimescaleUtilities.Wait(0.5)
            a1:toggleTrail(false)
        end)
    end

    a1.Executables = {
        Crit = function(a1_2) -- Line: 191 -- upvalues: Model (upval), a1 (val), EmitterManager (upval), TimescaleUtilities (upval)
            if not a1_2 then
                return
            end
            local v1 = Model:Clone()
            local v2 = a1:resolveParry()
            if not v2 then
                return
            end
            local v3 = v2:Clone()
            v3.Parent = v1.Part
            v1:ScaleTo(a1_2.Hitbox.Size.Y / 1.5)
            v1.Parent = a1_2
            v1:PivotTo(a1_2.PrimaryPart.CFrame * (CFrame.new(math.random(-1, 1), math.random(-1, 1), (math.random(-1, 1)))))
            EmitterManager.manualEmit(v3)
            TimescaleUtilities.CleanUp(v1, 2)
        end,
        Hit = function(a1_2) -- Line: 214
            -- upvalues: a1 (val), EasySound (upval), u42 (upval), Slash (upval), EmitterManager (upval)
            -- upvalues: TimescaleUtilities (upval)
            if not a1_2 then
                return
            end
            local v1 = a1:resolveSound("Hit", "HitSFX")
            if v1 then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = v1.SoundId,
                    parent = v1.Parent,
                    playbackSpeed = v1.PlaybackSpeed,
                })
            end
            if not a1_2:FindFirstChild("Slash") then
                local v2 = u42:NextNumber(-0.5, 0.5)
                local v3 = u42:NextNumber(-0.5, 0.5)
                local v4 = u42:NextNumber(-0.5, 0.5)
                local v5 = u42:NextNumber(-45, 45)
                local v6 = (CFrame.new(v2, v3, v4)) * CFrame.Angles(math.rad(v5), math.rad(v5), (math.rad(v5)))
                local v7 = Slash:Clone()
                v7:ScaleTo(a1_2.Hitbox.Size.Y / 2)
                v7:PivotTo(a1_2.PrimaryPart.CFrame * v6)
                v7.Parent = a1_2
                EmitterManager.manualEmit(v7)
                local WeldConstraint = Instance.new("WeldConstraint")
                WeldConstraint.Part0 = v7.VFX
                WeldConstraint.Part1 = a1_2.PrimaryPart
                WeldConstraint.Parent = v7.VFX
                TimescaleUtilities.CleanUp(v7, 1.05)
            end
        end,
        Attack = function(a1_2) -- Line: 254 -- upvalues: swingVFX (val), a1 (val)
            swingVFX(a1_2)
            if a1._swingAnim then
                a1._swingAnim:Stop(0)
            end
            a1._swingAnim = a1._animations["Swing" .. a1_2]
            a1._swingAnim:Play(0)
        end,
    }
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 265 -- upvalues: a1 (val), EmitterManager (upval)
        for i, j in a1.Model.Weapon:GetDescendants() do
            if j:GetAttribute("VFX") then
                EmitterManager.toggle(j, true)
            end
        end
        if not a1.Model.Upgrades:FindFirstChild(a1_2) then
            return
        end
        for k, n in a1.Model.Upgrades[a1_2]:GetDescendants() do
            if n:GetAttribute("Face") then
                n.Transparency = 0
            end
        end
    end)
end

return v1