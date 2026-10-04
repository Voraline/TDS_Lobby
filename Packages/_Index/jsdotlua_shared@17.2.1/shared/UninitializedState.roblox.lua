-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.UninitializedState.roblox
-- Decompile time: 0.31 ms

local console = require(script.Parent:WaitForChild("console"))
local v1 = {}
local v2 = {
    __metatable = "UninitializedState",
    __index = function(a1, a2) -- Line: 23 -- upvalues: console (val)
        if _G.__DEV__ then
            console.warn("Attempted to access uninitialized state. Use setState to initialize state")
        end
        return nil
    end,
    __newindex = function(a1, a2) -- Line: 31 -- upvalues: console (val)
        if _G.__DEV__ then
            console.error("Attempted to directly mutate state. Use setState to assign new values to state.")
        end
        return nil
    end,
    __tostring = function(a1) -- Line: 39
        return "<uninitialized component state>"
    end,
}
setmetatable(v1, v2)
return v1