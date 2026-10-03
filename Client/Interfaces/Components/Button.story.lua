-- Script path: ReplicatedStorage.Client.Interfaces.Components.Button.story
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(script.Parent.Button)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), Button (val), ReactRoblox (val)
    local v1 = createElement(Button, {
        Text = "Hello world!",
        Icon = "rbxassetid://6794338720",
        IconScale = 0.7,
        Clicked = function() -- Line: 14
            print("Hello! I was clicked")
        end,
    })
    local u9 = ReactRoblox.createRoot(a1)
    u9:render(v1)
    return function() -- Line: 22 -- upvalues: u9 (val)
        u9:unmount()
    end
end