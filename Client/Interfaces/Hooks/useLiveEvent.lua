-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useLiveEvent
-- Decompile time: 1.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = require(ReplicatedStorage.Shared.Data.Events)
local React = require(ReplicatedStorage.Shared.UI.React)
local useRef = React.useRef
local useEffect = React.useEffect
return function(a1) -- Line: 9 -- upvalues: useRef (val), Events (val), useEffect (val) -- types: a1: string
    local u6, u7 = useRef(Events.isActive(a1))
    useEffect(function() -- Line: 12 -- upvalues: u6 (val), Events (upval), a1 (val), u7 (val)
        if u6 then
            return
        end
        local u1 = nil
        local v1 = Events.Started:Connect(function(a1_2) -- Line: 18 -- upvalues: a1 (upval), u1 (ref), u7 (upval)
            if a1 ~= a1_2 then
                return
            end
            u1:Disconnect()
            u7(true)
        end)
    end, {})
    return u6
end