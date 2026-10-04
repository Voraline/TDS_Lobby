-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Spotlight
-- Decompile time: 10.94 ms

local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useRefPropertyValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useRefPropertyValue)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local useViewportSize = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewportSize)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local u45 = Color3.fromRGB(0, 0, 0)
return function(a1) -- Line: 21
    -- upvalues: useSpring (val), useViewportSize (val), useRefPropertyValue (val), GuiService (val), useEffect (val)
    -- upvalues: React (val), useTween (val), createElement (val), u45 (val)
    local visible = a1.visible
    local v1, u11 = useSpring(if not visible then 0 else 1, 1, 8, true)
    local v2 = useViewportSize(true)
    if not a1.rootRef.current then
        visible = false
    end
    local u25 = useRefPropertyValue(a1.rootRef, "AbsolutePosition", Vector2.new())
    local u31 = useRefPropertyValue(a1.rootRef, "AbsoluteSize", Vector2.new())
    local v3, u38 = useSpring(u25, 1, 8, true)
    local v4, u45_2 = useSpring(u31, 1, 8, true)
    local GuiInset, GuiInset_2 = GuiService:GetGuiInset()
    local u51 = GuiInset + GuiInset_2
    local v5 = {u25, u31}
    useEffect(function() -- Line: 41 -- upvalues: u38 (val), u25 (val), u45_2 (val), u31 (val)
        u38(u25)
        u45_2(u31)
    end, v5)
    local v6 = React.joinBindings({v1, v2, v4})
    local v7 = React.joinBindings({v3, v4})
    v5 = v2:map(function(a1) -- Line: 51
        return UDim2.fromOffset(a1.X * 1.5, a1.Y * 1.5)
    end)
    local v8, v9 = useTween(0, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), nil, true)
    v9(1)
    local v10 = {visible}
    useEffect(function() -- Line: 64 -- upvalues: u11 (val), visible (ref)
        u11(if not visible then 0 else 1)
    end, v10)
    return (createElement("CanvasGroup", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        GroupTransparency = v1:map(function(a1) -- Line: 74
            return 1 - a1 + 0.2
        end),
        Visible = v1:map(function(a1) -- Line: 78
            return a1 > 0.01
        end),
    }, {
        inputSink = createElement("Frame", {
            ZIndex = 0,
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.fromOffset(u31.X + u25.X + u51.X + 10, u31.Y + u25.Y + u51.Y + 10),
            Size = UDim2.fromOffset(u31.X + 20, u31.Y + 20),
        }, {
            top = createElement("Frame", {
                BorderSizePixel = 0,
                Active = true,
                BackgroundColor3 = u45,
                Position = UDim2.new(0.5, 0, 0, 8),
                Size = v5,
                AnchorPoint = Vector2.new(0.5, 1),
            }),
            bottom = createElement("Frame", {
                BorderSizePixel = 0,
                Active = true,
                BackgroundColor3 = u45,
                Position = UDim2.new(0.5, 0, 1, -8),
                Size = v5,
                AnchorPoint = Vector2.new(0.5, 0),
            }),
            left = createElement("Frame", {
                BorderSizePixel = 0,
                Active = true,
                BackgroundColor3 = u45,
                Position = UDim2.new(0, 8, 0.5, 0),
                Size = v5,
                AnchorPoint = Vector2.new(1, 0.5),
            }),
            right = createElement("Frame", {
                BorderSizePixel = 0,
                Active = true,
                BackgroundColor3 = u45,
                Position = UDim2.new(1, -8, 0.5, 0),
                Size = v5,
                AnchorPoint = Vector2.new(0, 0.5),
            }),
        }),
        overlay = createElement("Frame", {
            ZIndex = 1,
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v7:map(function(a1) -- Line: 139 -- upvalues: u51 (val)
                local v1 = a1[1]
                local v2 = a1[2] * 0.5
                return UDim2.fromOffset(v1.X + v2.X + u51.X, v1.Y + v2.Y + u51.Y)
            end),
            Size = v6:map(function(a1) -- Line: 148
                local v1 = a1[1]
                local v2 = a1[2]
                local v3 = a1[3]
                local v4 = math.max(v3.X, v3.Y) + 20
                local v5 = math.max(v2.X, v2.Y)
                return (UDim2.fromOffset(v5, v5)):Lerp(UDim2.fromOffset(v4, v4), v1)
            end),
        }, {
            cover = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://16360469806",
                ImageColor3 = u45,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            }),
            clickbait = createElement("Frame", {
                BackgroundTransparency = 1,
                ZIndex = 2,
                Size = UDim2.new(1, -5, 1, -5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
            }, {
                UICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
                stroke = createElement("UIStroke", {
                    Color = v8:map(function(a1) -- Line: 181
                        return (Color3.fromRGB(80, 255, 124)):Lerp(Color3.fromRGB(91, 221, 36), a1)
                    end),
                    Thickness = v8:map(function(a1) -- Line: 184
                        return 5 + a1 * 5
                    end),
                }),
            }),
        }),
    }))
end