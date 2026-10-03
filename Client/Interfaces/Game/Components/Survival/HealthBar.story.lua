-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Survival.HealthBar.story
-- Decompile time: 1.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HealthBar = require(script.Parent.HealthBar)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local u23 = Color3.fromHex("2DE266")
local u26 = Color3.fromHex("2D9FE2")
return function(a1) -- Line: 14
    -- upvalues: createElement (val), React (val), HealthBar (val), u23 (val), u26 (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 15 -- upvalues: React (upval), createElement (upval), HealthBar (upval), u23 (upval), u26 (upval)
        local v1, u4 = React.useState(100)
        local v2, u9 = React.useState(50)
        React.useEffect(function() -- Line: 19 -- upvalues: u4 (val), u9 (val)
            local u2 = task.spawn(function() -- Line: 20 -- upvalues: u4 (upval), u9 (upval)
                while true do
                    task.wait(3)
                    u4((math.floor(100 * (math.random()))))
                    u9((math.floor(50 * (math.random()))))
                end
            end)
            return function() -- Line: 28 -- upvalues: u2 (val)
                task.cancel(u2)
            end
        end, {})
        return createElement(HealthBar, {
            maxHealth = 100,
            size = UDim2.fromOffset(480, 32),
            position = UDim2.new(0.5, 0, 0, 36),
            anchorPoint = Vector2.new(0.5, 0),
            health = v1,
            color = u23,
            shieldColor = u26,
            shield = v2,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 48 -- upvalues: u7 (val)
        u7:unmount()
    end
end