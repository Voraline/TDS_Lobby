-- Script path: ReplicatedStorage.Shared.Modules.AudioUtil
-- Decompile time: 10.93 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u27 = require("./SpatialAudio")
local u28 = {}
local u30 = u27.speaker()
local u31 = {}

function u31.voice() -- Line: 41 -- upvalues: u27 (val)
    return u27.voice()
end

function u31.speaker() -- Line: 44 -- upvalues: u27 (val)
    return u27.speaker()
end

function u31.ambient() -- Line: 47 -- upvalues: u27 (val)
    return u27.ambient()
end

function u31.music() -- Line: 50 -- upvalues: u27 (val)
    return u27.music()
end

function u31.close() -- Line: 53 -- upvalues: u27 (val)
    local v1 = u27.voice(5, 55)
    return {distanceAttenuation = v1.distanceAttenuation, angleAttenuation = v1.angleAttenuation}
end

function u31.closeDirectional() -- Line: 60 -- upvalues: u27 (val)
    return {
        distanceAttenuation = (u27.voice(5, 55)).distanceAttenuation,
        angleAttenuation = u27.cone(80, 1, 0.35),
    }
end

function u28.setDefaultSpatialProfile(a1) -- Line: 76 -- upvalues: u30 (ref) -- types: a1: table
    assert(type(a1) == "table", "Profile must be a table")
    u30 = a1
end

local u39 = {}
local u40 = {}
local u41 = {}
local u42 = {}
local u44 = Signal.new()

local function resetAudioPlayer(a1) -- Line: 161 -- types: a1: userdata
    if a1.IsPlaying then
        a1:Stop()
    end
    a1.Volume = 1
    a1.PlaybackSpeed = 1
    a1.Looping = false
    a1.LoopRegion = NumberRange.new(0, 60000)
    a1.PlaybackRegion = NumberRange.new(0, 60000)
    a1.TimePosition = 0
    a1.Asset = ""
    a1:SetAttribute("TimeScaleEnabled", nil)
end

local function createOrGetEffect(a1, a2) -- Line: 176 -- types: a1: userdata, a2: string
    local v1 = a1:FindFirstChildOfClass(a2)
    if v1 then
        return v1
    end
    local v2 = Instance.new(a2)
    v2.Parent = a1
    local AudioPlayerWire = a1:FindFirstChild("AudioPlayerWire")
    local TargetInstance = nil
    if AudioPlayerWire and AudioPlayerWire:IsA("Wire") then
        TargetInstance = AudioPlayerWire.TargetInstance
        AudioPlayerWire.TargetInstance = v2
    end
    if TargetInstance then
        local Wire = Instance.new("Wire")
        Wire.Name = a2 .. "_OutWire"
        Wire.SourceInstance = v2
        Wire.TargetInstance = TargetInstance
        Wire.Parent = v2
    end
    return v2
end

function u28.bindTimeScale(a1, a2) -- Line: 205 -- types: a1: userdata, a2: number?
    if a1:HasTag("TimeScaled") then
        return
    end
    local success, result = pcall(function() -- Line: 210
        return require((game:GetService("ReplicatedStorage")).Shared.Modules.GameState)
    end)
    if success and result and result.Replicator and result.Replicator.GetStateChangedSignal then
        local v1 = result.TimeScale or 1
        local u22 = a2
        if not u22 then
            local PlaybackSpeed = a1.PlaybackSpeed
            u22 = PlaybackSpeed / (not (v1 == 0) and v1 or 1)
        end

        local function checkIfBound(a1) -- Line: 231 -- types: a1: userdata
            return a1:GetAttribute("TimeScaleEnabled") == true
        end

        local u42 = (result.Replicator:GetStateChangedSignal("TimeScale")):Connect(function(a1_2) -- Line: 235 -- upvalues: a1 (val), u22 (val)
            if a1.Parent and a1:GetAttribute("TimeScaleEnabled") == true then
                local Attribute = a1:GetAttribute("PlaybackSpeed") or u22
                a1.PlaybackSpeed = Attribute * (a1_2 or 1)
            end
        end)
        local u51 = (a1:GetAttributeChangedSignal("PlaybackSpeed")):Connect(function() -- Line: 242 -- upvalues: a1 (val), result (val), u22 (val)
            if a1.Parent then
                local v1 = a1:GetAttribute("TimeScaleEnabled") == true
                if v1 then
                    v1 = result.TimeScale or 1
                    local Attribute = a1:GetAttribute("PlaybackSpeed") or u22
                    a1.PlaybackSpeed = Attribute * v1
                end
            end
        end)
        a1.Destroying:Once(function() -- Line: 251 -- upvalues: u42 (ref), u51 (ref)
            if u42.Connected then
                u42:Disconnect()
            end
            if u51.Connected then
                u51:Disconnect()
            end
        end)
        a1:AddTag("TimeScaled")
        return
    end
