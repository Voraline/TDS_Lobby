-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-test-result@3.10.0.jest-test-result.helpers
-- Decompile time: 5.18 ms

local Boolean = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Boolean
require(script.Parent.Parent:WaitForChild("jest-types"))
require(script.Parent:WaitForChild("types"))
return {
    makeEmptyAggregatedTestResult = function() -- Line: 19
        return {
            numFailedTestSuites = 0,
            numFailedTests = 0,
            numPassedTestSuites = 0,
            numPassedTests = 0,
            numPendingTestSuites = 0,
            numPendingTests = 0,
            numRuntimeErrorTestSuites = 0,
            numTodoTests = 0,
            numTotalTestSuites = 0,
            numTotalTests = 0,
            startTime = 0,
            success = true,
            wasInterrupted = false,
            openHandles = {},
            snapshot = {
                added = 0,
                didUpdate = false,
                failure = false,
                filesAdded = 0,
                filesRemoved = 0,
                filesUnmatched = 0,
                filesUpdated = 0,
                matched = 0,
                total = 0,
                unchecked = 0,
                unmatched = 0,
                updated = 0,
                filesRemovedList = {},
                uncheckedKeysByFile = {},
            },
            testResults = {},
        }
    end,
    buildFailureTestResult = function(a1, a2) -- Line: 56
        return {
            leaks = false,
            numFailingTests = 0,
            numPassingTests = 0,
            numPendingTests = 0,
            numTodoTests = 0,
            skipped = false,
            openHandles = {},
            perfStats = {["end"] = 0, runtime = 0, slow = false, start = 0},
            snapshot = {
                added = 0,
                fileDeleted = false,
                matched = 0,
                unchecked = 0,
                unmatched = 0,
                updated = 0,
                uncheckedKeys = {},
            },
            testExecError = a2,
            testFilePath = a1,
            testResults = {},
        }
    end,
    addResult = function(a1, a2) -- Line: 84 -- upvalues: Boolean (val)
        if not Boolean.toJSBoolean(a2.numTodoTests) then
            a2.numTodoTests = 0
        end
        table.insert(a1.testResults, a2)
        a1.numTotalTests = a1.numTotalTests + (a2.numPassingTests + a2.numFailingTests + a2.numPendingTests + a2.numTodoTests)
        a1.numFailedTests = a1.numFailedTests + a2.numFailingTests
        a1.numPassedTests = a1.numPassedTests + a2.numPassingTests
        a1.numPendingTests = a1.numPendingTests + a2.numPendingTests
        a1.numTodoTests = a1.numTodoTests + a2.numTodoTests
        if Boolean.toJSBoolean(a2.testExecError) then
            a1.numRuntimeErrorTestSuites = a1.numRuntimeErrorTestSuites + 1
        end
        if not Boolean.toJSBoolean(a2.skipped) then
            local toJSBoolean = Boolean.toJSBoolean
            local testExecError = true
            if not (0 < a2.numFailingTests) then
                testExecError = a2.testExecError
            end
            if not toJSBoolean(testExecError) then
                a1.numPassedTestSuites = a1.numPassedTestSuites + 1
            else
                a1.numFailedTestSuites = a1.numFailedTestSuites + 1
            end
        else
            a1.numPendingTestSuites = a1.numPendingTestSuites + 1
        end
        if Boolean.toJSBoolean(a2.snapshot.added) then
            local snapshot = a1.snapshot
            snapshot.filesAdded = snapshot.filesAdded + 1
        end
        if Boolean.toJSBoolean(a2.snapshot.fileDeleted) then
            local snapshot_2 = a1.snapshot
            snapshot_2.filesRemoved = snapshot_2.filesRemoved + 1
        end
        if Boolean.toJSBoolean(a2.snapshot.unmatched) then
            local snapshot_3 = a1.snapshot
            snapshot_3.filesUnmatched = snapshot_3.filesUnmatched + 1
        end
        if Boolean.toJSBoolean(a2.snapshot.updated) then
            local snapshot_4 = a1.snapshot
            snapshot_4.filesUpdated = snapshot_4.filesUpdated + 1
        end
        local snapshot_5 = a1.snapshot
        snapshot_5.added = snapshot_5.added + a2.snapshot.added
        local snapshot_6 = a1.snapshot
        snapshot_6.matched = snapshot_6.matched + a2.snapshot.matched
        local snapshot_7 = a1.snapshot
        snapshot_7.unchecked = snapshot_7.unchecked + a2.snapshot.unchecked
        local toJSBoolean_2 = Boolean.toJSBoolean
        if toJSBoolean_2(if not Boolean.toJSBoolean(a2.snapshot.uncheckedKeys) then a2.snapshot.uncheckedKeys else #a2.snapshot.uncheckedKeys > 0) then
            table.insert(a1.snapshot.uncheckedKeysByFile, {filePath = a2.testFilePath, keys = a2.snapshot.uncheckedKeys})
        end
        local snapshot_9 = a1.snapshot
        snapshot_9.unmatched = snapshot_9.unmatched + a2.snapshot.unmatched
        local snapshot_10 = a1.snapshot
        snapshot_10.updated = snapshot_10.updated + a2.snapshot.updated
        local snapshot_11 = a1.snapshot
        snapshot_11.total = snapshot_11.total + (a2.snapshot.added + a2.snapshot.matched + a2.snapshot.unmatched + a2.snapshot.updated)
    end,
    createEmptyTestResult = function() -- Line: 138
        return {
            leaks = false,
            numFailingTests = 0,
            numPassingTests = 0,
            numPendingTests = 0,
            numTodoTests = 0,
            skipped = false,
            testFilePath = "",
            openHandles = {},
            perfStats = {["end"] = 0, runtime = 0, slow = false, start = 0},
            snapshot = {
                added = 0,
                fileDeleted = false,
                matched = 0,
                unchecked = 0,
                unmatched = 0,
                updated = 0,
                uncheckedKeys = {},
            },
            testResults = {},
        }
    end,
}