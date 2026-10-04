-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.runJest
-- Decompile time: 13.24 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local Set = v1.Set
local console = v1.console
local Boolean = v1.Boolean
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local v2 = {}
local CustomConsole = require(script.Parent.Parent:WaitForChild("jest-console")).CustomConsole
local v3 = require(script.Parent.Parent:WaitForChild("jest-test-result"))
local formatTestResults = v3.formatTestResults
local makeEmptyAggregatedTestResult = v3.makeEmptyAggregatedTestResult
require(script.Parent.Parent:WaitForChild("jest-types"))
require(script.Parent.Parent:WaitForChild("jest-runtime"))
local default = (require((script.Parent:WaitForChild("SearchSource")))).default
local createTestScheduler = (require((script.Parent:WaitForChild("TestScheduler")))).createTestScheduler
require(script.Parent:WaitForChild("TestWatcher"))
local default_2 = require(script.Parent:WaitForChild("getNoTestsFoundMessage")).default
require(script.Parent:WaitForChild("types"))
local v4 = require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local nodeUtils = v4.nodeUtils
local process = nodeUtils.process
local exit = nodeUtils.exit
local JSON = nodeUtils.JSON
local ensureDirectoryExists = v4.ensureDirectoryExists
local getDataModelService = v4.getDataModelService
local FileSystemService = getDataModelService("FileSystemService")
local CoreScriptSyncService = getDataModelService("CoreScriptSyncService")

