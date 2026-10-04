-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Survival.Wave.story
-- Decompile time: 2.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Wave = require(script.Parent.Wave)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), Wave (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), Wave (upval)
        local v1, u4 = React.useState(16)
        local v2, u9 = React.useState(false)
        React.useEffect(function() -- Line: 14 -- upvalues: u9 (val), u4 (val)
            local u2 = task.spawn(function() -- Line: 15 -- upvalues: u9 (upval), u4 (upval)
                local v1
                while true do
                    task.wait(3)
                    v1 = u9
                    if math.random(1, 2) == 1 then
                        v1(true)
                    else
                        v1(false)
                    end
                    u4(function(a1) -- Line: 19
                        return a1 + 1
                    end)
                end
            end)
            return function() -- Line: 25 -- upvalues: u2 (val)
                task.cancel(u2)
            end
        end, {})
        return createElement(Wave, {
            size = UDim2.fromOffset(120, 60),
            position = UDim2.new(0.5, -305, 0, 32),
            anchorPoint = Vector2.new(0.5, 0),
            wave = v1,
            hiddenWave = v2,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 42 -- upvalues: u7 (val)
        u7:unmount()
    end
end