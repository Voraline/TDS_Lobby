-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-snapshot@3.10.0.jest-snapshot.plugins
-- Decompile time: 0.35 ms

local mockSerializer = require(script.Parent:WaitForChild("mockSerializer"))
require(script.Parent.Parent:WaitForChild("pretty-format"))
local plugins = require(script.Parent.Parent:WaitForChild("pretty-format")).plugins
local u27 = {
    mockSerializer,
    plugins.AsymmetricMatcher,
    plugins.ReactElement,
    plugins.ReactTestComponent,
    plugins.RobloxInstance,
}
return {
    addSerializer = function(a1) -- Line: 27 -- upvalues: u27 (val)
        table.insert(u27, 1, a1)
    end,
    getSerializers = function() -- Line: 31 -- upvalues: u27 (val)
        return u27
    end,
}