-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.IntermissionTopBar.init.story
-- Decompile time: 0.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement

local function convertTime(a1) -- Line: 9
    local v1 = (a1 - a1 % 60) / 60
    local v2 = a1 - v1 * 60
    if v1 > 99 then
        return nil
    end
    return (string.format("%02i", v1)) .. ":" .. string.format("%02i", v2)
end

return function(a1) -- Line: 20 -- upvalues: createElement (val), Parent (val), ReactRoblox (val)
    local v1 = {TimeLeft = 11, StatusText = "test"}
    local v2 = 11
    local v3 = (v2 - v2 % 60) / 60
    v2 = v2 - v3 * 60
    v1.TimeLeftConverted = if not (v3 > 99) then (string.format("%02i", v3)) .. ":" .. string.format("%02i", v2) else nil
    local v4 = createElement(Parent, v1)
    local u31 = ReactRoblox.createRoot(a1)
    u31:render(v4)
    return function() -- Line: 32 -- upvalues: u31 (val)
        u31:unmount()
    end
end