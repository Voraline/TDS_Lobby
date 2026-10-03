-- Script path: ReplicatedStorage.Shared.Modules.EasySound
-- Decompile time: 4.02 ms

local ContentProvider = game:GetService("ContentProvider")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AudioUtil = require(ReplicatedStorage.Shared.Modules.AudioUtil)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)

local function resolveNumericId(a1) -- Line: 44
    if typeof(a1) == "number" then
        return a1
    end
    local v1 = tonumber(a1)
    if v1 then
        return v1
    end
    local v2 = tostring(a1):match("rbxassetid://(%d+)")
    assert(v2, "EasySound: Could not resolve numeric sound id from '" .. (tostring(a1)) .. "'")
    local v3 = tonumber(v2)
    assert(v3, "EasySound: extracted numeric id was nil")
    return v3
end

local function resolveAnchor(a1, a2) -- Line: 59 -- types: a1: userdata?, a2: vector?
    if a1 then
        if not a1:IsA("BasePart") and not a1:IsA("Attachment") then
            return nil, nil
        end
        return a1, false
    end
    if not a2 then
        return nil, nil
    end
    local Attachment = Instance.new("Attachment")
    Attachment.Name = "TempSoundAnchor"
    Attachment.WorldCFrame = CFrame.new(a2)
    Attachment.Parent = workspace
    return Attachment, true
end

local u27 = {}
local u28 = {}
local u29 = {}
local u30 = false

function u27.Play(a1, a2) -- Line: 94
    -- upvalues: u30 (ref), u27 (val), TimescaleUtilities (val)
    u30 = true
    local u6 = u27.Create(a1)
    u30 = false
    if a2 then
        TimescaleUtilities.Delay(a2, function() -- Line: 98 -- upvalues: u6 (val)
            if u6.Parent then
                u6:Play()
            end
        end)
        return u6
    end
    if u6.Parent then
        u6:Play()
    end
    return u6
end

function u27.Create(a1) -- Line: 111
    -- upvalues: resolveAnchor (val), AudioUtil (val), u28 (val), u29 (val), GameState (val)
    local u48, v1, v2
    local v3 = a1.playbackSpeed or 1
    local timeScaled = if a1.timeScaled ~= nil then a1.timeScaled else true
    local audioGroup = a1.audioGroup or a1.soundGroupName
    local u14, u15 = resolveAnchor(a1.parent, a1.position)
    local id = a1.id
    local v4 = id
    if typeof(v4) ~= "number" then
        v2 = tonumber(id)
        if not v2 then
            v4 = tostring(id):match("rbxassetid://(%d+)")
            assert(v4, "EasySound: Could not resolve numeric sound id from '" .. (tostring(id)) .. "'")
            v1 = tonumber(v4)
            assert(v1, "EasySound: extracted numeric id was nil")
            u48 = v1
        else
            u48 = v2
        end
    else
        u48 = id
    end
    local u67 = if u14 then AudioUtil.createSpatialSound(u48, u14, audioGroup, {preset = "close"}) else AudioUtil.createSound(u48, audioGroup)
    local name = a1.name or u67.Name
    u67.Name = name
    u67.Volume = a1.volume or 1
    u67.Looping = a1.looped or false
    u67:SetAttribute("TimeScaleEnabled", timeScaled)
    if not u67.Looping then
        v2 = os.clock()
        v4 = u28[u48] or 0
        v1 = u29[u48]
        local v5 = 1
        if v4 > 0 then
            v5 = 1 / math.sqrt((math.min(v4 + 1, 12)))
        end
        if v1 and v2 - v1 < 0.035 then
            v5 = v5 * 0.75
        end
        u67.Volume = (a1.volume or 1) * v5
        u28[u48] = v4 + 1
        u29[u48] = v2
        if not u67.Looping then
            u67.Ended:Once(function() -- Line: 159 -- upvalues: u28 (upval), u48 (val)
                local v1 = u28[u48]
                if v1 then
                    if v1 <= 1 then
                        u28[u48] = nil
                        return
                    end
                    u28[u48] = v1 - 1
                end
            end)
        end
    end
    u67.PlaybackSpeed = v3 * (timeScaled and GameState and GameState.TimeScale or 1)
    if a1.startTime then
        u67.TimePosition = a1.startTime
    end
    if timeScaled then
        u67:SetAttribute("PlaybackSpeed", v3)
        AudioUtil.bindTimeScale(u67, v3)
    end
    if u15 or a1.destroyOnEnd then
        local function destroyTempAnchor() -- Line: 187 -- upvalues: u15 (val), u14 (val)
            if u15 and u14 and u14.Parent then
                u14:Destroy()
            end
        end

        u67.Ended:Once(function() -- Line: 192 -- upvalues: timeScaled (val), u67 (ref), AudioUtil (upval), u15 (val), u14 (val)
            if timeScaled then
                u67:SetAttribute("PlaybackSpeed", nil)
            end
            AudioUtil.cleanupAudioPlayer(u67)
            if u15 and u14 and u14.Parent then
                u14:Destroy()
            end
        end)
    end
    return u67
end

function u27.Preload(a1) -- Line: 204 -- upvalues: ContentProvider (val) -- types: a1: table
    local Sound
    local u1 = {}
    for i, j in a1 do
        Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://" .. tostring(j)
        table.insert(u1, Sound)
    end
    task.spawn(function() -- Line: 213 -- upvalues: ContentProvider (upval), u1 (val)
        ContentProvider:PreloadAsync(u1)
    end)
end

function u27:Destroy() -- Line: 219 -- upvalues: AudioUtil (val) -- types: self: userdata
    if self and self:IsDescendantOf(game) then
        AudioUtil.cleanupAudioPlayer(self)
    end
end

u27.bindTimeScale = AudioUtil.bindTimeScale
return u27