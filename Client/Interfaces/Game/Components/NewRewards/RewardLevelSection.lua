-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewRewards.RewardLevelSection
-- Decompile time: 8.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Experience = require(ReplicatedStorage.Shared.Modules.Experience)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useConfetti = require(ReplicatedStorage.Client.Interfaces.Hooks.useConfetti)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween
local u35 = {}
u35[1] = {
    Amount = 30,
    Lifetime = 0.23,
    Force = 10,
    Radius = 30,
    AlwaysOnTop = false,
    Direction = Vector2.new(-1, 0),
}
return memo(function(a1) -- Line: 36
    -- upvalues: useTween (val), useSpring (val), useEffect (val), React (val), useConfetti (val), u35 (val)
    -- upvalues: Experience (val), createElement (val), Comma (val)
    local v1, u8 = useTween({start = 0, target = 0, info = TweenInfo.new(0.35, Enum.EasingStyle.Linear)})
    local v2, u12 = useSpring({target = 0, start = 0, damper = 0.5, speed = 12})
    local v3, u16 = useSpring({start = 0, target = 0, damper = 0.5, speed = 13})
    local v4 = useEffect
    local v5 = {a1.visible}
    v4(function() -- Line: 57 -- upvalues: u16 (val), a1 (val)
        u16({target = if not a1.visible then 0 else 1})
    end, v5)
    local u25 = React.useRef(nil)
    local u28, u29 = useConfetti(u35)
    local v6, u34 = React.useState(a1.previousLevel)
    local v7, u39 = React.useState(a1.newLevel)
    local v8 = v1:map(function(a1) -- Line: 70
        return Vector2.new(-0.5 + a1)
    end)
    local v9 = {u28, u25}
    useEffect(function() -- Line: 74 -- upvalues: u28 (val), u25 (val)
        if u28.current and u25.current then
            u28.current.Parent = u25.current
            return
        end
    end, v9)
    local v10 = useEffect
    v9 = {a1.newLevel, a1.previousLevel, a1.currentXP, a1.visible}
    v10(function() -- Line: 82 -- upvalues: a1 (val), u34 (val), u39 (val), u8 (val), u12 (val), u29 (val), Experience (upval)
        local u2 = task.spawn(function() -- Line: 83
            -- upvalues: a1 (upval), u34 (upval), u39 (upval), u8 (upval), u12 (upval), u29 (upval), Experience (upval)
            if not a1.visible then
                return
            end
            task.wait()
            for i = 1, (math.max(0, a1.newLevel - a1.previousLevel)) do
                u34(a1.previousLevel + i - 1)
                u39(a1.previousLevel + i)
                u8({
                    start = 0,
                    target = 1,
                    info = TweenInfo.new(0.5, Enum.EasingStyle.Linear),
                })
                u12({force = 10})
                u29()
                task.wait(0.55)
            end
            local v1 = Experience(a1.newLevel)
            local v2 = math.clamp(a1.currentXP / v1, 0, 1)
            u34(a1.newLevel)
            u39(a1.newLevel + 1)
            u8({
                start = 0,
                target = v2,
                info = TweenInfo.new(0.35, Enum.EasingStyle.Linear),
            })
        end)
        return function() -- Line: 126 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, v9)
    local createElement_2 = React.createElement
    local Fragment = React.Fragment
    local v11 = {
        confetti = createElement("Frame", {
            BackgroundTransparency = 1,
            ZIndex = 99999,
            Size = UDim2.fromScale(2, 2),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.15, 0.3),
            ref = u25,
            Visible = a1.visible,
        }),
    }
    local v12 = {
        BackgroundTransparency = 1,
        Position = UDim2.fromScale(0.0197133, 0.112281),
        Size = UDim2.fromScale(0.549283, 0.205263),
    }
    local v13 = {}
    local v14 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = v2:map(function(a1) -- Line: 151
            return UDim2.fromScale(0.5, 0.5 + a1 * 0.2)
        end),
        Size = UDim2.fromScale(0.968089, 0.931624),
    }
    local v15 = {UIScale = createElement("UIScale", {Scale = v3})}
    v15.currentLevel = createElement("TextLabel", {
        BackgroundTransparency = 1,
        LineHeight = 1.1,
        TextScaled = true,
        AnchorPoint = Vector2.new(0, 1),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(-0.00168506, 0.895587),
        Size = UDim2.fromScale(0.1, 1.06824),
        Text = v6,
        TextColor3 = Color3.new(1, 1, 1),
    }, {
        uIGradient = createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 60, 255)),
                ColorSequenceKeypoint.new(0.248705, Color3.fromRGB(35, 152, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(207, 251, 255))),
            }),
        }),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(21, 56, 94)}),
        uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 50}),
    })
    v15.title = createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "Lv.",
        TextScaled = true,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(-0.0016851, -0.547656),
        Size = UDim2.fromScale(0.1, 0.375),
        TextColor3 = Color3.new(1, 1, 1),
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(33, 33, 33)}),
        uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 30}),
    })
    v15.frame = createElement("Frame", {
        BackgroundTransparency = 0.3,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.fromScale(0.500473, 1.6219),
        Size = UDim2.fromScale(1.02285, 0.56872),
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 20)}),
        currentExp = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextStrokeTransparency = 0,
            ZIndex = 3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.978814, 0.9),
            Text = Comma(a1.currentXP),
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 14})}),
        requiredExp = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            TextStrokeTransparency = 0,
            ZIndex = 3,
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.978814, 0.9),
            Text = Comma(Experience(a1.newLevel)),
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Right,
        }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 14})}),
        markers = createElement("Frame", {BackgroundTransparency = 1, ZIndex = 2, Size = UDim2.fromScale(1, 1)}, {
            frame = createElement("Frame", {
                BackgroundTransparency = 0.6,
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.new(),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Size = UDim2.fromScale(0.00847458, 1),
            }),
            frame2 = createElement("Frame", {
                BackgroundTransparency = 0.6,
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.new(),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Size = UDim2.fromScale(0.00847458, 1),
            }),
            frame3 = createElement("Frame", {
                BackgroundTransparency = 0.6,
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.new(),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Size = UDim2.fromScale(0.00847458, 1),
            }),
            frame4 = createElement("Frame", {
                BackgroundTransparency = 0.6,
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.new(),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Size = UDim2.fromScale(0.00847458, 1),
            }),
            frame5 = createElement("Frame", {
                BackgroundTransparency = 0.6,
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.new(),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Size = UDim2.fromScale(0.00847458, 1),
            }),
            frame6 = createElement("Frame", {
                BackgroundTransparency = 0.6,
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.new(),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Size = UDim2.fromScale(0.00847458, 1),
            }),
            uIListLayout = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
        }),
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(22, 22, 22)}),
        bar = createElement("ImageLabel", {
            Image = "rbxassetid://76876230251877",
            BackgroundColor3 = Color3.new(1, 1, 1),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIGradient = createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(87, 210, 255)),
                    ColorSequenceKeypoint.new(0.231434, Color3.fromRGB(42, 117, 255)),
                    ColorSequenceKeypoint.new(0.523316, Color3.fromRGB(0, 170, 255)),
                    ColorSequenceKeypoint.new(0.765112, Color3.fromRGB(245, 252, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1))),
                }),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.499414, 0),
                    NumberSequenceKeypoint.new(0.5, 1),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
                Offset = v8,
            }),
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 20)}),
        }),
        dropShadow = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "http://www.roblox.com/asset/?id=9239716855",
            ImageTransparency = 0.2,
            ZIndex = -1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Slice,
            Size = UDim2.new(1, 16, 1, 16),
            SliceCenter = Rect.new(14, 14, 64, 24),
        }, {uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 20)})}),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(74, 74, 74)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))),
            }),
        }),
    })
    v15.nextlevel = createElement("TextLabel", {
        BackgroundTransparency = 1,
        LineHeight = 1.1,
        TextScaled = true,
        AnchorPoint = Vector2.new(1, 1),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.99663, 0.895587),
        Size = UDim2.fromScale(0.1, 1.06824),
        Text = v7,
        TextColor3 = Color3.fromRGB(148, 177, 202),
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(21, 56, 94)}),
        uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 50}),
    })
    v15.uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 12.5, AspectType = Enum.AspectType.ScaleWithParentSize})
    v15.uISizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 45)})
    v15.title2 = createElement("TextLabel", {
        BackgroundTransparency = 1,
        Text = "Lv.",
        TextScaled = true,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.827382, -0.547657),
        Size = UDim2.fromScale(0.241548, 0.375),
        TextColor3 = Color3.new(1, 1, 1),
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(33, 33, 33)}),
        uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 30}),
    })
    v15.matchXP = if not a1.xpEarned or not (0 < a1.xpEarned) then nil else createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.320168, -0.442337),
        Size = UDim2.fromScale(0.337019, 1.05318),
        Text = ("+%* XP"):format((Comma(a1.xpEarned))),
        TextColor3 = Color3.new(1, 1, 1),
    }, {
        uIStroke = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(154, 90, 0)}),
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 201, 7)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 144, 11))),
            }),
        }),
    })
    v15.imageLabel = if not a1.xpEarned or not (0 < a1.xpEarned) then nil else createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://16691356182",
        ImageTransparency = 0.76,
        ZIndex = 0,
        ImageColor3 = Color3.fromRGB(255, 190, 61),
        Position = UDim2.fromScale(0.211285, -1.17957),
        Size = UDim2.fromScale(0.595713, 2.50658),
    })
    v13.level = createElement("Frame", v14, v15)
    v11.other = createElement("Frame", v12, v13)
    return createElement_2(Fragment, nil, v11)
end)