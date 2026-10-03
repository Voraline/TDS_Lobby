-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.legacy-code-todo-rewrite.jestAdapter
-- Decompile time: 2.19 ms

local v1 = require(script.Parent.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local promise = require(script.Parent.Parent.Parent.Parent:WaitForChild("promise"))
require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-environment"))
require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-types"))
require(script.Parent.Parent.Parent.Parent:WaitForChild("jest-runtime"))
local deepCyclicCopy = (require((script.Parent.Parent.Parent.Parent:WaitForChild("jest-util")))).deepCyclicCopy
local jestAdapterInit = script.Parent.jestAdapterInit
local _addSnapshotData = nil

function _addSnapshotData(a1, a2) -- Line: 138 -- upvalues: Array (val), Boolean (val)
    Array.forEach(a1.testResults, function(a1) -- Line: 139 -- upvalues: a2 (val)
        local fullName = a1.fullName
        local status = a1.status
        if status == "pending" or status == "failed" then
            a2:markSnapshotsAsCheckedForTest(fullName)
        end
    end)
    local v1 = a2:getUncheckedCount()
    local v2 = a2:getUncheckedKeys()
    if Boolean.toJSBoolean(v1) then
        a2:removeUncheckedKeys()
    end
    local v3 = a2:save()
    a1.snapshot.fileDeleted = v3.deleted
    a1.snapshot.added = a2.added
    a1.snapshot.matched = a2.matched
    a1.snapshot.unmatched = a2.unmatched
    a1.snapshot.updated = a2.updated
    a1.snapshot.unchecked = if v3.deleted then 0 else v1
    a1.snapshot.uncheckedKeys = Array.from(v2)
end

return function(a1, a2, a3, a4, a5, a6) -- Line: 36
    -- upvalues: promise (val), jestAdapterInit (val), Boolean (val), _addSnapshotData (ref), deepCyclicCopy (val)
    return (promise.resolve()):andThen(function() -- Line: 45
        -- upvalues: a4 (val), jestAdapterInit (upval), a2 (val), a3 (val), a1 (val), a6 (val), a5 (val)
        -- upvalues: Boolean (upval), _addSnapshotData (upval), deepCyclicCopy (upval)
        local v1 = a4:requireInternalModule(jestAdapterInit)
        local initialize = v1.initialize
        local runAndTransformResultsToJestFormat = v1.runAndTransformResultsToJestFormat
        local v2 = initialize({
            config = a2,
            environment = a3,
            globalConfig = a1,
            localRequire = function(...) -- Line: 53 -- upvalues: a4 (upval)
                return a4:requireModule(...)
            end,
            sendMessageToJest = a6,
            setGlobalsForRuntime = function(...) -- Line: 59 -- upvalues: a4 (upval)
                a4:setGlobalsForRuntime(...)
            end,
            testPath = a5,
        }):expect()
        local globals = v2.globals
        local snapshotState = v2.snapshotState
        a3.fakeTimers:useFakeTimers()
        globals.beforeEach(function() -- Line: 76 -- upvalues: a2 (upval), a4 (upval), Boolean (upval), a3 (upval)
            if a2.resetModules then
                a4:resetModules()
            end
            if a2.clearMocks then
                a4:clearAllMocks()
            end
            if a2.resetMocks then
                a4:resetAllMocks()
                local toJSBoolean = Boolean.toJSBoolean
                local legacyFakeTimers = if not Boolean.toJSBoolean(a2.fakeTimers.enableGlobally) then a2.fakeTimers.enableGlobally else a2.fakeTimers.legacyFakeTimers
                if toJSBoolean(legacyFakeTimers) then
                    a3.fakeTimers:useFakeTimers()
                end
            end
            if a2.restoreMocks then
                a4:restoreAllMocks()
            end
        end)
        for i, j in a2.setupFilesAfterEnv do
            a4:requireModule(j, nil, nil, nil, true)
        end
        a4:requireModule(a5, nil, nil, nil, true)
        local v3 = runAndTransformResultsToJestFormat({config = a2, globalConfig = a1, testPath = a5}):expect()
        _addSnapshotData(v3, snapshotState)
        return deepCyclicCopy(v3, {keepPrototype = false})
    end)
end