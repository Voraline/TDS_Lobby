-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactTestSelectors
-- Decompile time: 0.33 ms

require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local supportsTestSelectors = require(script.Parent:WaitForChild("ReactFiberHostConfig")).supportsTestSelectors
local v1 = {}
local u19 = {}

function v1.onCommitRoot() -- Line: 511 -- upvalues: supportsTestSelectors (val), u19 (val)
    if supportsTestSelectors then
        for i, j in u19 do
            j()
        end
    end
end

return v1