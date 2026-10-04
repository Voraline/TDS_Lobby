-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.SoftShutdown.story
-- Decompile time: 1.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SoftShutdown = require(script.Parent.SoftShutdown)
local createElement = React.createElement

local function Story() -- Line: 9 -- upvalues: React (val), SoftShutdown (val)
    return React.createElement(SoftShutdown, {}, {})
end

return function(a1) -- Line: 13 -- upvalues: ReactRoblox (val), createElement (val), Story (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Story)))
    return function() -- Line: 17 -- upvalues: u4 (val)
        u4:unmount()
    end
end