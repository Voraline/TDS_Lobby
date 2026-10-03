-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.cli
-- Decompile time: 5.10 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local console = v1.console
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local v2 = {}
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local readConfigs = require(script.Parent.Parent:WaitForChild("jest-config")).readConfigs
require(script.Parent.Parent:WaitForChild("jest-runtime"))
local preRunMessage = (require((script.Parent.Parent:WaitForChild("jest-util")))).preRunMessage
local default = require(script.Parent:WaitForChild("TestWatcher")).default
local formatHandleErrors = require(script.Parent:WaitForChild("collectHandles")).formatHandleErrors
local default_2 = require(script.Parent:WaitForChild("getChangedFilesPromise")).default
local default_3 = require(script.Parent:WaitForChild("getProjectNamesMissingWarning")).default
local default_4 = require(script.Parent:WaitForChild("getSelectProjectsMessage")).default
local default_5 = require((script.Parent:WaitForChild("lib")):WaitForChild("createContext")).default
local default_6 = require((script.Parent:WaitForChild("lib")):WaitForChild("logDebugMessages")).default
local default_7 = require(script.Parent:WaitForChild("pluralize")).default
local default_8 = require(script.Parent:WaitForChild("runJest")).default
require(script.Parent:WaitForChild("types"))
local print = preRunMessage.print
local nodeUtils = require(script.Parent.Parent:WaitForChild("jest-roblox-shared")).nodeUtils
local process = nodeUtils.process
local exit = nodeUtils.exit
local _run10000 = nil
local runWithoutWatch = nil

