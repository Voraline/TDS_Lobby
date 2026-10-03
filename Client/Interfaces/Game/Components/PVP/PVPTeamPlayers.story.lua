-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTeamPlayers.story
-- Decompile time: 0.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local PVPTeamPlayers = require(script.Parent.PVPTeamPlayers)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), PVPTeamPlayers (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: createElement (upval), PVPTeamPlayers (upval)
        return createElement(PVPTeamPlayers, {
            player1 = 19004289,
            player2 = 49601674,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromOffset(1094, 128),
            Position = UDim2.fromScale(0.5, 0.5),
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 24 -- upvalues: u7 (val)
        u7:unmount()
    end
end