-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useViewEvent
-- Decompile time: 1.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u28 = nil
local React = require(ReplicatedStorage.Shared.UI.React)
local useCallback = React.useCallback
local useEffect = React.useEffect
if RunService:IsRunning() then
    u28 = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
end
return function(a1, a2, a3, a4) -- Line: 18
    -- upvalues: useEffect (val), u28 (ref), useCallback (val)
    local v1 = a4 or {a1, a2, a3}
    useEffect(function() -- Line: 19 -- upvalues: u28 (upval), a1 (val), a2 (val), a3 (val)
        if not u28 then
            return
        end
        if a1 and a2 then
            local u12 = (u28:getEmitter(a1)):On(a2, a3)
            return function() -- Line: 31 -- upvalues: u12 (val)
                u12:Disconnect()
            end
        end
    end, v1)
    return useCallback(function(...) -- Line: 36 -- upvalues: u28 (upval), a1 (val), a2 (val)
        (u28:getEmitter(a1)):Emit(a2, ...)
    end, {a1, a2})
end