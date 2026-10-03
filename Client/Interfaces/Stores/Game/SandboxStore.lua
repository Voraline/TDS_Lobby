-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore
-- Decompile time: 2.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local v1 = {
    PanelEnabled = false,
    SelectedTab = "Enemies",
    SearchTerm = "",
    EnemySpawnAmount = 1,
    EnemySpawnDelay = 1,
    UnitSpawnAmount = 1,
    UnitSpawnDelay = 1,
    Timescale = 1,
    Health = 100,
    Invincible = true,
    InfiniteCash = true,
    InfiniteTowers = false,
    NoConsumableCooldowns = false,
    MusicEnabled = true,
    VoteSkipEnabled = true,
    SkillsEnabled = true,
    Pause = false,
    GoldenPerks = false,
    DesiredWave = 0,
    Level = 0,
    PanelDisabledModifier = {},
}
local u39, u40 = Charm.signal(v1)
local u41 = {getState = u39, Initial = v1}
local u42 = false
local u43 = false

function u41.updateStateRaw(a1) -- Line: 81 -- upvalues: table (val), u39 (val), u40 (val) -- types: a1: table
    local v1 = table.deepClone(u39())
    for k, v in pairs(a1) do
        v1[k] = v
    end
    u40(v1)
end

function u41.setPanelEnabled(a1) -- Line: 91 -- upvalues: table (val), u39 (val), u40 (val) -- types: a1: boolean
    assert(a1 ~= nil, "Enabled is nil")
    local v1 = table.deepClone(u39())
    v1.PanelEnabled = a1
    u40(v1)
end

function u41.setDisabledModifier(a1, a2) -- Line: 99
    -- upvalues: table (val), u39 (val), u40 (val)
    assert(a2 ~= nil, "Enabled is nil")
    assert(a1, "id is nil")
    local v1 = table.deepClone(u39())
    v1.PanelDisabledModifier[a1] = a2 or nil
    u40(v1)
end

function u41.setSelected(a1) -- Line: 108 -- upvalues: table (val), u39 (val), u40 (val) -- types: a1: string
    assert(a1, "Selected is nil")
    local v1 = table.deepClone(u39())
    v1.SelectedTab = a1
    v1.SearchTerm = ""
    u40(v1)
end

function u41.toggle() -- Line: 117 -- upvalues: table (val), u39 (val), u40 (val)
    local v1 = table.deepClone(u39())
    v1.PanelEnabled = not v1.PanelEnabled
    u40(v1)
end

function u41.setSearchTerm(a1) -- Line: 123 -- upvalues: table (val), u39 (val), u40 (val) -- types: a1: string
    assert(a1, "Term is nil")
    local v1 = table.deepClone(u39())
    v1.SearchTerm = a1
    u40(v1)
end

function u41.setOption(a1, a2, a3) -- Line: 131
    -- upvalues: table (val), u39 (val), u40 (val), NewNetwork (val)
    assert(a1, (("ID %* is nil"):format(a1)))
    local v1 = ("Value %* is nil (ID: %*)"):format(a2, a1)
    assert(a2 ~= nil, v1)
    local v2 = table.deepClone(u39())
    v2[a1] = a2
    u40(v2)
    if not a3 then
        NewNetwork.Channel("Sandbox"):fireServer("SetOption", a1, a2)
    end
end

local function setupChannel() -- Line: 144 -- upvalues: u43 (ref), NewNetwork (val), u41 (val)
    if u43 then
        return
    end
    u43 = true
    ;(NewNetwork.Channel("Sandbox")):onEvent("ForceOptions", function(a1) -- Line: 151 -- upvalues: u41 (upval)
        a1.PanelEnabled = nil
        a1.PanelDisabledModifier = nil
        a1.SelectedTab = nil
        a1.SearchTerm = nil
        u41.updateStateRaw(a1)
    end)
end

function u41.start() -- Line: 161
    -- upvalues: u42 (ref), RunService (val), GameState (val), u43 (ref), NewNetwork (val), u41 (val), Enum (val)
    if not u42 and RunService:IsClient() then
        u42 = true
        task.spawn(function() -- Line: 168 -- upvalues: GameState (upval), u43 (upval), NewNetwork (upval), u41 (upval)
            while not GameState.State.AcceptingConnections do
                task.wait()
            end
            if GameState.State.GameMode == "Sandbox" and not u43 then
                u43 = true
                ;(NewNetwork.Channel("Sandbox")):onEvent("ForceOptions", function(a1) -- Line: 151 -- upvalues: u41 (upval)
                    a1.PanelEnabled = nil
                    a1.PanelDisabledModifier = nil
                    a1.SelectedTab = nil
                    a1.SearchTerm = nil
                    u41.updateStateRaw(a1)
                end)
            end
            ;(GameState.Replicator:GetStateChangedSignal("GameMode")):Connect(function() -- Line: 177 -- upvalues: GameState (upval), u43 (upval), NewNetwork (upval), u41 (upval)
                if GameState.State.GameMode == "Sandbox" then
                    if u43 then
                        return
                    end
                    u43 = true
                    ;(NewNetwork.Channel("Sandbox")):onEvent("ForceOptions", function(a1) -- Line: 151 -- upvalues: u41 (upval)
                        a1.PanelEnabled = nil
                        a1.PanelDisabledModifier = nil
                        a1.SelectedTab = nil
                        a1.SearchTerm = nil
                        u41.updateStateRaw(a1)
                    end)
                end
            end)
        end)
        GameState.Replicator.Changed:Connect(function(a1, a2) -- Line: 184 -- upvalues: u41 (upval), Enum (upval)
            if a1 == "TimeScale" then
                u41.updateStateRaw({Timescale = a2, Pause = a2 == 0})
                return
            end
            if a1 == "HealthPerTeam" then
                local v1 = a2[Enum.Team.Player]
                if not v1 then
                    return
                end
                u41.updateStateRaw({Health = v1.Current})
            end
        end)
        return
    end
end

u41.start()
return u41