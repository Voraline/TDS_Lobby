-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MainObjective.MiniObjective.story
-- Decompile time: 1.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MiniObjective = require(script.Parent.MiniObjective)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 11
    -- upvalues: createElement (val), useState (val), useEffect (val), MiniObjective (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 12 -- upvalues: useState (upval), useEffect (upval), createElement (upval), MiniObjective (upval)
        local v1, u3 = useState(0)
        useEffect(function() -- Line: 15 -- upvalues: u3 (val)
            local u0 = true
            local u3_2 = task.spawn(function() -- Line: 17 -- upvalues: u0 (ref), u3 (upval)
                while u0 do
                    for i = 10, 0, -1 do
                        u3(i)
                        task.wait(0.8)
                    end
                end
            end)
            return function() -- Line: 26 -- upvalues: u0 (ref), u3_2 (val)
                u0 = false
                task.cancel(u3_2)
            end
        end, {})
        return createElement(MiniObjective, {icon = 17662427029, text = ("%*/10 Parts Repaired"):format(v1)}, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 41 -- upvalues: u7 (val)
        u7:unmount()
    end
end