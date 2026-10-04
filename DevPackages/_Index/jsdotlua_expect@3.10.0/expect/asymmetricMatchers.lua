-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_expect@3.10.0.expect.asymmetricMatchers
-- Decompile time: 20.71 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local Object = v1.Object
local Symbol = v1.Symbol
local instanceof = v1.instanceof
require(script.Parent.Parent:WaitForChild("luau-regexp"))
local getType = require(script.Parent.Parent:WaitForChild("jest-get-type")).getType
local pluralize = require(script.Parent.Parent:WaitForChild("jest-util")).pluralize
local jasmineUtils = require(script.Parent:WaitForChild("jasmineUtils"))
local equals = jasmineUtils.equals
local hasProperty = jasmineUtils.hasProperty
local isA = jasmineUtils.isA
local isUndefined = jasmineUtils.isUndefined
local getState = require(script.Parent:WaitForChild("jestMatchersObject_extracted")).getState
require(script.Parent:WaitForChild("types"))
local utils = require(script.Parent:WaitForChild("utils"))
local u90 = Object.freeze(Object.assign({}, {}, {iterableEquality = utils.iterableEquality, subsetEquality = utils.subsetEquality}))
local u91 = {}
u91.__index = u91

function u91.new(a1, a2) -- Line: 113 -- upvalues: Symbol (val), u91 (val) -- types: a2: boolean?
    local v1 = if a2 == nil then false else a2
    local v2 = {
        sample = a1,
        inverse = if v1 ~= nil then v1 else false,
        ["$$typeof"] = Symbol.for_("jest.asymmetricMatcher"),
    }
    setmetatable(v2, u91)
    return v2
end

function u91.getMatcherContext(a1) -- Line: 135 -- upvalues: Object (val), getState (val), equals (val), u90 (val)
    return Object.assign({}, getState(), {equals = equals, isNot = a1.inverse, utils = u90})
end

local u94 = {}
u94.__index = u94
setmetatable(u94, u91)

function u94.new(a1) -- Line: 163 -- upvalues: u91 (val), u94 (val)
    if typeof(a1) ~= "table" and typeof(a1) ~= "string" then
        error("any() expects to be passed a typename string or a prototype class. Please pass one or use anything() to match any object.")
    end
    local v1 = u91.new(a1)
    setmetatable(v1, u94)
    return v1
end

function u94.asymmetricMatch(a1, a2) -- Line: 175 -- upvalues: getType (val), instanceof (val)
    local v1 = getType(a1.sample)
    local v2 = getType(a2)
    if v1 == "table" and v2 == "table" then
        return instanceof(a2, a1.sample)
    end
    if v1 == "error" and v2 == "error" then
        return instanceof(a2, a1.sample)
    end
    if v1 == "string" and a1.sample == v2 then
        return true
    end
    return false
end

function u94.toString(a1) -- Line: 189
    return "Any"
end

function u94.getExpectedType(a1) -- Line: 193
    return (tostring(a1.sample))
end

function u94.toAsymmetricMatcher(a1) -- Line: 198
    return "Any<" .. (tostring(a1.sample)) .. ">"
end

local u104 = {}
u104.__index = u104
setmetatable(u104, u91)

function u104.new(a1) -- Line: 205 -- upvalues: u91 (val), u104 (val)
    local v1 = u91.new(a1)
    setmetatable(v1, u104)
    return v1
end

function u104.asymmetricMatch(a1, a2) -- Line: 211 -- upvalues: isUndefined (val)
    return not isUndefined(a2)
end

function u104.toString(a1) -- Line: 216
    return "Anything"
end

function u104.toAsymmetricMatcher(a1) -- Line: 222
    return "Anything"
end

local u113 = {}
u113.__index = u113
setmetatable(u113, u91)

function u113.new(a1) -- Line: 230 -- upvalues: u91 (val), u113 (val)
    local v1 = u91.new(a1)
    setmetatable(v1, u113)
    return v1
end

function u113.asymmetricMatch(a1, a2) -- Line: 236 -- upvalues: isUndefined (val)
    return isUndefined(a2)
end

function u113.toString(a1) -- Line: 240
    return "Nothing"
end

function u113.getExpectedType(a1) -- Line: 244
    return "nil"
end

function u113.toAsymmetricMatcher(a1) -- Line: 248
    return "Nothing"
