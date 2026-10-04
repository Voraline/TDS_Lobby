-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.BattlepassValueDisplay
-- Decompile time: 4.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local createElement = React.createElement
local useEffect = React.useEffect
local useTween = ReactFlow.useTween
return React.memo(function(a1) -- Line: 11 -- upvalues: useTween (val), useEffect (val), createElement (val), React (val)
    local textColor = a1.textColor
    if not textColor then
        textColor = Color3.new(1, 1, 1)
    end
    local color = a1.color
    if not color then
        color = Color3.fromRGB(110, 110, 110)
    end
    local icon = a1.icon
    local v1, u25 = useTween({
        info = TweenInfo.new(0.2, Enum.EasingStyle.Sine),
        start = textColor,
        target = textColor,
    })
    local v2, u34 = useTween({
        info = TweenInfo.new(0.2, Enum.EasingStyle.Sine),
        start = color,
        target = color,
    })
    local v3 = {color}
    useEffect(function() -- Line: 28 -- upvalues: u34 (val), color (val)
        u34({target = color})
    end, v3)
    v3 = {textColor}
    useEffect(function() -- Line: 34 -- upvalues: u25 (val), textColor (val)
        u25({target = textColor})
    end, v3)
    v3 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local Position = a1.Position or UDim2.fromScale(0.00481, 0.876)
    v3.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.99, 0.124)
    v3.Size = Size
    v3.AnchorPoint = a1.AnchorPoint
    v3.LayoutOrder = a1.LayoutOrder or 1
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    local v4 = {
        bG2 = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://134572808131205",
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            ImageColor3 = v2,
            ImageTransparency = a1.Transparency,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }),
    }
    local v5 = {BackgroundTransparency = 1, BorderSizePixel = 0}
    local textAnchorPoint = a1.textAnchorPoint or Vector2.new(0.5, 0.5)
    v5.AnchorPoint = textAnchorPoint
    local textPosition = a1.textPosition or UDim2.fromScale(0.5, 0.5)
    v5.Position = textPosition
    local textSize = a1.textSize or UDim2.fromScale(0.828, 0.581)
    v5.Size = textSize
    v5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    local levelText = a1.levelText or ("Level %*"):format(a1.level)
    v5.Text = levelText
    v5.TextColor3 = v1
    v5.TextTransparency = a1.Transparency
    v5.TextScaled = a1.textScale ~= false
    v5.TextSize = a1.fontSize or 14
    v5.TextWrapped = a1.textWrapped ~= false
    local textXAlignment = a1.textXAlignment or Enum.TextXAlignment.Center
    v5.TextXAlignment = textXAlignment
    local textYAlignment = a1.textYAlignment or Enum.TextYAlignment.Center
    v5.TextYAlignment = textYAlignment
    v5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal)
    v4.currentLevel = createElement("TextLabel", v5)
    v4.children = createElement(React.Fragment, {}, a1.children)
    return createElement("Frame", v3, v4)
end)