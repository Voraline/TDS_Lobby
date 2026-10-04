-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPHealthBar.story
-- Decompile time: 2.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPHealthBar = require(script.Parent.PVPHealthBar)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 11 -- upvalues: createElement (val), React (val), PVPHealthBar (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 12 -- upvalues: React (upval), createElement (upval), PVPHealthBar (upval)
        local v1, u4 = React.useState(100)
        local v2, u9 = React.useState(100)
        React.useEffect(function() -- Line: 16 -- upvalues: u4 (val), u9 (val)
            local u2 = task.spawn(function() -- Line: 17 -- upvalues: u4 (upval), u9 (upval)
                while true do
                    task.wait(3)
                    u4((math.floor(100 * (math.random()))))
                    u9((math.floor(100 * (math.random()))))
                end
            end)
            return function() -- Line: 25 -- upvalues: u2 (val)
                task.cancel(u2)
            end
        end, {})
        return createElement(PVPHealthBar, {
            maxHealth = 100,
            size = UDim2.fromOffset(480, 32),
            position = UDim2.new(0.5, 0, 0, 36),
            anchorPoint = Vector2.new(0.5, 0),
            leftHealth = v1,
            rightHealth = v2,
            modifiers = {{modifier = 22, amount = 4}, {modifier = 25, amount = 4}},
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 47 -- upvalues: u7 (val)
        u7:unmount()
    end
end