function v2.runCLI(a1, a2, a3) -- Line: 83
    -- upvalues: promise (val), Boolean (val), process (val), readConfigs (val), default_6 (val), exit (val)
    -- upvalues: default_3 (val), default_4 (val), _run10000 (ref), Error (val), formatHandleErrors (val)
    -- upvalues: default_7 (val), chalk (val), Array (val), console (val)
    return (promise.resolve()):andThen(function() -- Line: 89
        -- upvalues: Boolean (upval), a2 (val), process (upval), readConfigs (upval), a1 (val), a3 (val)
        -- upvalues: default_6 (upval), exit (upval), default_3 (upval), default_4 (upval), _run10000 (upval)
        -- upvalues: promise (upval), Error (upval), formatHandleErrors (upval), default_7 (upval), chalk (upval)
        -- upvalues: Array (upval), console (upval)
        local u0 = nil
        local stdout = if Boolean.toJSBoolean(a2.json) then process.stderr else if not Boolean.toJSBoolean(a2.useStderr) then process.stdout else process.stderr
        local v1 = readConfigs(a1, a2, a3):expect()
        local globalConfig = v1.globalConfig
        local configs = v1.configs
        local hasDeprecationWarnings = v1.hasDeprecationWarnings
        if a2.debug then
            default_6(globalConfig, configs, stdout)
        end
        if a2.showConfig then
            default_6(globalConfig, configs, process.stdout)
            exit(0)
        end
        if Boolean.toJSBoolean(a2.selectProjects) then
            local v2 = default_3(configs, {ignoreProjects = a2.ignoreProjects, selectProjects = a2.selectProjects})
            if Boolean.toJSBoolean(v2) and v2 then
                stdout:write(v2)
            end
            stdout:write((default_4(configs, {ignoreProjects = a2.ignoreProjects, selectProjects = a2.selectProjects})))
        end
        _run10000(globalConfig, configs, hasDeprecationWarnings, stdout, function(a1) -- Line: 138 -- upvalues: u0 (ref)
            u0 = a1
        end):expect()
        if not a2.watch and not a2.watchAll then
            if not Boolean.toJSBoolean(u0) then
                error(Error.new("AggregatedResult must be present after test run is complete"))
            end
            local openHandles = u0.openHandles
            if openHandles ~= nil and #openHandles > 0 then
                local v3 = formatHandleErrors(openHandles, configs[1])
                local v4 = default_7("open handle", #v3, "s")
                local v5 = (chalk.red(("\nJest has detected the following %s potentially keeping Jest from exiting:\n\n"):format(v4))) .. Array.join(v3, "\n\n")
                console.error(v5)
            end
            return {globalConfig = globalConfig, results = u0}
        end
        return (promise.new(function() end))
    end)
end

local function buildContextsAndHasteMaps(a1, a2, a3) -- Line: 174
    -- upvalues: promise (val), Array (val), default_5 (val)
    return (promise.resolve()):andThen(function() -- Line: 179 -- upvalues: Array (upval), a1 (val), promise (upval), default_5 (upval)
        local v1 = Array.map(a1, function(a1, a2) -- Line: 182 -- upvalues: promise (upval), default_5 (upval)
            return promise.resolve(default_5(a1, nil))
        end)
        return {contexts = promise.all(v1):expect()}
    end)
end

function _run10000(a1, a2, a3, a4, a5) -- Line: 204
    -- upvalues: promise (val), default_2 (val), Boolean (val), Array (val), default_5 (val), runWithoutWatch (ref)
    return (promise.resolve()):andThen(function() -- Line: 211
        -- upvalues: default_2 (upval), a1 (val), a2 (val), Boolean (upval), promise (upval), a4 (val), Array (upval)
        -- upvalues: default_5 (upval), runWithoutWatch (upval), a5 (val)
        local v1 = default_2(a1, a2)
        local v2 = nil
        if Boolean.toJSBoolean(a1.filter) and not a1.skipFilter then
            local filter = require(a1.filter)
            local u25 = nil
            if Boolean.toJSBoolean(filter.setup) then
                u25 = promise.try(function() -- Line: 226 -- upvalues: filter (val)
                    local v1, v2 = filter:setup():await()
                    if not v1 then
                        return v2
                    end
                    return nil
                end)
            end
            v2 = promise.promisify(function(a1) -- Line: 234 -- upvalues: u25 (ref), Boolean (upval), filter (val)
                if u25 ~= nil then
                    local v1 = u25:expect()
                    if Boolean.toJSBoolean(v1) then
                        error(v1)
                    end
                end
                return filter(a1)
            end)
        end
        local u33 = a2
        local contexts = ((promise.resolve()):andThen(function() -- Line: 179 -- upvalues: Array (upval), u33 (val), promise (upval), default_5 (upval)
            local v1 = Array.map(u33, function(a1, a2) -- Line: 182 -- upvalues: promise (upval), default_5 (upval)
                return promise.resolve(default_5(a1, nil))
            end)
            return {contexts = promise.all(v1):expect()}
        end):expect()).contexts
        runWithoutWatch(a1, contexts, a4, a5, v1, v2):expect()
    end)
end

function runWithoutWatch(a1, a2, a3, a4, a5, a6) -- Line: 290
    -- upvalues: promise (val), print (val), default_8 (val), default (val)
    return (promise.resolve()):andThen(function() -- Line: 298
        -- upvalues: promise (upval), a1 (val), print (upval), a3 (val), default_8 (upval), a5 (val), a2 (val), a6 (val)
        -- upvalues: a4 (val), default (upval)
        local startRun

        function startRun() -- Line: 299
            -- upvalues: promise (upval), a1 (upval), print (upval), a3 (upval), default_8 (upval), a5 (upval)
            -- upvalues: a2 (upval), a6 (upval), a4 (upval), startRun (val), default (upval)
            return (promise.resolve()):andThen(function() -- Line: 300
                -- upvalues: a1 (upval), print (upval), a3 (upval), default_8 (upval), a5 (upval), a2 (upval)
                -- upvalues: a6 (upval), a4 (upval), startRun (upval), default (upval)
                if not a1.listTests then
                    print(a3)
                end
                return default_8({
                    changedFilesPromise = a5,
                    contexts = a2,
                    filter = a6,
                    globalConfig = a1,
                    onComplete = a4,
                    outputStream = a3,
                    startRun = startRun,
                    testWatcher = default.new({isWatchMode = false}),
                })
            end)
        end

        return startRun()
    end)
end

return v2