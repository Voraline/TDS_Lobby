-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.includes
-- Decompile time: 0.27 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local indexOf = require(script.Parent:WaitForChild("indexOf"))
return function(a1, a2, a3) -- Line: 5 -- upvalues: indexOf (val) -- types: a3: number?
    return indexOf(a1, a2, a3) ~= -1
end