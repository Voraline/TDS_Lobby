-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.jestMatchersObject
-- Decompile time: 6.93 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Symbol = v1.Symbol
local Object = v1.Object
local Error = v1.Error
local getType = require(script.Parent.Parent:WaitForChild("jest-get-type")).getType
local AsymmetricMatcher = require(script.Parent:WaitForChild("asymmetricMatchers")).AsymmetricMatcher
require(script.Parent:WaitForChild("types"))
local jestMatchersObject_extracted = require(script.Parent:WaitForChild("jestMatchersObject_extracted"))
local JEST_MATCHERS_OBJECT = jestMatchersObject_extracted.JEST_MATCHERS_OBJECT
local v2 = Symbol.for_("$$jest-internal-matcher")
if not _G[JEST_MATCHERS_OBJECT] then
    local v3 = _G
    v3[JEST_MATCHERS_OBJECT] = {matchers = {}, state = {assertionCalls = 0, isExpectingAssertions = false, suppressedErrors = {}}}
end
return {
    INTERNAL_MATCHER_FLAG = v2,
    getState = jestMatchersObject_extracted.getState,
    setState = function(a1) -- Line: 60 -- upvalues: Object (val), JEST_MATCHERS_OBJECT (val)
        Object.assign(_G[JEST_MATCHERS_OBJECT].state, a1)
    end,
    getMatchers = function() -- Line: 71 -- upvalues: JEST_MATCHERS_OBJECT (val)
        return _G[JEST_MATCHERS_OBJECT].matchers
    end,
    setMatchers = function(a1, a2, a3) -- Line: 82
        -- upvalues: Error (val), getType (val), AsymmetricMatcher (val), Object (val), JEST_MATCHERS_OBJECT (val)
        local v1
        local v2, v3, v4 = a1, a2, a3
        for k, v in pairs(a1) do
            if not v3 then
                if typeof(v) ~= "function" then
                    error(Error.new(("expect.extend: `%s` is not a valid matcher. Must be a function, is \"%s\""):format(
                        tostring(k),
                        (tostring((getType(v))))
                    )))
                end
                local u45 = {}
                u45.__index = u45
                v1 = AsymmetricMatcher
                setmetatable(u45, v1)

                function u45.new(a1, ...) -- Line: 101
                    -- upvalues: AsymmetricMatcher (upval), u45 (val)
                    if a1 == nil then
                        a1 = false
                    end
                    local v1 = AsymmetricMatcher.new({...}, a1)
                    setmetatable(v1, u45)
                    return v1
                end

                function u45.asymmetricMatch(a1, a2) -- Line: 108 -- upvalues: v (val)
                    local v1 = v
                    local v2 = a1:getMatcherContext()
                    local sample = a1.sample
                    local pass = v1(v2, a2, unpack(sample)).pass
                    if a1.inverse then
                        return not pass
                    end
                    return pass
                end

                function u45:toString() -- Line: 114 -- upvalues: k (val)
                    if self.inverse then
                        return string.format("never.%s", k)
                    end
                    return (tostring(k))
                end

                function u45.getExpectedType(a1) -- Line: 121
                    return "any"
                end

                function u45.toAsymmetricMatcher(a1) -- Line: 125
                    local sample = a1.sample
                    local v1 = 1
                    local v2 = ""
                    while v1 < #sample do
                        v2 = v2 .. (tostring(sample[v1])) .. ", "
                        v1 = v1 + 1
                    end
                    v2 = v2 .. tostring(sample[v1])
                    return string.format("%s<%s>", a1:toString(), v2)
                end

                v4[k] = function(...) -- Line: 138 -- upvalues: u45 (val)
                    return u45.new(false, ...)
                end

                if not v4.never then
                    v4.never = {}
                end

                v4.never[k] = function(...) -- Line: 144 -- upvalues: u45 (val)
                    return u45.new(true, ...)
                end
            end
        end
        Object.assign(_G[JEST_MATCHERS_OBJECT].matchers, v2)
    end,
}