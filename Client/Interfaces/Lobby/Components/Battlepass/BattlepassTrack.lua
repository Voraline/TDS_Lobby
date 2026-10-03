-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassTrack
-- Decompile time: 5.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local BattlepassTrackValue = require(script.Parent.BattlepassTrackValue)
local Change = React.Change
local Fragment = React.Fragment
local useRef = React.useRef
local useState = React.useState
local useEffect = React.useEffect
local createElement = React.createElement
local memo = React.memo

local function claimKey(a1, a2) -- Line: 15 -- types: a1: number, a2: boolean
    return (("%*:%*"):format(a1, if not a2 then "regular" else "premium"))
end

local u25 = memo(function(a1) -- Line: 19
    -- upvalues: useRef (val), useState (val), useEffect (val), createElement (val), BattlepassTrackValue (val)
    -- upvalues: Fragment (val)
    local index_2, v1, v2, v3, v4, v5, v6, v7, v8
    local items = a1.items
    local level = a1.level
    local tiers = a1.tiers
    local premium = a1.premium
    local scrollRef = a1.scrollRef
    local u420 = useRef(nil)
    local v9, u434 = useState({})
    local v10 = {}
    local v11 = #items
    local u272 = {}
    local u346 = {}

    local function recordClaim(a1, a2) -- Line: 34 -- upvalues: u272 (val), u346 (val) -- types: a1: number, a2: boolean
        local v1 = u272[a1] or {regular = false, premium = false}
        if not a2 then
            v1.regular = true
        else
            v1.premium = true
        end
        u272[a1] = v1
        u346[(("%*:%*"):format(a1, if not a2 then "regular" else "premium"))] = true
    end

    local v12 = nil
    local v13 = nil
    local v14 = a1
    for i, j in tiers, v12, v13 do
        if type(j) ~= "table" then
            if type(j) == "number" then
                v1 = u272[j] or {regular = false, premium = false}
                v1.regular = true
                u272[j] = v1
                u346[(("%*:regular"):format(j))] = true
                v1 = u272[j] or {regular = false, premium = false}
                v1.premium = true
                u272[j] = v1
                u346[(("%*:premium"):format(j))] = true
            end
        elseif type(j.index) == "number" then
            index_2 = j.index
            v2 = j.battlepass == true
            v3 = u272[index_2] or {regular = false, premium = false}
            if not v2 then
                v3.regular = true
            else
                v3.premium = true
            end
            u272[index_2] = v3
            u346[(("%*:%*"):format(index_2, if not v2 then "regular" else "premium"))] = true
        elseif type(j) == "number" then
            v1 = u272[j] or {regular = false, premium = false}
            v1.regular = true
            u272[j] = v1
            u346[(("%*:regular"):format(j))] = true
            v1 = u272[j] or {regular = false, premium = false}
            v1.premium = true
            u272[j] = v1
            u346[(("%*:premium"):format(j))] = true
        end
    end
    v13 = {u346}
    useEffect(function() -- Line: 61 -- upvalues: u420 (val), u346 (val), u434 (val)
        local current = u420.current
        u420.current = u346
        if not current then
            return
        end
        local v1 = {}
        for i in u346 do
            if not current[i] then
                v1[i] = true
            end
        end
        if not next(v1) then
            return
        end
        u434(v1)
        local u24 = task.delay(0.1, function() -- Line: 82 -- upvalues: u434 (upval)
            u434({})
        end)
        return function() -- Line: 86 -- upvalues: u24 (val)
            if coroutine.status(u24) ~= "dead" then
                task.cancel(u24)
            end
        end
    end, v13)
    v12 = nil
    v13 = nil
    for k, n in items, v12, v13 do
        v1 = n.level or 0
        v2 = u272[v1] or {}
        v3 = v2.regular == true
        v4 = v2.premium == true
        v5 = v1 == level + 1
        v6 = ("track%*"):format(v1)
        v7 = {LayoutOrder = v1, Visible = v14.Visible, maxLevel = v11, level = v1}
        v7.locked = not v5 and not v3 or level + 2 < v1
        v7.completed = v1 <= level
        v7.selected = v1 == level + 1
        v7.regular = n.regular
        v7.premium = n.premium
        v8 = true
        if premium == true then
            v8 = not v4
        end
        v7.premiumLocked = v8
        v7.regularJustClaimed = v9[("%*:regular"):format(v1)] == true
        v7.premiumJustClaimed = v9[("%*:premium"):format(v1)] == true
        v7.Transparency = v14.Transparency
        v7.scrollRef = scrollRef
        v10[v6] = (createElement(BattlepassTrackValue, v7))
    end
    return createElement(Fragment, nil, v10)
end)
return (memo(function(a1) -- Line: 122 -- upvalues: useRef (val), useState (val), createElement (val), Change (val), u25 (val)
    local items = a1.items or {}
    local v1 = a1.level or 0
    local tiers = a1.tiers or {}
    local v2 = a1.premium == true
    local v3 = useRef()
    local v4, u18 = useState(UDim2.new())
    local v5 = {BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 0, Selectable = false}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 0.5)
    v5.AnchorPoint = AnchorPoint
    v5.AutomaticCanvasSize = Enum.AutomaticSize.None
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v5.CanvasSize = v4
    local Position = a1.Position or UDim2.fromScale(0.191, 0.679)
    v5.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.806, 0.59)
    v5.Size = Size
    v5.ZIndex = a1.ZIndex or 2
    v5.ref = v3
    local v6 = {}
    local v7 = createElement
    local v8 = {
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        Padding = UDim.new(0, 10),
    }

    v8[Change.AbsoluteContentSize] = function(a1) -- Line: 157 -- upvalues: u18 (val)
        u18(UDim2.new(0, a1.AbsoluteContentSize.X, 0, 0))
    end

    v6.uIListLayout = v7("UIListLayout", v8)
    v6.content = createElement(u25, {
        items = items,
        level = v1,
        tiers = tiers,
        premium = v2,
        scrollRef = v3,
        Transparency = a1.Transparency,
        Visible = a1.Visible,
    })
    return createElement("ScrollingFrame", v5, v6)
end))