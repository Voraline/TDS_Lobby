-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.ToastNotification.story
-- Decompile time: 2.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local ToastNotification = require(script.Parent.ToastNotification)
local u25 = {
    "First toast message",
    "Second toast message",
    "Third toast message",
    "Fourth toast message",
    "Fifth toast message",
    "Sixth toast message",
    "Seventh toast message",
    "Eighth toast message",
}
return {
    react = React,
    reactRoblox = ReactRoblox,
    story = function() -- Line: 22 -- upvalues: React (val), Signal (val), u25 (val), ToastNotification (val)
        local u4 = React.useMemo(function() -- Line: 23 -- upvalues: Signal (upval)
            return Signal.new()
        end, {})
        React.useEffect(function() -- Line: 27 -- upvalues: u4 (val), u25 (upval)
            local u0 = true
            task.spawn(function() -- Line: 30 -- upvalues: u0 (ref), u4 (upval), u25 (upval)
                while u0 do
                    u4:Fire(u25[(math.random(1, #u25))])
                    task.wait(math.random(2, 5))
                end
            end)
            return function() -- Line: 38 -- upvalues: u0 (ref)
                u0 = false
            end
        end, {})
        return React.createElement(ToastNotification, {
            native = {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromScale(0.8, 0.3),
                Position = UDim2.fromScale(0.5, 0.5),
            },
            onEvent = u4,
        })
    end,
}