-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MapOverride
-- Decompile time: 4.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local fzy = require(ReplicatedStorage.Shared.Modules.fzy)
local CategoryButton = require(script.CategoryButton)
local List = require(script.List)
local Scale = require(script.Parent.Scale)
local Searchbox = require(script.Searchbox)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
return React.memo(function(a1) -- Line: 19
    -- upvalues: useState (val), useEffect (val), Enum (val), createElement (val), CategoryButton (val), Scale (val)
    -- upvalues: Searchbox (val), fzy (val), List (val), React (val)
    local v1
    local Categories = a1.Categories
    local v2 = {}
    local All, All_2 = useState("All")
    local u244, u10 = useState(a1.Maps)
    local v3, u246 = useState(Enum.SortOrder.Name)
    local u247, u22 = useState(workspace.CurrentCamera.ViewportSize.Y * 0.5)
    local v4 = {u247}
    useEffect(function() -- Line: 29 -- upvalues: u247 (val), u22 (val)
        local u10 = (workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(function() -- Line: 30 -- upvalues: u247 (upval), u22 (upval)
            local v1 = workspace.CurrentCamera.ViewportSize.Y * 0.5
            if v1 ~= u247 then
                u22(v1)
            end
        end)
        local v1 = workspace.CurrentCamera.ViewportSize.Y * 0.5
        if v1 ~= u247 then
            u22(v1)
        end
        return function() -- Line: 43 -- upvalues: u10 (val)
            if u10.Connected then
                u10:Disconnect()
            end
        end
    end, v4)
    local v5 = useEffect
    v4 = {a1.IsPrivateServer}
    v5(function() -- Line: 50 -- upvalues: a1 (val), Enum (upval), u10 (val)
        local v1 = {}
        local v2 = nil
        local v3 = nil
        for i, j in a1.Maps, v2, v3 do
            if j.MapType ~= Enum.MapType.Community then
                if not j.Skip then
                    v1[i] = j
                end
            elseif a1.IsPrivateServer and not j.Skip then
                v1[i] = j
            end
        end
        u10(v1)
    end, v4)

    local function filterSelectedMaps(a1_2) -- Line: 67 -- upvalues: a1 (val), u10 (val)
        local v1 = {}
        for i, j in a1.Maps do
            if a1_2(j, i) then
                v1[i] = j
            end
        end
        u10(v1)
    end

    v4 = nil
    local v6 = nil
    for i, j in Categories, v4, v6 do
        v1 = {
            CatagoryName = j,
            LayoutOrder = i,
            Selected = All == i,
            OnClick = function() -- Line: 84 -- upvalues: All_2 (val), i (val), filterSelectedMaps (val), Enum (upval), a1 (val)
                All_2(i)
                filterSelectedMaps(function(a1_2) -- Line: 86 -- upvalues: Enum (upval), a1 (upval), i (upval)
                    if a1_2.MapType == Enum.MapType.Community and not a1.IsPrivateServer then
                        return false
                    end
                    if a1_2.Skip then
                        return false
                    end
                    return a1_2.Difficulty == i
                end)
            end,
        }
        v2[j] = (createElement(CategoryButton, v1))
    end
    v6 = {
        BackgroundTransparency = 1,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.new(0, 540, 0.7, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = a1.Visible,
    }
    local v7 = {
        uiListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    v7.uiScale = createElement(Scale, {Max = 1})
    v7.searchbox = createElement(Searchbox, {
        OnSearch = function(a1_2) -- Line: 117
            -- upvalues: filterSelectedMaps (val), Enum (upval), a1 (val), All (val), u246 (val), u244 (val)
            -- upvalues: fzy (upval)
            if a1_2 == "" then
                filterSelectedMaps(function(a1_2) -- Line: 119 -- upvalues: Enum (upval), a1 (upval), All (upval)
                    if a1_2.MapType == Enum.MapType.Community and not a1.IsPrivateServer then
                        return false
                    end
                    if All == "All" then
                        return true
                    end
                    if All == "Community" then
                        return a1_2.MapType == Enum.MapType.Community
                    end
                    return a1_2.Difficulty == All
                end)
                u246(Enum.SortOrder.Name)
                return
            end
            local u7 = {}
            for i in u244 do
                table.insert(u7, i)
            end
            local u24 = fzy.filter(a1_2, u7, false)
            table.sort(u24, function(a1, a2) -- Line: 145
                local v1 = a1[3]
                return a2[3] < v1
            end)
            filterSelectedMaps(function(a1_2, a2) -- Line: 149 -- upvalues: Enum (upval), a1 (upval), u24 (val), u7 (val)
                if a1_2.MapType == Enum.MapType.Community and not a1.IsPrivateServer then
                    return false
                end
                for i, j in u24 do
                    if u7[j[1]] == a2 and j[2] then
                        return true
                    end
                end
                return false
            end)
            u246(Enum.SortOrder.LayoutOrder)
        end,
    })
    v7.list = createElement(List, {
        Position = UDim2.fromOffset(0, 72),
        Size = UDim2.fromScale(1, 0.8),
        Items = u244,
        SortOrder = v3,
        OnClick = a1.OnClick,
        MaxSize = u247,
    })
    local v8 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Position = UDim2.fromOffset(0, 40),
        Size = UDim2.new(1, 0, 0, 24),
    }
    v1 = {}
    v1[1] = (createElement("UIListLayout", {
        Padding = UDim.new(0, 8),
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }))
    v1.all = createElement(CategoryButton, {
        CatagoryName = "All Maps",
        LayoutOrder = -1,
        Selected = All == "All",
        OnClick = function() -- Line: 191 -- upvalues: All_2 (val), filterSelectedMaps (val), Enum (upval), a1 (val)
            All_2("All")
            filterSelectedMaps(function(a1_2) -- Line: 193 -- upvalues: Enum (upval), a1 (upval)
                if a1_2.MapType == Enum.MapType.Community and not a1.IsPrivateServer then
                    return false
                end
                return true
            end)
        end,
    })
    v1[2] = (React.createElement(React.Fragment, {}, v2))
    v1.community = if not a1.IsPrivateServer then nil else createElement(CategoryButton, {
        CatagoryName = "Community",
        LayoutOrder = 0,
        Selected = All == "Community",
        OnClick = function() -- Line: 212 -- upvalues: All_2 (val), filterSelectedMaps (val), Enum (upval)
            All_2("Community")
            filterSelectedMaps(function(a1) -- Line: 214 -- upvalues: Enum (upval)
                return a1.MapType == Enum.MapType.Community
            end)
        end,
    })
    v7.categories = createElement("Frame", v8, v1)
    v7.exitLabel = createElement("TextLabel", {
        Text = "Press 'ESC' or click anywhere off the menu to exit.",
        TextSize = 14,
        TextStrokeTransparency = 0.6,
        BackgroundTransparency = 1,
        LayoutOrder = 3,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.fromOffset(0, 16),
    })
    return createElement("Frame", v6, v7)
end)