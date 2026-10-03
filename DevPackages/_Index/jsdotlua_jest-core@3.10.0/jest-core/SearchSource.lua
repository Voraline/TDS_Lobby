-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.SearchSource
-- Decompile time: 3.79 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local promise = require(script.Parent.Parent:WaitForChild("promise"))
local u28 = require(script.Parent.Parent:WaitForChild("luau-regexp"))
local v2 = {}
require(script.Parent.Parent:WaitForChild("jest-test-result"))
require(script.Parent.Parent:WaitForChild("jest-types"))
require(script.Parent.Parent:WaitForChild("jest-runtime"))
local v3 = require(script.Parent.Parent:WaitForChild("jest-util"))
local globsToMatcher = v3.globsToMatcher
local testPathPatternToRegExp = v3.testPathPatternToRegExp
require(script.Parent:WaitForChild("types"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local getRelativePath = (require((script.Parent.Parent:WaitForChild("jest-roblox-shared")))).getRelativePath

local function getAllFiles(a1) -- Line: 64 -- upvalues: Array (val), getRelativePath (val)
    return Array.map(Array.filter(a1.config.rootDir:GetDescendants(), function(a1) -- Line: 67
        return a1:isA("ModuleScript")
    end), function(a1_2) -- Line: 70 -- upvalues: getRelativePath (upval), a1 (val) -- types: a1_2: userdata
        return {path = getRelativePath(a1_2, a1.config.rootDir), script = a1_2}
    end)
end

local function regexToMatcher(a1) -- Line: 97 -- upvalues: Array (val), u28 (val)
    local u5 = Array.map(a1, function(a1) -- Line: 98 -- upvalues: u28 (upval)
        return u28(a1)
    end)
    return function(a1) -- Line: 101 -- upvalues: Array (upval), u5 (val)
        return Array.some(u5, function(a1_2) -- Line: 102 -- upvalues: a1 (val)
            local v1 = a1_2:test(a1)
            a1_2.lastIndex = 0
            return v1
        end)
    end
end

local function toTests(a1, a2) -- Line: 113 -- upvalues: Array (val)
    return Array.map(a2, function(a1_2) -- Line: 119 -- upvalues: a1 (val)
        return {context = a1, path = a1_2.path, script = a1_2.script}
    end)
end

local u98 = {}
u98.__index = u98

function u98.new(a1) -- Line: 239 -- upvalues: u98 (val), globsToMatcher (val), u28 (val), Array (val)
    local v1 = setmetatable({}, u98)
    v1._testPathCases = {}
    local config = a1.config
    v1._context = a1
    v1._dependencyResolver = nil
    if #config.testMatch > 0 then
        table.insert(v1._testPathCases, {stat = "testMatch", isMatch = globsToMatcher(config.testMatch)})
    end
    if #config.testPathIgnorePatterns > 0 then
        local u28_2 = u28((Array.join(config.testPathIgnorePatterns, "|")))
        table.insert(v1._testPathCases, {
            stat = "testPathIgnorePatterns",
            isMatch = function(a1) -- Line: 268 -- upvalues: u28_2 (val)
                return not u28_2:test(a1)
            end,
        })
    end
    if #config.testRegex > 0 then
        local _testPathCases_3 = v1._testPathCases
        local v2 = {stat = "testRegex"}
        local testRegex = config.testRegex
        local u47 = Array.map(testRegex, function(a1) -- Line: 98 -- upvalues: u28 (upval)
            return u28(a1)
        end)

        function v2.isMatch(a1) -- Line: 101 -- upvalues: Array (upval), u47 (val)
            return Array.some(u47, function(a1_2) -- Line: 102 -- upvalues: a1 (val)
                local v1 = a1_2:test(a1)
                a1_2.lastIndex = 0
                return v1
            end)
        end

        table.insert(_testPathCases_3, v2)
    end
    return v1
end

function u98:_filterTestPathsWithStats(a2, a3) -- Line: 297
    -- upvalues: Array (val), Boolean (val), testPathPatternToRegExp (val)
    local u3 = {stats = {roots = 0, testMatch = 0, testPathIgnorePatterns = 0, testRegex = 0}, tests = {}}
    u3.total = #a2
    local u10 = Array.from(self._testPathCases)
    if a3 ~= nil and Boolean.toJSBoolean(a3) then
        local u17 = testPathPatternToRegExp(a3)
        table.insert(u10, {
            stat = "testPathPattern",
            isMatch = function(a1) -- Line: 309 -- upvalues: u17 (val) -- types: a1: string
                return u17:test(a1)
            end,
        })
        u3.stats.testPathPattern = 0
    end
    u3.tests = Array.filter(a2, function(a1) -- Line: 317 -- upvalues: u10 (val), u3 (val)
        local isMatch, stat, stats
        local v1 = true
        for i, j in u10 do
            isMatch = j.isMatch
            stat = j.stat
            if not isMatch(a1.path) then
                v1 = false
            else
                u3.stats[stat] = u3.stats[stat] or 0
                stats = u3.stats
                stats[stat] = stats[stat] + 1
            end
        end
        return v1
    end)
    return u3
end

function u98:_getAllTestPaths(a2) -- Line: 337
    -- upvalues: getAllFiles (val), Array (val)
    local _context = self._context
    return self:_filterTestPathsWithStats(Array.map(getAllFiles(self._context), function(a1) -- Line: 119 -- upvalues: _context (val)
        return {context = _context, path = a1.path, script = a1.script}
    end), a2)
end

function u98.isTestFilePath(a1, a2) -- Line: 352 -- upvalues: Array (val)
    return Array.every(a1._testPathCases, function(a1) -- Line: 353 -- upvalues: a2 (val)
        return a1.isMatch(a2)
    end)
end

function u98:findMatchingTests(a2) -- Line: 361 -- types: self: table, a2: string?
    return self:_getAllTestPaths(a2)
end

function u98._getTestPaths(a1, a2, a3) -- Line: 472 -- upvalues: promise (val)
    return (promise.resolve()):andThen(function() -- Line: 476 -- upvalues: a2 (val), a1 (val)
        if a2.testPathPattern ~= nil then
            return a1:findMatchingTests(a2.testPathPattern)
        end
        return {tests = {}}
    end)
end

function u98.getTestPaths(a1, a2, a3, a4) -- Line: 536 -- upvalues: promise (val)
    return (promise.resolve()):andThen(function() -- Line: 541 -- upvalues: a1 (val), a2 (val), a3 (val)
        return (a1:_getTestPaths(a2, a3):expect())
    end)
end

v2.default = u98
return v2