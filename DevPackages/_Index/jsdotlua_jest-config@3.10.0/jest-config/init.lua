-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config
-- Decompile time: 7.20 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local Map = v1.Map
local Object = v1.Object
local promise = require(script.Parent:WaitForChild("promise"))
local v2 = {}
local chalk = require(script.Parent:WaitForChild("chalk"))
require(script.Parent:WaitForChild("jest-types"))
local constants = require(script:WaitForChild("constants"))
local default = require(script:WaitForChild("normalize")).default
local default_2 = require(script:WaitForChild("readConfigFileAndSetRootDir")).default
local default_3 = require(script:WaitForChild("resolveConfigPath")).default
local isJSONString = require(script:WaitForChild("utils")).isJSONString
v2.isJSONString = require(script:WaitForChild("utils")).isJSONString
v2.normalize = require(script:WaitForChild("normalize")).default
v2.defaults = require(script:WaitForChild("Defaults")).default
v2.constants = constants
local JSON = require(script.Parent:WaitForChild("jest-roblox-shared")).nodeUtils.JSON
local groupOptions = nil

local function readConfig(a1, a2, a3, a4, a5, a6, a7) -- Line: 83
    -- upvalues: promise (val), Error (val), isJSONString (val), JSON (val), Boolean (val), default_3 (val)
    -- upvalues: default_2 (val), default (val), groupOptions (ref)
    if a6 == nil then
        a6 = (1 / 0)
    end
    if a7 == nil then
        a7 = false
    end
    return ((promise.resolve()):andThen(function() -- Line: 106
        -- upvalues: a3 (val), Error (upval), isJSONString (upval), a2 (val), JSON (upval), Boolean (upval), a4 (val)
        -- upvalues: default_3 (upval), a1 (val), a7 (ref), default_2 (upval), default (upval), a6 (ref)
        -- upvalues: groupOptions (upval)
        local rootDir, u18
        local v1 = nil
        local v2 = nil
        if typeof(a3) == "Instance" then
            if isJSONString(a2.config) then
                u18 = nil
                if not pcall(function() -- Line: 131 -- upvalues: u18 (ref), JSON (upval), a2 (upval)
                    u18 = JSON.parse(a2.config)
                    return
                end) then
                    error(Error.new("There was an error while parsing the `--config` argument as a JSON string."))
                end
                rootDir = Boolean.toJSBoolean(u18.rootDir) and u18.rootDir or a3
                u18.rootDir = rootDir
                v1 = u18
            else
                v2 = if a4 then default_3(a3, a1, a7) else if typeof(a2.config) ~= "string" then default_3(a3, a1, a7) else default_3(a2.config, a1, a7)
                v1 = default_2(v2):expect()
            end
        elseif typeof(a3) ~= "string" then
            error(Error.new("Jest: configuration as an object not supported yet"))
        elseif isJSONString(a2.config) then
            u18 = nil
            if not pcall(function() -- Line: 131 -- upvalues: u18 (ref), JSON (upval), a2 (upval)
                u18 = JSON.parse(a2.config)
                return
            end) then
                error(Error.new("There was an error while parsing the `--config` argument as a JSON string."))
            end
            rootDir = Boolean.toJSBoolean(u18.rootDir) and u18.rootDir or a3
            u18.rootDir = rootDir
            v1 = u18
        else
            v2 = if a4 then default_3(a3, a1, a7) else if typeof(a2.config) ~= "string" then default_3(a3, a1, a7) else default_3(a2.config, a1, a7)
            v1 = default_2(v2):expect()
        end
        local v3 = default(v1, a2, v2, a6):expect()
        local options = v3.options
        local hasDeprecationWarnings = v3.hasDeprecationWarnings
        local v4 = groupOptions(options)
        return {
            configPath = v2,
            globalConfig = v4.globalConfig,
            hasDeprecationWarnings = hasDeprecationWarnings,
            projectConfig = v4.projectConfig,
        }
    end))
end

v2.readConfig = readConfig

