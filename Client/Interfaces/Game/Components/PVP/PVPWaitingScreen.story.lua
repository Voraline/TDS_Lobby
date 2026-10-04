-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPWaitingScreen.story
-- Decompile time: 2.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPWaitingScreen = require(script.Parent.PVPWaitingScreen)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), PVPWaitingScreen (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), PVPWaitingScreen (upval)
        local v1, u4 = React.useState(10)
        local v2, u9 = React.useState("Waiting for Players...")
        local v3, u14 = React.useState(true)
        React.useEffect(function() -- Line: 16 -- upvalues: u9 (val), u14 (val), u4 (val)
            local u2 = task.spawn(function() -- Line: 17 -- upvalues: u9 (upval), u14 (upval), u4 (upval)
                u9("Initializing...")
                task.wait(4)
                u9("Waiting for Players...")
                u14(false)
                for i = 10, 0, -1 do
                    u4(i)
                    task.wait(1)
                end
                u14(true)
                u9("Loading Game...")
            end)
            return function() -- Line: 33 -- upvalues: u2 (val)
                task.cancel(u2)
            end
        end, {})
        return createElement(PVPWaitingScreen, {counter = v1, loading = v3, status = v2})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 48 -- upvalues: u7 (val)
        u7:unmount()
    end
end