-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.StoryBook.story
-- Decompile time: 0.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local Parent = require(script.Parent)
local createElement = React.createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 11 -- upvalues: createElement (upval), Parent (upval)
        return createElement(Parent, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 18 -- upvalues: u7 (val)
        u7:unmount()
    end
end