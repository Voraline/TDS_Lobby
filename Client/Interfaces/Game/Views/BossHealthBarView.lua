-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.BossHealthBarView
-- Decompile time: 3.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewEnemyHealth = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewEnemyHealth)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useBosses = require(ReplicatedStorage.Client.Interfaces.Hooks.useBosses)
local useReplicatorValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorValue)
local createElement = React.createElement
local useEffect = React.useEffect
local DynamicList = ReactFlow.DynamicList
local useCallback = React.useCallback
local useRef = React.useRef
local useState = React.useState
local u49 = React.memo(function(a1) -- Line: 18
    -- upvalues: useReplicatorValue (val), useRef (val), useState (val), useEffect (val), createElement (val)
    -- upvalues: NewEnemyHealth (val)
    local v1
    local v2 = useReplicatorValue(a1.class.Replicator, "Health", 0)
    local v3 = useReplicatorValue(a1.class.Replicator, "MaxHealth", 0)
    local v4 = useReplicatorValue(a1.class.Replicator, "Shield", 0)
    local v5 = useReplicatorValue(a1.class.Replicator, "DisplayName", nil)
    local v6 = useReplicatorValue(a1.class.Replicator, "Name", nil)
    local u117 = v5
    if not u117 then
        u117 = v6
        if not u117 then
            u117 = "???"
        end
    end
    local u37 = useRef(u117)
    local v7, u41 = useState(0)
    local v8 = {u117}
    useEffect(function() -- Line: 30 -- upvalues: u37 (val), u117 (val), u41 (val)
        local current = u37.current
        if current ~= nil and current ~= "???" and current ~= u117 then
            u41(function(a1) -- Line: 38
                return a1 + 1
            end)
        end
        u37.current = u117
    end, v8)
    local v9 = {}
    local Stats = a1.class.Stats
    if Stats.Phase2Threshold then
        v9.rage = {value = Stats.Phase2Threshold, color = Color3.fromRGB(255, 0, 0)}
    end
    if Stats.RageModePercentage then
        v9.rage = {value = Stats.Phase2Threshold, color = Color3.fromRGB(255, 0, 0)}
    end
    if not Stats.HealthMarkers then
        v1 = a1
    else
        local v10 = nil
        local v11 = nil
        v1 = a1
        for i, j in Stats.HealthMarkers, v10, v11 do
            if not j.shouldShow or j.shouldShow() then
                v9[i] = j
            end
        end
    end
    return createElement(NewEnemyHealth, {
        revealAnchorPoint = 0,
        health = v2,
        maxHealth = v3,
        shieldHealth = v4,
        enemyName = u117,
        nameGlitchKey = v7,
        destroy = v1.destroy,
        remove = v1.remove,
        markers = v9,
    })
end)

local function render() -- Line: 80
    -- upvalues: useBosses (val), useState (val), table (val), useCallback (val), createElement (val), u49 (val)
    -- upvalues: useEffect (val), React (val), DynamicList (val)
    local u1 = useBosses()
    local u4, u5 = useState({})
    local v1 = table.count(u4)
    local u13 = useCallback(function(a1) -- Line: 86 -- upvalues: u5 (val), table (upval)
        u5(function(a1_2) -- Line: 87 -- upvalues: table (upval), a1 (val)
            local v1 = table.clone(a1_2)
            v1[a1] = nil
            return v1
        end)
    end, {})
    local u17 = useCallback(function(a1) -- Line: 94 -- upvalues: u5 (val), table (upval), createElement (upval), u49 (upval)
        u5(function(a1_2) -- Line: 95 -- upvalues: table (upval), a1 (val), createElement (upval), u49 (upval)
            local v1 = table.clone(a1_2)
            v1[a1.EntityId] = (createElement(u49, {class = a1}))
            return v1
        end)
    end, {})
    local v2 = {u1}
    useEffect(function() -- Line: 104 -- upvalues: u1 (val), u4 (val), u17 (val), u13 (val)
        local v1
        for i, j in u1 do
            if not u4[j.EntityId] then
                u17(j)
            end
        end
        local v2 = nil
        local v3 = nil
        for k in u4, v2, v3 do
            v1 = false
            for n, m in u1 do
                if m.EntityId == k then
                    v1 = true
                    break
                end
            end
            if not v1 then
                u13(k)
            end
        end
    end, v2)
    local createElement_2 = React.createElement
    v2 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.15),
        Size = UDim2.fromScale(2, 1.1),
    }
    local v3 = {
        uIScale = createElement("UIScale", {Scale = math.clamp(math.map(v1, 2, 3, 1, 0.8), 0.5, 1) * 1.05}),
    }
    v3.iListLayout = React.createElement("UIListLayout", {
        Wraps = true,
        FillDirection = v1 > 3 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0.03, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    v3.uIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 2.26823})
    v3.bossFrames = createElement(DynamicList, nil, u4)
    return createElement_2("Frame", v2, v3)
end

return function(a1) -- Line: 153 -- upvalues: createElement (val), render (val)
    return createElement(render)
end