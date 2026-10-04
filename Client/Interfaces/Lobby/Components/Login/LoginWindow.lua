-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Login.LoginWindow
-- Decompile time: 15.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local LoginReward = require(script.Parent.LoginReward)
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef

local function LoginRewards(a1) -- Line: 35
    -- upvalues: table (val), createElement (val), LoginReward (val), React (val)
    local v1, v2, v3, v4, v5
    local buttonPosition = a1.buttonPosition
    local day = a1.day
    local v6 = {}
    local v7 = {}
    local v8 = nil
    local v9 = nil
    for i, j in a1.rewards, v8, v9 do
        v1 = math.ceil(i / 5)
        v2 = v6[v1] or {}
        v6[v1] = v2
        table.insert(v6[v1], j)
    end
    v8 = nil
    v9 = nil
    for k, n in v6, v8, v9 do
        v1 = {}
        v3 = nil
        v4 = nil
        for m, i5 in n, v3, v4 do
            v5 = ("reward%*"):format(m)
            v1[v5] = (createElement(LoginReward, table.merge({
                LayoutOrder = i5.day,
                InnerPosition = buttonPosition,
                disabled = i5.day < day,
                current = i5.day == day,
            }, i5)))
        end
        v2 = ("row%*"):format(k)
        v7[v2] = (createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 0, 0, 120),
            LayoutOrder = k,
        }, {
            layout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            content = React.createElement(React.Fragment, {}, v1),
        }))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
    }, {
        uIGridLayout = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        content = React.createElement(React.Fragment, {}, v7),
    })
end