function groupOptions(a1) -- Line: 165 -- upvalues: Object (val)
    return {
        globalConfig = Object.freeze({
            bail = a1.bail,
            changedSince = a1.changedSince,
            expand = a1.expand,
            filter = a1.filter,
            json = a1.json,
            listTests = a1.listTests,
            maxConcurrency = a1.maxConcurrency,
            maxWorkers = a1.maxWorkers,
            noStackTrace = a1.noStackTrace,
            nonFlagArgs = a1.nonFlagArgs,
            outputFile = a1.outputFile,
            passWithNoTests = a1.passWithNoTests,
            projects = a1.projects,
            rootDir = a1.rootDir,
            runTestsByPath = a1.runTestsByPath,
            silent = a1.silent,
            skipFilter = a1.skipFilter,
            snapshotFormat = a1.snapshotFormat,
            testFailureExitCode = a1.testFailureExitCode,
            testNamePattern = a1.testNamePattern,
            testPathPattern = a1.testPathPattern,
            testTimeout = a1.testTimeout,
            updateSnapshot = a1.updateSnapshot,
            verbose = a1.verbose,
        }),
        projectConfig = Object.freeze({
            automock = a1.automock,
            clearMocks = a1.clearMocks,
            displayName = a1.displayName,
            id = a1.id,
            injectGlobals = a1.injectGlobals,
            oldFunctionSpying = a1.oldFunctionSpying,
            resetMocks = a1.resetMocks,
            resetModules = a1.resetModules,
            restoreMocks = a1.restoreMocks,
            rootDir = a1.rootDir,
            roots = a1.roots,
            runner = a1.runner,
            runtime = a1.runtime,
            sandboxInjectedGlobals = a1.sandboxInjectedGlobals,
            setupFiles = a1.setupFiles,
            setupFilesAfterEnv = a1.setupFilesAfterEnv,
            slowTestThreshold = a1.slowTestThreshold,
            snapshotFormat = a1.snapshotFormat,
            snapshotSerializers = a1.snapshotSerializers,
            testEnvironment = a1.testEnvironment,
            testEnvironmentOptions = a1.testEnvironmentOptions,
            testLocationInResults = a1.testLocationInResults,
            testMatch = a1.testMatch,
            testPathIgnorePatterns = a1.testPathIgnorePatterns,
            testRegex = a1.testRegex,
            timers = a1.timers,
        }),
    }
end

local function ensureNoDuplicateConfigs(a1, a2) -- Line: 334
    -- upvalues: Map (val), chalk (val), Array (val), Error (val)
    if #a2 <= 1 then
        return
    end
    local u75 = Map.new()
    local v1 = nil
    local v2 = nil
    local v3, v4 = a1, a2
    for i, j in a1, v1, v2 do
        local configPath = j.configPath
        if u75:has(configPath) then
            error(Error.new((("Whoops! Two projects resolved to the same config path: %s:\n\n  Project 1: %s\n  Project 2: %s\n\nThis usually means that your %s config includes a directory that doesn't have any configuration recognizable by Jest. Please fix it.\n"):format(chalk.bold((tostring(configPath))), chalk.bold((tostring(v4[(Array.findIndex(v3, function(a1) -- Line: 354 -- upvalues: j (val)
                return a1 == j
            end))]))), tostring((chalk.bold((tostring(v4[(Array.findIndex(v3, function(a1) -- Line: 358 -- upvalues: u75 (val), configPath (val)
                return a1 == u75:get(configPath)
            end))]))))), (tostring((chalk.bold("\"projects\""))))))))
        end
        if configPath ~= nil then
            u75:set(configPath, j)
        end
    end
end

