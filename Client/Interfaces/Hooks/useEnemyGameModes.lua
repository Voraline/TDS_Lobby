-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useEnemyGameModes
-- Decompile time: 1.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local EnemyGameModeDisplay = require(Interfaces.Lobby.Utility.EnemyGameModeDisplay)
local EnemyGameModeLookup = require(Interfaces.Lobby.Utility.EnemyGameModeLookup)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useMemo = React.useMemo
local useState = React.useState

local function formatManualGameModes(a1) -- Line: 13 -- upvalues: EnemyGameModeDisplay (val) -- types: a1: table?
    local v1 = {}
    local v2 = {}
    local v3 = ipairs
    for i, v in v3(a1 or {}) do
        if typeof(v) == "string" and not v2[v] then
            v2[v] = true
            table.insert(v1, v)
        end
    end
    table.sort(v1, EnemyGameModeDisplay.sortModeNames)
    if #v1 == 0 then
        return EnemyGameModeDisplay.formatAppearsInText({}, {}, 0)
    end
    v3 = {}
    for i2, j in v1 do
        table.insert(v3, (EnemyGameModeDisplay.getRichText(j)))
    end
    return (("Appears in: %*"):format((table.concat(v3, ", "))))
end

return function(a1) -- Line: 38
    -- upvalues: useState (val), EnemyGameModeLookup (val), useEffect (val), useMemo (val), formatManualGameModes (val)
    local v1, u6 = useState(EnemyGameModeLookup.getVersion())
    useEffect(function() -- Line: 41 -- upvalues: EnemyGameModeLookup (upval), u6 (val)
        return EnemyGameModeLookup.subscribe(function(a1) -- Line: 42 -- upvalues: u6 (upval)
            u6(a1)
        end)
    end, {})
    return useMemo(function() -- Line: 47 -- upvalues: a1 (val), formatManualGameModes (upval), EnemyGameModeLookup (upval)
        if a1 ~= nil and typeof(a1) == "table" and a1.gameModes ~= nil then
            return formatManualGameModes(a1.gameModes)
        end
        return EnemyGameModeLookup.getAppearsInText(a1)
    end, {a1, v1})
end