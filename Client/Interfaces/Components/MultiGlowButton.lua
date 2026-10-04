-- Script path: ReplicatedStorage.Client.Interfaces.Components.MultiGlowButton
-- Decompile time: 4.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Event = React.Event
local Spring = ReactFlow.Spring
local useBinding = React.useBinding
local useState = React.useState
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 18
    -- upvalues: useBinding (val), useState (val), useGroupAnimation (val), useAnimation (val), Spring (val)
    -- upvalues: createElement (val), Event (val)
    local v1 = a1.background or 77004607150620
    local transparency = a1.transparency or useBinding(0)
    local clicked = a1.clicked
    local u11, u12 = useState(false)
    local v2, u35 = useGroupAnimation({
        pressing = useAnimation({scale = Spring({target = 0.95, speed = 30, damper = 0.6})}),
        hovering = useAnimation({scale = Spring({target = 1.05, speed = 30, damper = 0.6})}),
        idle = useAnimation({scale = Spring({target = 1, speed = 30, damper = 0.6})}),
    }, {scale = 1})
    local v3 = {BackgroundTransparency = 1}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v3.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.fromScale(0.905, 0.364)
    v3.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.159, 0.0821)
    v3.Size = Size
    v3.ZIndex = a1.ZIndex or 2
    v3.LayoutOrder = a1.LayoutOrder or 1
    local v4 = {}
    local v5 = createElement
    local v6 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v2.scale:map(function(a1) -- Line: 63
            return UDim2.fromScale(a1, a1)
        end),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.999,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        ScaleType = Enum.ScaleType.Fit,
    }

    v6[Event.MouseButton1Down] = function() -- Line: 73 -- upvalues: u11 (val), u35 (val)
        if u11 then
            u35("pressing")
        end
    end

    v6[Event.MouseButton1Up] = function() -- Line: 79 -- upvalues: u11 (val), u35 (val), clicked (val)
        if not u11 then
            u35("idle")
        else
            u35("hovering")
        end
        if u11 and clicked then
            clicked()
        end
    end

    v6[Event.MouseEnter] = function() -- Line: 91 -- upvalues: u12 (val), u35 (val)
        u12(true)
        u35("hovering")
    end

    v6[Event.MouseLeave] = function() -- Line: 96 -- upvalues: u12 (val), u35 (val)
        u12(false)
        u35("idle")
    end

    v4.button = v5("ImageButton", v6, {
        scale = createElement("UIScale", {Scale = v2.scale}),
        bG = createElement("ImageLabel", {
            BackgroundTransparency = 0.999,
            BorderSizePixel = 0,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Image = ("rbxassetid://%*"):format(v1),
            ImageTransparency = transparency,
            ImageColor3 = a1.color,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.21, 1.68),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(91, 91, 91, 91),
        }),
        content = createElement("Frame", {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}, a1.children),
    })
    return createElement("Frame", v3, v4)
end))