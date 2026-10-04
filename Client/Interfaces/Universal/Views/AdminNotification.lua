-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.AdminNotification
-- Decompile time: 1.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local ToastNotification = require(ReplicatedStorage.Client.Interfaces.Universal.Components.ToastNotification)
local Notifications = NewNetwork.Channel("Notifications")
local createElement = React.createElement
local useEffect = React.useEffect
local useMemo = React.useMemo
return function() -- Line: 15
    -- upvalues: useMemo (val), Signal (val), useEffect (val), Notifications (val), createElement (val)
    -- upvalues: ToastNotification (val)
    local u3 = useMemo(function() -- Line: 16 -- upvalues: Signal (upval)
        return Signal.new()
    end, {})
    useEffect(function() -- Line: 20 -- upvalues: Notifications (upval), u3 (val)
        return Notifications:onEvent("PushToast", function(...) -- Line: 21 -- upvalues: u3 (upval)
            u3:Fire(...)
        end)
    end, {})
    return createElement(ToastNotification, {
        native = {
            AnchorPoint = Vector2.new(0.5, 0),
            Size = UDim2.fromScale(0.3, 0.2),
            Position = UDim2.fromScale(0.5, 0.05),
        },
        onEvent = u3,
    })
end