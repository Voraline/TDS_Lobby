-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MainObjective.init.story
-- Decompile time: 1.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 11
    -- upvalues: createElement (val), useState (val), useEffect (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 12 -- upvalues: useState (upval), useEffect (upval), createElement (upval), Parent (upval)
        local v1, u3 = useState(true)
        local v2, u7 = useState(false)
        useEffect(function() -- Line: 16 -- upvalues: u7 (val), u3 (val)
            local u0 = true
            local u3_2 = task.spawn(function() -- Line: 18 -- upvalues: u0 (ref), u7 (upval), u3 (upval)
                while u0 do
                    task.wait(8)
                    u7(true)
                    task.wait(4)
                    u3(false)
                end
            end)
            return function() -- Line: 28 -- upvalues: u0 (ref), u3_2 (val)
                u0 = false
                task.cancel(u3_2)
            end
        end, {})
        return createElement(Parent, {icon = 17662427029, Visible = v1, completed = v2}, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 44 -- upvalues: u7 (val)
        u7:unmount()
    end
end