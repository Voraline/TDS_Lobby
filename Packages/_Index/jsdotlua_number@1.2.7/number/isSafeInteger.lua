-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_number@1.2.7.number.isSafeInteger
-- Decompile time: 0.21 ms

local isInteger = require(script.Parent:WaitForChild("isInteger"))
local MAX_SAFE_INTEGER = require(script.Parent:WaitForChild("MAX_SAFE_INTEGER"))
return function(a1) -- Line: 5 -- upvalues: isInteger (val), MAX_SAFE_INTEGER (val)
    return isInteger(a1) and (math.abs(a1)) <= MAX_SAFE_INTEGER
end