-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.state
-- Decompile time: 0.14 ms

local combined = require(script.Parent:WaitForChild("combined"))
return {
    ROOT_DESCRIBE_BLOCK_NAME = combined.ROOT_DESCRIBE_BLOCK_NAME,
    resetState = combined.resetState,
    getState = combined.getState,
    setState = combined.setState,
    dispatch = combined.dispatch,
    dispatchSync = combined.dispatchSync,
    addEventHandler = combined.addEventHandler,
}