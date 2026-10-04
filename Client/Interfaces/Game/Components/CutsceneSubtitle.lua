-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.CutsceneSubtitle
-- Decompile time: 2.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
local useEffect = React.useEffect
local Tween = ReactFlow.Tween
local useGroupAnimation = ReactFlow.useGroupAnimation
local useAnimation = ReactFlow.useAnimation
local u39 = TweenInfo.new(0.1, Enum.EasingStyle.Sine)
local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
GetTextBoundsParams.Text = "hello world!"
GetTextBoundsParams.Font = Font.new("rbxasset://fonts/families/GrenzeGotisch.json", Enum.FontWeight.Thin)
GetTextBoundsParams.Size = 20
GetTextBoundsParams.Width = 200
return function(a1) -- Line: 25
    -- upvalues: useGroupAnimation (val), useAnimation (val), Tween (val), u39 (val), React (val)
    -- upvalues: useTransparencyModifier (val), useEffect (val), GetTextBoundsParams (val), TextService (val)
    -- upvalues: createElement (val), TextLabel (val)
    local v1, u19 = useGroupAnimation({
        default = useAnimation({transparency = Tween({target = 0, info = u39})}),
        disable = useAnimation({transparency = Tween({target = 1, info = u39})}),
    }, {transparency = 1})
    local v2, u27 = React.useBinding(UDim2.fromOffset(0, 0))
    local u31 = React.useRef(nil)
    local v3 = useTransparencyModifier(v1.transparency)
    local v4 = useEffect
    local v5 = {a1.visible, a1.text}
    v4(function() -- Line: 43 -- upvalues: u19 (val), a1 (val)
        u19(if not a1.visible then "disable" else "default")
    end, v5)
    v4 = useEffect
    v5 = {u31, a1.speaker, a1.text, a1.speakerColor}
    v4(function() -- Line: 47 -- upvalues: u31 (val), GetTextBoundsParams (upval), TextService (upval), u27 (val)
        if u31.current then
            GetTextBoundsParams.Text = u31.current.Text
            GetTextBoundsParams.Font = u31.current.FontFace
            GetTextBoundsParams.RichText = u31.current.RichText
            GetTextBoundsParams.Size = u31.current.TextSize
            GetTextBoundsParams.Width = u31.current.AbsoluteSize.X
            local TextBoundsAsync = TextService:GetTextBoundsAsync(GetTextBoundsParams)
            u27(UDim2.fromOffset(TextBoundsAsync.X + 30, TextBoundsAsync.Y + 10))
        end
        return nil
    end, v5)
    return createElement(React.Fragment, nil, {
        label = createElement(TextLabel, {
            TextScaled = false,
            TextWrapped = true,
            RichText = true,
            FontFace = "Montserrat",
            FontWeight = "Bold",
            StrokeTransparency = 0.98,
            TextSize = 20,
            Size = a1.size,
            Position = a1.position,
            Text = ("<font color=\"#%*\">%*</font>: %*"):format((a1.speakerColor or Color3.fromRGB(255, 255, 255)):ToHex(), a1.speaker, a1.text),
            AnchorPoint = a1.anchorPoint,
            TextTransparency = v1.transparency,
            TextYAlignment = Enum.TextYAlignment.Bottom,
            Visible = v1.transparency:map(function(a1) -- Line: 78
                return a1 < 1
            end),
            Ref = u31,
        }, {textSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 22})}),
        fadeImage = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://18536350728",
            ZIndex = -1,
            Size = v2,
            Position = a1.position,
            AnchorPoint = Vector2.new(0.5, 0.8),
            ImageTransparency = v3(0.7),
            ImageColor3 = Color3.new(),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(512, 512, 512, 512),
            Visible = v1.transparency:map(function(a1) -- Line: 97
                return a1 < 1
            end),
        }),
    })
end