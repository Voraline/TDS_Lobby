-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-config@3.10.0.jest-config.normalize
-- Decompile time: 26.64 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Object = v1.Object
local console = v1.console
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local v2 = {}
local showTestPathPatternError = nil
local v3 = require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local process = v3.nodeUtils.process
local getRelativePath = v3.getRelativePath
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-types"))

local function replacePathSepForRegex(a1) -- Line: 55
    return a1
end

local clearLine = (require((script.Parent.Parent:WaitForChild("jest-util")))).clearLine

local function replacePathSepForGlob(a1) -- Line: 70
    return a1
end

local ValidationError = (require((script.Parent.Parent:WaitForChild("jest-validate")))).ValidationError
local default = require(script.Parent:WaitForChild("Defaults")).default
local getDisplayNameColor = require(script.Parent:WaitForChild("color")).getDisplayNameColor
local default_2 = require(script.Parent:WaitForChild("getMaxWorkers")).default
local default_3 = require(script.Parent:WaitForChild("setFromArgv")).default
local utils = require(script.Parent:WaitForChild("utils"))
local BULLET = utils.BULLET
local DOCUMENTATION_NOTE = utils.DOCUMENTATION_NOTE
local default_4 = require(script.Parent:WaitForChild("validatePattern")).default
local u135 = ("%sValidation Error"):format(BULLET)

local function createConfigError(a1) -- Line: 117
    -- upvalues: ValidationError (val), u135 (val), DOCUMENTATION_NOTE (val)
    return ValidationError.new(u135, a1, DOCUMENTATION_NOTE)
end

local function verifyDirectoryExists(a1, a2) -- Line: 121
    -- upvalues: createConfigError (val), chalk (val)
    if typeof(a1) ~= "Instance" then
        error(createConfigError(("  Directory %s in the %s option was not found."):format(chalk.bold((tostring(a1))), (chalk.bold(a2)))))
    end
end

local function normalizePreprocessor(a1) -- Line: 445
    return a1
end

local function normalizeMissingOptions(a1, a2, a3) -- Line: 490
    -- upvalues: Boolean (val), getRelativePath (val)
    if not Boolean.toJSBoolean(a1.id) then
        a1.id = getRelativePath(a1.rootDir, nil)
    end
    if a1.setupFiles == nil then
        a1.setupFiles = {}
    end
    return a1
end

local function normalizeRootDir(a1) -- Line: 516
    -- upvalues: Boolean (val), createConfigError (val), chalk (val), Object (val)
    if not Boolean.toJSBoolean(a1.rootDir) then
        error(createConfigError(("  Configuration option %s must be specified."):format((chalk.bold("rootDir")))))
    end
    local rootDir_2 = a1.rootDir
    if typeof(rootDir_2) ~= "Instance" then
        error(createConfigError(("  Directory %s in the %s option was not found."):format(chalk.bold((tostring(rootDir_2))), (chalk.bold("rootDir")))))
    end
    return Object.assign({}, a1, {rootDir = a1.rootDir})
end

local function normalizeReporters(a1) -- Line: 535
    return a1
end

local function buildTestPathPattern(a1) -- Line: 571
    -- upvalues: Array (val), default_4 (val), showTestPathPatternError (ref)
    local v1 = {}
    if a1._ ~= nil then
        v1 = Array.concat(v1, a1._)
    end
    if a1.testPathPattern ~= nil then
        v1 = Array.concat(v1, a1.testPathPattern)
    end
    local v2 = Array.join(Array.map(v1, function(a1) -- Line: 580
        return (tostring(a1))
    end), "|")
    if default_4(v2) then
        return v2
    end
    showTestPathPatternError(v2)
    return ""
end

function showTestPathPatternError(a1) -- Line: 604
    -- upvalues: clearLine (val), process (val), console (val), chalk (val)
    clearLine(process.stdout)
    console.log(chalk.red((("  Invalid testPattern %s supplied. "):format((tostring(a1)))) .. "Running all tests instead."))
end

