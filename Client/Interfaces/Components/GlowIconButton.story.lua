-- Script path: ReplicatedStorage.Client.Interfaces.Components.GlowIconButton.story
-- Decompile time: 0.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GlowIconButton = require(script.Parent.GlowIconButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), GlowIconButton (val), ReactRoblox (val)
    local v1 = createElement(GlowIconButton, {
        icon = 133222778627608,
        Position = UDim2.fromOffset(20, 20),
        AnchorPoint = Vector2.new(0, 0),
        Size = UDim2.fromOffset(100, 100),
        color = Color3.fromRGB(255, 60, 60),
        iconSize = UDim2.fromScale(0.5, 0.5),
    })
    local u29 = ReactRoblox.createRoot(a1)
    u29:render(v1)
    return function() -- Line: 22 -- upvalues: u29 (val)
        u29:unmount()
    end
end