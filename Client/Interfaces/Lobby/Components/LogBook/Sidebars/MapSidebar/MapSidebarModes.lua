-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LogBook.Sidebars.MapSidebar.MapSidebarModes
-- Decompile time: 4.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local useTransparencyModifier = require(Hooks.useTransparencyModifier)
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween
local memo = React.memo
local useEffect = React.useEffect
local createElement = React.createElement
local u27 = memo(function(a1) -- Line: 20
    -- upvalues: useTween (val), useTransparencyModifier (val), useEffect (val), createElement (val)
    local u2 = a1.layoutOrder or 1
    local map = a1.map
    local v1 = a1.name or "Fallen"
    local icon = a1.icon
    local color = a1.color
    local v2 = a1.wave or 0
    local maxWave = a1.maxWave
    local u19 = math.round((math.clamp(v2 / maxWave, 0, 1)) * 1000) / 1000
    local v3, u27 = useTween({
        start = 0,
        target = u19,
        info = TweenInfo.new(1, Enum.EasingStyle.Exponential),
    })
    local v4, u35 = useTween({
        start = 1,
        target = 0,
        info = TweenInfo.new(0.4, Enum.EasingStyle.Exponential),
    })
    local v5, u51 = useTween({
        start = UDim2.fromScale(-0.4, 0),
        target = UDim2.fromScale(0, 0),
        info = TweenInfo.new(0.4, Enum.EasingStyle.Exponential),
    })
    local v6 = useTransparencyModifier(v4)
    local v7 = {map}
    useEffect(function() -- Line: 51 -- upvalues: u27 (val), u35 (val), u51 (val), u2 (val), u19 (val)
        u27({
            start = 0,
            target = 0,
            info = TweenInfo.new(0.016666666666666666, Enum.EasingStyle.Linear),
        })
        u35({
            start = 1,
            target = 1,
            info = TweenInfo.new(0.016666666666666666, Enum.EasingStyle.Linear),
        })
        u51({
            start = UDim2.fromScale(0, 0),
            target = UDim2.fromScale(0, 0),
            info = TweenInfo.new(0.016666666666666666, Enum.EasingStyle.Linear),
        })
        task.delay((u2 - 1) * 0.05, function() -- Line: 68 -- upvalues: u27 (upval), u19 (upval), u35 (upval), u51 (upval)
            u27({
                start = 0,
                target = u19,
                info = TweenInfo.new(1, Enum.EasingStyle.Exponential),
            })
            u35({
                start = 1,
                target = 0,
                info = TweenInfo.new(0.4, Enum.EasingStyle.Exponential),
            })
            u51({
                start = UDim2.fromScale(-1, 0),
                target = UDim2.fromScale(0, 0),
                info = TweenInfo.new(0.4, Enum.EasingStyle.Exponential),
            })
        end)
    end, v7)
    v7 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 0.2),
        LayoutOrder = u2,
    }
    local v8 = {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 4})}
    local v9 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Position = v5}
    local v10 = {}
    local v11 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(43, 43, 43),
        BackgroundTransparency = v6(0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    v11.Image = not (typeof(icon) ~= "number") and ("rbxassetid://%*"):format(icon) or icon
    v11.ImageTransparency = v6(0)
    v11.Position = UDim2.fromScale(0, 0.5)
    v11.Size = UDim2.fromScale(0.223, 1)
    v10.icon = createElement("ImageLabel", v11, {
        aspectRatio = createElement("UIAspectRatioConstraint"),
        stroke = createElement("UIStroke", {Thickness = 2, Color = color, Transparency = v6(0)}),
    })
    v10.content = createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromScale(0.733, 1),
    }, {
        frame = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.fromScale(1, 0.7),
        }, {
            progress = createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = v6(0.2),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 0.595),
            }, {
                corner = createElement("UICorner"),
                stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(39, 39, 39), Transparency = v6(0)}),
                amount = createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    TextSize = 14,
                    TextWrapped = true,
                    ZIndex = 3,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(27, 42, 53),
                    FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.9, 0.6),
                    Text = ("%*%%"):format((math.round(u19 * 100))),
                    TextTransparency = v6(0),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left,
                }, {uIStroke1 = createElement("UIStroke", {Thickness = 2, Transparency = v6(0.5)})}),
                dropShadow = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://9239716855",
                    ZIndex = -1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(27, 42, 53),
                    ImageTransparency = v6(0.2),
                    Position = UDim2.fromScale(0.5, 0.5),
                    ScaleType = Enum.ScaleType.Slice,
                    Size = UDim2.fromScale(1.06, 1.11),
                    SliceCenter = Rect.new(14, 14, 64, 24),
                }),
                bar = createElement("ImageLabel", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://76856872302406",
                    ZIndex = 2,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    ImageTransparency = v6(0),
                    ImageColor3 = color,
                    Size = UDim2.fromScale(1, 1),
                }, {
                    gradient = createElement("UIGradient", {
                        Offset = v3:map(function(a1) -- Line: 212
                            return Vector2.new(a1 - 0.5, 0)
                        end),
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.5, 0),
                            NumberSequenceKeypoint.new(0.501, 1),
                            (NumberSequenceKeypoint.new(1, 1)),
                        }),
                    }),
                    corner = createElement("UICorner"),
                }),
            }),
            difficultyName = createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                ZIndex = 3,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(27, 42, 53),
                FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.fromScale(0.9, 0.3),
                Text = ("%* (%*/%*)"):format(v1, v2, maxWave),
                TextTransparency = v6(0),
                TextColor3 = Color3.fromRGB(255, 255, 255),
            }, {uIStroke3 = createElement("UIStroke", {Thickness = 2, Transparency = v6(0.25)})}),
        }),
    })
    v8.outterContent = createElement("Frame", v9, v10)
    return createElement("Frame", v7, v8)
end)
return (memo(function(a1) -- Line: 258 -- upvalues: createElement (val), u27 (val), React (val)
    local v1 = {}
    for i, j in a1.modes do
        v1[j.name] = (createElement(u27, {
            map = a1.map,
            name = j.name,
            icon = j.icon,
            color = j.color,
            wave = j.wave,
            maxWave = j.maxWave,
            layoutOrder = i,
        }))
    end
    return createElement(React.Fragment, {}, v1)
end))