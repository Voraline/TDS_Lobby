-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.UI.DialogInteractionText
-- Decompile time: 2.00 ms

local Dependencies = require(script.Parent.Parent.Dependencies)
local React = Dependencies.get("React")
local ReactFlow = Dependencies.get("ReactFlow")
local useAnimation = ReactFlow.useAnimation
local memo = React.memo
local createElement = React.createElement
local useState = React.useState
local u20 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
return memo(function(a1) -- Line: 39
    -- upvalues: useState (val), useAnimation (val), ReactFlow (val), createElement (val), React (val), u20 (val)
    local v1, u4 = useState(false)
    local v2 = a1.isHighlighted or v1
    local v3 = useAnimation({
        backgroundTransparency = ReactFlow.Tween({
            target = if not v2 then 0.85 else 0.5,
            info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        }),
        barTransparency = ReactFlow.Tween({
            target = if not v2 then 0.7 else 0,
            info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        }),
        textTransparency = ReactFlow.Tween({
            target = if not v2 then 0.3 else 0,
            info = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        }),
    }, {v2})
    local v4 = createElement
    local v5 = {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Text = "",
        LayoutOrder = a1.layoutOrder,
    }
    v5[React.Event.Activated] = a1.onActivated

    v5[React.Event.MouseEnter] = function() -- Line: 65 -- upvalues: u4 (val)
        u4(true)
    end

    v5[React.Event.MouseLeave] = function() -- Line: 68 -- upvalues: u4 (val)
        u4(false)
    end

    return v4("TextButton", v5, {
        Background = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = v3.backgroundTransparency,
        }, {
            UIGradient = createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.2, 0.4),
                    NumberSequenceKeypoint.new(0.5, 0.1),
                    NumberSequenceKeypoint.new(0.8, 0.4),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
            UICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        }),
        Bar = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 0, 0.5, 0),
            Size = UDim2.new(0, 4, 1, -4),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = v3.barTransparency,
        }, {UICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 2)})}),
        Label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 18,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 20, 0, 0),
            Size = UDim2.new(1, -36, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            FontFace = u20,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v3.textTransparency,
            Text = a1.text,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center,
        }),
        Padding = createElement("UIPadding", {PaddingTop = UDim.new(0, 8), PaddingBottom = UDim.new(0, 8)}),
    })
end)