-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Towers.TowersContent
-- Decompile time: 5.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Collapsible = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Collapsible)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local Searchbox = require(script.Parent.Parent.Searchbox)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local TowersEntry = require(script.Parent.TowersEntry)
local fzy = require(ReplicatedStorage.Shared.Modules.fzy)
local Troops_2 = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useHasSandboxGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useHasSandboxGamepass)
local useTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useTowers)
local createElement = React.createElement
local useState = React.useState
local useMemo = React.useMemo
return function() -- Line: 25
    -- upvalues: useFFlag (val), useCharmBinding (val), SandboxStore (val), useState (val), useCache (val)
    -- upvalues: useTowers (val), useHasSandboxGamepass (val), useMemo (val), Troops_2 (val), Enum (val), Troops (val)
    -- upvalues: createElement (val), TowersEntry (val), Collapsible (val), React (val), Searchbox (val), fzy (val)
    local u9 = useFFlag("towers.hidden", {})
    local v1 = u9
    if typeof(v1) ~= "table" then
        u9 = {u9}
    end
    local v2 = useCharmBinding(SandboxStore.getState)
    local u16, u17 = useState(Enum.SortOrder.Name)
    local u20, u21 = useState(nil)
    local v3 = v2:map(function(a1) -- Line: 36
        return a1.SelectedTab == "Towers"
    end)
    local u29 = useCache("Inventory.Troops", {})
    local u31 = useTowers()
    local u33 = useHasSandboxGamepass()
    local v4 = {u31, u33, u29, u9}
    local u42 = useMemo(function() -- Line: 44 -- upvalues: u29 (val), u33 (val), u31 (val), u9 (ref), Troops_2 (upval), Enum (upval)
        local v1 = {}
        local v2 = {}
        for i, j in u29 do
            table.insert(v1, i)
            v2[i] = true
        end
        if u33 then
            local v3
            for k, v in pairs(u31) do
                if not v2[k] and not table.find(u9, k) then
                    v3 = Troops_2(k)
                    if v3 and v3.Properties.Category ~= Enum.TowerCategory.Exclusive then
                        table.insert(v1, k)
                    end
                end
            end
        end
        return v1
    end, v4)
    local v5 = {u42, u20}
    local u48 = useMemo(function() -- Line: 75 -- upvalues: u20 (val), u42 (val), Troops (upval), Enum (upval)
        local v1, v2
        local v3 = {}
        local v4 = u20 ~= nil
        local v5 = nil
        local v6 = nil
        for i, j in u42, v5, v6 do
            if not v4 or u20[j] then
                v1 = Troops(j)
                if v1 then
                    v2 = Enum.TowerCategory.ToString(v1.Properties.Category) or "Exclusive"
                    if not v3[v2] then
                        v3[v2] = {}
                    end
                    table.insert(v3[v2], j)
                end
            end
        end
        return v3
    end, v5)
    local v6 = {u48}
    v4 = useMemo(function() -- Line: 101
        -- upvalues: u48 (val), createElement (upval), TowersEntry (upval), u16 (val), Collapsible (upval), Enum (upval)
        local v1, v2, v3, v4, v5
        local v6 = {}
        local v7 = nil
        local v8 = nil
        for i, j in u48, v7, v8 do
            v2 = {}
            v3 = false
            v4 = j
            v5 = nil
            v1 = nil
            for k, n in v4, v5, v1 do
                v3 = true
                v2[n] = (createElement(TowersEntry, {skin = "Default", enabled = true, idx = 1, name = n}))
            end
            if v3 then
                v2.grid = createElement("UIGridLayout", {
                    CellSize = UDim2.fromOffset(138, 138),
                    CellPadding = UDim2.fromOffset(15, 15),
                    SortOrder = u16,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                }, {ratio = createElement("UIAspectRatioConstraint")})
                v4 = createElement
                v5 = Collapsible
                v1 = {
                    name = i,
                    content = v2,
                    layoutOrder = tonumber(Enum.TowerCategory[i]) or 0,
                }
                v6[i] = (v4(v5, v1))
            end
        end
        return v6
    end, v6)
    local v7 = {u42}
    local u59 = React.useCallback(function(a1) -- Line: 142 -- upvalues: u42 (val), u21 (val)
        local v1 = {}
        for i, j in u42 do
            if a1(j) then
                v1[j] = true
            end
        end
        u21(v1)
    end, v7)
    return (createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = v3,
    }, {
        searchbox = createElement(Searchbox, {
            Text = "Search for Towers",
            OnSearch = function(a1) -- Line: 164 -- upvalues: u21 (val), u17 (val), fzy (upval), u42 (val), u59 (val) -- types: a1: string
                if a1 == "" then
                    u21(nil)
                    u17(Enum.SortOrder.Name)
                    return
                end
                local u13 = fzy.filter(a1, u42, false, true)
                table.sort(u13, function(a1, a2) -- Line: 173
                    local v1 = a1[3]
                    return a2[3] < v1
                end)
                u59(function(a1) -- Line: 177 -- upvalues: u13 (val), u42 (upval)
                    for i, j in u13 do
                        if u42[j[1]] == a1 and j[2] then
                            return true
                        end
                    end
                    return false
                end)
                u17(Enum.SortOrder.LayoutOrder)
            end,
        }),
        content = createElement("ScrollingFrame", {
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            TopImage = "",
            BottomImage = "",
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 1, -45),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 1),
            Visible = v3,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
        }, {
            content = React.createElement(React.Fragment, {}, v4),
            padding = createElement("UIPadding", {
                PaddingTop = UDim.new(0, 15),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 0),
            }),
            list = createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                FillDirection = Enum.FillDirection.Vertical,
                Padding = UDim.new(0, 10),
            }),
        }),
    }))
end