function v2.readConfigs(a1, a2, a3) -- Line: 380
    -- upvalues: promise (val), Error (val), isJSONString (val), JSON (val), Boolean (val), default_3 (val)
    -- upvalues: default_2 (val), default (val), groupOptions (ref), Array (val), readConfig (val)
    -- upvalues: ensureNoDuplicateConfigs (ref)
    return (promise.resolve()):andThen(function() -- Line: 390
        -- upvalues: a3 (val), a1 (val), a2 (val), promise (upval), Error (upval), isJSONString (upval), JSON (upval)
        -- upvalues: Boolean (upval), default_3 (upval), default_2 (upval), default (upval), groupOptions (upval)
        -- upvalues: Array (upval), readConfig (upval), ensureNoDuplicateConfigs (upval)
        local globalConfig = nil
        local hasDeprecationWarnings = nil
        local v1 = {}
        local projects = a3
        local configPath = nil
        if #a3 == 1 then
            local u7 = a1
            local u8 = a2
            local u9 = projects[1]
            local u12 = nil
            local u14 = nil
            if u12 == nil then
                u12 = (1 / 0)
            end
            if u14 == nil then
                u14 = false
            end
            local v2 = promise.resolve()
            local u18 = nil
            v2 = v2:andThen(function() -- Line: 106
                -- upvalues: u9 (val), Error (upval), isJSONString (upval), u8 (val), JSON (upval), Boolean (upval)
                -- upvalues: u18 (val), default_3 (upval), u7 (val), u14 (ref), default_2 (upval), default (upval)
                -- upvalues: u12 (ref), groupOptions (upval)
                local rootDir, u18_2
                local v1 = nil
                local v2 = nil
                if typeof(u9) == "Instance" then
                    if isJSONString(u8.config) then
                        u18_2 = nil
                        if not pcall(function() -- Line: 131 -- upvalues: u18_2 (ref), JSON (upval), u8 (upval)
                            u18_2 = JSON.parse(u8.config)
                            return
                        end) then
                            error(Error.new("There was an error while parsing the `--config` argument as a JSON string."))
                        end
                        rootDir = Boolean.toJSBoolean(u18_2.rootDir) and u18_2.rootDir or u9
                        u18_2.rootDir = rootDir
                        v1 = u18_2
                    else
                        v2 = if u18 then default_3(u9, u7, u14) else if typeof(u8.config) ~= "string" then default_3(u9, u7, u14) else default_3(u8.config, u7, u14)
                        v1 = default_2(v2):expect()
                    end
                elseif typeof(u9) ~= "string" then
                    error(Error.new("Jest: configuration as an object not supported yet"))
                elseif isJSONString(u8.config) then
                    u18_2 = nil
                    if not pcall(function() -- Line: 131 -- upvalues: u18_2 (ref), JSON (upval), u8 (upval)
                        u18_2 = JSON.parse(u8.config)
                        return
                    end) then
                        error(Error.new("There was an error while parsing the `--config` argument as a JSON string."))
                    end
                    rootDir = Boolean.toJSBoolean(u18_2.rootDir) and u18_2.rootDir or u9
                    u18_2.rootDir = rootDir
                    v1 = u18_2
                else
                    v2 = if u18 then default_3(u9, u7, u14) else if typeof(u8.config) ~= "string" then default_3(u9, u7, u14) else default_3(u8.config, u7, u14)
                    v1 = default_2(v2):expect()
                end
                local v3 = default(v1, u8, v2, u12):expect()
                local options = v3.options
                local hasDeprecationWarnings = v3.hasDeprecationWarnings
                local v4 = groupOptions(options)
                return {
                    configPath = v2,
                    globalConfig = v4.globalConfig,
                    hasDeprecationWarnings = hasDeprecationWarnings,
                    projectConfig = v4.projectConfig,
                }
            end)
            local v3 = v2:expect()
            configPath = v3.configPath
            hasDeprecationWarnings = v3.hasDeprecationWarnings
            globalConfig = v3.globalConfig
            v1 = {v3.projectConfig}
            local toJSBoolean = Boolean.toJSBoolean
            if toJSBoolean(if globalConfig.projects == nil then nil else #globalConfig.projects) then
                projects = globalConfig.projects
            end
        end
        if #projects > 0 then
            local u59 = a1
            local u62 = projects[1] == u59
            local v4 = promise.all(Array.map(Array.filter(projects, function(a1) -- Line: 416
                if typeof(a1) == "Instance" and #a1:GetChildren() == 0 and not a1:isA("ModuleScript") then
                    return false
                end
                return true
            end), function(a1_2, a2_2) -- Line: 423
                -- upvalues: projects (ref), u62 (val), readConfig (upval), a1 (upval), a2 (upval), configPath (ref)
                -- upvalues: u59 (val)
                local v1 = false
                if a2_2 == 1 then
                    v1 = #projects == 1
                end
                return readConfig(a1, a2, a1_2, not (if not v1 then v1 else u62), if configPath == nil then u59 else configPath.Parent, a2_2, u62)
            end)):expect()
            ensureNoDuplicateConfigs(v4, projects)
            v1 = Array.map(v4, function(a1) -- Line: 441
                return a1.projectConfig
            end)
            if not hasDeprecationWarnings then
                hasDeprecationWarnings = Array.some(v4, function(a1) -- Line: 446 -- upvalues: Boolean (upval)
                    return Boolean.toJSBoolean(a1.hasDeprecationWarnings)
                end)
            end
            if not Boolean.toJSBoolean(globalConfig) then
                globalConfig = v4[1].globalConfig
            end
        end
        if not Boolean.toJSBoolean(globalConfig) or not Boolean.toJSBoolean(#v1) then
            error(Error.new("jest: No configuration found for any project."))
        end
        return {
            configs = v1,
            globalConfig = globalConfig,
            hasDeprecationWarnings = Boolean.toJSBoolean(hasDeprecationWarnings),
        }
    end)
end

local v3 = groupOptions(v2.defaults)
v2.globalDefaults = v3.globalConfig
v2.projectDefaults = v3.projectConfig
return v2