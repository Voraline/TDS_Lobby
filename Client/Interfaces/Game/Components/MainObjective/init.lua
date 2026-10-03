-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MainObjective
-- Decompile time: 5.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Components = ReplicatedStorage.Client.Interfaces.Components
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useMediaQuery = require(Hooks.useMediaQuery)
local ImageLabel = require(Components.ImageLabel)
local MiniObjective = require(script.MiniObjective)
local Tween = ReactFlow.Tween
local Fragment = React.Fragment
local useAnimation = ReactFlow.useAnimation
local useGroupAnimation = ReactFlow.useGroupAnimation
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
return React.memo(function(a1) -- Line: 41
    -- upvalues: useState (val), useMediaQuery (val), useGroupAnimation (val), useAnimation (val), Tween (val)
    -- upvalues: useEffect (val), createElement (val), Fragment (val), MiniObjective (val), ImageLabel (val)
    local u3 = a1.Visible ~= false
    local completed = a1.completed
    local icon = a1.icon
    local title = a1.title
    local v1 = a1.collectText or title
    local v2, u13 = useState(false)
    local v3 = useMediaQuery("large", true)
    local v4, u126 = useGroupAnimation({
        enabled = useAnimation({
            circleTransparency = Tween({
                start = 0.2,
                target = 1,
                info = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            }),
            circleSize = Tween({
                start = UDim2.fromScale(0, 0),
                target = UDim2.fromScale(1, 1.3),
                info = TweenInfo.new(0.5),
            }),
            divider = Tween({target = UDim2.fromScale(0.7, 0.0204), info = TweenInfo.new(0.5)}),
            title = Tween({
                delay = 0.05,
                target = UDim2.fromScale(0.5, 0.8),
                info = TweenInfo.new(0.8),
            }),
            objective = Tween({
                delay = 0.05,
                target = UDim2.fromScale(0.5, 0.85),
                info = TweenInfo.new(0.8),
            }),
        }),
        disabled = useAnimation({
            divider = Tween({
                delay = 0.05,
                target = UDim2.fromScale(0, 0.0204),
                info = TweenInfo.new(0.6),
            }),
            title = Tween({target = UDim2.fromScale(0.5, 2), info = TweenInfo.new(0.8)}),
            objective = Tween({target = UDim2.fromScale(0.5, 0), info = TweenInfo.new(0.8)}),
        }),
    }, {
        circleTransparency = 1,
        circleSize = UDim2.fromScale(0, 0),
        divider = UDim2.fromScale(0, 0.0204),
        title = UDim2.fromScale(0.5, 2),
        objective = UDim2.fromScale(0.5, 0),
    })
    local v5 = {u3, completed}
    useEffect(function() -- Line: 104 -- upvalues: u3 (val), completed (val), u13 (val), u126 (val)
        local u0 = true
        local u3_2 = task.spawn(function() -- Line: 106 -- upvalues: u3 (upval), completed (upval), u13 (upval), u126 (upval), u0 (ref)
            if not u3 then
                u13(false)
                task.wait(0.1)
                if u0 then
                    u126("disabled")
                end
                return
            end
            if completed then
                u13(false)
                u126("enabled")
                task.wait(3)
                if not u0 then
                    return
                end
                u126("disabled")
                return
            end
            u126("enabled")
            task.wait(1)
            if not u0 then
                return
            end
            u13(true)
            task.delay(4, function() -- Line: 130 -- upvalues: u0 (upval), u126 (upval)
                if u0 then
                    u126("disabled")
                end
            end)
        end)
        return function() -- Line: 145 -- upvalues: u0 (ref), u3_2 (val)
            u0 = true
            task.cancel(u3_2)
        end
    end, v5)
    local v6 = {}
    local v7 = {}
    local v8 = u3 and v2 and v1 ~= nil
    v7.Visible = v8
    v7.text = v1
    v7.icon = icon
    v6.miniObjective = createElement(MiniObjective, v7)
    v7 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local Position = a1.Position or v3:map(function(a1) -- Line: 159
        return UDim2.fromScale(0.5, 0.1)
    end)
    v7.Position = Position
    local Size = a1.Size or v3:map(function(a1) -- Line: 162
        return a1 and UDim2.fromScale(0.332, 0.0952) or UDim2.fromScale(0.498, 0.1904)
    end)
    v7.Size = Size
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0)
    v7.AnchorPoint = AnchorPoint
    v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v8 = {
        circle = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://11999950713",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = v4.circleSize,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = v4.circleTransparency,
        }, {corner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)})}),
    }
    local v9 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.095),
        Size = UDim2.fromScale(1, 0.408),
    }
    local v10 = {}
    local v11 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = v4.title,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local v12 = {}
    local v13 = createElement
    local v14 = {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }
    v12.uIListLayout = v13("UIListLayout", v14)
    v13 = icon
    if v13 then
        v14 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
        }
        v14.Image = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon
        v14.Size = UDim2.fromScale(0.08, 1)
        v13 = createElement(ImageLabel, v14, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")})
    end
    v12.imageLabel = v13
    v14 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/TitilliumWeb.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Size = UDim2.fromScale(0.294, 1),
    }
    local subText = a1.subText or (if not completed then "NEW OBJECTIVE" else "OBJECTIVE COMPLETE")
    v14.Text = subText
    v14.TextColor3 = Color3.fromRGB(255, 255, 255)
    v12.textLabel = createElement("TextLabel", v14, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 40})})
    v10.title = createElement("Frame", v11, v12)
    v8.titleContainer = createElement("Frame", v9, v10)
    v8.contentContainer = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromScale(1, 0.592),
        Position = UDim2.fromScale(0.5, 1.1),
    }, {
        text = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = v4.objective,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/TitilliumWeb.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = title,
            TextColor3 = Color3.fromRGB(255, 182, 92),
        }, {uITextSizeConstraint1 = createElement("UITextSizeConstraint", {MaxTextSize = 48})}),
    })
    v8.frame1 = createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = v4.divider,
    }, {
        uIGradient = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v8.uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint", {AspectRatio = 7})
    v6.objective = createElement("Frame", v7, v8)
    return createElement(Fragment, nil, v6)
end)