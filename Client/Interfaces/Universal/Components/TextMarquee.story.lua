-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee.story
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TextMarquee = require(script.Parent.TextMarquee)
local createElement = React.createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), TextMarquee (val), ReactRoblox (val)
    local v1 = createElement(TextMarquee, {
        TextSize = 50,
        Text = "Hellloooo mewious!",
        Size = UDim2.new(0, 200, 0, 50),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
    local u22 = ReactRoblox.createRoot(a1)
    u22:render(v1)
    return function() -- Line: 23 -- upvalues: u22 (val)
        u22:unmount()
    end
end