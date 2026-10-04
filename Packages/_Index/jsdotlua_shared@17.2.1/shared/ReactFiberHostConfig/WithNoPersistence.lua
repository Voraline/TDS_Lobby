-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactFiberHostConfig.WithNoPersistence
-- Decompile time: 0.16 ms

local invariant = require(script.Parent.Parent:WaitForChild("invariant"))

local function shim(...) -- Line: 16 -- upvalues: invariant (val)
    invariant(
        false,
        "The current renderer does not support persistence. This error is likely caused by a bug in React. Please file an issue."
    )
end

return {
    supportsPersistence = false,
    cloneInstance = shim,
    cloneFundamentalInstance = shim,
    createContainerChildSet = shim,
    appendChildToContainerChildSet = shim,
    finalizeContainerChildren = shim,
    replaceContainerChildren = shim,
    cloneHiddenInstance = shim,
    cloneHiddenTextInstance = shim,
}