end

local function getMaxCurveDistance(a1) -- Line: 265 -- types: a1: table?
    if not a1 then
        return nil
    end
    local v1 = nil
    local v2 = nil
    local v3 = nil
    for i, j in a1, v2, v3 do
        if type(i) == "number" then
            if not v1 or v1 < i then
                v1 = i
            end
        end
    end
    return v1
end

local function ensureSoundGroup(a1) -- Line: 281
    -- upvalues: u28 (val), SoundService (val), u39 (val), u42 (val)
    local v1 = u28.getSoundGroup(a1)
    if v1 then
        return v1
    end
    local v2 = u28.createAudioDeviceOutput()
    local AudioFader = Instance.new("AudioFader")
    AudioFader.Name = a1
    AudioFader.Volume = if a1 ~= "master" then 0 else 1
    AudioFader.Bypass = false
    AudioFader.Parent = SoundService
    u39[a1] = AudioFader
    if not u28.getAudioListener(a1) then
        local AudioListener = Instance.new("AudioListener")
        AudioListener.Name = a1 .. "AudioListener"
        AudioListener.AudioInteractionGroup = if a1 ~= "master" then a1 else ""
        AudioListener.Parent = workspace.CurrentCamera
        local Wire = Instance.new("Wire")
        Wire.Name = a1 .. "_ListenerWire"
        Wire.SourceInstance = AudioListener
        Wire.TargetInstance = AudioFader
        Wire.Parent = AudioListener
        u42[a1] = AudioListener
    end
    local Wire_2 = Instance.new("Wire")
    Wire_2.Name = a1 .. "_RouteWire"
    Wire_2.SourceInstance = AudioFader
    Wire_2.TargetInstance = v2
    Wire_2.Parent = AudioFader
    return AudioFader
end

local function cleanupAudioPlayer(a1) -- Line: 323
    -- upvalues: u40 (val), u41 (val), resetAudioPlayer (val), SoundService (val)
    for i, j in a1:GetChildren() do
        if j:IsA("Wire") and j.TargetInstance and j.TargetInstance:IsA("AudioEmitter") then
            local Parent = j.TargetInstance.Parent
            if Parent and Parent.Name == "TempSoundAnchor" then
                pcall(function() -- Line: 333 -- upvalues: Parent (val)
                    Parent:Destroy()
                end)
            end
            j.TargetInstance = nil
        end
        j:Destroy()
    end
    local v1 = table.find(u40, a1)
    if v1 then
        table.remove(u40, v1)
    end
    if not table.find(u41, a1) and #u41 + #u40 < 128 and a1.Parent ~= nil then
        resetAudioPlayer(a1)
        a1.Asset = ""
        if pcall(function() -- Line: 354 -- upvalues: a1 (val), SoundService (upval)
            a1.Parent = SoundService
            return
        end) then
            table.insert(u41, a1)
            return
        end
    end
    if a1.Parent ~= nil then
        pcall(function() -- Line: 365 -- upvalues: a1 (val)
            a1:Destroy()
        end)
    end
