-- Script path: ReplicatedStorage.Client.Interfaces.Components.PlayButton.story
-- Decompile time: 1.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayButton = require(script.Parent.PlayButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), PlayButton (val), ReactRoblox (val)
    local v1 = createElement(PlayButton, {
        Text = "Play",
        Size = UDim2.fromScale(0.08, 0.08),
        Position = UDim2.new(0.5, 0, 0.8, 20),
        AnchorPoint = Vector2.new(0.5, 0),
        Clicked = function() -- Line: 16
            print("Hello! I was clicked")
        end,
    })
    local u23 = ReactRoblox.createRoot(a1)
    u23:render(v1)
    return function() -- Line: 24 -- upvalues: u23 (val)
        u23:unmount()
    end
end