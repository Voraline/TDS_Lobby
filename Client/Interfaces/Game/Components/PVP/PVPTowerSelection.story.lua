-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerSelection.story
-- Decompile time: 1.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPTowerSelection = require(script.Parent.PVPTowerSelection)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), PVPTowerSelection (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), PVPTowerSelection (upval)
        React.useEffect(function() end, {})
        return createElement(PVPTowerSelection, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 19 -- upvalues: u7 (val)
        u7:unmount()
    end
end