-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactCapturedValue
-- Decompile time: 0.18 ms

require(script.Parent:WaitForChild("ReactInternalTypes"))
local getStackByFiberInDevAndProd = require(script.Parent:WaitForChild("ReactFiberComponentStack")).getStackByFiberInDevAndProd
return {
    createCapturedValue = function(a1, a2) -- Line: 26 -- upvalues: getStackByFiberInDevAndProd (val)
        return {value = a1, source = a2, stack = getStackByFiberInDevAndProd(a2)}
    end,
}