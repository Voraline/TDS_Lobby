-- Script path: ReplicatedStorage.Content.Tower.DJ Booth.Animator
-- Decompile time: 12.73 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local MusicController = require(ReplicatedStorage.Client.Controllers.Shared.MusicController)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local u64 = {"rbxassetid://121261216766724", "rbxassetid://106357720266978"}
local u67 = {}
u67.Purple = Color3.fromRGB(216, 154, 255)
u67.Red = Color3.fromRGB(255, 96, 96)
u67.Green = Color3.fromRGB(105, 255, 88)
local v1 = {}
v1.__index = v1

local function emitParticles(a1) -- Line: 44
    -- upvalues: TimescaleUtilities (val), GameState (val)
    local TimeScale
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            local u23 = v:GetAttribute("EmitCount") or 1
            local Attribute = v:GetAttribute("TimeScale")
            if not Attribute then
                TimeScale = v.TimeScale
                v:SetAttribute("TimeScale", TimeScale)
                Attribute = v.TimeScale
            end
            TimescaleUtilities.Delay(v:GetAttribute("EmitDelay") or 0, function() -- Line: 55 -- upvalues: v (val), Attribute (ref), GameState (upval), u23 (val)
                v.TimeScale = Attribute * GameState.TimeScale
                v:Emit(u23)
            end)
        end
    end
end

local function toggleParticles(a1, a2) -- Line: 63 -- upvalues: GameState (val) -- types: a1: userdata, a2: boolean
    local Attribute, TimeScale, TimeScale_2
    for i, v in ipairs(a1:GetDescendants()) do
        TimeScale_2 = GameState.TimeScale
        if v:IsA("ParticleEmitter") then
            Attribute = v:GetAttribute("TimeScale")
            if not Attribute then
                TimeScale = v.TimeScale
                v:SetAttribute("TimeScale", TimeScale)
                Attribute = v.TimeScale
            end
            v.TimeScale = Attribute * TimeScale_2
            v.Enabled = a2
        end
    end
end

local function getMappedBins(a1, a2, a3) -- Line: 78
    -- upvalues: math (val)
    local v1
    local Spectrum = a1:GetSpectrum()
    if Spectrum and #Spectrum ~= 0 then
        local v2, v3, v4, v5, v6
        v1 = {}
        for i = 1, a3 do
            v5 = math.pow(#Spectrum, i / a3)
            v6 = math.max(1, math.floor(v5))
            v2 = math.min(#Spectrum, math.ceil(v5))
            v3 = v5 - math.floor(v5)
            v4 = math.clamp(math.sqrt((math.lerp(Spectrum[v6], Spectrum[v2], v3))) * 2, 0, 10)
            v1[i] = (math.pow(v4, 0.6666666666666666))
        end
        return v1
    end
    v1 = {}
    for j = 1, a3 do
        table.insert(v1, 0)
    end
    return v1
end

function v1:_handleAudio() -- Line: 110
    -- upvalues: RunService (val), math (val), MusicController (val), SoundService (val), GameState (val)
    self.Maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 111
        -- upvalues: self (val), math (upval), MusicController (upval), SoundService (upval), GameState (upval)
        local Magnitude = (workspace.CurrentCamera.CFrame.Position - self.Model.PrimaryPart.Position).Magnitude
        if Magnitude < self:_getRange() + 5 then
            local v1 = math.clamp(math.map(Magnitude, self:_getRange() / 4, self:_getRange(), 1, 0), 0, 1)
            MusicController.dJVolume = v1 * SoundService.DJ.Volume
        end
        self._audioPlayer.Volume = math.clamp((1 + self._extraVolume) * SoundService.DJ.Volume, 0, 1.2)
        self._audioPlayer.PlaybackSpeed = GameState.TimeScale
    end)))
end

function v1:_getRange() -- Line: 126
    return self.Replicator:Get("Range")
end

function v1:_updateSoundRange() -- Line: 130
    self._audioEmitter:SetDistanceAttenuation({[(self:_getRange())] = 1, [self:_getRange() + 10] = 0.1, [self:_getRange() + 30] = 0})
end

