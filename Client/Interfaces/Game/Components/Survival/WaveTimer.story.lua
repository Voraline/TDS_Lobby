-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Survival.WaveTimer.story
-- Decompile time: 0.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local WaveTimer = require(script.Parent.WaveTimer)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), React (val), WaveTimer (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 10 -- upvalues: React (upval), createElement (upval), WaveTimer (upval)
        local u3, u4 = React.useState(15)
        React.useEffect(function() -- Line: 13 -- upvalues: u3 (val), u4 (val)
            local u2 = task.spawn(function() -- Line: 14 -- upvalues: u3 (upval), u4 (upval)
                while u3 > 0 do
                    local u3_2 = task.wait()
                    u4(function(a1) -- Line: 17 -- upvalues: u3_2 (val)
                        if math.floor(a1) == 0 then
                            return (math.floor(a1))
                        end
                        return a1 - u3_2
                    end)
                end
            end)
            return function() -- Line: 27 -- upvalues: u2 (val)
                task.cancel(u2)
            end
        end, {})
        return createElement(WaveTimer, {
            size = UDim2.fromOffset(120, 60),
            anchorPoint = Vector2.new(0.5, 0),
            position = UDim2.new(0.5, 280, 0, 32),
            timeLeft = u3,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 43 -- upvalues: u7 (val)
        u7:unmount()
    end
end