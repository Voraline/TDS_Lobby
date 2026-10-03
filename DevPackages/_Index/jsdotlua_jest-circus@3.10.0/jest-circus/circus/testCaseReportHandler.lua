-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.testCaseReportHandler
-- Decompile time: 0.54 ms

local v1 = {}
require(script.Parent.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent.Parent:WaitForChild("jest-types"))
local utils = require(script.Parent:WaitForChild("utils"))
local makeSingleTestResult = utils.makeSingleTestResult
local parseSingleTestResult = utils.parseSingleTestResult

function v1.default(a1, a2) -- Line: 18
    -- upvalues: makeSingleTestResult (val), parseSingleTestResult (val)
    return function(a1_2, a2_2) -- Line: 19
        -- upvalues: makeSingleTestResult (upval), parseSingleTestResult (upval), a2 (val), a1 (val)
        if a2_2.name == "test_done" then
            local v1 = makeSingleTestResult(a2_2.test)
            a2("test-case-result", {a1, (parseSingleTestResult(v1))})
        end
    end
end

return v1