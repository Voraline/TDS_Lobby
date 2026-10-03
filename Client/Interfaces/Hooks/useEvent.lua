-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useEvent
-- Decompile time: 1.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useEffect = (require(ReplicatedStorage.Shared.UI.React)).useEffect
local u11 = {"Connect", "connect", "On", "on"}
local u16 = {"Destroy", "destroy", "Disconnect", "disconnect"}

local function connect(a1, a2) -- Line: 9 -- upvalues: u11 (val)
    if typeof(a1) == "RBXScriptSignal" then
        return a1:Connect(a2)
    end
    if type(a1) == "table" then
        for i, j in u11 do
            if type(a1[j]) == "function" then
                return a1[j](a1, a2)
            end
        end
    end
    error("Invalid signal object.", 3)
end

local function createDisconnect(a1) -- Line: 25 -- upvalues: u16 (val)
    return function() -- Line: 26 -- upvalues: a1 (val), u16 (upval)
        if a1 == nil then
            return
        end
        if typeof(a1) == "RBXScriptConnection" then
            a1:Disconnect()
            return
        end
        for i, j in u16 do
            if type(a1[j]) == "function" then
                a1[j](a1)
                return
            end
        end
        error("Invalid connection object.", 4)
    end
end

return function(a1, a2, a3, a4) -- Line: 78 -- upvalues: useEffect (val), connect (val), u16 (val)
    return useEffect(function() -- Line: 79 -- upvalues: a1 (val), a4 (val), connect (upval), a2 (val), u16 (upval)
        if not a1 then
            return
        end
        if a4 and not a4() then
            return
        end
        local u7 = connect(a1, a2)
        return function() -- Line: 26 -- upvalues: u7 (val), u16 (upval)
            if u7 == nil then
                return
            end
            if typeof(u7) == "RBXScriptConnection" then
                u7:Disconnect()
                return
            end
            for i, j in u16 do
                if type(u7[j]) == "function" then
                    u7[j](u7)
                    return
                end
            end
            error("Invalid connection object.", 4)
        end
    end, a3)
end