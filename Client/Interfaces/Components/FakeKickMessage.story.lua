-- Script path: ReplicatedStorage.Client.Interfaces.Components.FakeKickMessage.story
-- Decompile time: 1.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FakeKickMessage = require(ReplicatedStorage.Client.Interfaces.Components.FakeKickMessage)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function render() -- Line: 7 -- upvalues: createElement (val), FakeKickMessage (val)
    return createElement(FakeKickMessage, {kickMessage = "You were kicked from this experience: You are too good\n(Error Code: 267)"})
end

return function(a1) -- Line: 13 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render)))
    return function() -- Line: 17 -- upvalues: u4 (val)
        u4:unmount()
    end
end