local function getTestPaths(a1, a2, a3, a4, a5, a6) -- Line: 102
    -- upvalues: promise (val), Array (val), Object (val)
    return (promise.resolve()):andThen(function() -- Line: 110
        -- upvalues: a2 (val), a1 (val), a4 (val), a6 (val), promise (upval), Array (upval), Object (upval)
        local v1 = a2:getTestPaths(a1, a4, a6):expect()
        local u20 = promise.all(Array.map(v1.tests, function(a1) -- Line: 125 -- upvalues: promise (upval)
            return promise.resolve(true)
        end)):expect()
        local v2 = Array.filter(v1.tests, function(a1, a2) -- Line: 136 -- upvalues: u20 (val)
            return u20[a2]
        end)
        return Object.assign({}, v1, {allTests = #v2, tests = v2})
    end)
end

local function processResults(a1, a2) -- Line: 162
    -- upvalues: promise (val), FileSystemService (val), Boolean (val), ensureDirectoryExists (val), JSON (val)
    -- upvalues: formatTestResults (val), process (val)
    return (promise.resolve()):andThen(function() -- Line: 163
        -- upvalues: a2 (val), a1 (val), FileSystemService (upval), Boolean (upval), ensureDirectoryExists (upval)
        -- upvalues: JSON (upval), formatTestResults (upval), process (upval)
        local outputFile = a2.outputFile
        local json = a2.json
        local onComplete = a2.onComplete
        a1.openHandles = {}
        if json then
            if not outputFile or not FileSystemService or not Boolean.toJSBoolean(outputFile) then
                process.stdout:write((JSON.stringify((formatTestResults(a1)))))
            else
                ensureDirectoryExists(outputFile)
                FileSystemService:WriteFile(outputFile, (JSON.stringify((formatTestResults(a1)))))
                process.stdout:write((("Test results written to: %s\n"):format((tostring(outputFile)))))
            end
        end
        if onComplete ~= nil then
            onComplete(a1)
        end
    end)
end

local u129 = {firstRun = true, previousSuccess = true}

function v2.default(a1) -- Line: 206
    -- upvalues: promise (val), Array (val), default (val), Object (val), Set (val), CoreScriptSyncService (val)
    -- upvalues: console (val), JSON (val), makeEmptyAggregatedTestResult (val), default_2 (val), CustomConsole (val)
    -- upvalues: exit (val), createTestScheduler (val), u129 (val), FileSystemService (val), Boolean (val)
    -- upvalues: ensureDirectoryExists (val), formatTestResults (val), process (val)
    local contexts = a1.contexts
    local globalConfig = a1.globalConfig
    local outputStream = a1.outputStream
    local testWatcher = a1.testWatcher
    local startRun = a1.startRun
    local changedFilesPromise = a1.changedFilesPromise
    local onComplete = a1.onComplete
    local failedTestsCache = a1.failedTestsCache
    local filter = a1.filter
    return ((promise.resolve()):andThen(function() -- Line: 234
        -- upvalues: Array (upval), contexts (val), default (upval), promise (upval), globalConfig (ref)
        -- upvalues: outputStream (val), filter (val), Object (upval), Set (upval), CoreScriptSyncService (upval)
        -- upvalues: console (upval), JSON (upval), onComplete (val), makeEmptyAggregatedTestResult (upval)
        -- upvalues: default_2 (upval), CustomConsole (upval), exit (upval), createTestScheduler (upval), startRun (val)
        -- upvalues: u129 (upval), testWatcher (val), FileSystemService (upval), Boolean (upval)
        -- upvalues: ensureDirectoryExists (upval), formatTestResults (upval), process (upval)
        local v1
        local u0 = {}
        local u5 = Array.map(contexts, function(a1) -- Line: 263 -- upvalues: default (upval)
            return default.new(a1)
        end)
        local v2 = promise.all(Array.map(contexts, function(a1, a2) -- Line: 267
            -- upvalues: promise (upval), u5 (val), globalConfig (upval), outputStream (upval), filter (upval)
            -- upvalues: Array (upval), Object (upval), u0 (ref)
            return (promise.resolve()):andThen(function() -- Line: 268
                -- upvalues: u5 (upval), a2 (val), globalConfig (upval), outputStream (upval), filter (upval)
                -- upvalues: promise (upval), Array (upval), Object (upval), u0 (upval), a1 (val)
                local u2 = u5[a2]
                local u3 = globalConfig
                local u5_2 = filter
                local v1 = promise.resolve()
                local u9 = nil
                local v2 = v1:andThen(function() -- Line: 110
                    -- upvalues: u2 (val), u3 (val), u9 (val), u5_2 (val), promise (upval), Array (upval)
                    -- upvalues: Object (upval)
                    local v1 = u2:getTestPaths(u3, u9, u5_2):expect()
                    local u20 = promise.all(Array.map(v1.tests, function(a1) -- Line: 125 -- upvalues: promise (upval)
                        return promise.resolve(true)
                    end)):expect()
                    local v2 = Array.filter(v1.tests, function(a1, a2) -- Line: 136 -- upvalues: u20 (val)
                        return u20[a2]
                    end)
                    return Object.assign({}, v1, {allTests = #v2, tests = v2})
                end):expect()
                u0 = Array.concat(u0, v2.tests)
                return {context = a1, matches = v2}
            end)
        end)):expect()
        if globalConfig.listTests then
            local v3 = u0
            local v4 = Array.from(Set.new(Array.map(v3, function(a1) -- Line: 293 -- upvalues: CoreScriptSyncService (upval)
                if CoreScriptSyncService then
                    return CoreScriptSyncService:GetScriptFilePath(a1.script)
                end
                return a1.path
            end)))
            if not globalConfig.json then
                console.log(Array.join(v4, "\n"))
            else
                console.log(JSON.stringify(v4))
            end
            if onComplete ~= nil then
                onComplete(makeEmptyAggregatedTestResult())
            end
            return
        end
        if not (#u0 > 0) then
            v1 = default_2(v2, globalConfig)
            local exitWith0 = v1.exitWith0
            local message = v1.message
            if not exitWith0 then
                (CustomConsole.new(outputStream, outputStream)):error(message)
                exit(1)
            else
                (CustomConsole.new(outputStream, outputStream)):log(message)
            end
        elseif #u0 == 1 and globalConfig.silent ~= true and globalConfig.verbose ~= false then
            v1 = Object.assign({}, globalConfig, {verbose = true})
            globalConfig = Object.freeze(v1)
        end
        local u122 = (createTestScheduler(globalConfig, Object.assign({}, {startRun = startRun}, u129)):expect()):scheduleTests(u0, testWatcher):expect()
        local u123 = {}
        u123.json = globalConfig.json
        u123.onComplete = onComplete
        u123.outputFile = globalConfig.outputFile
        u123.outputStream = outputStream
        ;(promise.resolve()):andThen(function() -- Line: 163
            -- upvalues: u123 (val), u122 (val), FileSystemService (upval), Boolean (upval)
            -- upvalues: ensureDirectoryExists (upval), JSON (upval), formatTestResults (upval), process (upval)
            local outputFile = u123.outputFile
            local json = u123.json
            local onComplete = u123.onComplete
            u122.openHandles = {}
            if json then
                if not outputFile or not FileSystemService or not Boolean.toJSBoolean(outputFile) then
                    process.stdout:write((JSON.stringify((formatTestResults(u122)))))
                else
                    ensureDirectoryExists(outputFile)
                    FileSystemService:WriteFile(outputFile, (JSON.stringify((formatTestResults(u122)))))
                    process.stdout:write((("Test results written to: %s\n"):format((tostring(outputFile)))))
                end
            end
            if onComplete ~= nil then
                onComplete(u122)
            end
        end):expect()
    end))
end

return v2