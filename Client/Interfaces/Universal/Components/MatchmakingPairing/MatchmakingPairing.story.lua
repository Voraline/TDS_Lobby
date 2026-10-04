-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.MatchmakingPairing.MatchmakingPairing.story
-- Decompile time: 1.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), Parent (upval)
        local v1, u4 = React.useState(true)
        local v2, u9 = React.useState(50)
        React.useEffect(function() -- Line: 14 -- upvalues: u9 (val)
            local u2 = task.spawn(function() -- Line: 15 -- upvalues: u9 (upval)
                while task.wait(1) do
                    u9(function(a1) -- Line: 17
                        return a1 + 1
                    end)
                end
            end)
            return function() -- Line: 23 -- upvalues: u2 (val)
                task.cancel(u2)
            end
        end, {})
        return createElement(Parent, {
            canCancel = true,
            playerCountText = "1/2 Players",
            statusText = "Searching for players...",
            visible = v1,
            elapsedSeconds = v2,
            onCancel = function() -- Line: 34 -- upvalues: u4 (val), u9 (val)
                u4(false)
                task.wait(2)
                u9(0)
                u4(true)
            end,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 46 -- upvalues: u7 (val)
        u7:unmount()
    end
end