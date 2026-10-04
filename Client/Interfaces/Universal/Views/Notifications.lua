-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Notifications
-- Decompile time: 2.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Client = ReplicatedStorage.Client
local ViewController = Client.Interfaces.LegacyInterface.Controllers.ViewController
local React = require(ReplicatedStorage.Shared.UI.React)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Notifications = require(Client.Interfaces.Universal.Components.Notifications)
local useMemo = React.useMemo
local useEffect = React.useEffect
local createElement = React.createElement

local function playSound(a1) -- Line: 28 -- upvalues: Sound (val) -- types: a1: string
    local v1 = Sound(a1)
    if v1 then
        v1:Play(true)
    end
end

return function() -- Line: 36
    -- upvalues: useMemo (val), Signal (val), useEffect (val), ViewController (val), Sound (val), createElement (val)
    -- upvalues: Notifications (val)
    local u3 = useMemo(function() -- Line: 37 -- upvalues: Signal (upval)
        return Signal.new()
    end, {})
    useEffect(function() -- Line: 41 -- upvalues: ViewController (upval), Sound (upval), u3 (val)
        local u10 = (require(ViewController):getNotificationEmitter()):On("notification", function(a1) -- Line: 44 -- upvalues: Sound (upval), u3 (upval)
            if a1.sound then
                local sound = a1.sound
                local v1 = Sound(sound)
                if v1 then
                    v1:Play(true)
                end
            elseif a1.color ~= Color3.fromRGB(255, 0, 0) then
                local Notification = Sound("Notification")
                if Notification then
                    Notification:Play(true)
                end
            else
                local Error = Sound("Error")
                if Error then
                    Error:Play(true)
                end
            end
            u3:Fire(a1)
        end)
        return function() -- Line: 56 -- upvalues: u10 (val), u3 (upval)
            u10:Disconnect()
            u3:Destroy()
        end
    end, {})
    return createElement(Notifications, {onNotify = u3})
end