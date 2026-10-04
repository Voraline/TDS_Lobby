-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.FilterList
-- Decompile time: 9.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement

local function divider() -- Line: 31 -- upvalues: createElement (val)
    return createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 0.5,
        BackgroundColor3 = Color3.new(1, 1, 1),
        Size = UDim2.fromScale(1, 0.005),
    })
end

local function container(a1) -- Line: 40 -- upvalues: createElement (val), React (val) -- types: a1: table
    local v1 = createElement
    local v2 = {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 0),
    }
    local v3 = {
        textLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 22,
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.XY,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.new(0, 40, 0.5, 0),
            Text = a1.filterName,
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
    }
    local v4 = createElement
    local v5 = {BackgroundColor3 = Color3.new(), Size = UDim2.fromOffset(30, 30)}
    local v6 = {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.176253, 0)}),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(51, 51, 51)}),
    }
    local v7 = createElement
    local v8 = {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = ""}

    v8[React.Event.Activated] = function() -- Line: 80 -- upvalues: a1 (val)
        a1.onClick(a1.filterName, not a1.active)
    end

    v6.Button = v7("TextButton", v8)
    v6.imageLabel = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://17275148743",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Fit,
        Size = UDim2.fromScale(0.8, 0.8),
        Visible = a1.active,
    })
    v3.checkbox = v4("Frame", v5, v6)
    v3.uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 12)})
    return v1("Frame", v2, v3)
end

return React.memo(function(a1) -- Line: 102
    -- upvalues: useScale (val), React (val), createElement (val), divider (val), container (val)
    -- upvalues: UserInputService (val), Maid (val)
    local u75
    local list = a1.list
    local v1 = #list * 42 + 24
    local v2 = useScale(1.5, nil, true)
    local v3 = a1.scale or v2
    local v4, u268 = React.useBinding(v1)
    local u269 = a1.width or 200
    local maxHeight = a1.maxHeight
    local v5 = {}
    local v6 = nil
    local v7 = nil
    for i, j in list, v6, v7 do
        if j.divider then
            table.insert(v5, (createElement(divider, {})))
        elseif j.filterName then
            table.insert(v5, (createElement(container, {
                filterName = j.filterName,
                active = j.active == true,
                onClick = function(a1_2, a2) -- Line: 121 -- upvalues: a1 (val)
                    a1.filterItemChanged(a1_2, a2)
                end,
            })))
        end
    end
    local v8 = {}
    v6 = createElement
    local v9 = {Padding = UDim.new(0, 12), SortOrder = Enum.SortOrder.LayoutOrder}

    v9[React.Change.AbsoluteContentSize] = function(a1) -- Line: 133 -- upvalues: u268 (val)
        u268(a1.AbsoluteContentSize.Y + 24)
    end

    v8.uIListLayout = v6("UIListLayout", v9)
    v8.uIPadding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 12), PaddingTop = UDim.new(0, 12)})
    v8.filterItems = createElement(React.Fragment, nil, v5)
    local u68, u69 = React.useState(false)
    v9, u75 = React.useState(Vector2.new())
    local useEffect = React.useEffect
    local v10 = {a1.enabled}
    useEffect(function() -- Line: 149 -- upvalues: a1 (val), u75 (val), UserInputService (upval)
        if a1.enabled then
            u75(UserInputService:GetMouseLocation())
        end
    end, v10)
    local useEffect_2 = React.useEffect
    v10 = {u68, a1.enabled}
    useEffect_2(function() -- Line: 155 -- upvalues: Maid (upval), UserInputService (upval), a1 (val), u68 (val)
        local u2 = Maid.new()
        u2:Mark((UserInputService.InputEnded:Connect(function(a1_2) -- Line: 158 -- upvalues: a1 (upval), u68 (upval)
            if not a1.enabled then
                return
            end
            if a1_2.UserInputType == Enum.UserInputType.MouseButton1 then
                if not u68 then
                    a1.clickedOutside()
                end
            elseif a1_2.UserInputType == Enum.UserInputType.Touch and not u68 then
                a1.clickedOutside()
            end
        end)))
        return function() -- Line: 173 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v10)
    v10 = {
        AutomaticSize = if not maxHeight then Enum.AutomaticSize.Y else Enum.AutomaticSize.None,
        BackgroundColor3 = Color3.new(),
        BackgroundTransparency = 0.3,
    }
    local position = a1.position or UDim2.fromOffset(v9.X, v9.Y)
    v10.Position = position
    local v11 = if not maxHeight then UDim2.fromOffset(u269, 0) else v4:map(function(a1) -- Line: 184 -- upvalues: u269 (val), maxHeight (val)
        return UDim2.fromOffset(u269, (math.min(a1, maxHeight)))
    end)
    v10.Size = v11
    v10.ZIndex = a1.zIndex or 3
    v10.AutoButtonColor = false
    local anchorPoint = a1.anchorPoint or Vector2.new(0, 0)
    v10.AnchorPoint = anchorPoint
    v10.Visible = a1.enabled
    v10.Image = ""
    v10.Modal = true

    v10[React.Event.MouseEnter] = function() -- Line: 194 -- upvalues: u69 (val)
        u69(true)
    end

    v10[React.Event.MouseLeave] = function() -- Line: 197 -- upvalues: u69 (val)
        u69(false)
    end

    return createElement("ImageButton", v10, {
        uIScale = createElement("UIScale", {Scale = v3}),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        uIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.8, Color = Color3.new(1, 1, 1)}),
        scroll = if not maxHeight then nil else createElement("ScrollingFrame", {
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BottomImage = "",
            TopImage = "",
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = v4:map(function(a1) -- Line: 222
                return UDim2.fromOffset(0, a1)
            end),
            ScrollBarThickness = a1.scrollBarThickness or 8,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            Size = UDim2.fromScale(1, 1),
            ZIndex = a1.zIndex or 3,
        }, v8),
        content = if maxHeight then nil else createElement(React.Fragment, nil, v8),
    })
end)