-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_picomatch@0.4.0.picomatch.picomatch
-- Decompile time: 7.45 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Error = v1.Error
local Object = v1.Object
local u21 = require(script.Parent.Parent:WaitForChild("luau-regexp"))
local scan = require(script.Parent:WaitForChild("scan"))
local parse = require(script.Parent:WaitForChild("parse"))
local utils = require(script.Parent:WaitForChild("utils"))
local constants = require(script.Parent:WaitForChild("constants"))

local function isObject(a1) -- Line: 20 -- upvalues: Array (val)
    local v1 = false
    if typeof(a1) == "table" then
        v1 = not Array.isArray(a1)
    end
    return v1
end

local picomatch_ = nil
local v2 = {
    __call = function(a1, a2, a3, a4) -- Line: 49 -- upvalues: picomatch_ (ref) -- types: a4: boolean?
        return picomatch_(a2, a3, a4)
    end,
}
local u60 = setmetatable({}, v2)

function picomatch_(a1, a2, a3) -- Line: 54
    -- upvalues: Array (val), u60 (val), Boolean (val), Error (val), utils (val), Object (val)
    local u3 = a3 or false
    if Array.isArray(a1) then
        local u12 = Array.map(a1, function(a1) -- Line: 66 -- upvalues: u60 (upval), a2 (val), u3 (val)
            return u60(a1, a2, u3)
        end)
        local arrayMatcher_ = nil
        local v1 = {
            __call = function(a1, a2) -- Line: 72 -- upvalues: arrayMatcher_ (ref) -- types: a2: string
                return arrayMatcher_(a2)
            end,
        }
        local v2 = setmetatable({}, v1)

        function arrayMatcher_(a1) -- Line: 77 -- upvalues: u12 (val) -- types: a1: string
            local v1
            for i, v in ipairs(u12) do
                v1 = v(a1)
                if v1 then
                    return v1
                end
            end
            return false
        end

        return v2
    end
    local v3 = false
    if typeof(a1) == "table" then
        v3 = not Array.isArray(a1)
    end
    if v3 then
        v3 = Boolean.toJSBoolean(a1.tokens) and Boolean.toJSBoolean(a1.input)
    end
    if a1 == "" or typeof(a1) ~= "string" and not v3 then
        error(Error.new("TypeError: Expected pattern to be a non-empty string"))
    end
    local u55 = a2
    if not u55 then
        u55 = {}
    end
    local u60_2 = utils.isWindows(a2)
    local u78 = if not v3 then u60.makeRe(a1, a2, false, true) else u60.compileRe(a1, a2)
    local state = u78.state
    u78.state = nil

    local function isIgnored(a1) -- Line: 106
        return false
    end

    if Boolean.toJSBoolean(u55.ignore) then
        local v4 = Object.assign({}, a2, {ignore = Object.None, onMatch = Object.None, onResult = Object.None})
        isIgnored = u60(u55.ignore, v4, u3)
    end
    local matcher_ = nil
    local v5 = {
        __call = function(a1, a2, a3) -- Line: 122 -- upvalues: matcher_ (ref) -- types: a2: string, a3: boolean?
            return matcher_(a2, a3)
        end,
    }
    local v6 = setmetatable({}, v5)

    function matcher_(a1_2, a2_2) -- Line: 127
        -- upvalues: u60 (upval), u78 (val), a2 (val), a1 (val), u60_2 (val), state (val), u55 (val), isIgnored (ref)
        local v1 = a2_2 or false
        local v2 = u60.test(a1_2, u78, a2, {glob = a1, posix = u60_2})
        local isMatch = v2.isMatch
        local v3 = {
            glob = a1,
            state = state,
            regex = u78,
            posix = u60_2,
            input = a1_2,
            output = v2.output,
            match = v2.match,
            isMatch = isMatch,
        }
        if typeof(u55.onResult) == "function" then
            u55.onResult(v3)
        end
        if isMatch == false then
            v3.isMatch = false
            if v1 then
                return v3
            end
            return false
        end
        if not isIgnored(a1_2) then
            if typeof(u55.onMatch) == "function" then
                u55.onMatch(v3)
            end
            if v1 then
                return v3
            end
            return true
        end
        if typeof(u55.onIgnore) == "function" then
            u55.onIgnore(v3)
        end
        v3.isMatch = false
        if v1 then
            return v3
        end
        return false
    end

    if Boolean.toJSBoolean(u3) then
        v6.state = state
    end
    return v6
