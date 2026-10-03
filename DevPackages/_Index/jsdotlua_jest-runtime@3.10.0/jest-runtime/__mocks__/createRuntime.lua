-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-runtime@3.10.0.jest-runtime.__mocks__.createRuntime
-- Decompile time: 0.34 ms

local promise = require(script.Parent.Parent.Parent:WaitForChild("promise"))
local Parent = require(script.Parent.Parent)
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
return function(a1, a2) -- Line: 65 -- upvalues: promise (val), Parent (val) -- types: a1: userdata
    return (promise.resolve()):andThen(function() -- Line: 71 -- upvalues: Parent (upval), a2 (val)
        local v1 = Parent.new(a2)
        v1.__mockRootPath = script.Parent.Parent.__tests__.test_root
        return v1
    end)
end