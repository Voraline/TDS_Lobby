-- Script path: ReplicatedStorage.Client.Controllers.Shared.SoundCompressor
-- Decompile time: 5.60 ms

local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local MusicController = require(ReplicatedStorage.Client.Controllers.Shared.MusicController)
local Charm = require(ReplicatedStorage.Packages.Charm)
local EnemiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.EnemiesStore)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local u43 = {Dialog = {{Attack = 0.08, Release = 0.02, Threshold = 20, MaxImpact = 0.19}}}
local u46 = {Yapping = true}
local v1 = {}
local u49 = false
local u50 = 1

local function getDialogVolume(a1) -- Line: 31
    for i in a1 do
        if i.Name == "Yapping" then
            return i.Volume
        end
    end
    return 1
end

local function isDialogAudioActive(a1, a2) -- Line: 41
    -- upvalues: CollectionService (val)
    if a2 <= 0 then
        return false
    end
    for i, j in CollectionService:GetTagged("Dialog") do
        if j:IsA("Sound") then
            if not j.IsPlaying and not (a1 < j.PlaybackLoudness * a2) then
                continue
            end
            return true
        end
    end
    return false
end

local u53 = {}

function u53.Dialog(a1) -- Line: 61
    -- upvalues: MusicController (val), isDialogAudioActive (val), u49 (ref), u50 (ref), math (val), u46 (val)
    local Threshold, v1
    local GroupAudios = MusicController.GroupAudios
    local v2 = isDialogAudioActive
    local v3 = GroupAudios
    for i in v3 do
        if i.Name == "Yapping" then
            v2 = v2(a1.Threshold, i.Volume)
            u50 = if v2 then math.lerp(u50, a1.MaxImpact, a1.Attack) else if not u49 then math.lerp(u50, 1, a1.Release) else math.lerp(u50, a1.MaxImpact, a1.Attack)
            v1 = nil
            v3 = nil
            for j, k in GroupAudios, v1, v3 do
                if not u46[j.Name] and j.Volume ~= 0 then
                    if j.Name ~= "Music" or not u49 or v2 then
                        j.Volume = k * u50 - 0
                    else
                        j.Volume = k - 0
                    end
                end
            end
            return
        end
    end
    v2 = v2(Threshold, 1)
    u50 = if v2 then math.lerp(u50, a1.MaxImpact, a1.Attack) else if not u49 then math.lerp(u50, 1, a1.Release) else math.lerp(u50, a1.MaxImpact, a1.Attack)
    v1 = nil
    v3 = nil
    for n, m in GroupAudios, v1, v3 do
        if not u46[n.Name] and n.Volume ~= 0 then
            if n.Name ~= "Music" or not u49 or v2 then
                n.Volume = m * u50 - 0
            else
                n.Volume = m - 0
            end
        end
    end
end

function v1.init() -- Line: 96
    -- upvalues: Charm (val), EnemiesStore (val), u49 (ref), Scheduler (val), RunService (val), u43 (val), u53 (val)
    Charm.listen(EnemiesStore.getState, function(a1) -- Line: 97 -- upvalues: u49 (upval)
        u49 = #a1 > 0
    end)
    Scheduler.add("SoundCompressor", RunService.Heartbeat, function() -- Line: 101 -- upvalues: u43 (upval), u53 (upval)
        local v1 = nil
        local v2 = nil
        for i, j in u43, v1, v2 do
            if u53[i] then
                for k, n in j do
                    u53[i](n)
                end
            end
        end
    end)
end

task.spawn(v1.init)
return v1