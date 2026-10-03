-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventoryFilter
-- Decompile time: 4.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Change = React.Change
local createElement = React.createElement
local useCallback = React.useCallback
local useRef = React.useRef
local memo = React.memo
local u23 = memo(function(a1) -- Line: 12 -- upvalues: createElement (val), React (val) -- types: a1: table
    local selected = a1.selected
    local v1 = {}
    local v2 = selected and Color3.new(1, 1, 1) or Color3.fromRGB(21, 21, 21)
    v1.BackgroundColor3 = v2
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v1.BorderSizePixel = 0
    v1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    v1.Size = UDim2.new(0, 128, 1, 0)
    v1.Text = ""
    v1.TextColor3 = Color3.fromRGB(0, 0, 0)
    v1.TextSize = 14
    v1.ZIndex = a1.ZIndex
    v1.LayoutOrder = a1.LayoutOrder

    v1[React.Event.MouseButton1Click] = function() -- Line: 37 -- upvalues: a1 (val), selected (val)
        if a1.onClick then
            a1.onClick(if not selected then a1.text else nil)
        end
    end

    v2 = {uiCorner = createElement("UICorner")}
    v2.uiPadding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 4),
    })
    v2.uiStroke = createElement("UIStroke", {
        Thickness = 2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(7, 7, 7),
    })
    v2.listLayout = createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    local v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local icon_2 = not (typeof(a1.icon) ~= "number") and "rbxassetid://" .. a1.icon or a1.icon
    v3.Image = icon_2
    local v4 = selected and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
    v3.ImageColor3 = v4
    v3.Size = UDim2.fromScale(0.2, 1)
    v2.label1 = createElement("ImageLabel", v3, {aspectRatio = createElement("UIAspectRatioConstraint")})
    v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        TextScaled = true,
        TextSize = 16,
        TextWrapped = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Size = UDim2.fromScale(0.6, 1),
        Text = a1.text,
    }
    v4 = selected and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
    v3.TextColor3 = v4
    v2.label = createElement("TextLabel", v3)
    return createElement("TextButton", v1, v2)
end)
local u26 = memo(function(a1) -- Line: 97 -- upvalues: table (val), createElement (val), u23 (val), React (val)
    local onClick = a1.onClick
    local selected = a1.selected
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(0.7, 1),
    }, {
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        uIPadding1 = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 8),
        }),
        components = createElement(React.Fragment, {}, (table.reduce(a1.categories, function(a1, a2, a3) -- Line: 101 -- upvalues: createElement (upval), u23 (upval), selected (val), onClick (val)
            local text = a2.text
            local v1 = createElement
            local v2 = {
                icon = a2.icon,
                text = a2.text,
                selected = a2.text == selected,
                onClick = onClick,
                ZIndex = a3,
                LayoutOrder = a3,
            }
            a1[text] = (v1(u23, v2))
            return a1
        end, {}))),
    })
end)
return memo(function(a1) -- Line: 138 -- upvalues: useRef (val), createElement (val), u26 (val), Change (val), useCallback (val)
    local onSearch = a1.onSearch
    local u3 = useRef()
    local v1 = {BackgroundTransparency = 1, BorderSizePixel = 0, LayoutOrder = -1}
    local Size = a1.Size or UDim2.new(1, 0, 0, 48)
    v1.Size = Size
    v1.Position = a1.Position
    v1.AnchorPoint = a1.AnchorPoint
    v1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    local v2 = {}
    local v3 = {onClick = a1.categoryChanged, selected = a1.category}
    local categories = a1.categories or {
        {icon = 11702759774, text = "Offense"},
        {icon = 11702759774, text = "Defense"},
        {icon = 11702759774, text = "Support"},
    }
    v3.categories = categories
    v2.categories = createElement(u26, v3)
    local v4 = createElement
    v3 = {
        Active = true,
        BorderSizePixel = 0,
        Selectable = true,
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(21, 21, 21),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.new(0.35, 0, 1, -16),
    }
    local v5 = {
        uICorner3 = createElement("UICorner"),
        uIStroke3 = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(7, 7, 7),
        }),
        uIPadding4 = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
        }),
        imageLabel3 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://93748616033191",
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(0.05, 0.7),
        }, {
            uIAspectRatioConstraint3 = createElement("UIAspectRatioConstraint", {AspectType = Enum.AspectType.ScaleWithParentSize}),
        }),
    }
    local v6 = createElement
    local v7 = {
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(21, 21, 21),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        PlaceholderText = "[ Search ]",
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromScale(0.9, 1),
        Text = "",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
    }
    local v8 = {onSearch}
    v7[Change.Text] = (useCallback(function(a1) -- Line: 226 -- upvalues: onSearch (val), u3 (val) -- types: a1: userdata
        if not onSearch then
            return
        end
        local u2 = nil
        u2 = task.delay(0.25, function() -- Line: 232 -- upvalues: u3 (upval), u2 (ref), onSearch (upval), a1 (val)
            if u3.current == u2 then
                onSearch(a1.Text)
            end
        end)
        u3.current = u2
    end, v8))
    v5.textBox1 = v6("TextBox", v7, {
        uIPadding5 = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 4),
        }),
    })
    v2.textBox = v4("Frame", v3, v5)
    return createElement("Frame", v1, v2)
end)