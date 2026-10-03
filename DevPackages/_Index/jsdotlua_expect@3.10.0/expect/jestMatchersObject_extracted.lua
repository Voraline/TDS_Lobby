-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.jestMatchersObject_extracted
-- Decompile time: 0.28 ms

local Symbol = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Symbol
require(script.Parent:WaitForChild("types"))
local u20 = Symbol.for_("$$jest-matchers-object")
return {
    JEST_MATCHERS_OBJECT = u20,
    getState = function() -- Line: 26 -- upvalues: u20 (val)
        return _G[u20].state
    end,
}