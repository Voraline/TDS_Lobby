-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudButton.story
-- Decompile time: 0.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HudButton = require(script.Parent.HudButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 11
    -- upvalues: createElement (val), useState (val), useEffect (val), HudButton (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 12 -- upvalues: useState (upval), useEffect (upval), createElement (upval), HudButton (upval)
        local v1, u3 = useState(true)
        local v2, u7 = useState(90)
        useEffect(function() -- Line: 16 -- upvalues: u7 (val)
            local u2 = task.spawn(function() -- Line: 17 -- upvalues: u7 (upval)
                while true do
                    task.wait(1)
                    u7(function(a1) -- Line: 20
                        return a1 + 1
                    end)
                end
            end)
            return function() -- Line: 26 -- upvalues: u2 (val)
                task.cancel(u2)
            end
        end, {})
        return (createElement(HudButton, {
            text = "PARTY",
            icon = 17524544403,
            level = 1,
            levelLock = 15,
            Size = UDim2.fromOffset(64, 64),
            Position = UDim2.fromOffset(100, 100),
            Visible = v1,
            notifications = v2,
            clicked = function() -- Line: 45 -- upvalues: u3 (val)
                u3(false)
                task.wait(2)
                u3(true)
            end,
        }))
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 58 -- upvalues: u7 (val)
        u7:unmount()
    end
end