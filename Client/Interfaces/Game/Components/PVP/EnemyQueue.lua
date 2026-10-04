-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.EnemyQueue
-- Decompile time: 4.17 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EnemyQueueEntry = require(script.Parent.EnemyQueueEntry)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
require(ReplicatedStorage.Shared.Modules.PromiseQueue)
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useTagReplicatorInstance = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicatorInstance)
local createElement = React.createElement
local useMemo = React.useMemo
local PVP = NewNetwork.Channel("PVP")
return function() -- Line: 26
    -- upvalues: useTagReplicatorInstance (val), Players (val), useGameStateValue (val), useMemo (val)
    -- upvalues: PVPConstants (val), useReplicatedState (val), table (val), createElement (val), EnemyQueueEntry (val)
    -- upvalues: PVP (val), React (val)
    local v1 = useTagReplicatorInstance(Players.LocalPlayer, "Replicator", "EnemyQueue")
    local u9 = useGameStateValue("Difficulty", "PVP_lowRanks")
    local v2 = {u9}
    local u14 = useMemo(function() -- Line: 30 -- upvalues: PVPConstants (upval), u9 (val)
        return PVPConstants.getSpawnableEnemies(u9)
    end, v2)
    local u19 = useReplicatedState(v1, "NextSpawnsAt", 0)
    local u24 = useReplicatedState(v1, "Content", {})
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 72),
        Size = UDim2.fromOffset(320, 80),
    }, {
        list = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 0),
        }),
        content = React.createElement(React.Fragment, {}, (useMemo(function() -- Line: 38
            -- upvalues: table (upval), u24 (val), u14 (val), createElement (upval), EnemyQueueEntry (upval), u19 (val)
            -- upvalues: PVP (upval)
            return table.reduce(u24, function(a1, a2, a3) -- Line: 39
                -- upvalues: u14 (upval), createElement (upval), EnemyQueueEntry (upval), u19 (upval), PVP (upval)
                local v1 = string.split(a2.id, "__")[1]
                local v2 = u14[v1]
                local v3 = a3 == 1
                local id = a2.id
                local v4 = createElement
                local v5 = {
                    id = v1,
                    idx = a3,
                    main = v3,
                    timer = if not v3 then nil else u19,
                    maxTimer = if not v2 then nil else v2.SpawnTimer,
                    count = tonumber(a2.data) or 0,
                    onCancel = function() -- Line: 51 -- upvalues: PVP (upval), a2 (val)
                        PVP:fireServer("Cancel", a2.id)
                    end,
                }
                a1[id] = (v4(EnemyQueueEntry, v5))
                return a1
            end, {})
        end, {u24}))),
    })
end