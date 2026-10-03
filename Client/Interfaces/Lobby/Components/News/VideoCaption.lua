-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.VideoCaption
-- Decompile time: 2.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local createElement = React.createElement
local useRef = React.useRef
local useBinding = React.useBinding

local function map(a1, a2, a3, a4, a5) -- Line: 22 -- types: a1: number, a2: number, a3: number, a4: number, a5: number
    return (a1 - a2) / (a3 - a2) * (a5 - a4) + a4
end

return function(a1) -- Line: 26
    -- upvalues: useRef (val), useBinding (val), useReactBindings (val), createElement (val), TextLabel (val)
    -- upvalues: ImageLabel (val)
    local u3 = useRef(nil)
    local v1, u7 = useBinding(false)
    local v2 = useReactBindings
    local v3 = {v1}
    local v4 = {u3, a1.Video}
    v2(function(a1) -- Line: 30 -- upvalues: u3 (val)
        if u3.current then
            if a1 then
                u3.current:Play()
                return
            end
            u3.current:Pause()
        end
    end, v3, v4)
    v2 = useReactBindings
    v3 = {a1.Transparency}
    v4 = {u3, a1.Video}
    v2(function(a1) -- Line: 40 -- upvalues: u7 (val)
        u7(a1 and a1 == 0)
    end, v3, v4)
    v3 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.new(0.919, 0, 0, 0)
    v3.Size = Size
    v3.Position = a1.Position
    v3.AnchorPoint = a1.AnchorPoint
    v3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v3.LayoutOrder = a1.LayoutOrder
    v3.AutomaticSize = Enum.AutomaticSize.Y
    v4 = {
        uiList = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8),
        }),
    }
    local Text = a1.Text and createElement(TextLabel, {
        TextSize = 20,
        TextWrapped = true,
        TextScaled = false,
        FontWeight = "SemiBold",
        LayoutOrder = 1,
        RichText = true,
        Size = UDim2.fromScale(1, 0),
        Text = a1.Text,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextTransparency = a1.Transparency,
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {
        uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
    })
    v4.text = Text
    v4.holder = not a1.Text and createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0, 1),
    })
    local v5 = {
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        Looped = true,
        Volume = 0,
        Size = UDim2.new(1, 0, 0, 242),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Video = "rbxassetid://" .. a1.Video,
        ref = u3,
    }
    local v6 = {uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)})}
    local v7 = {}
    local v8 = if not a1.Transparency then NumberSequence.new(0) else a1.Transparency:map(function(a1) -- Line: 106
        return NumberSequence.new(a1)
    end)
    v7.Transparency = v8
    v6.gradient = createElement("UIGradient", v7)
    v6.dropShadow = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        Image = "rbxassetid://9239716855",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 14, 1, 14),
        ImageTransparency = if not a1.Transparency then 0.2 else a1.Transparency:map(function(a1) -- Line: 119
            return (a1 - 0) / 1 * 0.8 + 0.2
        end),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
    })
    v4.icon = createElement("VideoFrame", v5, v6)
    v4.divider = createElement("Frame", {
        LayoutOrder = 2,
        BackgroundTransparency = if not a1.Transparency then 0.4 else a1.Transparency:map(function(a1) -- Line: 130
            return (a1 - 0) / 1 * 0.6 + 0.4
        end),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(1, 0, 0, 1),
        AutomaticSize = Enum.AutomaticSize.Y,
    }, {
        gradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.2, 0),
                NumberSequenceKeypoint.new(0.8, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    return createElement("Frame", v3, v4)
end