end

u28.cleanupAudioPlayer = cleanupAudioPlayer

function u28.createAudioDeviceOutput() -- Line: 378 -- upvalues: RunService (val), SoundService (val), Players (val)
    assert(RunService:IsClient(), "createAudioDeviceOutput can only be called on the client")
    local AudioDeviceOutput = SoundService:WaitForChild("AudioDeviceOutput", 5) or Instance.new("AudioDeviceOutput")
    AudioDeviceOutput.Player = Players.LocalPlayer
    AudioDeviceOutput.Parent = SoundService
    return AudioDeviceOutput
end

function u28.getSoundGroup(a1) -- Line: 396 -- upvalues: u39 (val), SoundService (val) -- types: a1: string
    local v1 = u39[a1]
    if not v1 then
        local v2 = SoundService:FindFirstChild(a1, true)
        if v2 and v2:IsA("AudioFader") then
            v1 = v2
        end
    end
    if not u39[a1] and v1 then
        u39[a1] = v1
    end
    return v1
end

function u28.getAudioListener(a1) -- Line: 419 -- upvalues: RunService (val), u42 (val) -- types: a1: string
    assert(RunService:IsClient(), "getAudioListener can only be called on the client")
    local v1 = u42[a1] or workspace.CurrentCamera:FindFirstChild(a1, true)
    if not u42[a1] and v1 then
        u42[a1] = v1
    end
    return v1
end

function u28.createSoundGroupLink(a1, a2, a3) -- Line: 442
    -- upvalues: u28 (val), SoundService (val), u39 (val), u42 (val)
    local v1 = u28.getSoundGroup(a2)
    if not v1 then
        local AudioFader = Instance.new("AudioFader")
        AudioFader.Name = a2
        AudioFader.Volume = 1
        AudioFader.Bypass = false
        AudioFader.Parent = a3 or SoundService
        v1 = AudioFader
        u39[a2] = AudioFader
    end
    local v2 = u28.getAudioListener(a2)
    if not v2 then
        local AudioListener = Instance.new("AudioListener")
        AudioListener.Name = a2 .. "AudioListener"
        AudioListener.AudioInteractionGroup = if a2 ~= "master" then a2 else ""
        AudioListener.Parent = workspace.CurrentCamera
        local Wire = Instance.new("Wire")
        Wire.Name = a2
        Wire.SourceInstance = AudioListener
        Wire.TargetInstance = v1
        Wire.Parent = AudioListener
        v2 = AudioListener
        u42[a2] = AudioListener
    end
    local Wire_2 = Instance.new("Wire")
    Wire_2.Name = a2
    Wire_2.SourceInstance = v1
    Wire_2.TargetInstance = a3 or a1
    Wire_2.Parent = a1
    return v1, v2
end

local function getOrCreateAudioPlayerWire(a1, a2, a3) -- Line: 490
    -- upvalues: cleanupAudioPlayer (val)
    for i, j in a1:GetChildren() do
        if j:IsA("Wire") and j.TargetInstance == a2 then
            return j
        end
    end
    local Wire = Instance.new("Wire")
    Wire.Name = a3 or "AudioPlayerWire"
    Wire.SourceInstance = a1
    Wire.TargetInstance = a2
    if a2.Parent then
        local u23 = nil
        local v1 = a2.AncestryChanged:Connect(function(a1_2, a2) -- Line: 512 -- upvalues: u23 (ref), cleanupAudioPlayer (upval), a1 (val)
            if not a2 then
                u23:Disconnect()
                cleanupAudioPlayer(a1)
            end
        end)
    end
    Wire.Parent = a1
    return Wire
end

