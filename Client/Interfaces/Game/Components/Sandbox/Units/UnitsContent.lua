-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Units.UnitsContent
-- Decompile time: 6.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local Searchbox = require(script.Parent.Parent.Searchbox)
local UnitsEntry = require(script.Parent.UnitsEntry)
local fzy = require(ReplicatedStorage.Shared.Modules.fzy)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useSandboxWhitelist = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxWhitelist)
local useUnitsList = require(ReplicatedStorage.Client.Interfaces.Hooks.useUnitsList)
local createElement = React.createElement
local useState = React.useState
local useMemo = React.useMemo
return function() -- Line: 17
    -- upvalues: useCharmBinding (val), SandboxStore (val), useState (val), useSandboxWhitelist (val)
    -- upvalues: useUnitsList (val), useMemo (val), createElement (val), UnitsEntry (val), React (val), Searchbox (val)
    -- upvalues: fzy (val)
    local v1 = useCharmBinding(SandboxStore.getState)
    local v2, u7 = useState(Enum.SortOrder.Name)
    local u10, u11 = useState(nil)
    local v3 = v1:map(function(a1) -- Line: 23
        return a1.SelectedTab == "Units"
    end)
    local Units = useSandboxWhitelist("Units")
    local u20 = useUnitsList()
    local v4 = {u20, u10, Units}
    local v5 = useMemo(function() -- Line: 30 -- upvalues: u10 (val), u20 (val), Units (val), createElement (upval), UnitsEntry (upval)
        local v1 = {}
        local v2 = u10 ~= nil
        local v3 = nil
        local v4 = nil
        for i, j in u20, v3, v4 do
            if not v2 then
                if Units[j] then
                    v1[j] = (createElement(UnitsEntry, {enabled = true, idx = 1, name = j}))
                end
            elseif u10[j] and Units[j] then
                v1[j] = (createElement(UnitsEntry, {enabled = true, idx = 1, name = j}))
            end
        end
        return v1
    end, v4)
    local v6 = {u20}
    local u33 = React.useCallback(function(a1) -- Line: 49 -- upvalues: u20 (val), u11 (val)
        local v1 = {}
        for i, j in u20 do
            if a1(j) then
                v1[j] = true
            end
        end
        u11(v1)
    end, v6)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = v3,
    }, {
        searchbox = createElement(Searchbox, {
            Text = "Search for Units",
            OnSearch = function(a1) -- Line: 71 -- upvalues: u11 (val), u7 (val), fzy (upval), u20 (val), u33 (val) -- types: a1: string
                if a1 == "" then
                    u11(nil)
                    u7(Enum.SortOrder.Name)
                    return
                end
                local u13 = fzy.filter(a1, u20, false, true)
                table.sort(u13, function(a1, a2) -- Line: 80
                    local v1 = a1[3]
                    return a2[3] < v1
                end)
                u33(function(a1) -- Line: 84 -- upvalues: u13 (val), u20 (upval)
                    for i, j in u13 do
                        if u20[j[1]] == a1 and j[2] then
                            return true
                        end
                    end
                    return false
                end)
                u7(Enum.SortOrder.LayoutOrder)
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
            content = React.createElement(React.Fragment, {}, v5),
            padding = createElement("UIPadding", {
                PaddingTop = UDim.new(0, 15),
                PaddingBottom = UDim.new(0, 10),
                PaddingLeft = UDim.new(0, 12),
                PaddingRight = UDim.new(0, 0),
            }),
            grid = createElement("UIGridLayout", {
                CellSize = UDim2.fromOffset(138, 138),
                CellPadding = UDim2.fromOffset(15, 15),
                SortOrder = v2,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            }, {ratio = createElement("UIAspectRatioConstraint")}),
        }),
    })
end