-- Script path: ReplicatedStorage.Client.Interfaces.Components.SelectionList
-- Decompile time: 8.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local Event = React.Event
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local u41 = Color3.fromRGB(37, 37, 37)
local u46 = Color3.fromRGB(134, 182, 255)
local u51 = Color3.fromRGB(85, 170, 255)
local u56 = Color3.fromRGB(56, 56, 56)
local u61 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

local function DropDownItem(a1) -- Line: 20
    -- upvalues: useSound (val), useSpring (val), useState (val), useScale (val), u41 (val), u51 (val), u56 (val)
    -- upvalues: u46 (val), useTween (val), u61 (val), React (val), createElement (val), Event (val)
    local v1 = a1.Value or ""
    local v2 = a1.Selected == true
    local v3 = a1.Highlight == true
    local v4 = a1.Disabled == true
    local Click = useSound("Click")
    local v5, u23 = useSpring(1, 0.6, 40, true)
    local u26, u27 = useState(false)
    local u30, u31 = useState(false)
    local u34 = useScale(1)
    local u41_2 = if not v4 then if not v2 then u56 else u51 else u41
    local v6 = if not v4 then if not v3 then Color3.fromRGB(255, 255, 255) else if v2 then Color3.fromRGB(255, 255, 255) else u46 else Color3.fromRGB(85, 85, 85)
    local v7, u67 = useTween(u41_2, u61, nil, true)
    local v8 = {u41_2}
    React.useEffect(function() -- Line: 43 -- upvalues: u67 (val), u41_2 (val)
        u67(u41_2)
    end, v8)
    v8 = {
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", v2 and Enum.FontWeight.Heavy or Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = v1,
        TextColor3 = v6,
        AutoButtonColor = not v4,
        TextSize = v5:map(function(a1) -- Line: 57
            return (math.round(22 * a1))
        end),
        BackgroundColor3 = v7,
        BorderSizePixel = 0,
        LayoutOrder = a1.LayoutOrder or 1,
        Size = UDim2.new(1, 0, 0, 32),
    }

    v8[Event.MouseButton1Down] = function() -- Line: 65 -- upvalues: u23 (val), u34 (val), u31 (val)
        u23(1 - 0.1 * u34)
        u31(true)
    end

    v8[Event.MouseButton1Up] = function() -- Line: 70 -- upvalues: u30 (val), u23 (val), u26 (val), u34 (val), u31 (val), Click (val), a1 (val)
        u23(u26 and 1 + 0.1 * u34 or 1)
        u31(false)
        Click()
        if u30 and a1.Clicked then
            a1.Clicked()
        end
    end

    v8[Event.MouseEnter] = function() -- Line: 82 -- upvalues: u23 (val), u34 (val), u27 (val)
        u23(1 + 0.1 * u34)
        u27(true)
    end

    v8[Event.MouseLeave] = function() -- Line: 87 -- upvalues: u23 (val), u27 (val)
        u23(1)
        u27(false)
    end

    return createElement("TextButton", v8, {
        textStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(38, 38, 38)}),
    })
end

return function(a1) -- Line: 100 -- upvalues: createElement (val), DropDownItem (val), useScale (val), React (val)
    local v1, v2
    local Disabled = a1.Disabled or {}
    local Highlight = a1.Highlight or {}
    local Values = a1.Values or {}
    local v3 = {}
    local v4 = nil
    local v5 = nil
    for i, j in Values, v4, v5 do
        if table.find(Disabled, j) ~= nil then
            u154 = true
        else
            local u154 = false
        end
        v1 = table.find(Highlight, j) ~= nil
        v2 = {
            Value = j,
            LayoutOrder = i,
            Selected = j == a1.Selected,
            Highlight = v1,
            Disabled = u154,
            Clicked = function() -- Line: 117 -- upvalues: u154 (val), a1 (val), j (val)
                if u154 then
                    return
                end
                if a1.Clicked then
                    a1.Clicked(j)
                end
            end,
        }
        v3[j] = (createElement(DropDownItem, v2))
    end
    v5 = {
        BackgroundTransparency = 0.2,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(9, 9, 9),
    }
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0, 0)
    v5.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0.84, 0.948)
    v5.Position = Position
    local Size = a1.Size or UDim2.fromOffset(224, 0)
    v5.Size = Size
    return createElement("Frame", v5, {
        uiScale = createElement("UIScale", {Scale = useScale(1.5)}),
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        uIStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(157, 157, 157),
            LineJoinMode = Enum.LineJoinMode.Bevel,
        }),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
            PaddingTop = UDim.new(0, 8),
        }),
        title = createElement("TextLabel", {
            TextSize = 16,
            TextStrokeTransparency = 0,
            TextWrapped = true,
            BackgroundTransparency = 1,
            LayoutOrder = -1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromOffset(200, 20),
        }),
        content = React.createElement(React.Fragment, {}, v3),
    })
end