local function acquirePlayer(a1) -- Line: 534
    -- upvalues: u41 (val), resetAudioPlayer (val), SoundService (val), u40 (val)
    local v1 = #u41
    if v1 > 0 then
        v1 = table.remove(u41)
        if v1 and v1.Parent ~= nil then
            resetAudioPlayer(v1)
            v1.Asset = ("rbxassetid://%*"):format(a1)
            return v1
        end
    end
    local AudioPlayer = Instance.new("AudioPlayer")
    AudioPlayer.Asset = ("rbxassetid://%*"):format(a1)
    AudioPlayer.Parent = SoundService
    AudioPlayer.Destroying:Once(function() -- Line: 546 -- upvalues: u40 (upval), AudioPlayer (val)
        local v1 = table.find(u40, AudioPlayer)
        if v1 then
            table.remove(u40, v1)
        end
    end)
    return AudioPlayer
end

function u28.createSound(a1, a2) -- Line: 555
    -- upvalues: ensureSoundGroup (val), acquirePlayer (val), u40 (val), getOrCreateAudioPlayerWire (val)
    local v1 = ensureSoundGroup(a2 or "master")
    local v2 = acquirePlayer(a1)
    table.insert(u40, v2)
    getOrCreateAudioPlayerWire(v2, v1, "AudioPlayerWire")
    return v2
end

local function applySpatialParams(a1, a2, a3, a4) -- Line: 578
    -- upvalues: u31 (val), getMaxCurveDistance (val), u30 (ref)
    local v1
    local v2 = a4
    if not v2 and a3 == "sfx" then
        v2 = {preset = "close"}
    end
    if not v2 then
        if u30.angleAttenuation then
            a1:SetAngleAttenuation(u30.angleAttenuation)
        end
        if u30.distanceAttenuation then
            a1:SetDistanceAttenuation(u30.distanceAttenuation)
            v1 = getMaxCurveDistance(u30.distanceAttenuation)
            if v1 then
                a2:SetAttribute("AudioMaxDistance", v1)
            end
        end
        return
    end
    if v2.preset and u31[v2.preset] then
        v1 = u31[v2.preset]()
        if not v2.angleAttenuation and v1.angleAttenuation then
            a1:SetAngleAttenuation(v1.angleAttenuation)
        end
        if not v2.distanceAttenuation and v1.distanceAttenuation then
            a1:SetDistanceAttenuation(v1.distanceAttenuation)
            local v3 = getMaxCurveDistance(v1.distanceAttenuation)
            if v3 then
                a2:SetAttribute("AudioMaxDistance", v3)
            end
        end
    end
    if v2.angleAttenuation then
        a1:SetAngleAttenuation(v2.angleAttenuation)
    end
    if v2.distanceAttenuation then
        a1:SetDistanceAttenuation(v2.distanceAttenuation)
        v1 = getMaxCurveDistance(v2.distanceAttenuation)
        if v1 then
            a2:SetAttribute("AudioMaxDistance", v1)
            return
        end
    end
end

function u28.createSpatialSound(a1, a2, a3, a4) -- Line: 627
    -- upvalues: u40 (val), acquirePlayer (val), applySpatialParams (val), getOrCreateAudioPlayerWire (val)
    local audioPlayer
    if not a4 or not a4.audioPlayer then
        table.insert(u40, (acquirePlayer(a1)))
    else
        audioPlayer = a4.audioPlayer
        if not table.find(u40, audioPlayer) then
            table.insert(u40, audioPlayer)
        end
        audioPlayer.Asset = ("rbxassetid://%*"):format(a1)
    end
    audioPlayer:SetAttribute("_createdAt", (os.clock()))
    local v1 = ("AudioEmitter_%*"):format(a3 or "master")
    local v2 = a2:FindFirstChild(v1)
    if not v2 then
        v2 = Instance.new("AudioEmitter")
        v2.Name = v1
        v2.AudioInteractionGroup = a3 ~= "master" and a3 or ""
        v2.Parent = a2
    end
    applySpatialParams(v2, a2, a3, a4)
    getOrCreateAudioPlayerWire(audioPlayer, v2, "Wire_" .. (a2.Name or "Emitter") .. "_" .. tostring(v2))
    return audioPlayer
