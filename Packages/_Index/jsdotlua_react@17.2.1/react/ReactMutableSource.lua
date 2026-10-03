-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactMutableSource
-- Decompile time: 0.18 ms

require(script.Parent.Parent:WaitForChild("shared"))
return function(a1, a2) -- Line: 16
    local v1 = {_getVersion = a2, _source = a1}
    if _G.__DEV__ then
        v1._currentPrimaryRenderer = nil
        v1._currentSecondaryRenderer = nil
    end
    return v1
end