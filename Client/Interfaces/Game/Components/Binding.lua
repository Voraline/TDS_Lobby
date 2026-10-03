-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Binding
-- Decompile time: 3.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local useIsTutorialMatch = require(ReplicatedStorage.Client.Interfaces.Hooks.useIsTutorialMatch)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useKeyBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useKeyBinding)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local u44 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function getTextAspectRatio(a1) -- Line: 15 -- types: a1: string
    local v1 = #a1
    if v1 <= 1 then
        return 1
    end
    return (math.clamp((v1 - 1) * 0.25 + 1, 1, 2.25))
end

return function(a1) -- Line: 24
    -- upvalues: UserInputService (val), React (val), useIsTutorialMatch (val), useKeyBinding (val), useTween (val)
    -- upvalues: u44 (val), useReactBindings (val), createElement (val)
    if not UserInputService.KeyboardEnabled and not UserInputService.GamepadEnabled then
        return
    end
    local v1, u9 = React.useState(false)
    local v2 = useIsTutorialMatch()
    local u15 = a1.Visible ~= false
    local v3 = a1.Disabled == true
    local u24 = u15
    if u24 then
        u24 = not v3
    end
    local Size = a1.Size
    if not Size then
        Size = UDim2.fromScale(0.3, 0.3)
    end
    local Binding = a1.Binding
    local Callback = a1.Callback
    local v4 = a1.Dark == true
    local v5 = a1.FitText == true
    local v6 = if not v4 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(0, 0, 0)
    local v7 = if not v4 then Color3.fromRGB(156, 156, 156) else Color3.fromRGB(255, 255, 255)
    local Transparency = if not v4 then a1.Transparency else 0.2
    local Transparency_2 = if not v4 then a1.Transparency else 0
    local v8, v9 = useKeyBinding(Binding, function() -- Line: 49 -- upvalues: u24 (val), Callback (val)
        if not u24 then
            return
        end
        if Callback then
            Callback()
        end
    end, function(a1_2) -- Line: 57 -- upvalues: a1 (val) -- types: a1_2: boolean
        if a1.Pressed then
            a1.Pressed(a1_2)
        end
    end, a1.DisableOnGameState)
    local v10, u115 = useTween(if not v8:getValue() then 1 else 0.8, u44, nil, true)
    local v11 = useReactBindings
    local v12 = {a1.Locked}
    v11(function(a1) -- Line: 66 -- upvalues: u9 (val)
        u9(a1)
    end, v12)
    v12 = {v8}
    useReactBindings(function(a1) -- Line: 70 -- upvalues: u115 (val)
        u115(if not a1 then 1 else 0.8)
    end, v12)
    v11 = v9:map(function(a1_2) -- Line: 74 -- upvalues: a1 (val)
        return a1_2 or a1.DefaultText or "?"
    end)
    local v13 = if not v5 then Size else v11:map(function(a1) -- Line: 78 -- upvalues: Size (val)
        local v1 = #a1
        local v2 = if not (v1 <= 1) then math.clamp((v1 - 1) * 0.25 + 1, 1, 2.25) else 1
        return UDim2.new(Size.Y.Scale * v2, Size.Y.Offset * v2, Size.Y.Scale, Size.Y.Offset)
    end)
    local v14 = {
        TextScaled = true,
        TextSize = 20,
        TextWrapped = true,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
        Text = v11,
    }
    v14.Visible = if v1 then false else if not v2 then v9:map(function(a1) -- Line: 98 -- upvalues: u15 (val)
        return u15 and a1 ~= ""
    end) else false
    v14.TextColor3 = v7
    v14.TextTransparency = Transparency_2
    v14.BackgroundColor3 = v6
    v14.BackgroundTransparency = Transparency
    v14.BorderColor3 = Color3.fromRGB(27, 42, 53)
    local Position = a1.Position or UDim2.new(1, -8, 1, -8)
    v14.Position = Position
    v14.Size = v13
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v14.AnchorPoint = AnchorPoint
    v14.AutomaticSize = Enum.AutomaticSize.None
    v14.ZIndex = a1.ZIndex or 1
    v14.LayoutOrder = a1.LayoutOrder or 1
    return createElement("TextLabel", v14, {
        uiAspectRatioConstraint = not v5 and createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
        uiScale = createElement("UIScale", {Scale = v10}),
        uiPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0.08, 0),
            PaddingLeft = UDim.new(0.08, 0),
            PaddingRight = UDim.new(0.08, 0),
            PaddingTop = UDim.new(0.08, 0),
        }),
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        uiStroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = v7,
            Transparency = Transparency_2,
        }),
    })
end