end

function u28.addSpatialEmitter(a1, a2, a3, a4) -- Line: 668
    -- upvalues: applySpatialParams (val), getOrCreateAudioPlayerWire (val)
    local v1 = ("AudioEmitter_%*"):format(a3 or "master")
    local v2 = a2:FindFirstChild(v1)
    if not v2 then
        v2 = Instance.new("AudioEmitter")
        v2.Name = v1
        v2.AudioInteractionGroup = a3 ~= "master" and a3 or ""
        v2.Parent = a2
    end
    applySpatialParams(v2, a2, a3, a4)
    getOrCreateAudioPlayerWire(a1, v2, "SpatialWire_" .. tostring(v2):sub(-8))
    return v2
end

function u28.playSound(a1, a2) -- Line: 695 -- upvalues: u28 (val) -- types: a1: userdata, a2: table?
    local v1 = a2 or {}
    if v1.volume ~= nil then
        a1.Volume = v1.volume
    end
    if v1.playbackSpeed then
        a1.PlaybackSpeed = v1.playbackSpeed
    end
    if v1.looped ~= nil then
        a1.Looping = v1.looped
    end
    if v1.loopRegion then
        a1.LoopRegion = NumberRange.new(v1.loopRegion.start or 0, v1.loopRegion.finish or 60000)
    end
    if v1.playbackRegion then
        a1.PlaybackRegion = NumberRange.new(v1.playbackRegion.start or 0, v1.playbackRegion.finish or 60000)
        a1.TimePosition = v1.playbackRegion.start or 0
    end
    if v1.echo then
        u28.addEchoEffect(a1, v1.echo)
    end
    if v1.reverb then
        u28.addReverbEffect(a1, v1.reverb)
    end
    if v1.equalizer then
        u28.addEqualizerEffect(a1, v1.equalizer)
    end
    if v1.distortion then
        u28.addDistortionEffect(a1, v1.distortion)
    end
    if v1.pitchShift then
        u28.addPitchShiftEffect(a1, v1.pitchShift)
    end
    if v1.tremolo then
        u28.addTremoloEffect(a1, v1.tremolo)
    end
    if v1.compressor then
        u28.addCompressorEffect(a1, v1.compressor)
    end
    if v1.chorus then
        u28.addChorusEffect(a1, v1.chorus)
    end
    if v1.flange then
        u28.addFlangeEffect(a1, v1.flange)
    end
    a1:Play()
end

function u28.connect(a1) -- Line: 764 -- upvalues: u44 (val) -- types: a1: function
    local u5 = u44:Connect(a1)
    return function() -- Line: 767 -- upvalues: u5 (val)
        if u5.Connected then
            u5:Disconnect()
        end
    end
end

function u28.playSoundOneShot(a1, a2, a3) -- Line: 774
    -- upvalues: u28 (val), cleanupAudioPlayer (val)
    local u7 = u28.createSound(a1, a2)
    u28.playSound(u7, a3)
    u7.Ended:Once(function() -- Line: 782 -- upvalues: cleanupAudioPlayer (upval), u7 (val)
        cleanupAudioPlayer(u7)
    end)
    return u7
end

function u28.playSpatialSoundOneShot(a1, a2, a3, a4) -- Line: 788
    -- upvalues: u28 (val), cleanupAudioPlayer (val)
    local u12 = a2
    if typeof(a2) == "Vector3" then
        u12 = Instance.new("Attachment")
        u12.Name = "TempSoundAnchor"
        u12.WorldCFrame = CFrame.new(a2)
        u12.Parent = workspace.Terrain
    end
    local spatial = a4 and a4.spatial
    if a3 == "sfx" and not spatial then
        spatial = {preset = "close"}
    end
    local u42 = u28.createSpatialSound(a1, u12, a3, spatial)
    u28.playSound(u42, a4)
    u42.Ended:Once(function() -- Line: 814 -- upvalues: cleanupAudioPlayer (upval), u42 (ref), a2 (val), u12 (ref)
        cleanupAudioPlayer(u42)
        if typeof(a2) == "Vector3" then
            u12:Destroy()
        end
    end)
    return u42
