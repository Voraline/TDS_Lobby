-- Script path: ReplicatedStorage.Client.Controllers.Shared.SoundSettingController
-- Decompile time: 1.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local AudioUtil = require(ReplicatedStorage.Shared.Modules.AudioUtil)
local v1 = {}
local u21 = {
    "Ambience",
    "Communication",
    "Cutscene",
    "DJ",
    "Emotes",
    "Enemies",
    "Music",
    "Towers",
    "Yapping",
    "Stickers",
}
local u32 = {}

local function ensureCompatibilitySoundGroup(a1) -- Line: 40
    -- upvalues: u32 (val), SoundService (val)
    if u32[a1] then
        return u32[a1]
    end
    local v1 = SoundService:FindFirstChild(a1)
    if v1 and v1:IsA("SoundGroup") then
        u32[a1] = v1
        return v1
    end
    local SoundGroup = Instance.new("SoundGroup")
    SoundGroup.Name = a1
    SoundGroup.Parent = SoundService
    u32[a1] = SoundGroup
    return SoundGroup
end

function v1.init() -- Line: 57 -- upvalues: RunService (val), AudioUtil (val), u21 (val), u32 (val), SoundService (val)
    local SoundGroup, v1
    if not RunService:IsClient() then
        return
    end
    local v2 = AudioUtil.createAudioDeviceOutput()
    local v3 = AudioUtil.createSoundGroupLink(v2, "master")
    v3.Volume = 1
    local v4 = nil
    local v5 = nil
    for i, j in u21, v4, v5 do
        if not AudioUtil.getSoundGroup(j) then
            AudioUtil.createSoundGroupLink(v2, j, v3)
        end
        if not u32[j] then
            v1 = SoundService:FindFirstChild(j)
            if not v1 or not v1:IsA("SoundGroup") then
                SoundGroup = Instance.new("SoundGroup")
                SoundGroup.Name = j
                SoundGroup.Parent = SoundService
                u32[j] = SoundGroup
            else
                u32[j] = v1
            end
        else
            v1 = u32[j]
        end
    end

    local function bridgeVolume(a1) -- Line: 75
        -- upvalues: SoundService (upval), AudioUtil (upval)
        local u5 = SoundService:FindFirstChild(a1)
        if u5 and u5:IsA("SoundGroup") then
            local v1
            local u10 = {a1}
            for i, j in u10 do
                v1 = AudioUtil.getSoundGroup(j)
                if v1 then
                    v1.Volume = u5.Volume
                end
            end
            ;(u5:GetPropertyChangedSignal("Volume")):Connect(function() -- Line: 83 -- upvalues: u10 (val), AudioUtil (upval), u5 (val)
                local v1
                for i, j in u10 do
                    v1 = AudioUtil.getSoundGroup(j)
                    if v1 then
                        v1.Volume = u5.Volume
                    end
                end
            end)
            return
        end
    end

    for k, n in u21 do
        bridgeVolume(n)
    end
end

task.spawn(v1.init)
return v1