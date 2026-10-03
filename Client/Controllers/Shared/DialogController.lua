-- Script path: ReplicatedStorage.Client.Controllers.Shared.DialogController
-- Decompile time: 2.36 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Dialogue = require(ReplicatedStorage.Shared.Modules.Network).Channel("Dialogue")
local DialogStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.DialogStore)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local LocalPlayer = Players.LocalPlayer
local u42 = {}

local function getWordCount(a1) -- Line: 41 -- types: a1: string
    local v1 = 0
    for i in string.gmatch(a1, "%S+") do
        v1 = v1 + 1
    end
    return (math.max(5, v1))
end

function u42.GetDialogDelay(a1) -- Line: 51 -- types: a1: string
    local v1 = #a1 * 0.02
    local v2 = 0
    for i in string.gmatch(a1, "%S+") do
        v2 = v2 + 1
    end
    return v1 + math.max(5, v2) / 3
end

local function canQueueDialog(a1) -- Line: 57 -- upvalues: SettingsController (val) -- types: a1: table
    local v1 = true
    if a1.OverrideSetting ~= true then
        v1 = SettingsController.Game:Get("Dialog") ~= false
    end
    return v1
end

local function shouldForceDialog(a1) -- Line: 61 -- upvalues: LocalPlayer (val) -- types: a1: table
    local ForceDialogUserIds = a1.ForceDialogUserIds
    return ForceDialogUserIds and ForceDialogUserIds[tostring(LocalPlayer.UserId)] == true
end

function u42.Queue(a1, a2) -- Line: 66
    -- upvalues: SettingsController (val), DialogStore (val), HttpService (val)
    local v1 = true
    if a1.OverrideSetting ~= true then
        v1 = SettingsController.Game:Get("Dialog") ~= false
    end
    if not v1 then
        return
    end
    v1 = #a1.Text * 0.02
    local v2 = 0
    for i in string.gmatch(a1.Text, "%S+") do
        v2 = v2 + 1
    end
    local v3 = math.max(5, v2) / 3
    local v4 = DialogStore.getCurrent()
    local v5 = if a2 then a2 else v1 + v3
    if v5 < v1 then
        v5 = v5 + v1
    end
    DialogStore.add({
        id = HttpService:GenerateGUID(false),
        duration = v5,
        dialog = a1,
        OverrideSetting = a1.OverrideSetting,
        skipLast = v4 and v4.duration == (1 / 0),
    })
end

local u54 = GameState.Replicator:Get("GameOver") == true

function u42.init() -- Line: 95
    -- upvalues: GameState (val), u54 (ref), DialogStore (val), SettingsController (val), Dialogue (val)
    -- upvalues: LocalPlayer (val), u42 (val)
    (GameState.Replicator:GetStateChangedSignal("GameOver")):Connect(function(a1) -- Line: 96 -- upvalues: u54 (upval), DialogStore (upval)
        u54 = a1 == true
        if u54 then
            DialogStore.clear()
        end
    end)
    SettingsController.Game:On("Dialog", function(a1) -- Line: 104 -- upvalues: DialogStore (upval) -- types: a1: boolean
        if a1 == false then
            DialogStore.clearDisabled()
        end
    end)
    Dialogue:On("Skip", function(a1) -- Line: 110 -- upvalues: DialogStore (upval) -- types: a1: boolean
        DialogStore.skip(a1)
    end)
    Dialogue:On("Show", function(a1) -- Line: 114 -- upvalues: u54 (upval), LocalPlayer (upval), u42 (upval) -- types: a1: table
        if u54 then
            return
        end
        local ForceDialogUserIds = a1.ForceDialogUserIds
        if ForceDialogUserIds and ForceDialogUserIds[tostring(LocalPlayer.UserId)] == true then
            a1.Dialog.OverrideSetting = true
        end
        u42.Queue(a1.Dialog, a1.Duration)
    end)
    Dialogue:On("Enable", function(a1) -- Line: 127 -- upvalues: u42 (upval) -- types: a1: table
        for i, j in a1 do
            u42.Queue(j, j.Wait)
        end
    end)
    Dialogue:On("Clear", function(a1) -- Line: 133 -- upvalues: DialogStore (upval) -- types: a1: table
        DialogStore.clear()
    end)
end

u42.init()
return u42