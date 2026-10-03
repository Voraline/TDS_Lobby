-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Timer.story
-- Decompile time: 0.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Timer = require(script.Parent.Timer)
local createElement = React.createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), Timer (val), ReactRoblox (val)
    local v1 = createElement(Timer, {TimeLeft = 518400, TimerTemplate = "Restock in %s"})
    local u8 = ReactRoblox.createRoot(a1)
    u8:render(v1)
    return function() -- Line: 19 -- upvalues: u8 (val)
        u8:unmount()
    end
end