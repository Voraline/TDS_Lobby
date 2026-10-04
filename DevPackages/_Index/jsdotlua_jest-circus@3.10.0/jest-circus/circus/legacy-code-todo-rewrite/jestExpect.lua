-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.legacy-code-todo-rewrite.jestExpect
-- Decompile time: 1.10 ms

local v1 = {}
require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-types"))
local expect = require(script.Parent.Parent.Parent.Parent:WaitForChild("expect"))
local v2 = require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-snapshot"))
local addSerializer = v2.addSerializer
local toMatchSnapshot = v2.toMatchSnapshot
local toThrowErrorMatchingSnapshot = v2.toThrowErrorMatchingSnapshot

function v1.default(a1) -- Line: 28
    -- upvalues: expect (val), toMatchSnapshot (val), toThrowErrorMatchingSnapshot (val), addSerializer (val)
    expect.setState({expand = a1.expand})
    expect.extend({toMatchSnapshot = toMatchSnapshot, toThrowErrorMatchingSnapshot = toThrowErrorMatchingSnapshot})
    expect.addSnapshotSerializer = addSerializer
    return expect
end

return v1