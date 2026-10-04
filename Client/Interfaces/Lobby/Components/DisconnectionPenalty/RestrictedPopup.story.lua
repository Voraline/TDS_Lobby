-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.DisconnectionPenalty.RestrictedPopup.story
-- Decompile time: 1.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RestrictedPopup = require(script.Parent.RestrictedPopup)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 7 -- upvalues: React (val), RestrictedPopup (val)
    local v1, u4 = React.useBinding(true)
    return React.createElement(RestrictedPopup, {
        Visible = v1,
        TimeLeft = React.useBinding(20),
        OnClose = function() -- Line: 9 -- upvalues: u4 (val)
            u4(false)
        end,
    })
end

return function(a1) -- Line: 21 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 26 -- upvalues: u4 (val)
        u4:unmount()
    end
end