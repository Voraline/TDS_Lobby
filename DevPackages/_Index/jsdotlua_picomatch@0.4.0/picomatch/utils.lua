-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_picomatch@0.4.0.picomatch.utils
-- Decompile time: 1.88 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local String = v1.String
local u12 = {}
local constants = require(script.Parent:WaitForChild("constants"))
local REGEX_SPECIAL_CHARS = constants.REGEX_SPECIAL_CHARS
local REGEX_SPECIAL_CHARS_GLOBAL = constants.REGEX_SPECIAL_CHARS_GLOBAL

function u12.isObject(a1) -- Line: 26 -- upvalues: Array (val)
    local v1 = false
    if a1 ~= nil then
        v1 = false
        if typeof(a1) == "table" then
            v1 = not Array.isArray(a1)
        end
    end
    return v1
end

function u12.hasRegexChars(a1) -- Line: 29 -- upvalues: REGEX_SPECIAL_CHARS (val)
    return string.match(a1, REGEX_SPECIAL_CHARS) ~= nil
end

function u12.isRegexChar(a1) -- Line: 32 -- upvalues: u12 (val) -- types: a1: string
    local v1 = false
    if #a1 == 1 then
        v1 = u12.hasRegexChars(a1)
    end
    return v1
end

local stringReplace = require(script.Parent:WaitForChild("stringUtils")).stringReplace

function u12.escapeRegex(a1) -- Line: 39 -- upvalues: stringReplace (val), REGEX_SPECIAL_CHARS_GLOBAL (val)
    return stringReplace(a1, REGEX_SPECIAL_CHARS_GLOBAL, function(a1) -- Line: 41
        return "\\" .. a1
    end)
end

function u12.toPosixSlashes(a1) -- Line: 47
    error("toPosixSlashes not implemented")
end

function u12.removeBackslashes(a1) -- Line: 52
    error("removeBackslashes not implemented")
end

function u12.supportsLookbehinds() -- Line: 60
    return false
end

function u12.isWindows(a1) -- Line: 66
    if typeof(a1) == "table" and typeof(a1.windows) == "boolean" then
        return a1.windows
    end
    return false
end

function u12.escapeLast(a1, a2, a3) -- Line: 78
    -- upvalues: String (val), u12 (val)
    local v1 = String.lastIndexOf(a1, a2, a3)
    if v1 == -1 then
        return a1
    end
    if a1:sub(v1 - 1, v1 - 1) == "\\" then
        return u12.escapeLast(a1, a2, v1 - 1)
    end
    return ("%s%s"):format(String.slice(a1, 1, v1), (String.slice(a1, v1)))
end

function u12.removePrefix(a1, a2) -- Line: 89 -- upvalues: String (val) -- types: a1: string
    local v1 = a2 or {}
    local v2 = a1
    if String.startsWith(v2, "./") then
        v2 = String.slice(v2, 3)
        v1.prefix = "./"
    end
    return v2
end

function u12.wrapOutput(a1, a2, a3) -- Line: 99 -- upvalues: Boolean (val)
    local v1 = a3 or {}
    local v2 = if not Boolean.toJSBoolean(v1.contains) then "$" else ""
    local v3 = ("%s(?:%s)%s"):format(if not Boolean.toJSBoolean(v1.contains) then "^" else "", a1, v2)
    if (a2 or {}).negated == true then
        v3 = ("(?:^(?!%s).*$)"):format(v3)
    end
    return v3
end

return u12