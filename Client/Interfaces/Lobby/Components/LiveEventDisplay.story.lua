-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LiveEventDisplay.story
-- Decompile time: 0.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u7 = require("./LiveEventDisplay")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 8 -- upvalues: React (val), u7 (val)
    local u3, u4 = React.useBinding(50000)
    React.useEffect(function() -- Line: 11 -- upvalues: u3 (val), u4 (val)
        local u2 = task.spawn(function() -- Line: 12 -- upvalues: u3 (upval), u4 (upval)
            local v1
            while true do
                if not (0 < (u3:getValue())) then
                    break
                end
                v1 = task.wait(1)
                u4(u3:getValue() - v1)
                if (u3:getValue()) < 0 then
                    u4(0)
                    return
                end
            end
        end)
        return function() -- Line: 24 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, {})
    return React.createElement(u7, {
        eventTitle = "Live Event",
        eventImageId = 100669068520755,
        eventId = "123456",
        eventTimeLeft = u3,
    })
end

return function(a1) -- Line: 37 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 42 -- upvalues: u4 (val)
        u4:unmount()
    end
end