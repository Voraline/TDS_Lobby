-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.EnemySpawnMenu
-- Decompile time: 6.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local React = require(ReplicatedStorage.Shared.UI.React)
local ZombieSpawnEntry = require(script.Parent.ZombieSpawnEntry)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local usePlayerReplicator = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicator)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useMemo = React.useMemo
return function(a1) -- Line: 20
    -- upvalues: useSpring (val), React (val), usePlayerReplicator (val), useGameStateValue (val)
    -- upvalues: useReplicatedState (val), useMemo (val), PVPConstants (val), table (val), createElement (val)
    -- upvalues: ZombieSpawnEntry (val)
    local v1, u11 = useSpring(if not a1.enabled then 0 else 1, 1, 40, true)
    local v2 = v1:map(function(a1) -- Line: 22
        return 1 - a1
    end)
    local useEffect = React.useEffect
    local v3 = {a1.enabled}
    useEffect(function() -- Line: 26 -- upvalues: u11 (val), a1 (val)
        u11(if not a1.enabled then 0 else 1)
    end, v3)
    local v4 = usePlayerReplicator()
    local Wave = useGameStateValue("Wave")
    local Difficulty = useGameStateValue("Difficulty")
    local TotalWaves = useGameStateValue("TotalWaves")
    local u37 = useReplicatedState(v4, "ZombieSpawnData")
    local v5 = useMemo
    local v6 = {Wave, Difficulty, a1.enabled}
    v5 = v5(function() -- Line: 37
        -- upvalues: PVPConstants (upval), Difficulty (val), table (upval), Wave (val), a1 (val), u37 (val)
        -- upvalues: TotalWaves (val)
        local v1
        local v2 = {}
        local v3 = {}
        for i, j in PVPConstants.getSpawnableEnemies(Difficulty) do
            table.insert(v3, {i, j})
        end
        table.sort(v3, function(a1, a2) -- Line: 46
            return a1[2].Cost < a2[2].Cost
        end)
        for k, n in v3 do
            v1 = n[1]
            v2[v1] = {
                name = n[1],
                entry = n[2],
                wave = Wave,
                difficulty = Difficulty,
                enabled = a1.enabled,
                idx = k,
                zombieSpawnData = u37,
                totalWaves = TotalWaves,
            }
        end
        return v2
    end, v6)
    return createElement("Frame", {
        Position = UDim2.new(0.5, 0, 1, 0),
        Size = UDim2.fromOffset(672, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(35, 32, 53),
        BackgroundTransparency = v1:map(function(a1) -- Line: 76
            return math.map(a1, 0, 1, 1, 0.25)
        end),
        AnchorPoint = Vector2.new(0.5, 1),
    }, {
        scale = createElement("UIScale", {
            Scale = v1:map(function(a1) -- Line: 82
                return math.map(a1, 0, 1, 0.5, 1)
            end),
        }),
        corner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(88, 217, 159), Transparency = v2}, {
            gradient = createElement("UIGradient", {
                Rotation = 45,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.1, 0.75),
                    NumberSequenceKeypoint.new(0.2, 1),
                    NumberSequenceKeypoint.new(0.8, 1),
                    NumberSequenceKeypoint.new(0.9, 0.75),
                    (NumberSequenceKeypoint.new(1, 0)),
                }),
            }),
        }),
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 10),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 10),
        }),
        grid = createElement("UIGridLayout", {
            CellSize = UDim2.fromOffset(80, 80),
            CellPadding = UDim2.fromOffset(15, 15),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        enemies = React.createElement(React.Fragment, {}, (table.reduce(v5, function(a1, a2, a3) -- Line: 66 -- upvalues: createElement (upval), ZombieSpawnEntry (upval)
            a1[a3] = (createElement(ZombieSpawnEntry, a2))
            return a1
        end, {}))),
    })
end