function v2.default(a1, a2, a3, a4) -- Line: 693
    -- upvalues: promise (val), normalizeRootDir (val), default_3 (val), Boolean (val), getRelativePath (val)
    -- upvalues: default (val), Object (val), Array (val), replacePathSepForGlob (val), replacePathSepForRegex (val)
    -- upvalues: chalk (val), createConfigError (val), getDisplayNameColor (val), buildTestPathPattern (val)
    -- upvalues: default_2 (val)
    local u5 = if a4 == nil then (1 / 0) else a4
    return (promise.resolve()):andThen(function() -- Line: 702
        -- upvalues: normalizeRootDir (upval), default_3 (upval), a1 (val), a2 (val), a3 (val), u5 (val)
        -- upvalues: Boolean (upval), getRelativePath (upval), default (upval), Object (upval), Array (upval)
        -- upvalues: replacePathSepForGlob (upval), replacePathSepForRegex (upval), chalk (upval)
        -- upvalues: createConfigError (upval), getDisplayNameColor (upval), buildTestPathPattern (upval)
        -- upvalues: default_2 (upval)
        local u5_2 = normalizeRootDir(default_3(a1, a2))
        if not Boolean.toJSBoolean(u5_2.id) then
            u5_2.id = getRelativePath(u5_2.rootDir, nil)
        end
        if u5_2.setupFiles == nil then
            u5_2.setupFiles = {}
        end
        local testEnvironment = u5_2.testEnvironment or default.testEnvironment
        u5_2.testEnvironment = testEnvironment
        if u5_2.roots == nil and u5_2.testPathDirs ~= nil then
            u5_2.roots = u5_2.testPathDirs
            u5_2.testPathDirs = nil
        end
        if u5_2.roots == nil then
            u5_2.roots = {u5_2.rootDir}
        end
        local v1 = Object.assign({}, default)
        local v2 = Object.keys(u5_2)
        Array.reduce(v2, function(a1, a2_2) -- Line: 811
            -- upvalues: u5_2 (val), Array (upval), Boolean (upval), replacePathSepForGlob (upval)
            -- upvalues: replacePathSepForRegex (upval), a2 (upval), chalk (upval), createConfigError (upval)
            -- upvalues: getDisplayNameColor (upval)
            local v1
            if a2_2 == "resolver" then
                return a1
            end
            local v2 = u5_2
            local v3 = nil
            if a2_2 == "setupFiles" or a2_2 == "setupFilesAfterEnv" or a2_2 == "snapshotSerializers" then
                v1 = v2[a2_2]
                if v1 ~= nil then
                    v3 = Array.map(v1, function(a1) -- Line: 840 -- upvalues: u5_2 (upval)
                        if a1 == "<rootDir>" then
                            return u5_2.rootDir
                        end
                        return a1
                    end)
                end
            elseif a2_2 == "modulePaths" or a2_2 == "roots" then
                v1 = v2[a2_2]
                if v1 ~= nil then
                    v3 = Array.map(v1, function(a1) -- Line: 858 -- upvalues: u5_2 (upval)
                        if a1 == "<rootDir>" then
                            return u5_2.rootDir
                        end
                        return a1
                    end)
                end
            elseif a2_2 == "testPathIgnorePatterns" then
                v3 = v2[a2_2]
            elseif a2_2 == "projects" then
                v3 = Array.reduce(Array.map(Boolean.toJSBoolean(v2[a2_2]) and v2[a2_2] or {}, function(a1) -- Line: 1002
                    return a1
                end), function(a1, a2) -- Line: 1010 -- upvalues: Array (upval)
                    local v1 = {}
                    return Array.concat(a1, if not (#v1 > 0) then {a2} else v1)
                end, {})
            elseif a2_2 == "moduleDirectories" or a2_2 == "testMatch" then
                v1 = v2[a2_2]
                v3 = if v1 == nil then v1 else if not Array.isArray(v1) then v1 else Array.map(v1, replacePathSepForGlob)
            elseif a2_2 == "testRegex" then
                v1 = v2[a2_2]
                v3 = if v1 == nil or not Boolean.toJSBoolean(v1) then {} else Array.map(if not Array.isArray(v1) then {v1} else v1, replacePathSepForRegex)
            elseif a2_2 == "bail" then
                v1 = v2[a2_2]
                if typeof(v1) == "boolean" then
                    v3 = if not v1 then 0 else 1
                elseif typeof(v1) ~= "string" then
                    v3 = v2[a2_2]
                else
                    v3 = 1
                    table.insert(a2._, v1)
                end
            elseif a2_2 == "displayName" then
                v1 = v2[a2_2]
                if typeof(v1) ~= "table" then
                    v3 = {color = getDisplayNameColor(u5_2.runner), name = v1}
                else
                    local name = v1.name
                    local color = v1.color
                    if not Boolean.toJSBoolean(name)
                        or not Boolean.toJSBoolean(color)
                        or typeof(name) ~= "string"
                        or typeof(color) ~= "string" then
                        local v4 = (("  Option \"%s\" must be of type:\n\n"):format((chalk.bold("displayName")))) .. "  {\n    name: string;\n    color: string;\n  }\n"
                        error(createConfigError(v4))
                    end
                    v3 = v2[a2_2]
                end
            elseif a2_2 == "testTimeout" then
                if v2[a2_2] < 0 then
                    error(createConfigError(("  Option \"%s\" must be a natural number."):format((chalk.bold("testTimeout")))))
                end
                v3 = v2[a2_2]
            elseif a2_2 == "automock"
                or a2_2 == "cache"
                or a2_2 == "changedSince"
                or a2_2 == "changedFilesWithAncestor"
                or a2_2 == "clearMocks"
                or a2_2 == "collectCoverage"
                or a2_2 == "coverageProvider"
                or a2_2 == "coverageReporters"
                or a2_2 == "coverageThreshold"
                or a2_2 == "detectLeaks"
                or a2_2 == "detectOpenHandles"
                or a2_2 == "errorOnDeprecated"
                or a2_2 == "expand"
                or a2_2 == "extensionsToTreatAsEsm"
                or a2_2 == "extraGlobals"
                or a2_2 == "globals"
                or a2_2 == "findRelatedTests"
                or a2_2 == "forceCoverageMatch"
                or a2_2 == "forceExit"
                or a2_2 == "injectGlobals"
                or a2_2 == "lastCommit"
                or a2_2 == "listTests"
                or a2_2 == "logHeapUsage"
                or a2_2 == "maxConcurrency"
                or a2_2 == "id"
                or a2_2 == "noStackTrace"
                or a2_2 == "notify"
                or a2_2 == "notifyMode"
                or a2_2 == "onlyChanged"
                or a2_2 == "onlyFailures"
                or a2_2 == "outputFile"
                or a2_2 == "oldFunctionSpying"
                or a2_2 == "passWithNoTests"
                or a2_2 == "replname"
                or a2_2 == "reporters"
                or a2_2 == "resetMocks"
                or a2_2 == "resetModules"
                or a2_2 == "restoreMocks"
                or a2_2 == "rootDir"
                or a2_2 == "runTestsByPath"
                or a2_2 == "silent"
                or a2_2 == "skipFilter"
                or a2_2 == "skipNodeResolution"
                or a2_2 == "slowTestThreshold"
                or a2_2 == "snapshotFormat"
                or a2_2 == "testEnvironment"
                or a2_2 == "testEnvironmentOptions"
                or a2_2 == "testFailureExitCode"
                or a2_2 == "testLocationInResults"
                or a2_2 == "testNamePattern"
                or a2_2 == "testURL"
                or a2_2 == "timers"
                or a2_2 == "useStderr"
                or a2_2 == "verbose"
                or a2_2 == "watch"
                or a2_2 == "watchAll"
                or a2_2 == "watchman" then
                v3 = v2[a2_2]
            end
            a1[a2_2] = v3
            return a1
        end, v1)
        Array.forEach(v1.roots, function(a1, a2) -- Line: 1252 -- upvalues: createConfigError (upval), chalk (upval)
            local v1 = ("roots[%s]"):format((tostring(a2)))
            if typeof(a1) ~= "Instance" then
                error(createConfigError(("  Directory %s in the %s option was not found."):format(chalk.bold((tostring(a1))), (chalk.bold(v1)))))
            end
        end)
        v1.testPathPattern = buildTestPathPattern(a2)
        v1.json = Boolean.toJSBoolean(a2.json)
        v1.testFailureExitCode = tonumber(v1.testFailureExitCode, 10) or 0
        v1.updateSnapshot = if not Boolean.toJSBoolean(a2.ci) then if not a2.updateSnapshot then "new" else "all" else if a2.updateSnapshot then if not a2.updateSnapshot then "new" else "all" else "none"
        v1.maxConcurrency = tonumber(v1.maxConcurrency, 10) or 0
        v1.maxWorkers = default_2(a2, u5_2)
        if #v1.testRegex > 0 and u5_2.testMatch ~= nil then
            error(createConfigError((("  Configuration options %s and"):format((chalk.bold("testMatch")))) .. (" %s cannot be used together."):format((chalk.bold("testRegex")))))
        end
        if #v1.testRegex > 0 and u5_2.testMatch == nil then
            v1.testMatch = {}
        end
        if not Boolean.toJSBoolean(v1.projects) then
            v1.projects = {}
        end
        return {hasDeprecationWarnings = false, options = v1}
    end)
end

return v2