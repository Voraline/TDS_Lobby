-- Script path: ReplicatedStorage.Client.Interfaces.Components.GlowButton.story
-- Decompile time: 1.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GlowButton = require(script.Parent.GlowButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), GlowButton (val), ReactRoblox (val)
    local v1 = createElement(GlowButton, {
        text = "Skip",
        Position = UDim2.fromOffset(20, 20),
        AnchorPoint = Vector2.new(0, 0),
        Size = UDim2.fromOffset(150, 35),
        color = Color3.fromRGB(255, 60, 60),
    })
    local u25 = ReactRoblox.createRoot(a1)
    u25:render(v1)
    return function() -- Line: 21 -- upvalues: u25 (val)
        u25:unmount()
    end
end