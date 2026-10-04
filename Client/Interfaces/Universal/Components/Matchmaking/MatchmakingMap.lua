-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking.MatchmakingMap
-- Decompile time: 14.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local RewardInfo = require(script.Parent.RewardInfo)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local createElement = React.createElement
local useBinding = React.useBinding
local useRef = React.useRef
local useEffect = React.useEffect

local function withDisabled(a1, a2) -- Line: 33 -- types: a1: boolean, a2: function
    return function() -- Line: 34 -- upvalues: a1 (val), a2 (val)
        if a1 then
            return
        end
        return a2()
    end
end

return function(a1) -- Line: 43
    -- upvalues: useRef (val), useSound (val), useBinding (val), useTween (val), useSpring (val), useEffect (val)
    -- upvalues: createElement (val), RewardInfo (val), React (val), Icons (val)
    local u5 = true
    if a1.locked ~= true then
        u5 = a1.disabled == true
    end
    local u9 = a1.Visible ~= false
    local v1 = a1.icon or 17524202802
    local clicked = a1.clicked
    local index = a1.index
    if not index then
        index = a1.LayoutOrder
        if not index then
            index = 1
        end
    end
    local v2 = useRef()
    local Click = useSound("Click")
    local u24, u25 = useBinding(false)
    local v3, u35 = useTween(0, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), true, true)
    local v4 = v3:map(function(a1) -- Line: 59
        return 1 - a1
    end)
    local v5, u46 = useSpring(1, 0.5, 20, true)
    local v6, u53 = useSpring(2, 0.5, 20, true)
    local v7, u67 = useTween(Color3.fromRGB(145, 145, 145), TweenInfo.new(0.2, Enum.EasingStyle.Quad), true, true)
    local v8 = {index, u9}
    useEffect(function() -- Line: 72 -- upvalues: index (val), u35 (val), u9 (val)
        local u6 = task.delay(0.05 * (index - 1), function() -- Line: 73 -- upvalues: u35 (upval), u9 (upval)
            u35(if not u9 then 0 else 1)
        end)
        return function() -- Line: 77 -- upvalues: u6 (val)
            if u6 then
                task.cancel(u6)
            end
        end
    end, v8)
    v8 = {BackgroundTransparency = 1, Position = a1.Position, AnchorPoint = a1.AnchorPoint}
    local Size = a1.Size or UDim2.fromScale(0.45, 0.45)
    v8.Size = Size
    v8.LayoutOrder = a1.LayoutOrder
    v8.ZIndex = u24:map(function(a1) -- Line: 91
        if a1 then
            return 2
        end
        return 1
    end)
    local v9 = {}
    local rewardInfo = a1.rewardInfo and createElement(RewardInfo, {rewardInfo = a1.rewardInfo, size = UDim2.fromScale(1, 1)})
    v9.rewardInfo = rewardInfo
    v9.uiAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1})
    local v10 = {
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Selectable = true,
        Text = "",
        ref = v2,
        Position = v4:map(function(a1) -- Line: 116
            return (UDim2.fromScale(0.5, 0.5)) + UDim2.fromOffset(0, 100 * a1)
        end),
    }
    local MouseButton1Down = React.Event.MouseButton1Down

    local function u150() -- Line: 120 -- upvalues: u46 (val), u53 (val)
        u46(0.99)
        u53(4)
    end

    v10[MouseButton1Down] = function() -- Line: 34 -- upvalues: u5 (val), u150 (val)
        if u5 then
            return
        end
        return u150()
    end

    local MouseButton1Up = React.Event.MouseButton1Up

    local function u164() -- Line: 124 -- upvalues: u46 (val), u24 (val), u53 (val), Click (val), clicked (val)
        u46(if not u24:getValue() then 1 else 1.05)
        u53(2)
        Click()
        if clicked then
            clicked()
        end
    end

    v10[MouseButton1Up] = function() -- Line: 34 -- upvalues: u5 (val), u164 (val)
        if u5 then
            return
        end
        return u164()
    end

    local MouseEnter = React.Event.MouseEnter

    local function u175() -- Line: 134 -- upvalues: u46 (val), u67 (val), u25 (val)
        u46(1.05)
        u67(Color3.fromRGB(255, 255, 255))
        u25(true)
    end

    v10[MouseEnter] = function() -- Line: 34 -- upvalues: u5 (val), u175 (val)
        if u5 then
            return
        end
        return u175()
    end

    local MouseLeave = React.Event.MouseLeave

    local function u184() -- Line: 139 -- upvalues: u46 (val), u67 (val), u25 (val)
        u46(1)
        u67(Color3.fromRGB(145, 145, 145))
        u25(false)
    end

    v10[MouseLeave] = function() -- Line: 34 -- upvalues: u5 (val), u184 (val)
        if u5 then
            return
        end
        return u184()
    end

    local v11 = {scale = createElement("UIScale", {Scale = v5})}
    local v12 = {
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v13 = {
        uIStroke = createElement("UIStroke", {
            Color = u5 and Color3.fromRGB(59, 59, 59) or v7,
            Thickness = v6,
            Transparency = v4,
        }),
        uICorner = createElement("UICorner"),
    }
    local v14 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Selectable = false,
        ZIndex = 1,
        Size = UDim2.fromScale(1.2, 1.2),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v14.Image = not (typeof(v1) ~= "string") and v1 or ("rbxassetid://%*"):format(v1)
    v14.ImageColor3 = Color3.fromRGB(255, 255, 255)
    v14.ImageTransparency = v4
    v14.ScaleType = Enum.ScaleType.Crop
    v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v14.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v14.Position = UDim2.fromScale(0.5, 0.5)
    v13.background = createElement("ImageLabel", v14)
    v11.innerContent = createElement("CanvasGroup", v12, v13)
    v11.title = createElement("TextLabel", {
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
        Text = a1.title or "",
        TextTransparency = v4,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        stroke = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(0, 0, 0), Transparency = v4}, {}),
        constraint = createElement("UITextSizeConstraint", {MaxTextSize = 25}),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0.05, 0),
            PaddingLeft = UDim.new(0.05, 0),
            PaddingRight = UDim.new(0.05, 0),
            PaddingTop = UDim.new(0.1, 0),
        }),
    })
    v12 = {
        ZIndex = 10,
        Visible = u5,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = v3:map(function(a1) -- Line: 230
            return 1 - 0.7 * a1
        end),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }
    v13 = {
        uICorner = createElement("UICorner"),
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = Icons.Locked,
            ImageTransparency = v4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.4),
            Size = UDim2.fromScale(0.4, 0.4),
        }),
    }
    v14 = {BackgroundTransparency = 1, TextScaled = true, TextSize = 14, TextWrapped = true}
    local lockedText = a1.lockedText or a1.disabledText or "Locked"
    v14.Text = lockedText
    v14.TextTransparency = v4
    v14.AnchorPoint = Vector2.new(0.5, 0.4)
    v14.Position = UDim2.fromScale(0.5, 0.7)
    v14.Size = UDim2.fromScale(1, 0.1)
    v14.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
    v14.TextColor3 = Color3.fromRGB(255, 255, 255)
    v13.text = createElement("TextLabel", v14, {
        stroke = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(0, 0, 0), Transparency = v4}, {}),
    })
    v11.locked = createElement("Frame", v12, v13)
    v11.dropShadow = createElement("ImageLabel", {
        Image = "rbxassetid://9239716855",
        BackgroundTransparency = 1,
        ZIndex = -1,
        ImageTransparency = v3:map(function(a1) -- Line: 275
            return 1 - 0.8 * a1
        end),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 14, 1, 14),
    })
    v9.content = createElement("TextButton", v10, v11)
    return createElement("Frame", v8, v9)
end