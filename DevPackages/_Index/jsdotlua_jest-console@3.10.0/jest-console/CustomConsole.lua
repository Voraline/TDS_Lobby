-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-console@3.10.0.jest-console.CustomConsole
-- Decompile time: 3.99 ms

local v1 = {}
local default = require(script.Parent:WaitForChild("Console")).default
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Boolean = v2.Boolean
local inspect = v2.util.inspect
local helpers = require(script.Parent:WaitForChild("helpers"))
local format = helpers.format
local formatWithOptions = helpers.formatWithOptions
require(script.Parent.Parent:WaitForChild("jest-roblox-shared"))
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
local v3 = require(script.Parent.Parent:WaitForChild("jest-util"))
local clearLine = v3.clearLine
local formatTime = v3.formatTime
require(script.Parent:WaitForChild("types"))
local v4 = {__index = default}
local u72 = setmetatable({}, v4)
u72.__index = u72

function u72.new(a1, a2, a3) -- Line: 81 -- upvalues: default (val), u72 (val) -- types: a3: function?
    local v1 = default.new(a1, a2)
    local v2 = setmetatable(v1, u72)
    v1 = if a3 == nil then function(a1, a2) -- Line: 90
        return a2
    end else a3
    v2._counters = {}
    v2._timers = {}
    v2._groupDepth = 0
    v2.Console = default
    v2._stdout = a1
    v2._stderr = a2
    v2._formatBuffer = v1
    return v2
end

function u72:_log(a2, a3) -- Line: 107 -- upvalues: clearLine (val), default (val) -- types: a3: string
    clearLine(self._stdout)
    default.log(self, self._formatBuffer(a2, (("  "):rep(self._groupDepth)) .. a3))
end

function u72:_logError(a2, a3) -- Line: 113 -- upvalues: clearLine (val), default (val) -- types: a3: string
    clearLine(self._stderr)
    default.error(self, self._formatBuffer(a2, (("  "):rep(self._groupDepth)) .. a3))
end

function u72.assert(a1, a2, a3) -- Line: 119
    xpcall(function() -- Line: 120 -- upvalues: a2 (val)
        assert(a2)
    end, function(a1_2) -- Line: 122 -- upvalues: a3 (val), a1 (val)
        local v1 = ""
        if a3 ~= nil then
            v1 = " " .. tostring(a3)
        end
        a1:_logError("assert", (tostring(a1_2)) .. v1)
    end)
end

function u72.count(a1, a2) -- Line: 132 -- upvalues: format (val) -- types: a2: string?
    local v1 = if a2 == nil then "default" else a2
    if a1._counters[v1] == nil then
        a1._counters[v1] = 0
    end
    local _counters_2 = a1._counters
    _counters_2[v1] = _counters_2[v1] + 1
    a1:_log("count", (format("%s: %s", v1, a1._counters[v1])))
end

function u72.countReset(a1, a2) -- Line: 143 -- types: a2: string?
    local v1 = if a2 == nil then "default" else a2
    a1._counters[v1] = 0
end

function u72.debug(a1, a2, ...) -- Line: 148 -- upvalues: format (val)
    a1:_log("debug", (format(a2, ...)))
end

function u72.dir(a1, a2, a3) -- Line: 152 -- upvalues: inspect (val), formatWithOptions (val)
    local v1 = a3 or {}
    a1:_log("dir", (formatWithOptions(v1, (inspect(a2, v1)))))
end

function u72.dirxml(a1, a2, ...) -- Line: 158 -- upvalues: format (val)
    a1:_log("dirxml", (format(a2, ...)))
end

function u72.error(a1, a2, ...) -- Line: 162 -- upvalues: format (val)
    a1:_logError("error", (format(a2, ...)))
end

function u72.group(a1, a2, ...) -- Line: 166 -- upvalues: Boolean (val), chalk (val), format (val) -- types: a2: string?
    local v1 = {...}
    a1._groupDepth = a1._groupDepth + 1
    if Boolean.toJSBoolean(a2) then
        a1:_log("group", (chalk.bold((format(a2, ...)))))
    elseif #v1 > 0 then
        a1:_log("group", (chalk.bold((format(a2, ...)))))
    end
end

function u72.groupCollapsed(a1, a2, ...) -- Line: 174
    -- upvalues: Boolean (val), chalk (val), format (val)
    local v1 = {...}
    a1._groupDepth = a1._groupDepth + 1
    if Boolean.toJSBoolean(a2) then
        a1:_log("groupCollapsed", (chalk.bold((format(a2, ...)))))
    elseif #v1 > 0 then
        a1:_log("groupCollapsed", (chalk.bold((format(a2, ...)))))
    end
end

function u72.groupEnd(a1) -- Line: 182
    if 0 < a1._groupDepth then
        a1._groupDepth = a1._groupDepth - 1
    end
end

function u72.info(a1, a2, ...) -- Line: 188 -- upvalues: format (val)
    a1:_log("info", (format(a2, ...)))
end

function u72.log(a1, a2, ...) -- Line: 192 -- upvalues: format (val)
    a1:_log("log", (format(a2, ...)))
end

function u72.time(a1, a2) -- Line: 196 -- types: a2: string?
    local v1
    if a1._timers[if a2 == nil then "default" else a2] ~= nil then
        return
    end
    a1._timers[v1] = (DateTime.now())
end

function u72.timeEnd(a1, a2) -- Line: 204
    -- upvalues: Boolean (val), format (val), formatTime (val)
    local v1 = a1._timers[if a2 == nil then "default" else a2]
    if Boolean.toJSBoolean(v1) then
        local v2
        a1:_log("time", (format("%s: %s", v2, (formatTime((DateTime.now()).UnixTimestampMillis - v1.UnixTimestampMillis)))))
        a1._timers[v2] = nil
    end
end

function u72.timeLog(a1, a2, ...) -- Line: 215
    -- upvalues: Boolean (val), format (val), formatTime (val)
    local v1 = a1._timers[if a2 == nil then "default" else a2]
    if Boolean.toJSBoolean(v1) then
        local v2
        a1:_log("time", (format("%s: %s", v2, formatTime((DateTime.now()).UnixTimestampMillis - v1.UnixTimestampMillis), ...)))
    end
end

function u72.warn(a1, a2, ...) -- Line: 225 -- upvalues: format (val)
    a1:_logError("warn", (format(a2, ...)))
end

function u72.getBuffer(a1) -- Line: 229
    return nil
end

v1.default = u72
return v1