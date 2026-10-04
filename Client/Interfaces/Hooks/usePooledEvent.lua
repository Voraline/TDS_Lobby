-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePooledEvent
-- Decompile time: 3.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useEffect = (require(ReplicatedStorage.Shared.UI.React)).useEffect
local u11 = {"Connect", "connect", "on"}
local u15 = {"Destroy", "destroy", "Disconnect", "disconnect"}
local u20 = {}
local u21 = {}

local function getConnectionMethod(a1) -- Line: 12 -- upvalues: u11 (val)
    if typeof(a1) == "RBXScriptSignal" then
        return "Connect"
    end
    if typeof(a1) == "table" then
        for i, j in u11 do
            if type(a1[j]) == "function" then
                return j
            end
        end
    end
    error("Invalid signal object.", 3)
end

local function connectEvent(a1, a2) -- Line: 26 -- upvalues: u20 (val), getConnectionMethod (val), u21 (val), u15 (val)
    local u7 = u20[a1]
    if not u7 then
        local v1 = getConnectionMethod(a1)
        u7 = {}
        u20[a1] = u7
        u21[a1] = (a1[v1](a1, function(...) -- Line: 34 -- upvalues: u7 (ref)
            for i in u7 do
                i(...)
            end
        end))
    end
    u7[a2] = true
    return function() -- Line: 43 -- upvalues: u7 (ref), a2 (val), u21 (upval), a1 (val), u15 (upval)
        u7[a2] = nil
        if next(u7) ~= nil then
            return
        end
        local v1 = u21[a1]
        if v1 == nil then
            return
        end
        u21[a1] = nil
        if typeof(v1) == "RBXScriptConnection" then
            v1:Disconnect()
            return
        end
        for i, j in u15 do
            if type(v1[j]) == "function" then
                v1[j](v1)
                return
            end
        end
        error("Invalid connection object.", 4)
    end
end

return function(a1, a2, a3, a4) -- Line: 103 -- upvalues: useEffect (val), connectEvent (val)
    return useEffect(function() -- Line: 104 -- upvalues: a4 (val), connectEvent (upval), a1 (val), a2 (val)
        if a4 and not a4() then
            return
        end
        return (connectEvent(a1, a2))
    end, a3)
end