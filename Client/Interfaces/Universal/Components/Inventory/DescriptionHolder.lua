-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.DescriptionHolder
-- Decompile time: 2.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local useAspectRatio = require(ReplicatedStorage.Client.Interfaces.Hooks.useAspectRatio)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 19
    -- upvalues: useMediaQuery (val), useAspectRatio (val), useScale (val), React (val), Maid (val), createElement (val)
    local v1 = not useMediaQuery("large")
    local v2 = useAspectRatio()
    local v3 = useScale(if not v1 then 1.4 else 2.2, nil, true)
    local u18 = React.useRef(nil)
    local v4 = {u18}
    React.useEffect(function() -- Line: 27 -- upvalues: Maid (upval), u18 (val), a1 (val)
        local u2 = Maid.new()
        if u18.current then
            u2:Mark(((u18.current:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 31 -- upvalues: a1 (upval), u18 (upval)
                a1.setDescriptionSize(u18.current.AbsoluteSize)
            end)))
            a1.setDescriptionSize(u18.current.AbsoluteSize)
        end
        return function() -- Line: 37 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, v4)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 99999,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.597501),
        Size = UDim2.fromScale(0.9, 0.243),
    }, {
        uIScale = createElement("UIScale", {Scale = v3}),
        holder = createElement("Frame", {
            BackgroundTransparency = 0.4,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.new(),
            BorderColor3 = Color3.new(),
            Position = UDim2.fromScale(0, 1.04106e-06),
            Size = UDim2.fromScale(1, 0),
            ref = u18,
        }, {
            uIGradient = createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.0992098, 0),
                    NumberSequenceKeypoint.new(0.5, 0),
                    NumberSequenceKeypoint.new(0.899034, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
            Padding = createElement("UIPadding", {
                PaddingTop = UDim.new(0, 10 * v3 / v2),
                PaddingBottom = UDim.new(0, 10 * v3 / v2),
            }),
            uIListLayout = createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 15 * v3 / v2),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            }),
            description = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.5, 0.0727308),
                Size = UDim2.fromScale(0.81009, 0),
                Text = a1.description or "N/A",
                TextColor3 = Color3.new(1, 1, 1),
                TextSize = if not v1 then 21 * v3 / v2 else 12,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                Visible = a1.description ~= "",
            }, {uIStroke = createElement("UIStroke", {Thickness = 3, Transparency = 0.57})}),
            buttons = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 0.95),
                Size = UDim2.new(1, 0, 0, (if not v1 then 50 else 60) * v3),
            }, {
                buttons = createElement(React.Fragment, nil, a1.buttons),
                uIListLayout = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    Padding = UDim.new(0, 10 * v3 / v2),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                }),
            }),
        }),
        children = React.createElement(React.Fragment, nil, a1.children),
    })
end)