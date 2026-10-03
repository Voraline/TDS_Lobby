-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.MinimizeContainer
-- Decompile time: 1.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewsButton = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local Change = React.Change
local createElement = React.createElement
local memo = React.memo
local useState = React.useState
local u27 = UDim2.new(0.5, 0, 0, 64)
local u33 = UDim2.new(0.5, 0, 1, -32)
local u37 = Vector2.new(0.5, 0.5)

local function clampMinimize(a1) -- Line: 22 -- types: a1: number
    return (math.clamp(a1, 0, 1))
end

return memo(function(a1) -- Line: 26
    -- upvalues: useState (val), createElement (val), NewsButton (val), u37 (val), u33 (val), u27 (val), Change (val)
    local v1, u4 = useState(false)
    local u7, u8 = useState(0)
    if v1 then
        return createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            LayoutOrder = a1.LayoutOrder,
            Size = UDim2.fromScale(1, 0),
        }, a1.children)
    end
    local v2 = math.max(80, u7 * (math.clamp(a1.Minimize, 0, 1)))
    local v3 = createElement
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.None,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.new(1, 0, 0, v2),
    }
    local v5 = {
        button = createElement(NewsButton, {
            Text = "View More",
            ZIndex = 3,
            AnchorPoint = u37,
            Position = u33,
            Size = u27,
            Color = Color3.fromRGB(0, 170, 255),
            Clicked = function() -- Line: 60 -- upvalues: u4 (val)
                u4(true)
            end,
        }),
    }
    local v6 = createElement
    local v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 1, -80),
    }
    local v8 = {
        gradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.85, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    }
    local v9 = createElement
    local v10 = {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 0),
    }

    v10[Change.AbsoluteSize] = function(a1) -- Line: 90 -- upvalues: u7 (val), u8 (val) -- types: a1: userdata
        local Y = a1.AbsoluteSize.Y
        if Y ~= u7 then
            u8(Y)
        end
    end

    v8.content = v9("Frame", v10, a1.children)
    v5.canvasGroup = v6("CanvasGroup", v7, v8)
    return v3("Frame", v4, v5)
end)