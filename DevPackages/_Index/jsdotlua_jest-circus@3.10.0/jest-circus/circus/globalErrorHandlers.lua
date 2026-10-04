-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.globalErrorHandlers
-- Decompile time: 0.29 ms

local combined = require(script.Parent:WaitForChild("combined"))
return {
    injectGlobalErrorHandlers = combined.injectGlobalErrorHandlers,
    restoreGlobalErrorHandlers = combined.restoreGlobalErrorHandlers,
}