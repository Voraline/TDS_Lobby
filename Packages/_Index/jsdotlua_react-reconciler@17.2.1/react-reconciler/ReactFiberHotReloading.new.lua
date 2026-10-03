-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberHotReloading.new
-- Decompile time: 0.45 ms

require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local REACT_FORWARD_REF_TYPE = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_FORWARD_REF_TYPE
return {
    resolveFunctionForHotReloading = function(a1) -- Line: 82
        if _G.__DEV__ then
            return a1
        end
        return a1
    end,
    resolveClassForHotReloading = function(a1) -- Line: 100
        if _G.__DEV__ then
            return a1
        end
        return a1
    end,
    resolveForwardRefForHotReloading = function(a1) -- Line: 106
        if _G.__DEV__ then
            return a1
        end
        return a1
    end,
    isCompatibleFamilyForHotReloading = function(a1, a2) -- Line: 144
        warn("isCompatibleFamilyForHotReloading is stubbed (returns false)")
        return false
    end,
    markFailedErrorBoundaryForHotReloading = function(a1) -- Line: 224
        if _G.__DEV__ then
            return
        end
    end,
}