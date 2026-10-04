-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.CurseVotedFor
-- Decompile time: 9.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
local memo = React.memo
local u22 = {}
u22[1] = {
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 42, 106)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 147))),
    }),
}
u22[2] = {
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(163, 214, 68)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(118, 255, 129))),
    }),
}
u22[3] = {
    color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 199, 255))),
    }),
}

local function getColor(a1) -- Line: 41
    if typeof(a1) == "Color3" then
        return a1
    end
    if typeof(a1) ~= "table" then
        return nil
    end
    local R = a1[1] or a1.R or a1.r
    local G = a1[2] or a1.G or a1.g
    local B = a1[3] or a1.B or a1.b
    if typeof(R) == "number" and typeof(G) == "number" and typeof(B) == "number" then
        if not (R > 1) and not (G > 1) and not (B > 1) then
            return Color3.new(R, G, B)
        end
        return Color3.fromRGB(R, G, B)
    end
    return nil
end

local function getColorSequence(a1, a2) -- Line: 65
    -- upvalues: u22 (val), getColor (val)
    local v1 = u22[a1] or u22[1]
    local color = v1.color
    if typeof(a2) ~= "table" then
        return color
    end
    local v2 = getColor(a2[1] or a2.Start or a2.start or a2.Primary or a2.primary)
    local v3 = getColor(a2[2] or a2.End or a2.endColor or a2.Secondary or a2.secondary or v2)
    if v2 and v3 then
        return ColorSequence.new({ColorSequenceKeypoint.new(0, v2), (ColorSequenceKeypoint.new(1, v3))})
    end
    return color
end

return memo(function(a1) -- Line: 93
    -- upvalues: getColorSequence (val), ReactFlow (val), useTransparencyModifier (val), React (val)
    -- upvalues: createElement (val)
    local v1 = {color = getColorSequence(a1.index, a1.colors)}
    local description_2 = if typeof(a1.description) ~= "string" then if not a1.shrine then "Curse Active" else "Shrine Activated" else if a1.description == "" then if not a1.shrine then "Curse Active" else "Shrine Activated" else a1.description
    local v2 = a1.modifier or ""
    local v3, u25 = ReactFlow.useTween({start = 1, target = 1, info = TweenInfo.new(0.64)})
    local v4, u30 = ReactFlow.useSpring({start = -1, target = 0, damper = 0.6, speed = 10})
    local v5, u35 = ReactFlow.useSpring({start = 0, target = 1, damper = 0.6, speed = 10})
    local v6 = useTransparencyModifier(v3)
    local v7 = v4:map(function(a1) -- Line: 125
        return UDim2.fromScale(0.5, 0.5 + a1)
    end)
    local useEffect = React.useEffect
    local v8 = {a1.enabled}
    useEffect(function() -- Line: 129 -- upvalues: u35 (val), a1 (val), u30 (val), u25 (val)
        u35({
            target = if not a1.enabled then 0.1 else 1,
            speed = if not a1.enabled then 15 else 10,
            damper = if not a1.enabled then 0.8 else 0.6,
        })
        u30({
            target = if not a1.enabled then -1 else 0,
            speed = if not a1.enabled then 15 else 10,
            damper = if not a1.enabled then 0.8 else 0.6,
        })
        u25({target = if not a1.enabled then 1 else 0})
    end, v8)
    return createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(2, 2, 2),
        BorderColor3 = Color3.new(),
        Size = UDim2.fromScale(1, 0.247279),
        BackgroundTransparency = v6(0),
    }, {
        uIGradient = createElement("UIGradient", {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.2),
                NumberSequenceKeypoint.new(0.2, 0.3),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
        fade = createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Color3.new(),
            Size = UDim2.fromScale(1, 1),
        }, {
            uIGradient = createElement("UIGradient", {
                Rotation = 9,
                Offset = Vector2.new(-1, 0),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.000877963, 1),
                    NumberSequenceKeypoint.new(0.223881, 0),
                    NumberSequenceKeypoint.new(0.501317, 0),
                    NumberSequenceKeypoint.new(0.747147, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
        holder = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(3, 1),
        }, {
            imageLabel = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://5538771868",
                ImageTransparency = 0.28,
                AnchorPoint = Vector2.new(0.5, 0.5),
                ImageColor3 = v1.color.Keypoints[1].Value,
                Position = v7,
                ScaleType = Enum.ScaleType.Slice,
                Size = UDim2.fromScale(0.216155, 0.509612),
                SliceCenter = Rect.new(64, 64, 64, 64),
            }, {
                uIGradient = createElement("UIGradient", {
                    Rotation = 90,
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
            top = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextWrapped = true,
                AnchorPoint = Vector2.new(0.5, 0),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Italic),
                Position = UDim2.fromScale(0.5, 0.0626741),
                Size = UDim2.fromScale(0.44, 0.212681),
                Text = description_2,
                TextColor3 = Color3.new(1, 1, 1),
                TextTransparency = v6(0),
            }, {
                uIGradient = createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(148, 148, 148))),
                    }),
                }),
            }),
            curse = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                Position = v7,
                Size = UDim2.fromScale(0.562726, 0.423307),
                Text = v2:upper(),
                TextColor3 = Color3.new(1, 1, 1),
                TextTransparency = v6(0),
            }, {
                uIScale = createElement("UIScale", {Scale = v5}),
                uIGradient = createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, v1.color.Keypoints[1].Value:Lerp(Color3.new(0, 0, 0), 0.35)),
                        (ColorSequenceKeypoint.new(1, v1.color.Keypoints[2].Value:Lerp(Color3.new(0, 0, 0), 0.35))),
                    }),
                }),
                uIStroke = createElement("UIStroke", {
                    Thickness = 5,
                    Color = Color3.new(1, 1, 1),
                    LineJoinMode = Enum.LineJoinMode.Miter,
                    Transparency = v6(0),
                }, {
                    uIGradient = createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, v1.color.Keypoints[1].Value:Lerp(Color3.new(1, 1, 1), 0.9)),
                            (ColorSequenceKeypoint.new(1, v1.color.Keypoints[2].Value:Lerp(Color3.new(0, 0, 0), 0.2))),
                        }),
                    }),
                }),
                curseDS = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    ZIndex = -3,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    Position = UDim2.fromScale(0.5, 0.538835),
                    Size = UDim2.fromScale(1, 1),
                    Text = v2:upper(),
                    TextColor3 = Color3.new(),
                    TextTransparency = v6(0),
                }, {
                    uIStroke = createElement("UIStroke", {
                        Thickness = 5,
                        Color = Color3.new(1, 1, 1),
                        LineJoinMode = Enum.LineJoinMode.Miter,
                        Transparency = v6(0),
                    }, {
                        uIGradient = createElement("UIGradient", {
                            Rotation = 90,
                            Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, v1.color.Keypoints[1].Value:Lerp(Color3.new(1, 1, 1), 0.9)),
                                (ColorSequenceKeypoint.new(1, v1.color.Keypoints[2].Value:Lerp(Color3.new(0, 0, 0), 0.2))),
                            }),
                        }),
                    }),
                }),
            }),
            uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 9.10727}),
        }),
    })
end)