function v1.Initialize(a1) -- Line: 138
    -- upvalues: MusicController (val), Create (val), u64 (val), math (val), SoundService (val)
    -- upvalues: TimescaleUtilities (val), u67 (val), getMappedBins (val), emitParticles (val), toggleParticles (val)
    -- upvalues: Players (val), EffectsController (val), ReplicatedStorage (val), Shaker (val), RunService (val)
    -- upvalues: GameState (val), Animation (val)
    local visualizerAdded
    a1._extraVolume = 0
    a1._audioPlayer = a1.Model.PrimaryPart:WaitForChild("AudioPlayer", 1)
    a1._audioListener = Instance.new("AudioListener")
    a1._audioListener.Parent = workspace.CurrentCamera
    a1._deviceOutput = Instance.new("AudioDeviceOutput")
    a1._deviceOutput.Parent = a1._audioListener
    a1._audioEmitter = Instance.new("AudioEmitter")
    a1._audioEmitter.Parent = a1.Model.PrimaryPart
    a1._audioEmitterWire = Instance.new("Wire")
    a1._audioEmitterWire.Name = "AudioEmitterWire"
    a1._audioEmitterWire.SourceInstance = a1._audioListener
    a1._audioEmitterWire.TargetInstance = a1._deviceOutput
    a1._audioEmitterWire.Parent = a1._audioEmitter
    a1._audioAnalyzer = Instance.new("AudioAnalyzer")
    a1._audioAnalyzer.Parent = a1._audioPlayer
    a1.Maid:Mark(a1._audioListener)
    a1.Maid:Mark((a1.OnDestroy:Connect(function() -- Line: 163 -- upvalues: MusicController (upval)
        MusicController.dJVolume = 0
    end)))
    ;(a1.Replicator:GetStateChangedSignal("Track")):Connect(function() -- Line: 167
        -- upvalues: a1 (val), Create (upval), u64 (upval), math (upval), SoundService (upval)
        -- upvalues: TimescaleUtilities (upval)
        a1._extraVolume = -1
        Create("Sound", {
            SoundId = u64[math.random(1, #u64)],
            Volume = 0.6 * SoundService.DJ.Volume,
            Parent = a1.Model.PrimaryPart,
        }):Play()
        TimescaleUtilities.Delay(1, function() -- Line: 175 -- upvalues: a1 (upval)
            a1._extraVolume = 0
        end)
    end)
    local Wire = Instance.new("Wire")
    Wire.Name = "AnalyzeWire"
    Wire.Parent = a1._audioPlayer
    Wire.SourceInstance = a1._audioPlayer
    Wire.TargetInstance = a1._audioAnalyzer
    local Wire_2 = Instance.new("Wire")
    Wire_2.SourceInstance = a1._audioPlayer
    Wire_2.TargetInstance = a1._audioEmitter
    Wire_2.Parent = a1._audioPlayer
    a1._visualizers = {}
    a1._binsCache = {}
    a1._lastEmit = tick()

    local function getCurrentTrack() -- Line: 195 -- upvalues: a1 (val)
        return a1.Replicator:Get("Track")
    end

    function visualizerAdded(a1_2) -- Line: 199
        -- upvalues: a1 (val), u67 (upval), visualizerAdded (val)
        local Attribute = a1_2:GetAttribute("VisualizerType")
        if Attribute then
            a1._visualizers[a1_2] = {Type = Attribute, Ref = a1_2}
            a1_2.Destroying:Connect(function() -- Line: 207 -- upvalues: a1 (upval), a1_2 (val)
                a1._visualizers[a1_2] = nil
            end)
            if Attribute == "Bars" then
                local Bars = a1_2:FindFirstChild("Bars")
                if Bars then
                    local Y
                    for i, v in ipairs(Bars:GetChildren()) do
                        Y = v.Size.Y
                        v:SetAttribute("Height", Y)
                        v.Color = u67.Purple
                    end
                end
            end
        end
        for i2, i3 in ipairs(a1_2:GetChildren()) do
            if i3:IsA("Model") or i3:IsA("BasePart") or i3:IsA("Attachment") then
                visualizerAdded(i3)
            end
        end
    end

    local function updateBars(a1_2, a2) -- Line: 230
        -- upvalues: a1 (val), getMappedBins (upval), u67 (upval), math (upval)
        local Attribute_2, Color, v1, v2, v3, v4, v5, v6
        local Bars = a1_2:FindFirstChild("Bars")
        local PrimaryPart = a1_2.PrimaryPart
        if not Bars then
            return
        end
        local v7 = (a1_2:GetAttribute("Sensitivity") or 0.5) * 10
        local Children = Bars:GetChildren()
        local v8 = a1._binsCache[#Children + 1]
        if not v8 then
            v8 = getMappedBins(a1._audioAnalyzer, a1._audioPlayer, #Children + 1)
            a1._binsCache[#Children] = v8
        end
        local Attribute = a1_2:GetAttribute("Color") or u67[a1.Replicator:Get("Track")]
        local v9 = Attribute:lerp(Color3.fromRGB(), 0.7)
        local v10 = Attribute:lerp(Color3.new(1, 1, 1), 0.25)
        local v11 = a2
        for i, v in ipairs(Children) do
            Attribute_2 = v:GetAttribute("Height")
            v1 = math.clamp(v8[tonumber(v.Name)] * 2, 0, 1)
            v2 = Attribute_2 * v1
            v3 = math.lerp(v.Size.Y, v2, v11 * v7)
            v4 = PrimaryPart and PrimaryPart:FindFirstChild(v.Name)
            if v4 then
                v4.Transform = CFrame.new(0, -(Attribute_2 - v3) / 2, 0)
                v4:SetAttribute("Transform", v4.Transform)
            end
            v.Size = Vector3.new(v.Size.X, v3, v.Size.Z)
            v5 = v9:lerp(v10, (math.clamp(v1, 0, 1)))
            Color = v.Color
            v6 = v11 * v7
            v.Color = Color:Lerp(v5, v6)
        end
    end

    local function updateParticles(a1_2, a2) -- Line: 304
        -- upvalues: a1 (val), emitParticles (upval), toggleParticles (upval)
        local v1
        local PeakLevel = a1._audioAnalyzer.PeakLevel
        local v2 = a1_2:GetAttribute("ActivationLevel") or 0.5
        local LastUpdated = a1._visualizers[a1_2].LastUpdated
        local Attribute = a1_2:GetAttribute("Cooldown")
        local v3 = a1_2:GetAttribute("Level") or 0
        if v3 and a1:GetLevel() < v3 then
            return
        end
        if not (v2 <= PeakLevel) then
            if a1._visualizers[a1_2].Enabled then
                toggleParticles(a1_2, false)
                v1 = a1._visualizers[a1_2]
                v1.Enabled = false
            end
            return
        end
        if not Attribute then
            toggleParticles(a1_2, true)
            v1 = a1._visualizers[a1_2]
            v1.Enabled = true
            return
        end
        if LastUpdated and not (Attribute <= tick() - LastUpdated) then
            return
        end
        emitParticles(a1_2)
        v1 = a1._visualizers[a1_2]
        v1.LastUpdated = tick()
    end

    local function handleVisualizers(a1_2) -- Line: 333
        -- upvalues: a1 (val), getMappedBins (upval), updateBars (val), updateParticles (val)
        for k, v in pairs(a1._binsCache) do
            a1._binsCache[k] = (getMappedBins(a1._audioAnalyzer, a1._audioPlayer, k))
        end
        for k2, i in pairs(a1._visualizers) do
            if i.Type == "Bars" then
                updateBars(i.Ref, a1_2)
            elseif i.Type == "Particles" then
                updateParticles(i.Ref, a1_2)
            end
        end
    end

    a1.Executables = {
        Cash = function(a1_2, a2) -- Line: 352
            -- upvalues: Players (upval), a1 (val), Create (upval), TimescaleUtilities (upval)
            -- upvalues: EffectsController (upval)
            local PlayerByUserId = Players:GetPlayerByUserId(a1.Model.Owner.Value)
            local Character = PlayerByUserId and PlayerByUserId.Character and PlayerByUserId.Character:FindFirstChild("HumanoidRootPart")
            if PlayerByUserId and Character and a2 > 0 then
                local v1, v2, v3
                for i, j in a1_2 do
                    v3 = Create("Attachment", {Position = j, Parent = workspace.Terrain})
                    v1 = Create("Sound", {
                        SoundId = "rbxassetid://330274138",
                        Volume = 1,
                        PlaybackSpeed = Random.new():NextNumber(0.8, 1.2),
                        Parent = v3,
                    })
                    v1:Play()
                    TimescaleUtilities.CleanUp(v3, v1.TimeLength)
                    v2 = Character.Position + Vector3.new(
                        Character.Size.X / 2 * Random.new():NextNumber(-1, 1),
                        Character.Size.Y / 2 * Random.new():NextNumber(-1, 1),
                        Character.Size.Z / 2 * (Random.new():NextNumber(-1, 1))
                    )
                    EffectsController.Cash(j, v2)
                end
            end
        end,
        CreateWave = function(a1_2, a2, a3, a4) -- Line: 384
            -- upvalues: ReplicatedStorage (upval), Create (upval), a1 (val), SoundService (upval), Shaker (upval)
            -- upvalues: RunService (upval), GameState (upval), math (upval), TimescaleUtilities (upval)
            local DropTheBeat = ReplicatedStorage.Assets.Effects.Misc.DropTheBeat
            if not DropTheBeat then
                return
            end
            local u12 = DropTheBeat:Clone()
            u12.Parent = workspace.CurrentCamera
            local v1 = a1_2 + Vector3.new(0, 1.5, 0)
            local v2 = CFrame.new(v1)
            u12:PivotTo(v2)
            u12.Top.Top.Color = a2
            u12.Top.TopEdge.Color = a2
            u12.Bottom.Bottom.Color = a2
            u12.Bottom.BottomEdge.Color = a2
            u12.Particles.Notes.Color = ColorSequence.new(a2)
            local u44 = Create("Sound", {
                SoundId = "rbxassetid://115831870084183",
                Volume = 1,
                Parent = a1.Model.PrimaryPart,
                SoundGroup = SoundService.Towers,
            })
            u44:Play()
            u44.Ended:Connect(function() -- Line: 414 -- upvalues: u44 (val)
                u44:Destroy()
            end)
            Shaker:Shake({0.75, 10, 0, 1.5}, 0.5, 0.5, {radius = 100, position = v1})
            local u73 = u12.Top.TopEdge.Size.Y / u12.Top.Top.Size.Y
            local Y = (u12.Root.CFrame:ToObjectSpace(u12.Top.TopEdge.CFrame)).Y
            local Size = u12.Top.TopEdge.Size
            local u86 = 0
            local u87 = 0
            local u88 = nil
            local v3 = RunService.Stepped:Connect(function(a1, a2) -- Line: 433
                -- upvalues: GameState (upval), u86 (ref), math (upval), a4 (val), a3 (val), u87 (ref), u73 (val)
                -- upvalues: u12 (ref), Y (val), Size (val), u88 (ref), TimescaleUtilities (upval)
                local v1 = a2 * GameState.TimeScale
                u86 = math.clamp(u86 + a4 * v1, 0, a3)
                u87 = u87 + v1 * a4 / 3
                local v2 = 1.5 * (1 - (math.pow(u86, 2)) / math.pow(a3, 2))
                local v3 = v2 * u73
                local v4 = Vector3.new(u86 * 2, v2, u86 * 2)
                local v5 = Vector3.new(v4.X, v3, v4.Z)
                local v6 = math.rad(u87 * 5)
                u12.Top.Top.Size = v4
                u12.Top.Top.CFrame = (u12:GetPivot()) * CFrame.new(0, v4.Y / 2, 0) * CFrame.Angles(0, v6, 0)
                u12.Top.TopEdge.Size = v5
                u12.Top.TopEdge.CFrame = (u12:GetPivot()) * CFrame.new(0, Y * (v5.Y / Size.Y), 0) * CFrame.Angles(0, v6, 0)
                u12.Bottom.Bottom.Size = v4
                u12.Bottom.Bottom.CFrame = (u12:GetPivot()) * CFrame.new(0, -v4.Y / 2, 0) * CFrame.Angles(math.pi, 0, 0) * CFrame.Angles(0, v6, 0)
                u12.Bottom.BottomEdge.Size = v5
                u12.Bottom.BottomEdge.CFrame = (u12:GetPivot()) * CFrame.new(0, -Y * (v5.Y / Size.Y), 0) * CFrame.Angles(math.pi, 0, 0) * CFrame.Angles(0, v6, 0)
                u12.Particles.Size = Vector3.new(v4.Y, v4.X, v4.Z)
                if a3 <= u86 then
                    u88:Disconnect()
                    u12.Bottom:Destroy()
                    u12.Top:Destroy()
                    TimescaleUtilities.CleanUp(u12, 2)
                end
            end)
        end,
        ApplyBuff = function(a1_2) -- Line: 474 -- upvalues: a1 (val), ReplicatedStorage (upval) -- types: a1_2: userdata
            if a1.Model.Name == "Mako" then
                local MakoAura = ReplicatedStorage.Assets.Effects.Misc:FindFirstChild("MakoAura")
                if MakoAura then
                    local u14 = MakoAura:Clone()
                    u14.Parent = workspace.Trash
                    u14:PivotTo((a1_2:GetPivot()))
                    a1.Maid:Mark(u14)
                    local v1 = a1_2.Destroying:Once(function() -- Line: 483 -- upvalues: u14 (val), a1 (upval), a1_2 (val)
                        if u14.Parent then
                            u14:Destroy()
                        end
                        if a1._makoAuras then
                            a1._makoAuras[a1_2] = nil
                        end
                    end)
                    a1.Maid:Mark(v1)
                    if not a1._makoAuras then
                        a1._makoAuras = {}
                        a1.Maid:Mark(function() -- Line: 495 -- upvalues: a1 (upval)
                            if a1._makoAuras then
                                for k, v in pairs(a1._makoAuras) do
                                    if v.aura.Parent then
                                        v.aura:Destroy()
                                    end
                                    v.destroyConn:Disconnect()
                                end
                                a1._makoAuras = nil
                            end
                        end)
                    end
                    a1._makoAuras[a1_2] = {aura = u14, destroyConn = v1}
                end
            end
        end,
        RemoveBuff = function(a1_2) -- Line: 514 -- upvalues: a1 (val) -- types: a1_2: userdata
            if a1.Model.Name == "Mako" then
                local _makoAuras = a1._makoAuras and a1._makoAuras[a1_2]
                if _makoAuras then
                    if _makoAuras.aura.Parent then
                        _makoAuras.aura:Destroy()
                    end
                    _makoAuras.destroyConn:Disconnect()
                    a1._makoAuras[a1_2] = nil
                end
            end
        end,
    }
    a1._lastUpdate = tick()
    a1._visualizerConn = RunService.Stepped:Connect(function() -- Line: 529 -- upvalues: a1 (val), handleVisualizers (val)
        local v1 = tick() - a1._lastUpdate
        if v1 >= 0.002 then
            handleVisualizers(v1)
            a1._lastUpdate = tick()
        end
    end)
    a1.Maid:Mark(a1._visualizerConn)
    a1.Model.Weapon.ChildAdded:Connect(visualizerAdded)
    ;(a1.Replicator:GetStateChangedSignal("Upgrade")):Connect(function(a1_2) -- Line: 540 -- upvalues: a1 (val), visualizerAdded (val)
        local v1 = a1.Model.Upgrades:FindFirstChild(a1_2)
        if v1 then
            for i, v in ipairs(v1:GetChildren()) do
                if v:IsA("Model") then
                    visualizerAdded(v)
                end
            end
        end
    end)
    visualizerAdded(a1.Model.Upgrades["0"])
    visualizerAdded(a1.Model.Weapon)
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 553 -- upvalues: RunService (upval), a1 (val), Animation (upval) -- types: a1_2: number
        RunService.RenderStepped:Wait()
        a1:_updateSoundRange()
        if a1.Model.Name == "Mako" then
            if a1_2 == 4 then
                local v1 = a1.Model.Upgrades["4"]
                for i, v in ipairs({v1.Sticks1, v1.Sticks2, v1.Sticks3}) do
                    for i2, i3 in ipairs(v:GetChildren()) do
                        if i3.Name == "LightstickNeonLeft" or i3.Name == "LightstickNeonRight" then
                            i3.Trail.Enabled = true
                        end
                    end
                end
                return
            end
            if a1_2 == 5 then
                local Holo = a1.Model.Upgrades["5"]:WaitForChild("Holo")
                local v2 = Animation.new({
                    Preload = true,
                    Target = Holo.AnimationController,
                    Track = Holo.Animation,
                })
                local Controller = a1._idleAnimation.Controller
                v2.Controller.TimePosition = Controller.TimePosition / Controller.Length * v2.Controller.Length
                v2:Play()
            end
        end
    end)
    a1:_updateSoundRange()
    a1:_handleAudio()
end

return v1