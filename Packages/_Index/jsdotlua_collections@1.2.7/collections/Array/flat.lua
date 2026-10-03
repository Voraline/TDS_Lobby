-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Array.flat
-- Decompile time: 0.80 ms

local flat
local __DEV__ = _G.__DEV__
local isArray = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))

function flat(a1, a2) -- Line: 5 -- upvalues: __DEV__ (val), isArray (val), flat (val) -- types: a2: number?
    if __DEV__ then
        if typeof(a1) ~= "table" then
            error(string.format("Array.flat called on %s", (typeof(a1))))
        end
        if a2 ~= nil and typeof(a2) ~= "number" then
            error("depth is not a number or nil")
        end
    end
    local v1 = a2 or 1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        if not isArray(j) then
            table.insert(v2, j)
        else
            for k, n in if not (v1 > 1) then j else flat(j, v1 - 1) do
                table.insert(v2, n)
            end
        end
    end
    return v2
end

return flat