-- Script path: ReplicatedStorage.Client.Controllers.Shared.MedalClipController
-- Decompile time: 6.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local MedalClipper = require(ReplicatedStorage.Client.Modules.MedalClipper)
local u24 = FFlagController.get("medal.autoclipping.enabled", true)
local u28 = FFlagController.get("medal.autoclipping.studio_enabled", false)
local v1 = {}
local u30 = (-1 / 0)
local u31 = {}

local function cleanTagValue(a1) -- Line: 19
    if a1 == nil then
        return nil
    end
    local v1 = tostring(a1):gsub("%s+", "_")
    if v1 == "" then
        return nil
    end
    return v1:sub(1, 64)
end

local function addTag(a1, a2, a3) -- Line: 32 -- types: a1: table
    local v1, v2
    if a2 ~= nil then
        v2 = tostring(a2):gsub("%s+", "_")
        v1 = if v2 ~= "" then v2:sub(1, 64) else nil
    else
        v1 = nil
    end
    if a3 ~= nil then
        local v3 = tostring(a3):gsub("%s+", "_")
        v2 = if v3 ~= "" then v3:sub(1, 64) else nil
    else
        v2 = nil
    end
    if v1 and v2 then
        a1[v1] = v2
    end
end

local function getContextTags(a1) -- Line: 41 -- types: a1: table?
    local v1 = {}
    if a1 then
        local v2, v3, v4
        local v5 = nil
        local v6 = nil
        for i, j in a1, v5, v6 do
            if i ~= nil then
                v3 = tostring(i):gsub("%s+", "_")
                v2 = if v3 ~= "" then v3:sub(1, 64) else nil
            else
                v2 = nil
            end
            if j ~= nil then
                v4 = tostring(j):gsub("%s+", "_")
                v3 = if v4 ~= "" then v4:sub(1, 64) else nil
            else
                v3 = nil
            end
            if v2 and v3 then
                v1[v2] = v3
            end
        end
    end
    return v1
end

local function canClip(a1, a2) -- Line: 53
    -- upvalues: RunService (val), u28 (val), u24 (val), u31 (val), u30 (ref)
    if RunService:IsStudio() and not u28() then
        return false
    end
    if not u24() then
        return false
    end
    local v1 = os.clock()
    local v2 = u31[a1]
    if v2 and v1 - v2 < a2 then
        return false
    end
    if v1 - u30 < 12 then
        return false
    end
    return true
end

local function recordClip(a1) -- Line: 76 -- upvalues: u30 (ref), u31 (val) -- types: a1: string
    u30 = os.clock()
    u31[a1] = u30
end

function v1.TriggerClip(a1, a2, a3) -- Line: 81
    -- upvalues: canClip (val), MedalClipper (val), getContextTags (val), u30 (ref), u31 (val)
    local u6 = a3 or {}
    if not canClip(a1, u6.cooldown or 60) then
        return false
    end
    local success, result = pcall(function() -- Line: 97 -- upvalues: MedalClipper (upval), a1 (val), a2 (val), u6 (ref), getContextTags (upval)
        MedalClipper:TriggerClip(a1, a2, {
            duration = u6.duration or 30,
            captureDelayMs = u6.captureDelayMs,
            contextTags = getContextTags(u6.contextTags),
        })
    end)
    if not success then
        warn((("Medal clip trigger failed: %*"):format(result)))
        return false
    end
    u30 = os.clock()
    u31[a1] = u30
    return true
end

return v1