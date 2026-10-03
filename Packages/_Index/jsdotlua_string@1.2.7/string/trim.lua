-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_string@1.2.7.string.trim
-- Decompile time: 0.17 ms

local trimStart = require(script.Parent:WaitForChild("trimStart"))
local trimEnd = require(script.Parent:WaitForChild("trimEnd"))
return function(a1) -- Line: 4 -- upvalues: trimStart (val), trimEnd (val) -- types: a1: string
    return trimStart(trimEnd(a1))
end