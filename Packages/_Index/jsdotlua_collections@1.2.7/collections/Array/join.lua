-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.join
-- Decompile time: 0.33 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local map = require(script.Parent:WaitForChild("map"))
return function(a1, a2) -- Line: 5 -- upvalues: map (val) -- types: a2: string?
    if #a1 == 0 then
        return ""
    end
    return table.concat(map(a1, function(a1) -- Line: 10
        return (tostring(a1))
    end), a2 or ",")
end