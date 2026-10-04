-- Script path: ReplicatedStorage.Content.Tower.Warden.Animator
-- Decompile time: 8.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Effects = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")
local v1 = {}
v1.__index = v1

local function runTweenChain(a1, a2) -- Line: 20 -- upvalues: TweenService (val) -- types: a1: userdata, a2: table
    local v1
    local u42 = false
    local u35 = {}
    local v2 = nil
    local v3 = nil
    for i, j in a2, v2, v3 do
        local u24 = TweenService:Create(a1, j.TweenInfo, j.Properties)
        v1 = u35[#u35]
        if v1 then
            v1.Completed:Connect(function() -- Line: 29 -- upvalues: u42 (ref), u24 (val)
                if not u42 then
                    u24:Play()
                end
            end)
        elseif not u42 then
            u24:Play()
        end
        table.insert(u35, u24)
    end
    return function() -- Line: 41 -- upvalues: u42 (ref), u35 (val)
        u42 = true
        for i, j in u35 do
            if j.PlaybackState == Enum.PlaybackState.Playing then
                j:Cancel()
            end
        end
    end
end

local function runHandFade(a1) -- Line: 52 -- upvalues: runTweenChain (val)
    local v1 = {
        {
            TweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            Properties = {Transparency = 1},
        },
        {
            TweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            Properties = {Transparency = 0},
        },
        {
            TweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
            Properties = {Transparency = 1},
        },
    }
    local u23 = {}
    local u24 = {}
    for i, j in a1.Model.Weapon:GetChildren() do
        if j:IsA("BasePart") and j.Name:find("Hand") then
            j.Transparency = 0
            u23[j] = true
            table.insert(u24, (runTweenChain(j, v1)))
        end
    end
    return function() -- Line: 84 -- upvalues: u24 (val), u23 (val)
        for i, j in u24 do
            j()
        end
        for k in u23 do
            k.Transparency = 0
        end
        table.clear(u24)
        table.clear(u23)
    end
end

local function AdjustLevel(a1) -- Line: 98 -- types: a1: number
    if a1 < 4 then
        return 0
    end
    return 4
end

local function getSwingSounds(a1) -- Line: 102
    local v1 = {}
    for i, j in a1 do
        if j:IsA("Sound") then
            table.insert(v1, j)
        end
    end
    return v1
end

function v1.Initialize(a1) -- Line: 114
    -- upvalues: getSwingSounds (val), Animation (val), SoundPool (val), runHandFade (val), GameState (val)
    -- upvalues: EmitterManager (val), TimescaleUtilities (val), Effects (val)
    a1.lastFade = nil
    a1.handFade = false
    a1.canSound = true
    a1.lastAnimLevel = -1
    a1._soundPools = {}
    a1.root = a1.Model.PrimaryPart
    a1.swingSounds = if not a1.root:FindFirstChild("Swings") then {
        a1.Model.Head.Swing1,
        a1.Model.Head.Swing2,
        a1.Model.Head.Swing3,
    } else getSwingSounds(a1.root.Swings:GetChildren())

    function a1:updateAttackAnims(a2) -- Line: 126 -- upvalues: Animation (upval) -- types: self: table, a2: number
        local v1
        if self.lastAnimLevel == (if not (a2 < 4) then 4 else 0) then
            return
        end
        self.lastAnimLevel = v1
        local AnimationController = self.Model:WaitForChild("AnimationController")
        local Animations = self.Model:WaitForChild("Animations")
        for i, v in ipairs(self.swingAnimations) do
            if v then
                v:Stop()
            end
        end
        table.clear(self.swingAnimations)
        for i2, i3 in ipairs(Animations.Fire[v1]:GetChildren()) do
            self.swingAnimations[i2] = (Animation.new({Preload = true, Track = i3, Target = AnimationController}))
        end
    end

    a1.swingAnimations = {}
    a1:updateAttackAnims((a1:GetLevel()))
    ;(a1.Replicator:GetStateChangedSignal("Upgrade")):Connect(function(a1_2) -- Line: 156 -- upvalues: a1 (val) -- types: a1_2: number
        a1:updateAttackAnims(a1_2)
    end)
    a1.Model.AnimationController.AnimationPlayed:Connect(function(a1_2) -- Line: 160 -- upvalues: a1 (val), SoundPool (upval), runHandFade (upval) -- types: a1_2: userdata
        if a1_2 and a1_2.Looped ~= true then
            a1.canSound = true
            local u4 = nil
            pcall(function() -- Line: 169 -- upvalues: u4 (ref), a1_2 (val), a1 (upval), SoundPool (upval), runHandFade (upval)
                u4 = (a1_2:GetMarkerReachedSignal("Swing")):Connect(function(a1_3) -- Line: 170 -- upvalues: a1 (upval), SoundPool (upval), runHandFade (upval), a1_2 (upval), u4 (upval)
                    local Trail = if not a1.BoneVFX then if not a1.FBXModel then a1.Model.Weapon:FindFirstChild("Baton") and a1.Model.Weapon.Baton.Handle.Trail else a1.Model.Handle.Value.Trail else a1.BoneVFX:FindFirstChild("Trail", true) or a1.Model.Handle.Value.Trail
                    if a1_3 ~= "true" then
                        if a1.Model.Name == "Patriotic" then
                            for i, j in a1.Model.Trail.BladeBase:GetChildren() do
                                j.Enabled = false
                            end
                        end
                        if Trail then
                            Trail.Enabled = false
                        end
                        u4:Disconnect()
                        return
                    end
                    local v1 = a1.swingSounds[math.random(1, #a1.swingSounds)]
                    local v2 = a1._soundPools[v1]
                    if not v2 then
                        v2 = SoundPool.new({
                            size = 5,
                            audioGroup = "Towers",
                            timeScaled = true,
                            id = v1.SoundId,
                            parent = v1.Parent,
                        })
                        a1._soundPools[v1] = v2
                    end
                    v2:play({volume = 0.25, playbackSpeed = Random.new():NextNumber(0.8, 1.2)})
                    if a1.Model.Name == "Patriotic" then
                        for k, n in a1.Model.Trail.BladeBase:GetChildren() do
                            n.Enabled = true
                        end
                    end
                    if Trail then
                        Trail.Enabled = true
                    end
                    if a1.Model.Name ~= "Masquerade" then
                        return
                    end
                    if a1.lastFade then
                        a1.lastFade()
                        a1.lastFade = nil
                    end
                    a1.lastFade = runHandFade(a1)
                    a1_2.Stopped:Once(function() -- Line: 212 -- upvalues: a1 (upval)
                        if a1.lastFade then
                            a1.lastFade()
                            a1.lastFade = nil
                        end
                    end)
                end)
            end)
            return
        end
    end)
    a1.Executables = {
        Attack = function(a1_2) -- Line: 237 -- upvalues: a1 (val), GameState (upval) -- types: a1_2: number
            for i, v in ipairs(a1.swingAnimations) do
                v:Stop()
            end
            local v1 = #a1.swingAnimations
            if v1 == 0 then
                return
            end
            local v2 = a1.swingAnimations[(a1_2 - 1) % v1 + 1]
            local v3 = v2:Play().Length or 1
            local v4 = 1
            if v3 then
                v4 = 1 / (a1.Stats.Cooldown * 0.75 / v3) * GameState.TimeScale
            end
            if a1.Model.Name == "Patriotic" then
                v4 = v4 / 1.8
            end
            v2:AdjustSpeed(v4)
        end,
        Hurt = function(a1_2, a2, a3) -- Line: 266
            -- upvalues: a1 (val), SoundPool (upval), EmitterManager (upval), TimescaleUtilities (upval)
            local Attribute, v1
            if a1.canSound then
                local Hit, v2
                a1.canSound = false
                for i, j in a1.Model:GetChildren() do
                    Hit = j:FindFirstChild("Hit", true)
                    if Hit and Hit:IsA("Sound") then
                        v2 = a1._soundPools[Hit]
                        if not v2 then
                            v2 = SoundPool.new({
                                size = 6,
                                audioGroup = "Towers",
                                timeScaled = true,
                                id = Hit.SoundId,
                                parent = Hit.Parent,
                            })
                            a1._soundPools[Hit] = v2
                        end
                        v2:play({volume = 0.25, playbackSpeed = Random.new():NextNumber(0.8, 1.2)})
                    end
                end
                if a3 then
                    local PrimaryPart = if not a1.FBXModel then a1.Model.Head else a1.Model.PrimaryPart
                    local Crit = PrimaryPart.Crit
                    v1 = a1._soundPools[Crit]
                    if not v1 then
                        v1 = SoundPool.new({
                            size = 3,
                            audioGroup = "Towers",
                            timeScaled = true,
                            id = Crit.SoundId,
                            parent = Crit.Parent,
                        })
                        a1._soundPools[Crit] = v1
                    end
                    v1:play({volume = 0.25, playbackSpeed = Random.new():NextNumber(0.8, 1.2)})
                end
            end
            local X = a2.X
            local v3 = X / 4
            v1 = Vector3.new((Random.new()):NextNumber(-v3, v3), (Random.new()):NextNumber(-v3, v3), ((Random.new()):NextNumber(-v3, v3)))
            if a1.Model:FindFirstChild("HitVFX") then
                local u134 = a1.Model.HitVFX:Clone()
                u134.Position = a1_2 + v1
                u134.Parent = workspace.Terrain
                for k2, k3 in pairs(u134:GetDescendants()) do
                    if k3:IsA("ParticleEmitter") then
                        k3.ZOffset = X + k3.ZOffset
                    end
                end
                EmitterManager.manualEmit(u134)
                TimescaleUtilities.Delay(1, function() -- Line: 336 -- upvalues: u134 (val)
                    u134:Destroy()
                end)
                return
            end
            local Handle = a1.Model.Handle
            if Handle:IsA("ObjectValue") then
                Handle = Handle.Value
            end
            local Hit_2 = Handle:FindFirstChild("Hit")
            if not Hit_2 then
                warn(string.format("[Warden] Missing Hit effect on %s", Handle.Name))
                return
            end
            local u195 = Hit_2:Clone()
            u195.Parent = workspace.Terrain
            u195.WorldPosition = a1_2 + v1
            for k, v in pairs(u195:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    v.ZOffset = X + v.ZOffset
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
            TimescaleUtilities.Delay(1, function() -- Line: 368 -- upvalues: u195 (val)
                u195:Destroy()
            end)
        end,
        Stun = function(a1, a2) -- Line: 373
            -- upvalues: Animation (upval), GameState (upval), Effects (upval), TimescaleUtilities (upval)
            local PrimaryPart = a1.PrimaryPart
            local ExtentsSize = a1:GetExtentsSize()
            local Stun = a1:WaitForChild("Animations"):FindFirstChild("Stun")
            local u20 = nil
            if Stun then
                u20 = Animation.new({Track = Stun, Target = a1.AnimationController})
                local v1 = 4.3 / ExtentsSize.Y * 1.5 * GameState.TimeScale
                u20:Play()
                u20.Controller:AdjustSpeed(v1)
            end
            local u46 = (Effects:WaitForChild("Particles")):WaitForChild("Dizzy"):Clone()
            u46.Parent = a1
            u46.Anchored = false
            u46.Rotate.Part1 = PrimaryPart
            for k, v in pairs(u46.Particles:GetChildren()) do
                v.Enabled = true
            end
            u46.Trail1.Enabled = true
            u46.Trail2.Enabled = true
            TimescaleUtilities.Delay(a2, function() -- Line: 405 -- upvalues: u46 (val)
                u46:Destroy()
            end)
            if u20 then
                TimescaleUtilities.Delay(a2 * 0.65, function() -- Line: 410 -- upvalues: u20 (ref)
                    u20:Stop(0.5)
                end)
            end
        end,
        Block = function() -- Line: 416 -- upvalues: Animation (upval), a1 (val), EmitterManager (upval)
            Animation.new({
                Track = a1.Model.Animations.Block,
                Target = a1.Model.AnimationController,
            }):Play()
            if a1.Model.PrimaryPart:FindFirstChild("ParrySound") then
                a1.Model.PrimaryPart.ParrySound:Play()
            end
            local Parry = a1.Model.PrimaryPart.Parry
            EmitterManager.manualEmit(Parry)
        end,
    }
end

return v1