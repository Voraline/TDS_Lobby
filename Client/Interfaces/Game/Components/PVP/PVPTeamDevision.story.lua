-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTeamDevision.story
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local PVPTeamDevision = require(script.Parent.PVPTeamDevision)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), PVPTeamDevision (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: createElement (upval), PVPTeamDevision (upval)
        return createElement(PVPTeamDevision, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 17 -- upvalues: u7 (val)
        u7:unmount()
    end
end