end

function u60.test(a1, a2, a3, a4) -- Line: 189
    -- upvalues: Error (val), Boolean (val), utils (val), u60 (val)
    local v1
    local v2 = a4 or {}
    local glob = v2.glob
    local posix = v2.posix
    if typeof(a1) ~= "string" then
        error(Error.new("TypeError: Expected input to be a string"))
    end
    if a1 == "" then
        return {isMatch = false, output = ""}
    end
    local v3 = a3 or {}
    local format = if not Boolean.toJSBoolean(v3.format) then if not Boolean.toJSBoolean(posix) then nil else utils.toPosixSlashes else v3.format
    local v4 = if not (a1 == glob) then a1 else if not Boolean.toJSBoolean(format) then a1 else format(a1)
    if not v1 then
        v1 = (if not Boolean.toJSBoolean(format) then a1 else format(a1)) == glob
    end
    if not v1 or v3.capture == true then
        v1 = if v3.matchBase == true then u60.matchBase(a1, a2, a3, posix) else if v3.basename ~= true then a2:exec(v4) else u60.matchBase(a1, a2, a3, posix)
    end
    return {isMatch = Boolean.toJSBoolean(v1), match = v1, output = v4}
end

function u60.matchBase(a1, a2, a3, a4) -- Line: 240 -- types: a4: boolean?
    error("matchBase not implemented")
end

function u60.isMatch(a1, a2, a3) -- Line: 267 -- upvalues: u60 (val) -- types: a1: string
    return u60(a2, a3)(a1)
end

function u60.parse(a1, a2) -- Line: 285 -- upvalues: Array (val), u60 (val), parse (val), Object (val)
    if Array.isArray(a1) then
        return Array.map(a1, function(a1) -- Line: 287 -- upvalues: u60 (upval), a2 (val)
            return u60.parse(a1, a2)
        end)
    end
    return parse(a1, Object.assign({}, a2, {fastpaths = false}))
end

function u60.scan(a1, a2) -- Line: 321 -- upvalues: scan (val)
    return scan(a1, a2)
end

function u60.compileRe(a1, a2, a3, a4) -- Line: 337
    -- upvalues: Boolean (val), u60 (val)
    if (a3 or false) == true then
        return a1.output
    end
    local v1 = a2 or {}
    local v2 = if not Boolean.toJSBoolean(v1.contains) then "$" else ""
    local v3 = tostring(a1.output)
    local v4 = ("%s(?:%s)%s"):format(if not Boolean.toJSBoolean(v1.contains) then "^" else "", v3, v2)
    if typeof(a1) == "table" and a1.negated == true then
        v4 = ("^(?!%s).*$"):format(v4)
    end
    local v5 = u60.toRegex(v4, a2)
    if (a4 or false) == true then
        v5.state = a1
    end
    return v5
end

function u60.makeRe(a1, a2, a3, a4) -- Line: 381
    -- upvalues: Boolean (val), Error (val), parse (val), u60 (val)
    local v1 = a2 or {}
    if not Boolean.toJSBoolean(a1) or typeof(a1) ~= "string" then
        error(Error.new("TypeError: Expected a non-empty string"))
    end
    local v2 = {negated = false, fastpaths = true}
    if v1.fastpaths ~= false then
        if string.sub(a1, 1, 1) == "." or string.sub(a1, 1, 1) == "*" then
            v2.output = parse.fastpaths(a1, v1)
        end
    end
    if not Boolean.toJSBoolean(v2.output) then
        v2 = parse(a1, v1)
    end
    return u60.compileRe(v2, v1, a3 or false, a4 or false)
end

function u60.toRegex(a1, a2) -- Line: 420 -- upvalues: u21 (val), Boolean (val) -- types: a1: string
    local success, result = pcall(function() -- Line: 421 -- upvalues: a2 (val), u21 (upval), a1 (val), Boolean (upval)
        local v1 = a2 or {}
        return u21(a1, Boolean.toJSBoolean(v1.flags) and v1.flags or (if not Boolean.toJSBoolean(v1.nocase) then "" else "i"))
    end)
    if success then
        return result
    end
    if a2 ~= nil and a2.debug == true then
        error(result)
    end
    return u21("$^")
end

u60.constants = constants
return u60