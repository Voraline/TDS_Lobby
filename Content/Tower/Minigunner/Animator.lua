-- Script path: ReplicatedStorage.Content.Tower.Minigunner.Animator
-- Decompile time: 14.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1
local u42 = {"Golden", "Golden Plushie", "Punk", "Road Rage", "Gardener", "Chocolatier", "Ox"}
local u50 = {Cursed = 1}

function v1:FireSound(a2, a3) -- Line: 23
    -- upvalues: u50 (val), EasySound (val)
    local v1
    local Fire = (if not self.FBXModel then self.Model.Weapon.Minigun.Handle else self.Model.PrimaryPart:FindFirstChild("Handle", true)):FindFirstChild("Fire")
    if self.Model.Name == "Holiday" and (self:GetLevel()) < 3 then
        local Handle
        for i, j in Handle:GetChildren() do
            if j:IsA("Sound") and j.Name == "Fire" and 1 < j.TimeLength then
                Fire = j
                break
            end
        end
    end
    if a2 then
        self.goalSFXVolume = 0
        return
    end
    if not Fire then
        return
    end
    local v2 = u50[self.Model.Name] or 0.5
    if self._firePlayer then
        if self._firePlayer.Volume <= 0.001 then
            local Parent = self._firePlayer.Parent
            EasySound.Destroy(self._firePlayer)
            self._firePlayer = nil
            v1 = string.match(Fire.SoundId or "", "%d+")
            local v3 = v1 and tonumber(v1)
            if v3 then
                self._firePlayer = EasySound.Play({
                    looped = true,
                    soundGroupName = "Towers",
                    id = v3,
                    parent = Parent or Fire.Parent,
                    volume = v2,
                })
            end
            self.currentSFXVolume = v2
        end
        self.goalSFXVolume = v2
    else
        local v4 = string.match(Fire.SoundId or "", "%d+")
        v1 = v4 and tonumber(v4)
        if v1 then
            self._firePlayer = EasySound.Play({
                looped = true,
                soundGroupName = "Towers",
                id = v1,
                parent = Fire.Parent,
                volume = v2,
            })
            self.currentSFXVolume = v2
            self.goalSFXVolume = v2
        end
    end
    if self._firePlayer and a3 then
        self._firePlaybackSpeed = a3
    end
end

function v1:_updateAudioPlaybackSpeeds() -- Line: 94 -- upvalues: GameState (val)
    local TimeScale = GameState.TimeScale
    if self._firePlayer and self._firePlaybackSpeed then
        self._firePlayer.PlaybackSpeed = self._firePlaybackSpeed * TimeScale
    end
    if self._spinPlayer then
        self._spinPlayer.PlaybackSpeed = TimeScale
    end
    if self._startPlayer then
        self._startPlayer.PlaybackSpeed = TimeScale
    end
    if self._slowPlayer then
        self._slowPlayer.PlaybackSpeed = TimeScale
    end
    if not self.FBXModel then
        local Head = self.Model:FindFirstChild("Head")
        if Head then
            local Spin = Head:FindFirstChild("Spin")
            local Start = Head:FindFirstChild("Start")
            local Slow = Head:FindFirstChild("Slow")
            if Spin and Spin:IsA("Sound") then
                Spin.PlaybackSpeed = TimeScale
            end
            if Start and Start:IsA("Sound") then
                Start.PlaybackSpeed = TimeScale
            end
            if Slow and Slow:IsA("Sound") then
                Slow.PlaybackSpeed = TimeScale
            end
        end
    end
end

