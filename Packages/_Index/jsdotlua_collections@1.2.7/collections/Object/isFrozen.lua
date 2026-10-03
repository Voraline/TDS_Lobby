-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_collections@1.2.7.collections.Object.isFrozen
-- Decompile time: 0.20 ms

local __DEV__ = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(a1) -- Line: 7 -- upvalues: __DEV__ (val)
    if __DEV__ then
        print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call")
    end
    return table.isfrozen(a1)
end