end

local u123 = {}
u123.__index = u123
setmetatable(u123, u91)

function u123.new(a1, a2) -- Line: 256 -- upvalues: u91 (val), u123 (val) -- types: a1: table, a2: boolean?
    if a2 == nil then
        a2 = false
    end
    local v1 = u91.new(a1, a2)
    setmetatable(v1, u123)
    return v1
end

function u123.asymmetricMatch(a1, a2) -- Line: 263 -- upvalues: Array (val), equals (val) -- types: a1: table, a2: table
    if not Array.isArray(a1.sample) then
        error(string.format("You must provide an array to %s, not '%s'.", a1:toString(), (typeof(a1.sample))))
    end
    local v1 = false
    if #a1.sample == 0
        or Array.isArray(a2) and Array.every(a1.sample, function(a1) -- Line: 273 -- upvalues: Array (upval), a2 (val), equals (upval)
            local some, v1, v2
            v1 = Array
            some = v1.some
            v2 = a2
            return some(v2, function(a1_2) -- Line: 274 -- upvalues: equals (upval), a1 (val)
                return equals(a1, a1_2)
            end)
        end) then
        v1 = true
    end
    if a1.inverse then
        return not v1
    end
    return v1
end

function u123:toString() -- Line: 288
    if self.inverse then
        return "ArrayNotContaining"
    end
    return "ArrayContaining"
end

function u123.getExpectedType(a1) -- Line: 295
    return "array"
end

local u132 = {}
u132.__index = u132
setmetatable(u132, u91)

function u132.new(a1, a2) -- Line: 302 -- upvalues: u91 (val), u132 (val) -- types: a1: table, a2: boolean?
    if a2 == nil then
        a2 = false
    end
    local v1 = u91.new(a1, a2)
    setmetatable(v1, u132)
    return v1
end

function u132.asymmetricMatch(a1, a2) -- Line: 309
    -- upvalues: hasProperty (val), equals (val)
    if typeof(a1.sample) ~= "table" then
        error(string.format("You must provide an object to %s, not '%s'.", a1:toString(), (typeof(a1.sample))))
    end
    local v1 = true
    for k, v in pairs(a1.sample) do
        if hasProperty(a2, k) and equals(v, a2[k]) then
            continue
        end
        v1 = false
        break
    end
    if a1.inverse then
        return not v1
    end
    return v1
end

function u132:toString() -- Line: 327
    if self.inverse then
        return "ObjectNotContaining"
    end
    return "ObjectContaining"
end

function u132.getExpectedType(a1) -- Line: 334
    return "object"
end

local u141 = {}
u141.__index = u141
setmetatable(u141, u91)

function u141.new(a1, a2) -- Line: 341 -- upvalues: isA (val), u91 (val), u141 (val) -- types: a1: string, a2: boolean?
    if a2 == nil then
        a2 = false
    end
    if not isA("string", a1) then
        error("Expected is not a String")
    end
    local v1 = u91.new(a1, a2)
    setmetatable(v1, u141)
    return v1
end

function u141.asymmetricMatch(a1, a2) -- Line: 351 -- upvalues: isA (val) -- types: a1: table, a2: string
    local v1 = isA("string", a2) and a2:find(a1.sample, 1, true)
    if a1.inverse then
        return not v1
    end
    return not not v1
end

function u141:toString() -- Line: 360
    if self.inverse then
        return "StringNotContaining"
    end
    return "StringContaining"
end

function u141.getExpectedType(a1) -- Line: 367
    return "string"
end

local u150 = {}
u150.__index = u150
setmetatable(u150, u91)

function u150.new(a1, a2) -- Line: 374 -- upvalues: isA (val), u91 (val), u150 (val) -- types: a2: boolean?
    if a2 == nil then
        a2 = false
    end
    if not isA("string", a1) and not isA("regexp", a1) then
        error("Expected is not a String")
    end
    local v1 = u91.new(a1, a2)
    setmetatable(v1, u150)
    return v1
end

function u150.asymmetricMatch(a1, a2) -- Line: 385 -- upvalues: isA (val) -- types: a1: table, a2: string
    local v1 = false
    if isA("string", a2) then
        if not isA("string", a1.sample) then
            v1 = a1.sample:test(a2)
        else
            a1.sample = string.gsub(a1.sample, "\027%[", "\027%%[")
            v1 = a2:find(a1.sample)
        end
    end
    if a1.inverse then
        return not v1
    end
    return not not v1
