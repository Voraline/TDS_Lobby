-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Notifications.story
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Notifications = require(script.Parent.Notifications)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local createElement = React.createElement
local useEffect = React.useEffect
local useMemo = React.useMemo
local u34 = {}
u34.Coins = Color3.fromRGB(255, 223, 0)
u34.Gems = Color3.fromRGB(0, 170, 255)
local u45 = {"Coins", "Gems"}

local function render(a1) -- Line: 19
    -- upvalues: useMemo (val), Signal (val), useEffect (val), u45 (val), Icons (val), u34 (val), createElement (val)
    -- upvalues: Notifications (val)
    local u4 = useMemo(function() -- Line: 20 -- upvalues: Signal (upval)
        return Signal.new()
    end, {})
    useEffect(function() -- Line: 24 -- upvalues: u45 (upval), u4 (val), Icons (upval), u34 (upval)
        local u2 = task.spawn(function() -- Line: 25 -- upvalues: u45 (upval), u4 (upval), Icons (upval), u34 (upval)
            local v1
            while true do
                v1 = u45[math.random(1, #u45)]
                u4:Fire({
                    text = "This is a <font color=\"rgb(210, 170, 255)\">rich</font> notification!",
                    timeout = 5,
                    icon = Icons[v1],
                    color = u34[v1],
                })
                task.wait(1)
            end
        end)
        return function() -- Line: 38 -- upvalues: u4 (upval), u2 (val)
            u4:Destroy()
            task.cancel(u2)
        end
    end, {})
    return createElement(Notifications, {onNotify = u4})
end

return function(a1) -- Line: 49 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render(createElement(render), a1)
    return function() -- Line: 53 -- upvalues: u4 (val)
        u4:unmount()
    end
end