function v1:Fire(a2) -- Line: 130 -- upvalues: u42 (val), EmitterManager (val), SharedControllerFunctions (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Minigun = if self.FBXModel then nil else self.Model.Weapon:WaitForChild("Minigun")
    local Handle = Minigun and Minigun.Handle or (self.BoneVFX or self.Model.PrimaryPart):FindFirstChild("Handle", true)
    if not Handle then
        warn("No handle found for minigunner", self.Model.Name)
        return
    end
    local v1 = nil
    local v2 = nil
    local v3 = if not self.maxAnimsFound then 1 else if not (4 <= (self:GetLevel())) then 1 else 4
    local v4 = 0.1 / self.State.Cooldown
    self:SetStanceAnimation(v3, "Fire", v4)
    self:FireSound(false, v4)
    if not table.find(u42, self.Model.Name) then
        v1 = Handle:WaitForChild("Start")
        v2 = Handle:FindFirstChild("Barrel")
    elseif not (self.Upgrade < 4) then
        if 4 <= self.Upgrade then
            if not self.right then
                v2 = Handle:FindFirstChild("Barrel2")
                v1 = Handle:WaitForChild("Start2")
            else
                v2 = Handle:FindFirstChild("Barrel1")
                v1 = Handle:WaitForChild("Start1")
            end
            self.right = not self.right
        end
    elseif table.find(u42, self.Model.Name) then
        v1 = Handle:WaitForChild("Start")
        v2 = Handle:FindFirstChild("Barrel")
    elseif 4 <= self.Upgrade then
        if not self.right then
            v2 = Handle:FindFirstChild("Barrel2")
            v1 = Handle:WaitForChild("Start2")
        else
            v2 = Handle:FindFirstChild("Barrel1")
            v1 = Handle:WaitForChild("Start1")
        end
        self.right = not self.right
    end
    if self.FBXModel then
        v1 = Handle:FindFirstChild(("Start%*"):format((self:GetLevel())), true) or Handle:FindFirstChild("Start")
    end
    if not self.FBXModel then
        local Attribute
        for k, v in pairs(v1:GetChildren()) do
            if v:IsA("ParticleEmitter") then
                Attribute = v:GetAttribute("EmitCount")
                if Attribute then
                    v:Emit(Attribute)
                end
            end
        end
    else
        EmitterManager.manualEmit(v1)
        self._vfxStart = v1
    end
    if Minigun and v2 then
        local v5 = self.barrelJoints[Minigun]
        if v5 then
            local v6 = v5[v2]
            if v6 then
                local spring = v6.spring
                spring.v = spring.v + 20
            end
        end
    end
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    self:Face(Position)
    SharedControllerFunctions.AimArmsAt(self, Position)
    SharedControllerFunctions.AimHeadAt(self, Position_2)
    self:Bullet({
        Spread = 50,
        Speed = 140,
        Bullet = "Normal",
        Start = v1.WorldPosition,
        End = Position,
    })
end

function v1:SetStanceAnimation(a2, a3, a4) -- Line: 217 -- upvalues: GameState (val)
    local v1 = self.animationStances[a2][a3]
    local v2 = 0
    if v1 then
        if self.currentAnimation == v1 then
            return
        end
        v1:Play()
        if a4 then
            if v1.Looped then
                a4 = math.clamp(a4 - 0.1, 0, (1 / 0))
            end
            v1:AdjustSpeed(a4)
        end
    end
    for k, v in pairs(self.animationStances) do
        for k2, i in pairs(v) do
            if i.IsPlaying and k2 == a3 and v1 then
                v2 = v1.Length * (i.TimePosition / i.Length) * GameState.TimeScale
            end
            if i ~= v1 then
                i:Stop()
            end
        end
    end
    if v1 then
        v1.TimePosition = v2
        self.currentAnimation = v1
    end
    self.currentStance = a3
end

function v1.Initialize(a1) -- Line: 250
    -- upvalues: SpringClass (val), EasySound (val), SharedControllerFunctions (val), RunService (val), GameState (val)
    -- upvalues: TweenService (val)
    local v1, v2, v3, v4, v5
    if a1.Model.Name == "Nutcracker" then
        a1.Model.HumanoidRootPart:WaitForChild("Song"):Play()
    end
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local u283 = tick()
    local u284 = tick()
    local u285 = true
    local u286 = nil
    a1._startPlayer = nil
    a1._spinPlayer = nil
    a1._slowPlayer = nil
    a1._firePlayer = nil
    a1._firePlaybackSpeed = nil
    a1.barrelJoints = {}
    a1.recoilSprings = {}
    local u287 = 0
    local u288 = 0
    a1.currentSFXVolume = 0
    a1.goalSFXVolume = 0
    a1.right = true
    a1.recoilSpring = SpringClass.new(0, 0.5, 30)
    a1.Maid:Mark(function() -- Line: 274 -- upvalues: a1 (val), EasySound (upval)
        local v1
        for i, v in ipairs({"_spinPlayer", "_slowPlayer", "_startPlayer", "_firePlayer"}) do
            v1 = a1[v]
            if v1 then
                v1:Stop()
                EasySound.Destroy(v1)
                a1[v] = nil
            end
        end
    end)
    for k, v in pairs(a1.Model:GetDescendants()) do
        if v:IsA("Model") and v.Name == "Minigun" then
            v2 = {}
            for k2, i in pairs((v:WaitForChild("Handle")):GetChildren()) do
                if i:IsA("Motor6D") and i.Name:match("Barrel") then
                    v4 = a1.recoilSprings[k2]
                    if not v4 then
                        a1.recoilSprings[k2] = (SpringClass.new(0, 0.5, 20))
                        v4 = a1.recoilSprings[k2]
                    end
                    v5 = {spring = v4, originalC0 = i.C0}
                    v2[i] = v5
                end
            end
            a1.barrelJoints[v] = v2
        end
    end
    if not a1.FBXModel then
        local v6 = {a1.Model.Torso["Right Shoulder"], a1.Model.Torso["Left Shoulder"]}
        if a1.Model.Name == "Plushie" then
            table.insert(v6, ((a1.Model:WaitForChild("HumanoidRootPart")):WaitForChild("Gun")))
        end
        SharedControllerFunctions.RegisterJoints(a1, v6)
    end
    a1.maxAnimsFound = not not (a1.Model.Animations:WaitForChild("Fire")):FindFirstChild("4")
    a1.currentStance = ""
    a1.currentAnimation = nil
    a1.animationStances = {}
    for k3, j in pairs(a1.Model.Animations:WaitForChild("Fire"):GetChildren()) do
        v1 = tonumber(j.Name)
        a1.animationStances[v1] = {}
        for k4, k5 in pairs(j:GetChildren()) do
            v3 = a1.animationStances[v1]
            v3[k5.Name] = (AnimationController:LoadAnimation(k5))
        end
    end
    a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 326
        -- upvalues: a1 (val), u288 (ref), u287 (ref), GameState (upval), EasySound (upval), u285 (ref)
        a1:_updateAudioPlaybackSpeeds()
        local Minigun = a1.Model.Weapon:FindFirstChild("Minigun")
        local Handle = Minigun and Minigun:FindFirstChild("Handle") or (a1.BoneVFX or a1.Model.PrimaryPart):FindFirstChild("Handle", true)
        if not Handle then
            warn("No handle found for minigunner", a1.Model.Name)
            return
        end
        u288 = math.lerp(u288, u287, a1_2 * GameState.TimeScale)
        if a1._firePlayer then
            a1.currentSFXVolume = math.lerp(a1.currentSFXVolume, a1.goalSFXVolume, a1_2 * 10)
            a1._firePlayer.Volume = a1.currentSFXVolume
            if a1.goalSFXVolume == 0 and a1.currentSFXVolume <= 0.001 then
                a1._firePlayer:Stop()
                EasySound.Destroy(a1._firePlayer)
                a1._firePlayer = nil
            end
        end
        for k, v in pairs(a1.recoilSprings) do
            v.t = 0
        end
        if Minigun then
            local v1 = Minigun:FindFirstChild("Handle")
            local v2 = a1.barrelJoints[Minigun]
            if v2 and v1 then
                local Part1, Spin, new, originalC0, v3
                for k2, i in pairs(v2) do
                    originalC0 = i.originalC0
                    new = CFrame.new
                    v3 = i.spring.p * 0.45
                    k2.C0 = originalC0 * new(0, 0, v3 / math.clamp(GameState.TimeScale, 1, (1 / 0)))
                    k2.MaxVelocity = u288
                    Part1 = k2.Part1
                    if Part1 then
                        Spin = Part1:FindFirstChild("Spin")
                        if Spin then
                            Spin.Enabled = not u285
                        end
                    end
                end
            end
        end
    end)))
    a1:Thread(function() -- Line: 377
        -- upvalues: a1 (val), u283 (ref), GameState (upval), u285 (ref), u284 (ref), TweenService (upval), u286 (ref)
        -- upvalues: u287 (ref), EasySound (upval)
        local v1 = a1:FindTarget()
        local v2 = if not a1.maxAnimsFound then 1 else if not (4 <= (a1:GetLevel())) then 1 else 4
        local v3 = tick()
        local HumanoidRootPart = a1.Model:FindFirstChild("HumanoidRootPart") or a1.Model.PrimaryPart
        local PrimaryPart = if not a1.FBXModel then a1.Model:FindFirstChild("Head") else a1.Model.PrimaryPart
        local v4 = (v3 - u283) * GameState.TimeScale
        if a1.State.Cooldown <= v4 then
            local v5, v6
            if not v1 then
                a1:FireSound(true)
                if not u285 and (v3 - u283) * GameState.TimeScale < a1.Stats.Attributes.SlowTime then
                    a1:SetStanceAnimation(v2, "Holster")
                    return
                end
                if not u285 then
                    v4 = (tick() - u283) * GameState.TimeScale
                    if a1.Stats.Attributes.SlowTime <= v4 then
                        u285 = true
                        a1:SetStanceAnimation(v2, "Outro", 1 * GameState.TimeScale)
                        if HumanoidRootPart and HumanoidRootPart:FindFirstChild("Song") then
                            TweenService:Create(
                                a1.Model.Torso.Key0,
                                TweenInfo.new(a1.Stats.Attributes.SlowTime * 2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                                {MaxVelocity = 0}
                            ):Play()
                            TweenService:Create(
                                HumanoidRootPart.Song,
                                TweenInfo.new(a1.Stats.Attributes.SlowTime),
                                {Volume = 0, PlaybackSpeed = 0.5}
                            ):Play()
                        end
                        if a1._spinPlayer then
                            a1._spinPlayer:Stop()
                            EasySound.Destroy(a1._spinPlayer)
                            a1._spinPlayer = nil
                        end
                        if a1._startPlayer then
                            a1._startPlayer:Stop()
                            EasySound.Destroy(a1._startPlayer)
                            a1._startPlayer = nil
                        end
                        local Slow = PrimaryPart:FindFirstChild("Slow")
                        if Slow and Slow:IsA("Sound") then
                            v5 = string.match(Slow.SoundId or "", "%d+")
                            v6 = v5 and tonumber(v5)
                            if v6 then
                                if a1._slowPlayer then
                                    a1._slowPlayer:Stop()
                                    EasySound.Destroy(a1._slowPlayer)
                                    a1._slowPlayer = nil
                                end
                                a1._slowPlayer = EasySound.Play({
                                    soundGroupName = "Towers",
                                    destroyOnEnd = true,
                                    id = v6,
                                    parent = Slow.Parent,
                                    volume = Slow.Volume,
                                })
                            end
                        end
                        u287 = 0
                        if u286 then
                            u286:Disconnect()
                        end
                    end
                end
            elseif v1.PrimaryPart then
                if u285 then
                    u285 = false
                    u284 = v3
                    if HumanoidRootPart and HumanoidRootPart:FindFirstChild("Song") then
                        TweenService:Create(
                            a1.Model.Torso.Key0,
                            TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                            {MaxVelocity = 0.8}
                        ):Play()
                        TweenService:Create(a1.Model.HumanoidRootPart.Song, TweenInfo.new(1), {Volume = 1.5, PlaybackSpeed = 1}):Play()
                    end
                    if PrimaryPart then
                        PrimaryPart.Start:Play()
                        u286 = PrimaryPart.Start.Ended:Connect(function() -- Line: 418 -- upvalues: PrimaryPart (val)
                            PrimaryPart.Spin:Play()
                        end)
                    end
                    v4 = 1.5 / a1.Stats.Attributes.RevTime * GameState.TimeScale
                    a1:SetStanceAnimation(v2, "Intro", v4)
                    u287 = 0.35
                end
                local Start_2 = PrimaryPart:FindFirstChild("Start")
                if Start_2 and Start_2:IsA("Sound") then
                    v5 = string.match(Start_2.SoundId or "", "%d+")
                    v6 = v5 and tonumber(v5)
                    if v6 then
                        if a1._startPlayer then
                            a1._startPlayer:Stop()
                            EasySound.Destroy(a1._startPlayer)
                            a1._startPlayer = nil
                        end
                        a1._startPlayer = EasySound.Play({
                            soundGroupName = "Towers",
                            destroyOnEnd = true,
                            id = v6,
                            parent = Start_2.Parent,
                            volume = Start_2.Volume,
                        })
                    end
                end
                v5 = 1.5 / a1.Stats.Attributes.RevTime * GameState.TimeScale
                a1:SetStanceAnimation(v2, "Intro", v5)
                if u286 then
                    u286:Disconnect()
                end
                if a1._startPlayer then
                    u286 = a1._startPlayer.Ended:Connect(function() -- Line: 461 -- upvalues: a1 (upval), PrimaryPart (val), EasySound (upval)
                        if a1._spinPlayer then
                            return
                        end
                        local Spin = PrimaryPart:FindFirstChild("Spin")
                        if Spin and Spin:IsA("Sound") then
                            local v1 = string.match(Spin.SoundId or "", "%d+")
                            local v2 = v1 and tonumber(v1)
                            if v2 then
                                a1._spinPlayer = EasySound.Play({
                                    looped = true,
                                    soundGroupName = "Towers",
                                    id = v2,
                                    parent = Spin.Parent,
                                    volume = Spin.Volume,
                                })
                            end
                        end
                    end)
                end
                if u285 then
                    a1:Face(v1.PrimaryPart.Position)
                    a1:Delay(a1.State.Cooldown)
                else
                    v6 = (v3 - u284) * GameState.TimeScale
                    if not (a1.Stats.Attributes.RevTime <= v6) then
                        a1:Face(v1.PrimaryPart.Position)
                        a1:Delay(a1.State.Cooldown)
                    else
                        a1:Fire(v1)
                    end
                end
                u283 = v3
                return
            end
        end
    end)
end

return v1