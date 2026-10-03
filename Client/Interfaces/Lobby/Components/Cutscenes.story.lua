-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Cutscenes.story
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Cutscenes = require(script.Parent.Cutscenes)
local createElement = React.createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), Cutscenes (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 11 -- upvalues: createElement (upval), Cutscenes (upval)
        return createElement(Cutscenes, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 18 -- upvalues: u7 (val)
        u7:unmount()
    end
end