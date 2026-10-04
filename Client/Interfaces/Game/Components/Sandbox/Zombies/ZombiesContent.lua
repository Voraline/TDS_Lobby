-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Zombies.ZombiesContent
-- Decompile time: 10.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Collapsible = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Collapsible)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local Searchbox = require(script.Parent.Parent.Searchbox)
local ZombieEntry = require(script.Parent.ZombieEntry)
local fzy = require(ReplicatedStorage.Shared.Modules.fzy)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useEnemies = require(ReplicatedStorage.Client.Interfaces.Hooks.useEnemies)
local useHasSandboxGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useHasSandboxGamepass)
local useSandboxUnlock = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxUnlock)
local useSandboxWhitelist = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxWhitelist)
local createElement = React.createElement
local useState = React.useState
local useMemo = React.useMemo
local u79 = {Legacy = 2, Modern = 1}
return function() -- Line: 26
    -- upvalues: useCharmBinding (val), SandboxStore (val), useState (val), useSandboxWhitelist (val)
    -- upvalues: useSandboxUnlock (val), useHasSandboxGamepass (val), useEnemies (val), useMemo (val)
    -- upvalues: createElement (val), ZombieEntry (val), Collapsible (val), u79 (val), React (val), Searchbox (val)
    -- upvalues: fzy (val)
    local v1 = useCharmBinding(SandboxStore.getState)
    local u6, u7 = useState(Enum.SortOrder.Name)
    local u10, u11 = useState(nil)
    local v2 = v1:map(function(a1) -- Line: 32
        return a1.SelectedTab == "Enemies"
    end)
    local Enemies = useSandboxWhitelist("Enemies")
    local Enemies_2 = useSandboxUnlock("Enemies")
    local u23 = useHasSandboxGamepass()
    local u25 = useEnemies()
    local v3 = {u25, u10, Enemies, Enemies_2, u23}
    local v4 = useMemo(function() -- Line: 41
        -- upvalues: u10 (val), u25 (val), Enemies (val), Enemies_2 (val), createElement (upval), ZombieEntry (upval)
        -- upvalues: u23 (val), u6 (val), Collapsible (upval), u79 (upval)
        local v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = {}
        local v10 = {}
        local v11 = u10 ~= nil
        local v12 = nil
        local v13 = nil
        for i, j in u25, v12, v13 do
            if not v11 or u10[j] then
                v2 = #j - 6
                if not (string.sub(j, v2) == " Legacy") then
                    v8 = j
                else
                    v3 = #j - 7
                    v8 = string.sub(j, 1, v3)
                end
                if Enemies[v8] or Enemies_2[v8] then
                    v2 = v10[if not v7 then "Modern" else "Legacy"] or {}
                    v3 = createElement
                    v4 = {enabled = true, idx = 1, enemyName = j}
                    if not v7 then
                        v5 = j
                    else
                        v6 = #j - 7
                        v5 = string.sub(j, 1, v6)
                    end
                    v4.displayName = v5
                    v4.legacy = v7
                    v4.locked = if not u23 then not Enemies_2[j] else false
                    v2[j] = (v3(ZombieEntry, v4))
                    v10[v1] = v2
                end
            end
        end
        for k, n in v10 do
            v7 = createElement
            v1 = {
                CellSize = UDim2.fromOffset(145, 145),
                CellPadding = UDim2.fromOffset(10, 10),
                SortOrder = u6,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            }
            v2 = {ratio = createElement("UIAspectRatioConstraint")}
            n.grid = v7("UIGridLayout", v1, v2)
            v7 = createElement
            v8 = Collapsible
            v1 = {name = k, content = n, layoutOrder = u79[k]}
            v9[k] = (v7(v8, v1))
        end
        return v9
    end, v3)
    local v5 = {u25}
    local u40 = React.useCallback(function(a1) -- Line: 96 -- upvalues: u25 (val), u11 (val)
        local v1 = {}
        for i, j in u25 do
            if a1(j) then
                v1[j] = true
            end
        end
        u11(v1)
    end, v5)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = v2,
    }, {
        searchbox = createElement(Searchbox, {
            Text = "Search for Enemies",
            OnSearch = function(a1) -- Line: 118 -- upvalues: u11 (val), u7 (val), fzy (upval), u25 (val), u40 (val) -- types: a1: string
                if a1 == "" then
                    u11(nil)
                    u7(Enum.SortOrder.Name)
                    return
                end
                local u13 = fzy.filter(a1, u25, false, true)
                table.sort(u13, function(a1, a2) -- Line: 127
                    local v1 = a1[3]
                    return a2[3] < v1
                end)
                u40(function(a1) -- Line: 131 -- upvalues: u13 (val), u25 (upval)
                    for i, j in u13 do
                        if u25[j[1]] == a1 and j[2] then
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
            Visible = v2,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
        }, {
            content = React.createElement(React.Fragment, {}, v4),
            padding = createElement("UIPadding", {
                PaddingTop = UDim.new(0, 5),
                PaddingBottom = UDim.new(0, 5),
                PaddingLeft = UDim.new(0, 5),
                PaddingRight = UDim.new(0, 5),
            }),
            list = createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                FillDirection = Enum.FillDirection.Vertical,
            }),
        }),
    })
end