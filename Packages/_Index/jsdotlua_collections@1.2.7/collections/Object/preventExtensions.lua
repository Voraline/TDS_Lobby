-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Object.preventExtensions
-- Decompile time: 0.29 ms

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1) -- Line: 8
    local u3 = tostring(a1)
    return (setmetatable(a1, {
        __metatable = false,
        __newindex = function(a1, a2, a3) -- Line: 13 -- upvalues: u3 (val)
            error(("%q (%s) is not a valid member of %s"):format(tostring(a2), typeof(a2), u3), 2)
        end,
    }))
end