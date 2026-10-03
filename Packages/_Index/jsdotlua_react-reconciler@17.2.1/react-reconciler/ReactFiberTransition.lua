-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberTransition
-- Decompile time: 0.19 ms

local ReactCurrentBatchConfig = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentBatchConfig
return {
    NoTransition = 0,
    requestCurrentTransition = function() -- Line: 18 -- upvalues: ReactCurrentBatchConfig (val)
        return ReactCurrentBatchConfig.transition
    end,
}