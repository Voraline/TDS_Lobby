-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Crosshair.story
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Crosshair = require(script.Parent.Crosshair)
return function(a1) -- Line: 7 -- upvalues: ReactRoblox (val), React (val), Crosshair (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(Crosshair, {spread = 5})))
    return function() -- Line: 13 -- upvalues: u4 (val)
        u4:unmount()
    end
end