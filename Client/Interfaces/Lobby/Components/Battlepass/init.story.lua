-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass.init.story
-- Decompile time: 1.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), Parent (upval)
        local v1, u4 = React.useState(true)
        local v2, u9 = React.useState(0)
        React.useEffect(function() -- Line: 14 -- upvalues: u9 (val)
            local u0 = true
            local u3 = task.spawn(function() -- Line: 16 -- upvalues: u0 (ref), u9 (upval)
                while u0 do
                    task.wait(1)
                    u9(function(a1) -- Line: 19
                        return a1 + math.clamp(a1 * 0.1, 100, 1000)
                    end)
                end
            end)
            return function() -- Line: 25 -- upvalues: u0 (ref), u3 (val)
                u0 = false
                task.cancel(u3)
            end
        end, {})
        return createElement(Parent, {
            name = "Tyler Smells",
            Visible = v1,
            data = {["Tyler Smells"] = {experience = v2}},
            close = function() -- Line: 41 -- upvalues: u4 (val)
                u4(false)
                task.delay(2, function() -- Line: 43 -- upvalues: u4 (upval)
                    u4(true)
                end)
            end,
        }, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 53 -- upvalues: u7 (val)
        u7:unmount()
    end
end