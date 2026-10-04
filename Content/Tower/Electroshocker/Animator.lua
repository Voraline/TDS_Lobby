-- Script path: ReplicatedStorage.Content.Tower.Electroshocker.Animator
-- Decompile time: 13.68 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimerClass = require(ReplicatedStorage.Shared.Modules.TimerClass)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1
local u52 = Random.new()

local function specialZap(a1, a2, a3) -- Line: 23 -- upvalues: u52 (val), TweenService (val), TimescaleUtilities (val)
    local startAttachment, v1, v2, v3, v4, v5, v6
    local v7 = {}
    local Magnitude = (a1.Start - a1.End).Magnitude
    local u193 = Magnitude / math.clamp(math.floor(Magnitude / 4), 3, (1 / 0))
    local v8 = #a2
    local Part = Instance.new("Part")
    Part.Anchored = true
    Part.Transparency = 1
    Part.CanCollide = false
    Part.Size = Vector3.new(0, 0, Magnitude)
    Part.CFrame = (CFrame.new(a1.Start, a1.End)) * CFrame.new(0, 0, -Magnitude / 2)
    Part.Parent = workspace.CurrentCamera

    local function v9(a1) -- Line: 41 -- upvalues: u193 (val), Magnitude (val), Part (val)
        local v1 = u193 * a1
        local Attachment = Instance.new("Attachment")
        Attachment.Name = "Node" .. a1
        Attachment.Position = Vector3.new(0, 0, -Magnitude / 2 + v1)
        Attachment.Parent = Part
        return Attachment
    end

    local Bursts = a1.Bursts
    local v10, v11, v12 = a1, a2, a3
    for i = 1, Bursts do
        table.insert(v7, {})
        v2 = v7[i]
        v4 = u193 * 0
        v3 = Instance.new("Attachment")
        v3.Name = "Node" .. 0
        v3.Position = Vector3.new(0, 0, -Magnitude / 2 + v4)
        v3.Parent = Part
        table.insert(v2, v3)
        v1 = v10.Lifetime * u52:NextNumber(0.2, 1)
        for j = 1, v8 do
            v6 = u193 * j
            v5 = Instance.new("Attachment")
            v5.Name = "Node" .. j
            v5.Position = Vector3.new(0, 0, -Magnitude / 2 + v6)
            v5.Parent = Part
            v6 = v11[j]
            v6.Enabled = true
            v6.FaceCamera = true
            startAttachment = v10.startAttachment or v7[i][j]
            v6.Attachment0 = startAttachment
            v6.Attachment1 = v5
            v6.Parent = Part
            v12.Parent = Part
            v12.CFrame = v5.WorldCFrame
            for i2, v in ipairs(v12:GetDescendants()) do
                if v:IsA("ParticleEmitter") then
                    v.Enabled = true
                end
            end
            TweenService:Create(
                v6,
                TweenInfo.new(v1, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
                {Width0 = 0, Width1 = 0}
            ):Play()
            table.insert(v7[i], v5)
            TimescaleUtilities.Delay(v10.Lifetime, function() -- Line: 90 -- upvalues: Part (val)
                Part:Destroy()
            end)
        end
    end
end

function v1.Initialize(a1) -- Line: 97
    -- upvalues: SharedControllerFunctions (val), specialZap (val), u52 (val), Laser (val), Animation (val)
    -- upvalues: ReplicatedStorage (val), Debris (val), TimescaleUtilities (val)
    a1._weaponHandles = {}
    a1._animations = {}
    a1._adsTimer = nil
    a1:_updateAnimations()
    a1:_updateWeaponStarts()
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 104 -- upvalues: a1 (val)
        a1:_updateAnimations()
        if a1_2 >= 4 then
            a1:_updateWeaponStarts()
        end
    end)
    if a1.Model.Name == "Classic" then
        local Weapon = a1.Model:FindFirstChild("Weapon")
        if Weapon then
            Weapon:Destroy()
        end
    elseif a1.Model.Name == "Jellyfish" then
        a1._beam04 = a1.Model:WaitForChild("JellyfishBeam04")
        a1._beam5 = a1.Model:WaitForChild("JellyfishBeam5")
        a1._beam04.Parent = nil
        a1._beam5.Parent = nil
        a1._hit04 = a1.Model:WaitForChild("JellyfishHitLevel04")
        a1._hit5 = a1.Model:WaitForChild("JellyfishHitLevel5")
        a1._hit04.Parent = nil
        a1._hit5.Parent = nil
    end
    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Shoulder"], a1.Model.Torso["Right Shoulder"]})
    end
    a1.Executables = {
        Bolt = function(a1_2) -- Line: 136 -- upvalues: a1 (val), specialZap (upval), u52 (upval), Laser (upval)
            local PrimaryPart_2, PrimaryPart_3, shoot, v1
            if #a1_2 <= 0 then
                return
            end
            local v2 = a1_2[1]
            local PrimaryPart = v2 and v2.PrimaryPart
            if not v2 and not PrimaryPart then
                return
            end
            a1:Fire(v2)
            local Weapon = a1.Model:FindFirstChild("Weapon")
            local Weapon_2 = Weapon and Weapon:FindFirstChild("Weapon")
            local Configuration = Weapon_2 and Weapon_2:FindFirstChild("Configuration")
            local Attribute = Configuration and Configuration:GetAttribute("FireDelay")
            if typeof(Attribute) == "number" and Attribute > 0 then
                a1:Wait(Attribute)
            end
            if not (#a1._weaponHandles > 0) then
                local Weapon_3 = a1.Model:FindFirstChild("Weapon")
                if not Weapon_3 then
                    return
                end
                local Weapon_4 = Weapon_3:FindFirstChild("Weapon")
                if not Weapon_4 then
                    return
                end
                local Configuration_2 = Weapon_4:FindFirstChild("Configuration")
                if not Configuration_2 then
                    return
                end
                local Attachments = Configuration_2:FindFirstChild("Attachments")
                if not Attachments then
                    return
                end
                local Start_2 = Attachments:FindFirstChild("Start")
                if Start_2 and Start_2.Value then
                    local v3 = {
                        Lifetime = 0.5,
                        minWidth = 0.1,
                        maxWidth = 0.2,
                        Bursts = 2,
                        Color = Color3.fromRGB(214, 8, 255),
                        Start = Start_2.Value.WorldPosition,
                        End = PrimaryPart.Position,
                        Offset = u52:NextNumber(0.25, 0.5),
                    }
                    Laser:Lightning(v3)
                    if #a1_2 > 1 then
                        local PrimaryPart_4 = a1_2[#a1_2].PrimaryPart
                        if PrimaryPart_4 then
                            v3.Start = PrimaryPart.Position
                            v3.End = PrimaryPart_4.Position
                            Laser:Lightning(v3)
                        end
                    end
                    return
                end
                return
            end
            local v4 = a1_2
            for i, v in ipairs(a1._weaponHandles) do
                if v then
                    v1 = workspace
                    if v:IsDescendantOf(v1) then
                        local Start = v.Start
                        local u86 = Color3.fromRGB(0, 170, 255)
                        if a1.Model.Name == "Classic" and a1:GetLevel() == 5 then
                            u86 = Color3.fromRGB(132, 0, 255)
                        end
                        if a1.Model.Name ~= "Jellyfish" then
                            v1 = {
                                Lifetime = 0.5,
                                minWidth = 0.1,
                                maxWidth = 0.2,
                                Bursts = 2,
                                Color = u86,
                                Start = Start.WorldPosition,
                                End = PrimaryPart.Position,
                                Offset = u52:NextNumber(0.25, 0.5),
                            }
                            Laser:Lightning(v1)
                            if #v4 > 1 then
                                PrimaryPart_3 = v4[#v4].PrimaryPart
                                if PrimaryPart_3 then
                                    v1.Start = PrimaryPart.Position
                                    v1.End = PrimaryPart_3.Position
                                    Laser:Lightning(v1)
                                end
                            end
                        else
                            function shoot(a1_2) -- Line: 173
                                -- upvalues: a1 (upval), specialZap (upval), u86 (ref), Start (val), u52 (upval)
                                local v1 = if a1:GetLevel() ~= 5 then a1._beam04:Clone() else a1._beam5:Clone()
                                local v2 = {}
                                for i, v in ipairs(v1:GetDescendants()) do
                                    if v:IsA("Beam") then
                                        v.Enabled = true
                                        table.insert(v2, v)
                                    end
                                end
                                specialZap({
                                    Lifetime = 0.5,
                                    minWidth = 0.1,
                                    maxWidth = 0.2,
                                    Bursts = 2,
                                    Color = u86,
                                    Start = Start.WorldPosition,
                                    End = a1_2.Position,
                                    Offset = u52:NextNumber(0.25, 0.5),
                                    startAttachment = Start,
                                }, v2, if a1:GetLevel() ~= 5 then a1._hit04:Clone() else a1._hit5:Clone())
                                v1:Destroy()
                            end

                            shoot(PrimaryPart)
                            if #v4 > 1 then
                                PrimaryPart_2 = v4[#v4].PrimaryPart
                                if PrimaryPart_2 then
                                    shoot(PrimaryPart_2)
                                end
                            end
                        end
                    end
                end
            end
        end,
        Shock = function(a1_2, a2) -- Line: 288
            -- upvalues: a1 (val), Animation (upval), ReplicatedStorage (upval), Debris (upval)
            -- upvalues: TimescaleUtilities (upval)
            local Torso, v1
            local Seizure = a1.Model.Animations.Seizure
            local u73 = Animation.new({Track = Seizure, Target = a1_2.AnimationController})
            local Electric = ReplicatedStorage.Assets.Effects.Particles.Electric
            local u67 = {}
            local v2 = a1_2
            for k, v in pairs(Electric.Effect:GetChildren()) do
                v1 = v:Clone()
                Torso = v2:FindFirstChild("Torso") or v2.PrimaryPart
                v1.Parent = Torso
                Debris:AddItem(v1, a2 + 1)
                table.insert(u67, v1)
            end
            u73:Play()
            u73.Controller:AdjustWeight(a2 / 2, a2 / 4)
            TimescaleUtilities.Delay(a2, function() -- Line: 305 -- upvalues: u73 (val), a2 (val), u67 (val)
                u73:Stop(a2)
                for k, v in pairs(u67) do
                    if v ~= nil then
                        v.Enabled = false
                    end
                end
            end)
        end,
    }
end

function v1:_updateAnimations() -- Line: 317 -- upvalues: Animation (val)
    local Animations = self.Model.Animations
    local AnimationController = self.Model.AnimationController

    local function handleAnim(a1, a2) -- Line: 321 -- upvalues: Animation (upval), AnimationController (val), self (val)
        local v1 = Animation.new({IgnorePriority = true, Track = a2, Target = AnimationController})
        self.Maid:Mark(v1)
        local ADS = self._animations.ADS
        self._animations[a1] = v1
        if a1 == "ADS" and ADS and ADS.Controller and ADS.Controller.IsPlaying then
            ADS:Stop()
            v1:Play()
        end
    end

    for i, v in ipairs(Animations:GetChildren()) do
        if v:IsA("Folder") then
            for i2, i3 in ipairs(v:GetChildren()) do
                if not i3:IsA("Animation") then
                    if i3:IsA("Folder") then
                        for i4, j in ipairs(i3:GetChildren()) do
                            if j:IsA("Animation") and (tonumber(i3.Name)) == self.Upgrade then
                                handleAnim(j.Name, j)
                            end
                        end
                    end
                elseif (tonumber(i3.Name)) == self.Upgrade then
                    handleAnim(i3.Parent.Name, i3)
                end
            end
        end
    end
end

function v1:_updateWeaponStarts() -- Line: 359
    local v1, v2
    table.clear(self._weaponHandles)
    local Level = self:GetLevel()

    local function getNumberAttribute(a1, ...) -- Line: 363
        local Attribute
        for i, v in ipairs({...}) do
            Attribute = a1:GetAttribute(v)
            if typeof(Attribute) == "number" then
                return Attribute
            end
        end
        return nil
    end

    local function shouldUseHandleForLevel(a1) -- Line: 374 -- upvalues: getNumberAttribute (val), Level (val)
        local v1 = getNumberAttribute(a1, "LevelMin")
        local v2 = getNumberAttribute(a1, "LevelMax")
        if v1 and Level < v1 then
            return false
        end
        if v2 and v2 < Level then
            return false
        end
        return true
    end

    if self.Model.Name == "Classic" then
        local v3, v4
        local v5 = {[5] = "Tesla3Core", [4] = "Tesla2Core"}
        table.insert(self._weaponHandles, (self.Model:FindFirstChild(v5[(self:GetLevel())] or "TeslaCore", true)))
        local v6 = nil
        local v7 = nil
        for j, k in self._weaponHandles, v6, v7 do
            if k then
                v3 = workspace
                if k:IsDescendantOf(v3) then
                    v1 = {}
                    for n, m in k:GetChildren() do
                        if m.Name == "Start" then
                            table.insert(v1, m)
                        end
                    end
                    v3 = nil
                    v4 = nil
                    for i5, i6 in v1, v3, v4 do
                        for k2, i7 in pairs(i6:GetDescendants()) do
                            if i7:IsA("ParticleEmitter") then
                                task.defer(function() -- Line: 414 -- upvalues: i7 (val)
                                    i7.Enabled = false
                                end)
                            end
                        end
                    end
                end
            end
        end
        return
    end
    if self.Model.Name == "Jellyfish" then
        local BoneVFX = self.BoneVFX
        if BoneVFX then
            for i2, i3 in ipairs(BoneVFX:GetDescendants()) do
                if i3:IsA("Attachment") and i3.ClassName ~= "Bone" and string.match(i3.Name, "^Handle") then
                    v1 = getNumberAttribute(i3, "LevelMin")
                    v2 = getNumberAttribute(i3, "LevelMax")
                    if if not v1 then if not v2 then true else not (v2 < Level) else if Level < v1 then false else if not v2 then true else not (v2 < Level) then
                        table.insert(self._weaponHandles, i3)
                    end
                end
            end
        end
        return
    end
    local BoneVFX_2 = if not self.BoneVFX then if not self.FBXModel then self.Model:FindFirstChild("Weapon") else self.Model:FindFirstChild("RootPart") else self.BoneVFX
    if self.FBXModel and not self.Model:FindFirstChild("RootPart") then
        BoneVFX_2 = nil
    end
    if BoneVFX_2 then
        local v8 = self
        for i, v in ipairs(BoneVFX_2:GetDescendants()) do
            if v:IsA("BasePart") then
                if string.match(v.Name, "^Handle") and v:FindFirstChild("Start") then
                    v1 = getNumberAttribute(v, "LevelMin")
                    v2 = getNumberAttribute(v, "LevelMax")
                    if if not v1 then if not v2 then true else not (v2 < Level) else if Level < v1 then false else if not v2 then true else not (v2 < Level) then
                        table.insert(v8._weaponHandles, v)
                    end
                end
            elseif v:IsA("Attachment") and string.match(v.Name, "^Handle") and v:FindFirstChild("Start") then
                v1 = getNumberAttribute(v, "LevelMin")
                v2 = getNumberAttribute(v, "LevelMax")
                if if not v1 then if not v2 then true else not (v2 < Level) else if Level < v1 then false else if not v2 then true else not (v2 < Level) then
                    table.insert(v8._weaponHandles, v)
                end
            end
        end
    end
end

function v1:Face(a2) -- Line: 468
    local PrimaryPart = self.Model.PrimaryPart
    PrimaryPart.CFrame = CFrame.new(PrimaryPart.Position, (Vector3.new(a2.X, PrimaryPart.Position.Y, a2.Z)))
end

function v1:Fire(a2) -- Line: 477
    -- upvalues: TimerClass (val), EmitterManager (val), EasySound (val), u52 (val), SharedControllerFunctions (val)
    local v1, v2
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Head = a2:FindFirstChild("Head")
    local Torso = a2:FindFirstChild("Torso")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    local ADS = self._animations.ADS
    if ADS then
        if self._adsTimer then
            self._adsTimer:Destroy()
        end
        local v3 = TimerClass.new("ElectroshockerADS", 5)
        self.Maid:Mark((v3.OnFinish:Connect(function() -- Line: 496 -- upvalues: self (val)
            self._animations.Transition:Play()
            self._animations.ADS:Stop()
        end)))
        self._adsTimer = v3
        ADS:Play()
    end
    if self._animations.Fire then
        self._animations.Fire:Play()
    end
    if #self._weaponHandles > 0 then
        local Fire, Start
        for i, v in ipairs(self._weaponHandles) do
            Start = v:FindFirstChild("Start")
            if Start then
                v2 = workspace
                if v:IsDescendantOf(v2) then
                    EmitterManager.manualEmit(Start)
                    Fire = v:FindFirstChild("Fire")
                    if Fire and Fire:IsA("Sound") then
                        v1 = string.match(Fire.SoundId or "", "%d+")
                        v2 = v1 and tonumber(v1)
                        if v2 then
                            EasySound.Play({
                                volume = 0.5,
                                destroyOnEnd = true,
                                soundGroupName = "Towers",
                                id = v2,
                                playbackSpeed = u52:NextNumber(Fire.PlaybackSpeed * 0.9, Fire.PlaybackSpeed * 1.2),
                                parent = v,
                            })
                        end
                    end
                end
            end
        end
    elseif self.FBXModel then
        local Weapon = self.Model:FindFirstChild("Weapon")
        if Weapon then
            local Configuration = Weapon:FindFirstChild("Weapon"):FindFirstChild("Configuration")
            if Configuration then
                local Attachments = Configuration:FindFirstChild("Attachments")
                if Attachments then
                    local Start_2 = Attachments:FindFirstChild("Start")
                    if Start_2 and Start_2.Value then
                        EmitterManager.manualEmit(Start_2.Value)
                    end
                end
                local Sounds = Configuration:FindFirstChild("Sounds")
                if Sounds then
                    local Fire_2 = Sounds:FindFirstChild("Fire")
                    if Fire_2 and Fire_2.Value then
                        local Value_2 = Configuration.Sounds.Fire.Value
                        if Value_2 and Value_2:IsA("Sound") then
                            v1 = string.match(Value_2.SoundId or "", "%d+")
                            v2 = v1 and tonumber(v1)
                            if v2 then
                                EasySound.Play({
                                    volume = 0.5,
                                    destroyOnEnd = true,
                                    soundGroupName = "Towers",
                                    id = v2,
                                    parent = Value_2.Parent,
                                    playbackSpeed = u52:NextNumber(Value_2.PlaybackSpeed * 0.9, Value_2.PlaybackSpeed * 1.2),
                                })
                            end
                        end
                    end
                end
            end
        end
    end
    self:Face(Position)
    SharedControllerFunctions.AimArmsAt(self, Position)
    SharedControllerFunctions.AimHeadAt(self, Position_2)
end

return v1