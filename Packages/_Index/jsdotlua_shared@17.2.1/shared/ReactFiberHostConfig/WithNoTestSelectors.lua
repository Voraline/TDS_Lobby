-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactFiberHostConfig.WithNoTestSelectors
-- Decompile time: 0.19 ms

local invariant = require(script.Parent.Parent:WaitForChild("invariant"))

local function shim(...) -- Line: 16 -- upvalues: invariant (val)
    invariant(
        false,
        "The current renderer does not support test selectors. This error is likely caused by a bug in React. Please file an issue."
    )
end

return {
    supportsTestSelectors = false,
    findFiberRoot = shim,
    getBoundingRect = shim,
    getTextContent = shim,
    isHiddenSubtree = shim,
    matchAccessibilityRole = shim,
    setFocusIfFocusable = shim,
    setupIntersectionObserver = shim,
}