end

function u28.addEchoEffect(a1, a2) -- Line: 825 -- upvalues: createOrGetEffect (val) -- types: a1: userdata, a2: table?
    local v1 = a2 or {}
    local v2 = createOrGetEffect(a1, "EchoSoundEffect")
    v2.Delay = v1.delay or 0.5
    v2.Feedback = v1.feedback or 0.5
    v2.WetLevel = v1.wetLevel or 0.5
    return v2
end

function u28.addReverbEffect(a1, a2) -- Line: 837
    -- upvalues: createOrGetEffect (val)
    local v1 = a2 or {}
    local v2 = createOrGetEffect(a1, "ReverbSoundEffect")
    v2.DecayTime = v1.decay or 1.5
    v2.Density = v1.density or 1
    v2.Diffusion = v1.diffusion or 1
    v2.WetLevel = v1.wetLevel or 0.5
    return v2
end

function u28.addEqualizerEffect(a1, a2) -- Line: 850
    -- upvalues: createOrGetEffect (val)
    local v1 = a2 or {}
    local v2 = createOrGetEffect(a1, "EqualizerSoundEffect")
    v2.HighGain = v1.highGain or 0
    v2.MidGain = v1.midGain or 0
    v2.LowGain = v1.lowGain or 0
    return v2
end

function u28.addDistortionEffect(a1, a2) -- Line: 862
    -- upvalues: createOrGetEffect (val)
    local v1 = createOrGetEffect(a1, "DistortionSoundEffect")
    v1.Level = (a2 or {}).level or 0.5
    return v1
end

function u28.addPitchShiftEffect(a1, a2) -- Line: 872
    -- upvalues: createOrGetEffect (val)
    local v1 = createOrGetEffect(a1, "PitchShiftSoundEffect")
    v1.Octave = (a2 or {}).octave or 1
    return v1
end

function u28.addTremoloEffect(a1, a2) -- Line: 882
    -- upvalues: createOrGetEffect (val)
    local v1 = a2 or {}
    local v2 = createOrGetEffect(a1, "TremoloSoundEffect")
    v2.Depth = v1.depth or 1
    v2.Frequency = v1.frequency or 5
    v2.Duty = v1.duty or 0.5
    return v2
end

function u28.addCompressorEffect(a1, a2) -- Line: 894
    -- upvalues: createOrGetEffect (val)
    local v1 = a2 or {}
    local v2 = createOrGetEffect(a1, "CompressorSoundEffect")
    v2.Threshold = v1.threshold or -20
    v2.Ratio = v1.ratio or 4
    v2.Attack = v1.attack or 0.1
    v2.Release = v1.release or 0.3
    return v2
end

function u28.addChorusEffect(a1, a2) -- Line: 907
    -- upvalues: createOrGetEffect (val)
    local v1 = a2 or {}
    local v2 = createOrGetEffect(a1, "ChorusSoundEffect")
    v2.Depth = v1.depth or 0.15
    v2.Mix = v1.mix or 0.5
    v2.Rate = v1.rate or 0.5
    return v2
end

function u28.addFlangeEffect(a1, a2) -- Line: 919
    -- upvalues: createOrGetEffect (val)
    local v1 = a2 or {}
    local v2 = createOrGetEffect(a1, "FlangeSoundEffect")
    v2.Depth = v1.depth or 0.45
    v2.Mix = v1.mix or 0.5
    v2.Rate = v1.rate or 0.5
    return v2
end

u28.cleanupAudioPlayer = cleanupAudioPlayer
return u28