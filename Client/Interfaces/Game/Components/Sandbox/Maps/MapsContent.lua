-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Maps.MapsContent
-- Decompile time: 11.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Collapsible = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Collapsible)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Loader = require(ReplicatedStorage.Client.Interfaces.Components.Loader)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
local MapsEntry = require(script.Parent.MapsEntry)
local React = require(ReplicatedStorage.Shared.UI.React)
local Searchbox = require(script.Parent.Parent.Searchbox)
local fzy = require(ReplicatedStorage.Shared.Modules.fzy)
local useHasSandboxGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useHasSandboxGamepass)
local useSandboxUnlock = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxUnlock)
local useMaps = require(ReplicatedStorage.Client.Interfaces.Hooks.useMaps)
local useSandboxWhitelist = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxWhitelist)
local createElement = React.createElement
local useState = React.useState
local useMemo = React.useMemo
return function() -- Line: 22
    -- upvalues: useSandboxWhitelist (val), useMaps (val), useState (val), useSandboxUnlock (val)
    -- upvalues: useHasSandboxGamepass (val), useMemo (val), NewMaps (val), Enum (val), createElement (val)
    -- upvalues: MapsEntry (val), Collapsible (val), React (val), Loader (val), Searchbox (val), fzy (val)
    local Maps = useSandboxWhitelist("Maps")
    local u4, v1 = useMaps()
    local u8, u9 = useState(Enum.SortOrder.Name)
    local u12, u13 = useState(nil)
    local Maps_2 = useSandboxUnlock("Maps")
    local u18 = useHasSandboxGamepass()
    local v2 = {u4, u12, Maps}
    local u25 = useMemo(function() -- Line: 32 -- upvalues: u12 (val), u4 (val), Maps (val), NewMaps (upval), Enum (upval)
        local v1, v2
        local v3 = {}
        local v4 = u12 ~= nil
        local v5 = nil
        local v6 = nil
        for i, j in u4, v5, v6 do
            if v4 and not u12[j] then
                continue
            end
            if Maps[j] then
                v1 = NewMaps(j)
                if not v1 then
                    return
                end
                v2 = Enum.Difficulty.ToString(v1.Difficulty) or "Normal"
                if v2 == "VeryEasy" then
                    v2 = "Easy"
                end
                if not v3[v2] then
                    v3[v2] = {}
                end
                table.insert(v3[v2], j)
            end
        end
        return v3
    end, v2)
    local v3 = {u25, Maps_2, u18}
    local v4 = useMemo(function() -- Line: 61
        -- upvalues: u25 (val), NewMaps (upval), u18 (val), Maps_2 (val), Enum (upval), createElement (upval)
        -- upvalues: MapsEntry (upval), u8 (val), Collapsible (upval)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
        local v12 = {}
        local v13 = nil
        local v14 = nil
        for i, j in u25, v13, v14 do
            v8 = {}
            v9 = false
            v10 = j
            v11 = nil
            v1 = nil
            for k, n in v10, v11, v1 do
                v2 = NewMaps(n)
                if not v2 then
                    return
                end
                v3 = if not u18 then not Maps_2[n] else false
                if v2.MapType == Enum.MapType.Community then
                    v3 = not u18
                end
                v9 = true
                v5 = createElement
                v6 = MapsEntry
                v7 = {
                    enabled = true,
                    idx = 1,
                    name = v2.DisplayName or n,
                    locked = v3,
                    communityMap = v4,
                }
                v8[n] = (v5(v6, v7))
            end
            if v9 then
                v8.grid = createElement("UIGridLayout", {
                    CellSize = UDim2.fromOffset(138, 138),
                    CellPadding = UDim2.fromOffset(15, 15),
                    SortOrder = u8,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                }, {ratio = createElement("UIAspectRatioConstraint")})
                v10 = createElement
                v11 = Collapsible
                v1 = {
                    name = i,
                    content = v8,
                    layoutOrder = tonumber(Enum.Difficulty[i]) or 0,
                }
                v12[i] = (v10(v11, v1))
            end
        end
        return v12
    end, v3)
    local v5 = {u4}
    local u38 = React.useCallback(function(a1) -- Line: 114 -- upvalues: u4 (val), u13 (val)
        local v1 = {}
        for i, j in u4 do
            if a1(j) then
                v1[j] = true
            end
        end
        u13(v1)
    end, v5)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }, {
        loader = createElement(Loader, {
            BackgroundTransparency = 1,
            ZIndex = 20,
            Visible = v1,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }),
        searchbox = createElement(Searchbox, {
            Text = "Search for Maps",
            OnSearch = function(a1) -- Line: 143 -- upvalues: u13 (val), u9 (val), fzy (upval), u4 (val), u38 (val) -- types: a1: string
                if a1 == "" then
                    u13(nil)
                    u9(Enum.SortOrder.Name)
                    return
                end
                local u13_2 = fzy.filter(a1, u4, false, true)
                table.sort(u13_2, function(a1, a2) -- Line: 152
                    local v1 = a1[3]
                    return a2[3] < v1
                end)
                u38(function(a1) -- Line: 156 -- upvalues: u13_2 (val), u4 (upval)
                    for i, j in u13_2 do
                        if u4[j[1]] == a1 and j[2] then
                            return true
                        end
                    end
                    return false
                end)
                u9(Enum.SortOrder.LayoutOrder)
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
    })
end