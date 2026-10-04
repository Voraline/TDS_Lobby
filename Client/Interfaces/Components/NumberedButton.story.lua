-- Script path: ReplicatedStorage.Client.Interfaces.Components.NumberedButton.story
-- Decompile time: 0.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NumberedButton = require(script.Parent.NumberedButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), NumberedButton (val), ReactRoblox (val)
    local v1 = createElement(NumberedButton, {
        Icon = 12289762618,
        Text = 1,
        Color = Color3.fromRGB(43, 235, 0),
        Clicked = function() -- Line: 14
            print("Hello! I was clicked")
        end,
    })
    local u14 = ReactRoblox.createBlockingRoot(a1)
    u14:render(v1)
    return function() -- Line: 22 -- upvalues: u14 (val)
        u14:unmount()
    end
end