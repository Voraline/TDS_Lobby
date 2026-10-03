-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard.init.story
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), Parent (upval)
        React.useState(true)
        return createElement(Parent, {
            aspectRatio = 0.904651,
            size = UDim2.fromScale(0.2, 0.2),
            position = UDim2.fromScale(0.5, 0.5),
        }, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 23 -- upvalues: u7 (val)
        u7:unmount()
    end
end