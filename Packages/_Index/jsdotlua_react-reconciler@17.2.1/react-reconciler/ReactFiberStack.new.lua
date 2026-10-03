-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberStack.new
-- Decompile time: 1.07 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local u18 = {}
local u19 = {}
local u23 = nil
if _G.__DEV__ then
    u23 = {}
end
local u24 = 0
return {
    createCursor = function(a1) -- Line: 34
        return {current = a1}
    end,
    isEmpty = function() -- Line: 40 -- upvalues: u24 (ref)
        return u24 == 0
    end,
    pop = function(a1, a2) -- Line: 44 -- upvalues: u24 (ref), console (val), u23 (ref), u19 (val), u18 (val) -- types: a1: table
        if u24 < 1 then
            if _G.__DEV__ then
                console.error("Unexpected pop.")
            end
            return
        end
        if _G.__DEV__ and a2 ~= u23[u24] then
            console.error("Unexpected Fiber popped.")
        end
        local v1 = u19[u24]
        if v1 ~= u18 then
            a1.current = v1
        else
            a1.current = nil
        end
        u19[u24] = nil
        if _G.__DEV__ then
            u23[u24] = nil
        end
        u24 = u24 - 1
    end,
    push = function(a1, a2, a3) -- Line: 76 -- upvalues: u24 (ref), u19 (val), u18 (val), u23 (ref) -- types: a1: table
        u24 = u24 + 1
        local current = a1.current
        if current ~= nil then
            u19[u24] = current
        else
            u19[u24] = u18
        end
        if _G.__DEV__ then
            u23[u24] = a3
        end
        a1.current = a2
    end,
    checkThatStackIsEmpty = function() -- Line: 93 -- upvalues: u24 (ref), console (val)
        if _G.__DEV__ and u24 ~= 0 then
            console.error("Expected an empty stack. Something was not reset properly.")
        end
    end,
    resetStackAfterFatalErrorInDev = function() -- Line: 101 -- upvalues: u24 (ref), u19 (val), u23 (ref)
        if _G.__DEV__ then
            u24 = 0
            table.clear(u19)
            table.clear(u23)
        end
    end,
}