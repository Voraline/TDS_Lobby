-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.LoadOutPicker.LoadOutTimer.story
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local LoadOutTimer = require(script.Parent.LoadOutTimer)
local createElement = React.createElement
local useMemo = React.useMemo
return function(a1) -- Line: 10 -- upvalues: createElement (val), useMemo (val), LoadOutTimer (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 11 -- upvalues: useMemo (upval), createElement (upval), LoadOutTimer (upval)
        local v1 = useMemo(function() -- Line: 12
            return tick()
        end)
        return createElement(LoadOutTimer, {startsAt = v1, endsAt = v1 + 10}, {})
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 25 -- upvalues: u7 (val)
        u7:unmount()
    end
end