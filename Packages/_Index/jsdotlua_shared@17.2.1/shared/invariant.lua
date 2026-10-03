-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.invariant
-- Decompile time: 0.27 ms

local Error = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error
return function(a1, a2, ...) -- Line: 24 -- upvalues: Error (val)
    if not a1 then
        error(Error(string.format(a2, ...)))
    end
end