end

function u150:toString() -- Line: 405
    if self.inverse then
        return "StringNotMatching"
    end
    return "StringMatching"
end

function u150.getExpectedType(a1) -- Line: 412
    return "string"
end

local v2 = {__index = u91}
local u162 = setmetatable({}, v2)
u162.__index = u162

function u162.new(a1, a2, a3) -- Line: 442
    -- upvalues: Boolean (val), isA (val), Error (val), u91 (val), u162 (val)
    local v1 = if a2 == nil then 2 else a2
    local v2 = if a3 == nil then false else a3
    if not Boolean.toJSBoolean(isA("number", a1)) then
        error(Error.new("Expected is not a Number"))
    end
    if not Boolean.toJSBoolean(isA("number", v1)) then
        error(Error.new("Precision is not a Number"))
    end
    local v3 = u91.new(a1)
    setmetatable(v3, u162)
    v3.inverse = v2
    v3.precision = v1
    return v3
end

function u162.asymmetricMatch(a1, a2) -- Line: 460 -- upvalues: Boolean (val), isA (val) -- types: a1: table, a2: number
    if not Boolean.toJSBoolean(isA("number", a2)) then
        return false
    end
    local v1 = if a2 ~= (1 / 0) then if a2 ~= (-1 / 0) or a1.sample ~= (-1 / 0) then (math.abs(a1.sample - a2)) < math.pow(10, -a1.precision) / 2 else true else if a1.sample == (1 / 0) then true else if a2 ~= (-1 / 0) or a1.sample ~= (-1 / 0) then (math.abs(a1.sample - a2)) < math.pow(10, -a1.precision) / 2 else true
    if Boolean.toJSBoolean(a1.inverse) then
        return not Boolean.toJSBoolean(v1)
    end
    return v1
end

function u162:toString() -- Line: 475 -- upvalues: Boolean (val)
    return ("Number%sCloseTo"):format(if not Boolean.toJSBoolean(self.inverse) then "" else "Not")
end

function u162.getExpectedType(a1) -- Line: 479
    return "number"
end

function u162.toAsymmetricMatcher(a1) -- Line: 483 -- upvalues: Array (val), pluralize (val)
    return Array.join({
        a1:toString(),
        a1.sample,
        (("(%s)"):format((tostring((pluralize("digit", a1.precision)))))),
    }, " ")
end

return {
    AsymmetricMatcher = u91,
    any = function(a1) -- Line: 493 -- upvalues: u94 (val)
        return u94.new(a1)
    end,
    anything = function() -- Line: 496 -- upvalues: u104 (val)
        return u104.new()
    end,
    nothing = function() -- Line: 499 -- upvalues: u113 (val)
        return u113.new()
    end,
    arrayContaining = function(a1) -- Line: 502 -- upvalues: u123 (val) -- types: a1: table
        return u123.new(a1)
    end,
    arrayNotContaining = function(a1) -- Line: 505 -- upvalues: u123 (val) -- types: a1: table
        return u123.new(a1, true)
    end,
    objectContaining = function(a1) -- Line: 508 -- upvalues: u132 (val)
        return u132.new(a1)
    end,
    objectNotContaining = function(a1) -- Line: 511 -- upvalues: u132 (val)
        return u132.new(a1, true)
    end,
    stringContaining = function(a1) -- Line: 514 -- upvalues: u141 (val) -- types: a1: string
        return u141.new(a1)
    end,
    stringNotContaining = function(a1) -- Line: 517 -- upvalues: u141 (val) -- types: a1: string
        return u141.new(a1, true)
    end,
    stringMatching = function(a1) -- Line: 520 -- upvalues: u150 (val)
        return u150.new(a1)
    end,
    stringNotMatching = function(a1) -- Line: 523 -- upvalues: u150 (val)
        return u150.new(a1, true)
    end,
    closeTo = function(a1, a2) -- Line: 526 -- upvalues: u162 (val) -- types: a1: number, a2: number?
        return u162.new(a1, a2)
    end,
    notCloseTo = function(a1, a2) -- Line: 529 -- upvalues: u162 (val) -- types: a1: number, a2: number?
        return u162.new(a1, a2, true)
    end,
}