-- Script path: ReplicatedStorage.Shared.Modules.TutorialState
-- Decompile time: 2.11 ms

local v1 = game:GetService("RunService"):IsServer()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u28 = {}
local u29 = {}
local u30 = nil

local function getEventSignal(a1) -- Line: 13 -- upvalues: u28 (val), Signal (val) -- types: a1: string
    local v1 = u28[a1]
    if not v1 then
        u28[a1] = (Signal.new())
    end
    return v1
end

local u32 = {ScoutPlaced = false}
u32.Events = table.freeze({
    ScoutSelectionPromptShown = "ScoutSelectionPromptShown",
    ScoutSelected = "ScoutSelected",
    ScoutPlacementPromptShown = "ScoutPlacementPromptShown",
    ScoutPlaced = "ScoutPlaced",
    SniperSelectionPromptShown = "SniperSelectionPromptShown",
    SniperSelected = "SniperSelected",
    SniperPlacementPromptShown = "SniperPlacementPromptShown",
    SniperPlaced = "SniperPlaced",
    DemomanSelectionPromptShown = "DemomanSelectionPromptShown",
    DemomanSelected = "DemomanSelected",
    DemomanPlacementPromptShown = "DemomanPlacementPromptShown",
    DemomanPlaced = "DemomanPlaced",
    ScoutUpgradePromptShown = "ScoutUpgradePromptShown",
    ScoutUpgraded = "ScoutUpgraded",
    SniperUpgradePromptShown = "SniperUpgradePromptShown",
    SniperUpgraded = "SniperUpgraded",
})

function u32.Emit(a1, ...) -- Line: 46 -- upvalues: u29 (val), u28 (val), Signal (val) -- types: a1: string
    local v1 = table.pack(...)
    u29[a1] = v1
    local v2 = u28[a1]
    if not v2 then
        u28[a1] = (Signal.new())
    end
    v2:Fire((table.unpack(v1, 1, v1.n)))
end

function u32.HasReached(a1) -- Line: 52 -- upvalues: u29 (val) -- types: a1: string
    return u29[a1] ~= nil
end

function u32.WaitFor(a1) -- Line: 56 -- upvalues: u29 (val), u28 (val), Signal (val) -- types: a1: string
    local v1 = u29[a1]
    if v1 then
        return table.unpack(v1, 1, v1.n)
    end
    local v2 = u28[a1]
    if not v2 then
        u28[a1] = (Signal.new())
    end
    return v2:Wait()
end

function u32.ExpectPrompt(a1) -- Line: 65 -- upvalues: u30 (ref) -- types: a1: string
    u30 = a1
end

function u32.AcknowledgePrompt(a1) -- Line: 69 -- upvalues: u30 (ref), u32 (val) -- types: a1: string
    if a1 ~= u30 then
        return false
    end
    u30 = nil
    u32.Emit(a1)
    return true
end

function u32.ResetEvents() -- Line: 79 -- upvalues: u28 (val), u29 (val), u30 (ref)
    for i, j in u28 do
        j:Destroy()
    end
    table.clear(u28)
    table.clear(u29)
    u30 = nil
end

if RunService:IsServer() then
    u32.Replicator = require(ServerStorage.Server.Modules.ServerTagReplicator).new("TutorialState", {ScoutPlaced = false, ScoutTargetMode = false})
    u32.Replicator:Hook(u32)
    return u32
end
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local Promise = if not v1 then require(ReplicatedStorage.Shared.Modules.Promise) else require(ServerStorage.Server.Modules.Session.DataStore2.Promise)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u87 = {}
u87.Updated = Signal.new()

function u87.GetState() -- Line: 110 -- upvalues: Promise (val), u87 (val)
    return Promise.new(function(a1) -- Line: 111 -- upvalues: u87 (upval)
        while not u87.State do
            task.wait()
        end
        a1(u87.State)
    end)
end

TagReplicator.hook("GameState", function(a1, a2) -- Line: 119 -- upvalues: u87 (val), LegacyMiddleware (val), Enum (val)
    a2:Hook(a2)
    a2:Hook(u87)
    u87.State = a2
    u87.Replicator = a2
    ;(a2:GetStateChangedSignal("Wave")):Connect(function(a1) -- Line: 126 -- upvalues: LegacyMiddleware (upval), Enum (upval)
        LegacyMiddleware:RunFunction(Enum.HookType.OnNextWave, nil, function() -- Line: 127 -- upvalues: a1 (val)
            return a1
        end)
    end)
    u87.Updated:Fire(a2)
end)
return u87