return function(a1) -- Line: 102
    -- upvalues: useSpring (val), useScale (val), useRef (val), createElement (val), LoginRewards (val), useEffect (val)
    -- upvalues: Button (val), React (val)
    local v1
    local rewards = a1.rewards or {}
    local u6 = a1.Visible ~= false
    local day = a1.day
    local v2, u15 = useSpring(0, 1, 30, true)
    local v3, u22 = useSpring(100, 1, 20, true)
    local v4, u29 = useSpring(-300, 1, 25, true)
    local v5, u36 = useSpring(1, 1, 25, true)
    local v6 = useScale(1.2)
    local u41 = useRef()
    local v7 = v2:map(function(a1) -- Line: 115
        return 1 - a1
    end)
    local v8 = {}
    for i, v in ipairs(rewards) do
        v1 = ("week%*"):format(i)
        v8[v1] = (createElement(LoginRewards, {buttonPosition = v5, rewards = v, day = day, scale = v6}))
    end
    local v9 = {u6}
    useEffect(function() -- Line: 129 -- upvalues: u15 (val), u6 (val), u22 (val), u29 (val), u36 (val)
        u15(if not u6 then 0 else 1)
        u22(if not u6 then 100 else 0)
        u29(if not u6 then -300 else 0)
        u36(if not u6 then 1 else 0)
    end, v9)
    local v10 = useEffect
    v9 = {a1.week}
    v10(function() -- Line: 136 -- upvalues: u41 (val), a1 (val)
        local current = u41.current
        if not current then
            return
        end
        current:JumpToIndex(a1.week - 1)
    end, v9)
    v9 = {
        Image = "rbxassetid://17524202802",
        ImageTransparency = v7,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(22, 22, 22),
        BackgroundTransparency = v2:map(function(a1) -- Line: 150
            return 1 - a1 * 0.85
        end),
        Size = UDim2.fromOffset(640, 364),
        Visible = v2:map(function(a1) -- Line: 154
            return a1 > 0.01
        end),
        Position = v3:map(function(a1) -- Line: 157
            return UDim2.new(0.5, 0, 0.5, a1)
        end),
    }
    local v11 = {scale = createElement("UIScale", {Scale = v6})}
    local v12 = {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        ZIndex = -1,
        Position = UDim2.new(0.5, 0, 1, 80),
        AnchorPoint = Vector2.new(0.5, 1),
        Size = UDim2.fromOffset(300, 100),
    }
    local v13 = {}
    local v14 = {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = v4:map(function(a1) -- Line: 175
            return UDim2.new(0.5, 0, 1, a1 - 8)
        end),
    }
    v14.Text = if not a1.claimable then "CLOSE" else "CLAIM"
    v14.TextSize = UDim2.fromScale(1, 0.5)
    v14.Size = UDim2.fromOffset(192, 56)
    v14.Font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
    local v15 = a1.claimable and Color3.fromRGB(77, 231, 113) or Color3.fromRGB(150, 150, 150)
    v14.Color = v15
    v14.Clicked = a1.clicked
    v13.button = createElement(Button, v14)
    v11.confirm = createElement("Frame", v12, v13)
    v11.streak = createElement("Frame", {
        BorderSizePixel = 0,
        LayoutOrder = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.new(0.5, 0, 1, -28),
        Size = UDim2.new(0.5, 0, 0, 18),
        BackgroundTransparency = v7,
    }, {
        uIGradient = createElement("UIGradient", {
            Transparency = v2:map(function(a1) -- Line: 203
                return NumberSequence.new({
                    NumberSequenceKeypoint.new(0, a1),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, a1)),
                })
            end),
        }),
        streak1 = createElement("TextLabel", {
            TextSize = 32,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
            Text = ("%* day streak!"):format(day),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = v7,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 0, 0, 32),
        }, {uIStroke1 = createElement("UIStroke", {Thickness = 3, Transparency = v7})}),
        uiScale = createElement("UIScale", {Scale = v2}),
    })
    v11.weeks = createElement("Frame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 0, 0, 72),
        Size = UDim2.new(1, 0, 0, 240),
    }, {
        uiPageLayout = createElement("UIPageLayout", {TweenTime = 0.5, EasingStyle = Enum.EasingStyle.Exponential, ref = u41}),
        content = React.createElement(React.Fragment, {}, v8),
    })
    v11.coins = createElement("ImageLabel", {
        Image = "rbxassetid://16455010681",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 0,
        ImageTransparency = v7,
        ImageColor3 = Color3.fromRGB(150, 150, 150),
        ScaleType = Enum.ScaleType.Fit,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(1, 0, 0, 150),
    })
    v11.dropShadow = createElement("ImageLabel", {
        Image = "rbxassetid://9239716855",
        BackgroundTransparency = 1,
        ZIndex = -1,
        ImageTransparency = v7,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 14, 1, 14),
    })
    v11.uICorner = createElement("UICorner")
    v11.uIGradient1 = createElement("UIGradient", {
        Rotation = 45,
        Transparency = v7:map(function(a1) -- Line: 289
            return NumberSequence.new(a1)
        end),
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(238, 238, 238)),
            ColorSequenceKeypoint.new(0.477, Color3.fromRGB(77, 77, 77)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(31, 31, 31))),
        }),
    })
    v11.frame = createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(0.5, 0, 0, 64),
    }, {
        textLabel = createElement("TextLabel", {
            Text = "Login Rewards",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            ZIndex = 4,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            TextTransparency = v7,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0, 64, 0.5, 0),
            Size = UDim2.new(1, -72, 0.5, 9),
        }, {
            uIStroke2 = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(30, 30, 30), Transparency = v7}),
        }),
        icon = createElement("ImageLabel", {
            Image = "rbxassetid://17834969496",
            BackgroundTransparency = 1,
            ImageTransparency = v7,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0, 32, 0.5, 0),
            Size = UDim2.fromOffset(48, 48),
        }),
    })
    v11.textLabel1 = createElement("TextLabel", {
        Text = "Rewards scale with your login streak!",
        TextScaled = true,
        TextSize = 14,
        TextWrapped = true,
        BackgroundTransparency = 1,
        ZIndex = 4,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        TextTransparency = v7,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0.5, 8, 0, 32),
        Size = UDim2.new(0.5, -24, 0, 28),
    }, {
        uIStroke3 = createElement("UIStroke", {Thickness = 3, Color = Color3.fromRGB(30, 30, 30), Transparency = v7}),
    })
    v11.top = createElement("ImageLabel", {
        Image = "rbxassetid://17834720091",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = -1,
        ImageTransparency = v2:map(function(a1) -- Line: 375
            return 1 - a1 * 0.4
        end),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(8, 8, 56, 64),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 0, 64),
    }, {
        uIGradient2 = createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.4, 0),
                NumberSequenceKeypoint.new(0.535, 0.0625),
                NumberSequenceKeypoint.new(0.639, 0.175),
                NumberSequenceKeypoint.new(0.714, 0.462),
                NumberSequenceKeypoint.new(0.793, 0.812),
                NumberSequenceKeypoint.new(0.881, 0.931),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    v11.uIStroke4 = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(255, 255, 255), Transparency = v7}, {
        uIGradient3 = createElement("UIGradient", {
            Rotation = 45,
            Transparency = v2:map(function(a1) -- Line: 408
                return NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.5, a1),
                    (NumberSequenceKeypoint.new(1, 0)),
                })
            end),
        }),
    })
    return createElement("ImageLabel", v9, v11)
end