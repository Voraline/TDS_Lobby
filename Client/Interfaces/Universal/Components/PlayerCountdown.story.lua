-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PlayerCountdown.story
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerCountdown = require(script.Parent.PlayerCountdown)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Story() -- Line: 9 -- upvalues: React (val), PlayerCountdown (val)
    return React.createElement(PlayerCountdown, {Visible = true, endTime = tick() + 10}, {})
end

return function(a1) -- Line: 16 -- upvalues: ReactRoblox (val), createElement (val), Story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Story)))
    return function() -- Line: 20 -- upvalues: u4 (val)
        u4:unmount()
    end
end