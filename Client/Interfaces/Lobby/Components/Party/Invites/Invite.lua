-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.Invites.Invite
-- Decompile time: 11.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useTween = require(Hooks.useTween)
local createElement = React.createElement
local useEffect = React.useEffect
local useBinding = React.useBinding
return function(a1) -- Line: 24
    -- upvalues: React (val), PartyContext (val), useBinding (val), ReactFlow (val), useTween (val), useEffect (val)
    -- upvalues: createElement (val), Button (val), ImageLabel (val), TextLabel (val)
    local u4 = React.useContext(PartyContext)
    local u8 = useBinding(tick())
    local u11, u12 = useBinding(false)
    local v1, u16 = useBinding(30)
    local v2, u21 = ReactFlow.useSpring({start = 1, damper = 0.6, speed = 40})
    local v3, u36 = useTween(UDim2.fromScale(0, 1), TweenInfo.new(v1:getValue(), Enum.EasingStyle.Linear), true, true)
    local v4 = {u11}
    useEffect(function() -- Line: 41 -- upvalues: u11 (val), u16 (val), u36 (val), u21 (val), u8 (val), u12 (val)
        if u11:getValue() then
            return
        end
        local u6 = task.spawn(function() -- Line: 46 -- upvalues: u16 (upval), u36 (upval), u21 (upval), u8 (upval), u12 (upval)
            u16(30)
            u36(UDim2.fromScale(1, 1))
            u21({start = 1, target = 0})
            while true do
                if not (tick() - u8:getValue() < 30) then
                    break
                end
                task.wait(0.5)
            end
            u36(UDim2.fromScale(0, 1))
            u16(0)
            u12(true)
        end)
        return function() -- Line: 60 -- upvalues: u6 (val)
            task.cancel(u6)
        end
    end, v4)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(370, 120),
        Visible = u11:map(function(a1) -- Line: 71
            return not a1
        end),
    }, {
        bin = createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Position = v2:map(function(a1) -- Line: 78
                return UDim2.new(a1, -8, 0, 0)
            end),
        }, {
            background = createElement("Frame", {
                BackgroundTransparency = 0.4,
                ZIndex = 0,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Size = UDim2.fromScale(1, 1),
            }, {uICorner = createElement("UICorner")}),
            buttons = createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 4,
                AnchorPoint = Vector2.new(0.5, 1),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0.5, 0, 1, -20),
                Size = UDim2.fromScale(1, 0),
            }, {
                uiListLayout = createElement("UIListLayout", {
                    Padding = UDim.new(0, 8),
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                uIPadding = createElement("UIPadding", {PaddingBottom = UDim.new(0, -8)}),
                declineButton = createElement(Button, {
                    Text = "Deny",
                    Size = UDim2.fromOffset(160, 40),
                    Color = Color3.fromRGB(253, 41, 41),
                    Clicked = function() -- Line: 117 -- upvalues: u4 (val), a1 (val)
                        u4.denyInvite(a1.player)
                    end,
                }),
                acceptButton = createElement(Button, {
                    Text = "Accept",
                    Size = UDim2.fromOffset(160, 40),
                    Color = Color3.fromRGB(58, 222, 64),
                    Clicked = function() -- Line: 127 -- upvalues: u4 (val), a1 (val)
                        u4.acceptInvite(a1.player)
                    end,
                }),
            }),
            dropShadow = createElement(ImageLabel, {
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
            }),
            sender = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0.5, 0, 0, 0),
                Size = UDim2.fromOffset(0, 55),
            }, {
                uiListLayout = createElement("UIListLayout", {
                    Padding = UDim.new(0, 10),
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Bottom,
                }),
                info = createElement("Frame", {
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.new(1, -45, 1, 0),
                }, {
                    uiListLayout = createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                    }),
                    padding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 1), PaddingTop = UDim.new(0, 1)}),
                    player = createElement(TextLabel, {
                        FontWeight = "Heavy",
                        TextSize = 20,
                        LayoutOrder = 1,
                        StrokeThickness = 2,
                        StrokeTransparency = 0.5,
                        Text = a1.displayName,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.fromScale(1, 0.6),
                    }),
                    description = createElement(TextLabel, {
                        FontWeight = "SemiBold",
                        Text = "invited you to a party!",
                        TextSize = 20,
                        LayoutOrder = 2,
                        StrokeThickness = 2,
                        StrokeTransparency = 0.5,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Size = UDim2.fromScale(1, 0.35),
                    }),
                }),
                icon = createElement(ImageLabel, {
                    BackgroundTransparency = 1,
                    Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=180&h=180"):format(a1.userId),
                    Size = UDim2.fromOffset(90, 90),
                }, {
                    gradient = createElement("UIGradient", {
                        Rotation = 90,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.9, 0),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                }),
            }),
            timer = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0.5, 0, 1, -8),
                Size = UDim2.new(1, -16, 0, 2),
            }, {
                frame = createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = v3:map(function(a1) -- Line: 225 -- types: a1: userdata
                        return UDim2.fromScale(1 - a1.X.Scale, a1.Y.Scale)
                    end),
                }),
            }),
        }),
    })
end