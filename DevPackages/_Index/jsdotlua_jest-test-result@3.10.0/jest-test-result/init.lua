-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-test-result@3.10.0.jest-test-result
-- Decompile time: 0.49 ms

local v1 = {formatTestResults = require(script:WaitForChild("formatTestResults")).default}
local helpers = require(script:WaitForChild("helpers"))
v1.addResult = helpers.addResult
v1.buildFailureTestResult = helpers.buildFailureTestResult
v1.createEmptyTestResult = helpers.createEmptyTestResult
v1.makeEmptyAggregatedTestResult = helpers.makeEmptyAggregatedTestResult
require(script:WaitForChild("types"))
return v1