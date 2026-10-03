-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.state_
-- Decompile time: 0.22 ms

require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
local STATE_SYM = (require((script.Parent:WaitForChild("types")))).STATE_SYM
return {
    ROOT_DESCRIBE_BLOCK_NAME = "ROOT_DESCRIBE_BLOCK",
    getState = function() -- Line: 20 -- upvalues: STATE_SYM (val)
        return _G[STATE_SYM]
    end,
}