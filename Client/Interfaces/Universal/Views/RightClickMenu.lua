-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.RightClickMenu
-- Decompile time: 3.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local BaseComponents = ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents
local Stores = ReplicatedStorage.Client.Interfaces.Stores
local Container = require(BaseComponents.Container)
local ImageLabel = require(BaseComponents.ImageLabel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local RightClickMenuStore = require(Stores.Shared.RightClickMenuStore)
local TextLabel = require(BaseComponents.TextLabel)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useBinding = React.useBinding
local memo = React.memo
local Event = React.Event
local u66 = memo(function(a1) -- Line: 23
    -- upvalues: useSound (val), useBinding (val), createElement (val), Event (val), RightClickMenuStore (val)
    -- upvalues: ImageLabel (val), TextLabel (val)
    local icon = a1.icon
    local name = a1.name
    local callback = a1.callback
    local Click = useSound("Click")
    local u9, u10 = useBinding(false)
    local u13, u14 = useBinding(false)
    local v1 = {
        Size = UDim2.fromScale(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = u13:map(function(a1) -- Line: 38
            if a1 then
                return 0.8
            end
            return 1
        end),
        Text = "",
    }

    v1[Event.MouseButton1Down] = function() -- Line: 44 -- upvalues: u10 (val)
        u10(true)
    end

    v1[Event.MouseButton1Up] = function() -- Line: 48
        -- upvalues: u9 (val), u13 (val), u10 (val), Click (val), callback (val), RightClickMenuStore (upval)
        local v1 = u9:getValue() and u13:getValue()
        u10(false)
        Click()
        if v1 then
            callback()
            RightClickMenuStore.update({Enabled = false})
        end
    end

    v1[Event.MouseEnter] = function() -- Line: 62 -- upvalues: u14 (val)
        u14(true)
    end

    v1[Event.MouseLeave] = function() -- Line: 66 -- upvalues: u14 (val)
        u14(false)
    end

    return createElement("TextButton", v1, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 6),
            PaddingBottom = UDim.new(0, 6),
            PaddingLeft = UDim.new(0, 8),
            PaddingRight = UDim.new(0, 8),
        }),
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        icon = icon and createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            Image = icon,
            ScaleType = Enum.ScaleType.Fit,
        }),
        text = createElement(TextLabel, {
            TextSize = 18,
            TextScaled = false,
            FontWeight = "SemiBold",
            Text = name,
            Size = UDim2.fromScale(1, 0),
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.new(0, 0),
            TextXAlignment = Enum.TextXAlignment.Left,
            AutomaticSize = Enum.AutomaticSize.Y,
        }, {}),
    })
end)
return function() -- Line: 112
    -- upvalues: ReactCharm (val), RightClickMenuStore (val), React (val), createElement (val), u66 (val)
    -- upvalues: useEvent (val), UserInputService (val), Container (val)
    local u4 = ReactCharm.useSignalState(RightClickMenuStore.getState)
    local u8 = React.useRef(nil)
    local useMemo = React.useMemo
    local v1 = {u4.Values}
    local v2 = useMemo(function() -- Line: 117 -- upvalues: u4 (val), createElement (upval), u66 (upval)
        local v1 = {}
        for i, j in u4.Values do
            v1[i] = (createElement(u66, {name = i, callback = j}))
        end
        return v1
    end, v1)
    local v3 = useEvent
    local InputBegan = UserInputService.InputBegan
    local v4 = {u4.Enabled}
    v3(InputBegan, function(a1) -- Line: 130 -- upvalues: u8 (val), RightClickMenuStore (upval)
        if a1.UserInputType == Enum.UserInputType.MouseButton1 then
            local current = u8.current
            if not current then
                return
            end
            local v1 = Vector2.new(a1.Position.X, a1.Position.Y)
            local AbsolutePosition = current.AbsolutePosition
            local v2 = current.AbsolutePosition + current.AbsoluteSize
            if v1.X < AbsolutePosition.X or v2.X < v1.X or v1.Y < AbsolutePosition.Y or v2.Y < v1.Y then
                RightClickMenuStore.update({Enabled = false})
            end
        end
    end, v4)
    return createElement(Container, {
        BackgroundTransparency = 0,
        CornerRadius = 4,
        StrokeThickness = 1,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        StrokeColor = Color3.fromRGB(56, 56, 56),
        Size = UDim2.fromOffset(250, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Visible = u4.Enabled,
        Position = u4.Position,
        AnchorPoint = Vector2.new(0, 0),
        reference = u8,
    }, {
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingBottom = UDim.new(0, 4),
        }),
        scale = createElement("UIScale", {Scale = 1}),
        list = createElement("UIListLayout", {
            Padding = UDim.new(0, 5),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        options = React.createElement(React.Fragment, {}, v2),
    })
end