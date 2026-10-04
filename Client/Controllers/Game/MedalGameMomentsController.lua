-- Script path: ReplicatedStorage.Client.Controllers.Game.MedalGameMomentsController
-- Decompile time: 8.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local MedalClipController = require(ReplicatedStorage.Client.Controllers.Shared.MedalClipController)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local u28 = {Deluxe = true, Golden = true, ["High Grade"] = true, Premium = true}
local u36 = FFlagController.get("medal.autoclipping.final_wave_enabled", true)
local u40 = FFlagController.get("medal.autoclipping.match_end_enabled", true)
local u44 = FFlagController.get("medal.autoclipping.rare_reward_enabled", true)
local v1 = {}
local u46 = nil
local u47 = false
local u48 = false

local function getState(a1) -- Line: 29 -- upvalues: GameState (val) -- types: a1: string
    return GameState.State and GameState.State:Get(a1)
end

local function getGameContextTags(a1) -- Line: 33 -- upvalues: GameState (val) -- types: a1: table?
    local v1 = {}
    local State = GameState.State and GameState.State:Get("GameMode")
    v1.mode = State
    local State_2 = GameState.State and GameState.State:Get("Difficulty")
    v1.difficulty = State_2
    local State_3 = GameState.State and GameState.State:Get("MapName")
    v1.map = State_3
    local State_4 = GameState.State and GameState.State:Get("Wave")
    v1.wave = State_4
    if a1 then
        for i, j in a1 do
            v1[i] = j
        end
    end
    return v1
end

local function triggerGameClip(a1, a2, a3) -- Line: 50
    -- upvalues: MedalClipController (val), getGameContextTags (val)
    return MedalClipController.TriggerClip(a1, a2, {
        duration = a3.duration,
        captureDelayMs = a3.captureDelayMs,
        contextTags = getGameContextTags(a3.contextTags),
        cooldown = a3.cooldown,
    })
end

local function getLocalTeam() -- Line: 68 -- upvalues: u46 (ref)
    if not u46 then
        return nil
    end
    return u46.Replicator:Get("Team")
end

local function tryTriggerFinalWave() -- Line: 76
    -- upvalues: u47 (ref), u36 (val), GameState (val), MedalClipController (val), getGameContextTags (val)
    if not u47 and u36() then
        local v1 = tonumber(GameState.State and GameState.State:Get("Wave"))
        local State_2 = GameState.State and GameState.State:Get("FinalWave")
        if State_2 and v1 and not (v1 <= 0) then
            local State_3 = GameState.State and GameState.State:Get("GameOver")
            if not State_3 then
                local v2 = {
                    duration = 30,
                    captureDelayMs = 3000,
                    cooldown = 300,
                    contextTags = {event = "final_wave"},
                }
                u47 = MedalClipController.TriggerClip("tds_final_wave", "Final Wave", {
                    duration = v2.duration,
                    captureDelayMs = v2.captureDelayMs,
                    contextTags = getGameContextTags(v2.contextTags),
                    cooldown = v2.cooldown,
                })
                return
            end
        end
        return
    end
end

local function tryTriggerMatchEnd() -- Line: 97
    -- upvalues: u48 (ref), u40 (val), GameState (val), u46 (ref), MedalClipController (val), getGameContextTags (val)
    if not u48 and u40() then
        local State = GameState.State and GameState.State:Get("GameOver")
        local State_2 = GameState.State and GameState.State:Get("WinningTeam")
        local v1 = if u46 then u46.Replicator:Get("Team") else nil
        if State and State_2 ~= nil and v1 ~= nil then
            if not (State_2 == v1) then
                u48 = true
                return
            end
            local v2 = {
                duration = 45,
                captureDelayMs = 5000,
                cooldown = 300,
                contextTags = {event = "triumph", result = "win"},
            }
            u48 = MedalClipController.TriggerClip("tds_match_triumph", "TDS Triumph", {
                duration = v2.duration,
                captureDelayMs = v2.captureDelayMs,
                contextTags = getGameContextTags(v2.contextTags),
                cooldown = v2.cooldown,
            })
            return
        end
        return
    end
end

local function getRewardName(a1, a2) -- Line: 127 -- types: a1: string, a2: table
    return (tostring(a2.Value or a2.Label or a2.Tower or a1))
end

local function getRareRewardClip(a1, a2) -- Line: 131 -- upvalues: u28 (val) -- types: a1: string
    if type(a2) ~= "table" then
        return nil, nil
    end
    local v1 = tostring(a2.Type or "")
    local v2 = tostring(a2.Value or a2.Label or a2.Tower or a1)
    if v1 == "Tower" then
        local v3 = a2.Tower or v2
        local Skin = a2.Skin
        local v4 = if not Skin then ("%* Unlocked"):format(v3) else ("%* %* Unlocked"):format(Skin, v3)
        return v4, {
            event = "rare_reward",
            rewardType = if not Skin then "tower" else "skin",
            reward = v3,
            skin = Skin,
        }
    end
    if v1 == "Crate" and u28[v2] then
        return (("%* Crate Earned"):format(v2)), {event = "rare_reward", rewardType = "crate", reward = v2}
    end
    if v1 == "Modifier" then
        return (("%* Modifier Earned"):format(v2)), {event = "rare_reward", rewardType = "modifier", reward = v2}
    end
    return nil, nil
end

local function onPlayerStateChanged(a1, a2) -- Line: 173
    -- upvalues: u44 (val), getRareRewardClip (val), MedalClipController (val), getGameContextTags (val)
    if not u44() then
        return
    end
    local v1 = a1:match("^(.+)Reward$")
    if not v1 then
        return
    end
    v1 = v1:gsub("_", " ")
    local v2, v3 = getRareRewardClip(v1, a2)
    if not v2 then
        return
    end
    local v4 = {duration = 20, captureDelayMs = 3000, cooldown = 300, contextTags = v3}
    MedalClipController.TriggerClip("tds_rare_reward", v2, {
        duration = v4.duration,
        captureDelayMs = v4.captureDelayMs,
        contextTags = getGameContextTags(v4.contextTags),
        cooldown = v4.cooldown,
    })
end

function v1.init() -- Line: 198
    -- upvalues: GameState (val), tryTriggerFinalWave (val), tryTriggerMatchEnd (val), PlayerReplicator (val), u46 (ref)
    -- upvalues: onPlayerStateChanged (val)
    (GameState.State:GetStateChangedSignal("Wave")):Connect(tryTriggerFinalWave)
    ;(GameState.State:GetStateChangedSignal("FinalWave")):Connect(tryTriggerFinalWave)
    ;(GameState.State:GetStateChangedSignal("GameOver")):Connect(tryTriggerMatchEnd)
    ;(GameState.State:GetStateChangedSignal("WinningTeam")):Connect(tryTriggerMatchEnd)
    ;(PlayerReplicator.GetLocalPlayer()):andThen(function(a1) -- Line: 204 -- upvalues: u46 (upval), onPlayerStateChanged (upval), tryTriggerMatchEnd (upval)
        u46 = a1
        a1.Replicator.Changed:Connect(onPlayerStateChanged)
        ;(a1.Replicator:GetStateChangedSignal("Team")):Connect(tryTriggerMatchEnd)
        tryTriggerMatchEnd()
    end)
end

task.spawn(v1.init)
return v1