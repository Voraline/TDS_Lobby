-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.CommunicationStore
-- Decompile time: 2.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Communication = require(ReplicatedStorage.Shared.Data.Communication)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u26, u27 = Charm.signal({
    open = false,
    openAtMouse = false,
    suggestions = {},
    cooldowns = {},
    dismissed = {},
})
local v1 = {getState = u26}

local function removeSuggestionFromState(a1, a2) -- Line: 58 -- types: a1: table, a2: string
    a1.suggestions[a2] = nil
    a1.dismissed[a2] = nil
    if a1.focusedSuggestion == a2 then
        a1.focusedSuggestion = nil
    end
end

local function removeMatchingTowerPingSuggestions(a1, a2) -- Line: 67
    -- upvalues: Communication (val)
    local v1 = Communication.getSuggestionTowerPingKey(a2)
    if not v1 then
        return
    end
    for i, j in a1.suggestions do
        if i ~= a2.id and Communication.getSuggestionTowerPingKey(j) == v1 then
            a1.suggestions[i] = nil
            a1.dismissed[i] = nil
            if a1.focusedSuggestion == i then
                a1.focusedSuggestion = nil
            end
        end
    end
end

local function addSuggestionToState(a1, a2) -- Line: 83
    -- upvalues: removeMatchingTowerPingSuggestions (val)
    removeMatchingTowerPingSuggestions(a1, a2)
    a1.suggestions[a2.id] = a2
    a1.dismissed[a2.id] = nil
end

function v1.setOpen(a1, a2) -- Line: 89
    -- upvalues: table (val), u26 (val), u27 (val)
    local v1 = table.deepClone(u26())
    v1.open = a1 == true
    local open = v1.open and a2 == true
    v1.openAtMouse = open
    u27(v1)
end

function v1.toggle(a1) -- Line: 96 -- upvalues: table (val), u26 (val), u27 (val) -- types: a1: boolean?
    local v1 = table.deepClone(u26())
    v1.open = not v1.open
    local open = v1.open and a1 == true
    v1.openAtMouse = open
    u27(v1)
end

function v1.addSuggestion(a1) -- Line: 103
    -- upvalues: table (val), u26 (val), removeMatchingTowerPingSuggestions (val), u27 (val)
    local v1 = table.deepClone(u26())
    removeMatchingTowerPingSuggestions(v1, a1)
    v1.suggestions[a1.id] = a1
    v1.dismissed[a1.id] = nil
    u27(v1)
end

function v1.setSuggestions(a1) -- Line: 109
    -- upvalues: table (val), u26 (val), removeMatchingTowerPingSuggestions (val), u27 (val)
    local v1 = table.deepClone(u26())
    v1.suggestions = {}
    local v2 = {}
    for i, j in a1 or {} do
        table.insert(v2, j)
    end
    table.sort(v2, function(a1, a2) -- Line: 118
        local createdAt_2, createdAt_4
        if (if typeof(a1.createdAt) ~= "number" then 0 else a1.createdAt) == (if typeof(a2.createdAt) ~= "number" then 0 else a2.createdAt) then
            return a1.id < a2.id
        end
        return createdAt_2 < createdAt_4
    end)
    for k, n in v2 do
        removeMatchingTowerPingSuggestions(v1, n)
        v1.suggestions[n.id] = n
        v1.dismissed[n.id] = nil
    end
    u27(v1)
end

function v1.removeSuggestion(a1) -- Line: 135 -- upvalues: table (val), u26 (val), u27 (val) -- types: a1: string
    local v1 = table.deepClone(u26())
    v1.suggestions[a1] = nil
    v1.dismissed[a1] = nil
    if v1.focusedSuggestion == a1 then
        v1.focusedSuggestion = nil
    end
    u27(v1)
end

function v1.removeSuggestions(a1) -- Line: 141 -- upvalues: u26 (val), table (val), u27 (val) -- types: a1: function
    local v1 = u26()
    local v2 = {}
    for i, j in v1.suggestions do
        if a1(j) then
            table.insert(v2, i)
        end
    end
    if #v2 == 0 then
        return
    end
    local v3 = table.deepClone(v1)
    for k, n in v2 do
        v3.suggestions[n] = nil
        v3.dismissed[n] = nil
        if v3.focusedSuggestion == n then
            v3.focusedSuggestion = nil
        end
    end
    u27(v3)
end

function v1.updateCooldown(a1, a2) -- Line: 163
    -- upvalues: table (val), u26 (val), u27 (val)
    local v1 = table.deepClone(u26())
    v1.cooldowns[a1] = a2
    u27(v1)
end

function v1.dismissNotification(a1) -- Line: 169 -- upvalues: table (val), u26 (val), u27 (val) -- types: a1: string
    local v1 = table.deepClone(u26())
    v1.dismissed[a1] = true
    u27(v1)
end

function v1.focusSuggestion(a1) -- Line: 175 -- upvalues: table (val), u26 (val), u27 (val) -- types: a1: string
    local v1 = table.deepClone(u26())
    v1.focusedSuggestion = a1
    u27(v1)
end

return v1