-- Script path: ReplicatedStorage.Client.Interfaces.Components.IconButton.story
-- Decompile time: 0.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IconButton = require(script.Parent.IconButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), IconButton (val), ReactRoblox (val)
    local v1 = createElement(IconButton, {
        Clicked = function() -- Line: 10
            print("Hello! I was clicked")
        end,
    })
    local u9 = ReactRoblox.createBlockingRoot(a1)
    u9:render(v1)
    return function() -- Line: 18 -- upvalues: u9 (val)
        u9:unmount()
    end
end