-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.SkipButton
-- Decompile time: 1.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 10 -- upvalues: useState (val), useEffect (val), createElement (val), GlowButton (val)
    local visible = a1.visible
    local onActivated = a1.onActivated
    local v1, u6 = useState(visible)
    local v2 = {visible}
    useEffect(function() -- Line: 16 -- upvalues: u6 (val), visible (val)
        u6(visible)
    end, v2)
    if not v1 then
        return nil
    end
    return createElement(GlowButton, {
        text = "Skip",
        AnchorPoint = Vector2.new(1, 1),
        Size = UDim2.fromScale(0.1, 0.1),
        Position = UDim2.new(1, -15, 1, -15),
        textColor = Color3.fromRGB(255, 255, 255),
        color = Color3.fromRGB(83, 255, 83),
        clicked = onActivated,
    }, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 3}),
        sizeConstraint = createElement("UISizeConstraint", {MaxSize = 125 * Vector2.one, MinSize = 40 * Vector2.one}),
    })
end