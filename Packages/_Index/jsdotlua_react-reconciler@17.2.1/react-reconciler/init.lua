-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler
-- Decompile time: 0.33 ms

require(script:WaitForChild("ReactInternalTypes"))
require(script:WaitForChild("ReactRootTags"))
return function(a1) -- Line: 28
    local ReactFiberHostConfig = require(script:WaitForChild("ReactFiberHostConfig"))
    for i, j in a1 do
        ReactFiberHostConfig[i] = j
    end
    return require(script:WaitForChild("ReactFiberReconciler"))
end