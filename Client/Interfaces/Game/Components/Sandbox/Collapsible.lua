-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Collapsible
-- Decompile time: 6.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement
local u26 = UDim.new(0, 6)
return function(a1) -- Line: 21
    -- upvalues: React (val), useSpring (val), createElement (val), TextLabel (val), u26 (val)
    local v1 = a1.corner or 6
    local v2 = v1 and v1 > 0
    local u12, u13 = React.useState(a1.openedByDefault or false)
    local v3, u23 = useSpring(if not u12 then 0 else 1, 1, 30, true)
    local v4 = {u12}
    React.useEffect(function() -- Line: 28 -- upvalues: u23 (val), u12 (val)
        u23(if not u12 then 0 else 1)
    end, v4)
    v4 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = a1.layoutOrder,
    }
    local v5 = {
        list = createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            FillDirection = Enum.FillDirection.Vertical,
            Padding = UDim.new(0, 10),
        }),
    }
    local v6 = {
        BorderSizePixel = 0,
        BackgroundColor3 = v3:map(function(a1) -- Line: 48
            return (Color3.fromRGB(24, 24, 24)):Lerp(Color3.fromRGB(38, 50, 63), a1)
        end),
        TextTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    }

    v6[React.Event.MouseButton1Click] = function() -- Line: 56 -- upvalues: u13 (val), u12 (val)
        u13(not u12)
    end

    v5.textContent = createElement("TextButton", v6, {
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5),
        }),
        uICorner = v2 and createElement("UICorner", {CornerRadius = UDim.new(0, v1)}),
        uIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.2, 0),
                (NumberSequenceKeypoint.new(1, 0.2)),
            }),
        }),
        text = createElement(TextLabel, {
            LayoutOrder = 100,
            ZIndex = 4,
            TextScaled = false,
            BackgroundTransparency = 1,
            TextSize = 20,
            FontWeight = "Black",
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0.13, 0.5),
            Size = UDim2.fromOffset(0, 0),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
            Text = a1.name,
            AutomaticSize = Enum.AutomaticSize.XY,
        }),
        openerContainer = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0.02, -0.55),
            Size = UDim2.fromScale(0, 0),
            AutomaticSize = Enum.AutomaticSize.XY,
        }, {
            ratio = createElement("UIAspectRatioConstraint"),
            opener = createElement(TextLabel, {
                LayoutOrder = 0,
                ZIndex = 4,
                BackgroundTransparency = 1,
                TextScaled = false,
                TextSize = 60,
                FontWeight = "Black",
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0, 0),
                Size = UDim2.fromScale(0, 0),
                Text = if not u12 then "▶" else "▼",
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                AutomaticSize = Enum.AutomaticSize.XY,
            }),
        }),
    })
    v5.content = createElement("Frame", {
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        LayoutOrder = 100,
        BackgroundColor3 = Color3.fromRGB(24, 24, 24),
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = u12,
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, u26)}),
        uIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.2, 0),
                (NumberSequenceKeypoint.new(1, 0.2)),
            }),
        }),
        children = if not u12 then nil else React.createElement(React.Fragment, {}, a1.content),
    })
    return createElement("Frame", v4, v5)
end