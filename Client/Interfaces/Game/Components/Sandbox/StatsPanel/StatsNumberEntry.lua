-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.StatsPanel.StatsNumberEntry
-- Decompile time: 12.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BaseComponents = ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.BaseComponents
local React = require(ReplicatedStorage.Shared.UI.React)
local Button = require(BaseComponents.Button)
local Container = require(BaseComponents.Container)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = (require(ReplicatedStorage.Packages.ReactFlow)).useSpring
local createElement = React.createElement

local function valueOrNaN(a1, a2) -- Line: 23 -- types: a2: number
    if a1 == a1 then
        return a1
    end
    return a2
end

return function(a1) -- Line: 31
    -- upvalues: React (val), useSpring (val), useSound (val), createElement (val), Button (val), Container (val)
    local v1, u5 = React.useBinding(a1.baseValue)
    local u9 = React.useRef(nil)
    local v2, u13 = useSpring({start = 0, speed = 20, damper = 1})
    local v3, u17 = useSpring({start = 0, speed = 20, damper = 1})
    local Beep = useSound("Beep")
    local u23 = useSound("New Upgrade Hover")
    local useCallback = React.useCallback
    local v4 = {a1.activate, a1.min, a1.max}
    local u31 = useCallback(function(a1_2) -- Line: 50 -- upvalues: a1 (val), u23 (val), u13 (val), u17 (val), Beep (val), u5 (val)
        local min = a1.min
        local v1 = a1.min or (-1 / 0)
        local max = a1.max
        local v2 = math.clamp(if a1_2 ~= a1_2 then min or (-1 / 0) else a1_2, v1, max or (1 / 0))
        if v2 == a1_2 then
            u17({force = 20})
            Beep()
        else
            u23()
            u13({force = 20})
        end
        u5(v2)
        a1.activate(v2)
    end, v4)
    local useEffect = React.useEffect
    local v5 = {a1.baseValue}
    useEffect(function() -- Line: 71 -- upvalues: u5 (val), a1 (val)
        u5(a1.baseValue)
    end, v5)
    local v6, u41 = useSpring({start = 1, speed = 20, damper = 1})
    v5 = React.joinBindings({v6, v3, v2}):map(function(a1) -- Line: 82
        local v1 = a1[1]
        local v2 = a1[2]
        local v3 = a1[3]
        return (((Color3.fromRGB(255, 255, 255)):Lerp(Color3.fromRGB(168, 64, 64), (math.clamp(v3, 0, 1)))):Lerp(
            Color3.fromRGB(73, 168, 64),
            (math.clamp(v2, 0, 1))
        )):Lerp(
            Color3.fromRGB(168, 64, 64),
            (math.clamp(1 - v1, 0, 1))
        )
    end)
    local v7 = createElement
    local v8 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v9 = {
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),
    }
    local v10 = createElement
    local v11 = Button
    local v12 = {
        Size = UDim2.fromOffset(28, 28),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(52, 52, 52),
        Image = "rbxassetid://6764432408",
        ImageColor3 = Color3.fromRGB(156, 156, 156),
        ImageRectSize = Vector2.new(50, 50),
        ImageRectOffset = Vector2.new(0, 550),
        CornerRadius = 8,
        StrokeColor = Color3.fromRGB(116, 116, 116),
        StrokeThickness = 2,
        LayoutOrder = 0,
        AutoButtonAnimate = true,
        PressSound = "New Click",
        HoverSound = "New Hover",
        HoverSizeScale = 1.2,
        DepressSizeScale = 0.85,
    }

    v12[React.Event.Activated] = function() -- Line: 127 -- upvalues: u9 (val), a1 (val), u31 (val)
        local current = u9.current
        if not current then
            return
        end
        local v1 = tonumber(current.Text)
        if v1 then
            v1 = v1 - (a1.increment or 1)
            u31(v1)
        end
    end

    v9.previousButton = v10(v11, v12)
    v10 = createElement
    v11 = Button
    v12 = {
        Size = UDim2.fromOffset(28, 28),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(52, 52, 52),
        Image = "rbxassetid://6764432408",
        ImageColor3 = Color3.fromRGB(156, 156, 156),
        ImageRectSize = Vector2.new(50, 50),
        ImageRectOffset = Vector2.new(0, 500),
        CornerRadius = 8,
        StrokeColor = Color3.fromRGB(116, 116, 116),
        StrokeThickness = 2,
        AutoButtonAnimate = true,
        LayoutOrder = 2,
        PressSound = "New Click",
        HoverSound = "New Hover",
        HoverSizeScale = 1.2,
        DepressSizeScale = 0.85,
    }

    v12[React.Event.Activated] = function() -- Line: 167 -- upvalues: u9 (val), a1 (val), u31 (val)
        local current = u9.current
        if not current then
            return
        end
        local v1 = tonumber(current.Text)
        if v1 then
            v1 = v1 + (a1.increment or 1)
            u31(v1)
        end
    end

    v9.forwardButton = v10(v11, v12)
    local v13 = createElement
    v10 = Container
    v11 = {
        BackgroundTransparency = 0.5,
        CornerRadius = 8,
        LayoutOrder = 1,
        StrokeThickness = 2,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(0.6, 1),
        StrokeColor = Color3.fromRGB(90, 90, 90),
    }
    v12 = {
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 2),
            PaddingBottom = UDim.new(0, 2),
            PaddingLeft = UDim.new(0, 2),
            PaddingRight = UDim.new(0, 2),
        }),
    }
    local v14 = createElement
    local v15 = {
        ClearTextOnFocus = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Text = v1,
        Font = Enum.Font.GothamMedium,
        TextScaled = true,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        ref = u9,
        TextColor3 = v5,
    }

    v15[React.Change.Text] = function(a1_2) -- Line: 216 -- upvalues: a1 (val), u41 (val)
        local v1 = tonumber(a1_2.Text)
        local v2 = false
        if v1 ~= nil then
            v2 = false
            if (a1.min or (-1 / 0)) <= v1 then
                v2 = v1 <= (a1.max or (1 / 0))
            end
        end
        u41({target = if not v2 then 0 else 1})
    end

    v15[React.Event.FocusLost] = function(a1_2) -- Line: 225 -- upvalues: u31 (val), u23 (val), a1 (val)
        local v1 = tonumber(a1_2.Text)
        if v1 then
            u31(v1)
            return
        end
        u23()
        a1_2.Text = tostring(v1:getValue() or a1.min)
    end

    v12.content = v14("TextBox", v15, {
        uICorner = createElement("UICorner"),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.2, 0),
                (NumberSequenceKeypoint.new(1, 0.2)),
            }),
        }),
        stroke = createElement("UIStroke", {
            Transparency = 0,
            Color = Color3.fromRGB(115, 116, 128),
            LineJoinMode = Enum.LineJoinMode.Round,
        }),
    })
    v9[1] = v13(v10, v11, v12)
    return v7("Frame", v8, v9)
end