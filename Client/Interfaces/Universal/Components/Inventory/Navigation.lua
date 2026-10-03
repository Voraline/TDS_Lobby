-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.Navigation
-- Decompile time: 4.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useEffect = React.useEffect
local createElement = React.createElement
return React.memo(function(a1) -- Line: 28
    -- upvalues: React (val), useScale (val), useEffect (val), createElement (val)
    local u4 = React.useRef(nil)
    local v1, u12 = React.useState(Vector2.new(0, 0))
    local v2 = useScale(1, nil, true)
    local v3 = {u4}
    useEffect(function() -- Line: 34 -- upvalues: u4 (val), u12 (val)
        if u4.current then
            local AbsoluteSize = u4.current.AbsoluteSize
            if AbsoluteSize then
                u12(AbsoluteSize)
            end
            ;(u4.current:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 35 -- upvalues: u4 (upval), u12 (upval)
                local AbsoluteSize = u4.current.AbsoluteSize
                if AbsoluteSize then
                    u12(AbsoluteSize)
                end
            end)
        end
    end, v3)
    local v4 = {}
    if a1.children ~= nil then
        for i, j in a1.children do
            if i ~= "otherChildren" and typeof(j) == "table" and j.props then
                j.props.flipped = a1.flipped
                v4[i] = j
            end
        end
    end
    local v5 = {BackgroundTransparency = 1, ZIndex = 2}
    local anchorPoint = a1.anchorPoint or Vector2.new(0.5, 0)
    v5.AnchorPoint = anchorPoint
    local position = a1.position or UDim2.fromScale(0.5, 0.04 * v2)
    v5.Position = position
    local size = a1.size or (UDim2.fromScale(1, 0)) + UDim2.fromOffset(0, 80)
    v5.Size = size
    v5.Rotation = if not a1.flipped then 0 else 90
    v5.Visible = a1.Visible
    local v6 = {}
    local v7 = {
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(v1.X + (a1.paddingX or 50), v1.Y + (a1.paddingY or 15)),
    }
    local v8 = {}
    local v9 = {}
    local cornerRadius = a1.cornerRadius or UDim.new(0.12, 0)
    v9.CornerRadius = cornerRadius
    v8.uICorner = createElement("UICorner", v9)
    v8.uIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.8, Color = Color3.new(1, 1, 1)})
    v8.uIGradient = createElement("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(63, 63, 63)),
            ColorSequenceKeypoint.new(0.379965, Color3.fromRGB(15, 15, 15)),
            (ColorSequenceKeypoint.new(1, Color3.new())),
        }),
        Rotation = if not a1.flipped then 90 else 0,
    })
    v6.background = createElement("Frame", v7, v8)
    v7 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0, 1),
        ref = u4,
        AutomaticSize = Enum.AutomaticSize.X,
    }
    v8 = {
        uiScale = createElement("UIScale", {Scale = if not a1.unscaled then v2 * (a1.scaleMult or 1) else 1}),
    }
    v9 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
    }
    local childPadding = a1.childPadding or UDim.new(0, 30)
    v9.Padding = childPadding
    v9.SortOrder = Enum.SortOrder.LayoutOrder
    v9.VerticalAlignment = Enum.VerticalAlignment.Center
    v8.uIListLayout = createElement("UIListLayout", v9)
    local padding = a1.padding and createElement("UIPadding", {
        PaddingLeft = a1.padding.left,
        PaddingRight = a1.padding.right,
        PaddingTop = a1.padding.top,
        PaddingBottom = a1.padding.bottom,
    })
    v8.padding = padding
    v8.children = createElement(React.Fragment, nil, v4)
    v6.buttons = createElement("Frame", v7, v8)
    return createElement("Frame", v5, v6, a1.children and a1.children.otherChildren or {})
end)