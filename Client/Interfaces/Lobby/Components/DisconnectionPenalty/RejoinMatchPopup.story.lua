-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.DisconnectionPenalty.RejoinMatchPopup.story
-- Decompile time: 1.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RejoinMatchPopup = require(script.Parent.RejoinMatchPopup)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 7 -- upvalues: React (val), RejoinMatchPopup (val)
    return React.createElement(RejoinMatchPopup, {
        Visible = React.useBinding(true),
        Offset = React.useBinding(Vector2.new(0.1, 0)),
    })
end

return function(a1) -- Line: 17 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 22 -- upvalues: u4 (val)
        u4:unmount()
    end
end