-- Script path: ReplicatedStorage.Client.Interfaces.Components.Prompt
-- Decompile time: 5.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
return function(a1) -- Line: 10 -- upvalues: useScale (val), createElement (val), React (val)
    local v1 = useScale(1)
    local v2 = {BackgroundTransparency = 1, ZIndex = 2, Visible = a1.Visible}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = AnchorPoint
    v2.AutomaticSize = Enum.AutomaticSize.XY
    v2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v2.Position = Position
    local Size = a1.Size or UDim2.fromOffset(0, 80 * v1)
    v2.Size = Size
    local v3 = {
        background = createElement("Frame", {
            BackgroundTransparency = 0.05,
            ZIndex = 0,
            BackgroundColor3 = Color3.fromRGB(36, 36, 36),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Size = UDim2.fromScale(1, 1),
        }, {uICorner = createElement("UICorner")}),
    }
    v3.dropShadow = createElement("ImageLabel", {
        Image = "rbxassetid://9239716855",
        ImageTransparency = 0.2,
        BackgroundTransparency = 1,
        ZIndex = -1,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 14, 1, 14),
    })
    local v4 = {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(0, 1),
    }
    local v5 = {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 16 * v1),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    v5.uIPadding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 8 * v1),
        PaddingLeft = UDim.new(0, 8 * v1),
        PaddingRight = UDim.new(0, 8 * v1),
        PaddingTop = UDim.new(0, 8 * v1),
    })
    local v6 = a1.Icon and createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://" .. a1.Icon,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 32 * v1),
        Size = UDim2.fromOffset(64 * v1, 64 * v1),
    }, {uIPadding1 = createElement("UIPadding")}) or nil
    v5.icon = v6
    v6 = a1.Title and createElement("TextLabel", {
        RichText = true,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = math.floor(34 * v1),
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 114 * v1),
        Size = UDim2.fromOffset(0, 20 * v1),
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.8}),
        uIPadding3 = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 16 * v1),
            PaddingLeft = UDim.new(0, 8 * v1),
            PaddingRight = UDim.new(0, 8 * v1),
            PaddingTop = UDim.new(0, 16 * v1),
        }),
    }) or nil
    v5.title = v6
    v6 = a1.Description and createElement("TextLabel", {
        RichText = true,
        TextWrapped = true,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Text = a1.Description,
        TextColor3 = Color3.fromRGB(163, 163, 163),
        TextSize = math.floor(20 * v1),
        AnchorPoint = Vector2.new(0.5, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 144 * v1),
        Size = UDim2.fromOffset(280 * v1, 0),
    }) or nil
    v5.description = v6
    v5.buttons = createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 4,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        uIListLayout1 = createElement("UIListLayout", {Padding = UDim.new(0, 8 * v1), SortOrder = Enum.SortOrder.LayoutOrder}),
        uIPadding2 = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 8 * v1),
            PaddingBottom = UDim.new(0, 16 * v1),
        }),
        content = React.createElement(React.Fragment, {}, a1.children or {}),
    })
    v3.content = createElement("Frame", v4, v5)
    return createElement("Frame", v2, v3)
end