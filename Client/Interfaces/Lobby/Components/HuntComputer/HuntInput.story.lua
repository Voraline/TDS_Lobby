-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.HuntComputer.HuntInput.story
-- Decompile time: 1.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local HuntInput = require(script.Parent.HuntInput)
local createElement = React.createElement
local useState = React.useState
return function(a1) -- Line: 11 -- upvalues: createElement (val), useState (val), HuntInput (val), ReactRoblox (val)
    local v1 = createElement(function() -- Line: 12 -- upvalues: useState (upval), createElement (upval), HuntInput (upval)
        local v1, u3 = useState(true)
        local v2, u7 = useState(false)
        local v3, u11 = useState("")
        return createElement(HuntInput, {
            uiVisible = v1,
            complete = v2,
            successText = v3,
            closed = function() -- Line: 21 -- upvalues: u3 (val)
                u3(false)
            end,
            entered = function(a1) -- Line: 24 -- upvalues: u7 (val), u11 (val) -- types: a1: string
                if string.upper(a1) ~= "PASSWORD" then
                    return false
                end
                u7(true)
                u11("The Deathwalker awaits...")
                return true
            end,
        })
    end)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 39 -- upvalues: u7 (val)
        u7:unmount()
    end
end