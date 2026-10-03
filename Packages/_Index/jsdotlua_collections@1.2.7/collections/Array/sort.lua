-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.sort
-- Decompile time: 0.61 ms

local None = require((script.Parent.Parent:WaitForChild("Object")):WaitForChild("None"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))

local function u23(a1, a2) -- Line: 5
    return (type(a1)) .. tostring(a1) < (type(a2)) .. tostring(a2)
end

return function(a1, a2) -- Line: 9 -- upvalues: u23 (val), None (val) -- types: a2: function?
    local v1 = u23
    if a2 ~= nil and a2 ~= None then
        if typeof(a2) ~= "function" then
            error("invalid argument to Array.sort: compareFunction must be a function")
        end

        function v1(a1, a2_2) -- Line: 16 -- upvalues: a2 (val)
            local v1 = a2(a1, a2_2)
            if typeof(v1) ~= "number" then
                error(("invalid result from compare function, expected number but got %s"):format((typeof(v1))))
            end
            return v1 < 0
        end
    end
    table.sort(a1, v1)
    return a1
end