-- Script path: ReplicatedStorage.Client.Interfaces.Components.SegmentedButton
-- Decompile time: 4.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useRef = React.useRef
local useState = React.useState
local Event = React.Event
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)

local function darken(a1, a2) -- Line: 14
    return a1:Lerp(Color3.new(0, 0, 0), a2)
end

local function getSize(a1, a2) -- Line: 18 -- types: a1: string, a2: userdata
    local Scale = a2[a1].Scale
    local Offset = a2[a1].Offset
    local v1 = false
    if Scale > 0 then
        v1 = Offset > 0
    end
    assert(not v1, "Cannot have both scale and offset")
    if Scale > 0 then
        return UDim.new(Scale, 0)
    end
    return UDim.new(0, Offset)
end

local function Button(a1) -- Line: 30
    -- upvalues: useSpring (val), useState (val), useScale (val), useRef (val), createElement (val), Event (val)
    local Clicked = a1.Clicked
    local Selected = a1.Selected
    local v1 = a1.Text or ""
    local v2, u11 = useSpring(1, 1, 40, true)
    local u14, u15 = useState(false)
    local u18, u19 = useState(false)
    local u22 = useScale(1)
    local u24 = useRef()
    local v3 = {BackgroundTransparency = 1, Size = a1.Size, LayoutOrder = a1.LayoutOrder}
    v3.ZIndex = if u14 then 2 else if not u18 then 1 else 2
    local v4 = {}
    local v5 = {
        AutoButtonColor = false,
        FontFace = Font.new(
            "rbxasset://fonts/families/GothamSSm.json",
            Selected and Enum.FontWeight.Heavy or Enum.FontWeight.Medium,
            Enum.FontStyle.Normal
        ),
        Text = v1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = v2:map(function(a1) -- Line: 56
            return 20 * a1
        end),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }

    v5[Event.MouseButton1Down] = function() -- Line: 65 -- upvalues: u11 (val), u22 (val), u24 (val), u19 (val)
        u11(1 - 0.2 * u22)
        if u24.current then
            u19(true)
        end
    end

    v5[Event.MouseButton1Up] = function() -- Line: 74 -- upvalues: u18 (val), u11 (val), u14 (val), u22 (val), u19 (val), Clicked (val)
        u11(u14 and 1 + 0.2 * u22 or 1)
        u19(false)
        if not u18 then
            Clicked()
        end
    end

    v5[Event.MouseEnter] = function() -- Line: 85 -- upvalues: u11 (val), u22 (val), u15 (val)
        u11(1 + 0.2 * u22)
        u15(true)
    end

    v5[Event.MouseLeave] = function() -- Line: 90 -- upvalues: u11 (val), u15 (val)
        u11(1)
        u15(false)
    end

    v4.content = createElement("TextButton", v5, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})})
    return createElement("Frame", v3, v4)
end

local function SelectButton(a1) -- Line: 103 -- upvalues: useTween (val), React (val), createElement (val)
    local Color = a1.Color
    local Selected = a1.Selected
    local Size = a1.Size
    local ButtonSize = a1.ButtonSize
    local v1, u22 = useTween(
        UDim2.new(ButtonSize.Scale * Selected, ButtonSize.Offset * Selected, 0.5, 0),
        TweenInfo.new(0.1, Enum.EasingStyle.Sine),
        nil,
        true
    )
    local v2 = {Selected}
    React.useEffect(function() -- Line: 115 -- upvalues: u22 (val), ButtonSize (val), Selected (val)
        u22(UDim2.new(ButtonSize.Scale * Selected, ButtonSize.Offset * Selected, 0.5, 0))
    end, v2)
    return createElement("TextButton", {
        AutoButtonColor = false,
        TextTransparency = 1,
        BackgroundTransparency = 0,
        TextSize = 20,
        BorderSizePixel = 0,
        ZIndex = 0,
        Visible = Selected >= 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        BackgroundColor3 = Color,
        Text = a1.Selected,
        LayoutOrder = a1.LayoutOrder,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = Size,
        Position = v1,
        AnchorPoint = Vector2.new(0, 0.5),
    })
end

return function(a1) -- Line: 142
    -- upvalues: getSize (val), useSound (val), createElement (val), Button (val), React (val), SelectButton (val)
    local v1
    local Size = a1.Size or UDim2.fromOffset(88, 48)
    local v2 = UDim2.new(UDim.new(0, 0), getSize("Y", Size))
    local Click = useSound("Click")
    local u265 = a1.Disabled == true
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked() end
    end
    local Values = a1.Values or {}
    local v3 = Color3.fromRGB(13, 238, 103)
    if u265 then
        v3 = v3:Lerp(Color3.new(0, 0, 0), 0.2)
    end
    local v4 = {}
    local v5 = -1
    local v6 = nil
    local v7 = nil
    local v8 = a1
    for i, j in Values, v6, v7 do
        if v8.Selected == j then
            v5 = i - 1
        end
        v1 = {
            Clicked = function() -- Line: 167 -- upvalues: Click (val), u265 (val), Clicked (val), j (val)
                Click()
                if not u265 then
                    Clicked(j)
                end
            end,
            LayoutOrder = i,
            Selected = v8.Selected == j,
            Text = j,
            Size = Size,
        }
        v4[j] = (createElement(Button, v1))
    end
    v7 = {
        BackgroundTransparency = 0,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(63, 63, 63),
    }
    local AnchorPoint = v8.AnchorPoint or Vector2.new(1, 0.5)
    v7.AnchorPoint = AnchorPoint
    local Position = v8.Position or UDim2.new(1, -16, 0.5, 0)
    v7.Position = Position
    v7.Size = v2
    local v9 = {
        content = createElement("Frame", {
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = v2,
            Visible = #Values > 0,
        }, {
            uIListLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            stroke = createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(189, 189, 189),
                LineJoinMode = Enum.LineJoinMode.Bevel,
            }),
            children = React.createElement(React.Fragment, {}, v4),
        }),
    }
    local v10 = {Color = v3, Selected = v5, Size = Size}
    local Scale = Size.X.Scale
    local Offset = Size.X.Offset
    local v11 = false
    if Scale > 0 then
        v11 = Offset > 0
    end
    assert(not v11, "Cannot have both scale and offset")
    v10.ButtonSize = if not (Scale > 0) then UDim.new(0, Offset) else UDim.new(Scale, 0)
    v9.select = createElement(SelectButton, v10)
    return createElement("Frame", v7, v9)
end