-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudPlayButton.story
-- Decompile time: 0.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HudPlayButton = require(script.Parent.HudPlayButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), HudPlayButton (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: createElement (upval), HudPlayButton (upval)
        return createElement(HudPlayButton, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 17 -- upvalues: u7 (val)
        u7:unmount()
    end
end