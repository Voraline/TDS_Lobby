-- Script path: ReplicatedStorage.Content.Tower.Hallow Punk.Animator
-- Decompile time: 5.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1
local u36 = {Lunar = {HallowExplosionMax = "LunarExplosionMax", HallowExplosion = "LunarExplosion"}}
local u40 = {Lunar = 0.25}

function v1.Initialize(a1) -- Line: 24
    -- upvalues: Animation (val), TimescaleUtilities (val), GameState (val), EasySound (val), RunService (val)
    -- upvalues: u36 (val), u40 (val), EmitterManager (val)
    a1.animations = {}
    a1._lastRepositionServerTime = (-1 / 0)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    if a1.Replicator and a1.Replicator.GetStateChangedSignal then
        a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 31 -- upvalues: a1 (val)
            a1._lastRepositionServerTime = workspace:GetServerTimeNow()
        end)))
    end

    local function adjustLvl(a1_2) -- Line: 39 -- upvalues: a1 (val) -- types: a1_2: number
        if a1.Model.Animations.Fire:FindFirstChild(a1_2) then
            return a1_2
        end
        if a1_2 >= 1 then
            return 1
        end
        return 0
    end

    function a1:_loadAnimations(a2) -- Line: 47
        -- upvalues: Animations (val), Animation (upval), AnimationController (val)
        for k, v in pairs(self.animations) do
            v:Stop(0)
        end
        table.clear(self.animations)
        local v1 = 0
        for i = 1, a2 do
            if (Animations:WaitForChild("Fire")):FindFirstChild(i) then
                v1 = i
            end
        end
        for i2, j in ipairs(Animations:WaitForChild("Fire")[v1]:GetChildren()) do
            v2.animations[j.Name] = (Animation.new({
                Preload = true,
                IgnorePriority = true,
                IsPersistent = true,
                Target = AnimationController,
                Track = j,
            }))
        end
    end

    function a1:_reloadAnimation() -- Line: 73 -- upvalues: TimescaleUtilities (upval), GameState (upval)
        local Ammo = self.Model.Weapon:WaitForChild("Ammo")
        local Cooldown = self:GetCooldown()
        local v1 = Cooldown - Cooldown * 0.72
        TimescaleUtilities.Delay(v1, function() -- Line: 78 -- upvalues: self (val), Cooldown (val), GameState (upval), Ammo (val)
            if self.animations.Fire.Controller.IsPlaying then
                self.animations.Fire:Stop(0)
            end
            self.animations.Reload:Play(0)
            local v1 = self.animations.Reload.Controller.Length / (Cooldown * 0.72)
            self.animations.Reload.Controller:AdjustSpeed(v1 * GameState.TimeScale)
            self:_playWeaponSound("Reload", v1)
            task.wait(0.1)
            for k, v in pairs(Ammo:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = 0
                end
            end
        end)
    end

    function a1:_playWeaponSound(a2, a3) -- Line: 100
        -- upvalues: EasySound (upval)
        local Handle = self.Model.Weapon.Weapon:WaitForChild("Handle")
        local v1 = Handle:FindFirstChild(a2)
        if not v1 then
            return
        end
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            id = v1.SoundId,
            parent = Handle,
            playbackSpeed = a3 or (Random.new()):NextNumber(v1.PlaybackSpeed * 0.9, v1.PlaybackSpeed * 1.2),
            volume = v1.Volume or 1,
        })
    end

    a1.Executables = {
        Fire = function(a1_2, a2, a3) -- Line: 119
            -- upvalues: a1 (val), RunService (upval), GameState (upval), u36 (upval), u40 (upval)
            -- upvalues: EmitterManager (upval), TimescaleUtilities (upval)
            local Attribute
            if a3 and a3 < a1._lastRepositionServerTime then
                return
            end
            local Handle = a1.Model.Weapon.Weapon:WaitForChild("Handle")
            local Ammo = a1.Model.Weapon:WaitForChild("Ammo")
            local u187 = Ammo:Clone()
            local u188 = CFrame.new()
            for i, j in u187:GetDescendants() do
                if j:IsA("WeldConstraint") then
                    j:Destroy()
                elseif j:IsA("ParticleEmitter") or j:IsA("Trail") then
                    j.Enabled = true
                end
            end
            u187.Parent = workspace
            u187.PrimaryPart.Anchored = true
            a1:Face(a2)
            if a1.animations.Reload.Controller.IsPlaying then
                a1.animations.Reload:Stop(0)
            end
            a1.animations.Fire:Play()
            a1:_playWeaponSound("Fire")
            for k, v in pairs(Handle:GetDescendants()) do
                if v:IsA("ParticleEmitter") then
                    if v.Parent.Name == "Start" or v.Parent.Name == "Back" then
                        Attribute = v:GetAttribute("EmitCount")
                        if Attribute then
                            v:Emit(Attribute)
                        end
                    end
                end
            end
            for k2, k3 in pairs(Ammo:GetChildren()) do
                if k3:IsA("BasePart") then
                    k3.Transparency = 1
                end
            end
            a1:_reloadAnimation()
            local u105 = nil
            local u106 = 0
            local Position = (u187:GetPivot()).Position
            local v1 = RunService.Heartbeat:Connect(function(a1_3) -- Line: 175
                -- upvalues: u106 (ref), GameState (upval), a1_2 (val), u187 (val), a1 (upval), u36 (upval), u40 (upval)
                -- upvalues: EmitterManager (upval), a2 (val), TimescaleUtilities (upval), u105 (ref), Position (val)
                -- upvalues: u188 (ref)
                local v1
                u106 = u106 + a1_3 * GameState.TimeScale / a1_2
                if u187 and u187.Parent and not (u106 >= 1) then
                    v1 = CFrame.new(math.noise(u106 * a1_2) * 8, math.noise(u106 * a1_2 * 2) * 4, 0)
                    local v2 = CFrame.new((Position:Lerp(a2, u106))) * v1
                    u187:PivotTo((CFrame.new(v2.Position, v2.Position - (u188.Position - v2.Position).Unit * 2)))
                    u188 = v2
                    return
                end
                if u187 and u187.Parent then
                    v1 = if not (3 <= (a1:GetLevel())) then "HallowExplosion" else "HallowExplosionMax"
                    if u36[a1.Model.Name] then
                        v1 = u36[a1.Model.Name][v1] or v1
                    end
                    local v3 = u40[a1.Model.Name] or 1
                    EmitterManager.Emit(v1, CFrame.new(a2), a1.Stats.Attributes.ExplosionRadius * v3)
                    for k, v in pairs(u187:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.Transparency = 1
                        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                            v.Enabled = false
                        end
                    end
                    TimescaleUtilities.CleanUp(u187, 2)
                end
                u105:Disconnect()
            end)
        end,
    }
    a1:_loadAnimations((a1:GetLevel()))
    ;(a1.Replicator:GetStateChangedSignal("Upgrade")):Connect(function(a1_2) -- Line: 228 -- upvalues: a1 (val)
        local v1
        if a1.prevAnimLevel == (if not a1.Model.Animations.Fire:FindFirstChild(a1_2) then if not (a1_2 >= 1) then 0 else 1 else a1_2) then
            return
        end
        a1:_loadAnimations(v1)
        a1.prevAnimLevel = v1
    end)
end

return v1