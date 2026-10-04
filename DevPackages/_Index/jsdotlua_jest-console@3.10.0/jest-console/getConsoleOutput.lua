-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-console@3.10.0.jest-console.getConsoleOutput
-- Decompile time: 3.20 ms

local v1 = {}
local v2 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v2.Array
local String = v2.String
local chalk = require(script.Parent.Parent:WaitForChild("chalk"))
require(script.Parent.Parent:WaitForChild("jest-types"))
local formatStackTrace = (require((script.Parent.Parent:WaitForChild("jest-message-util")))).formatStackTrace
require(script.Parent:WaitForChild("types"))

function v1.default(a1, a2, a3) -- Line: 30 -- upvalues: Array (val), String (val), chalk (val), formatStackTrace (val)
    local u5 = if not a3.verbose then "    " else "  "
    local u9 = u5 .. "  "
    local v1 = Array.reduce(a1, function(a1, a2_2) -- Line: 34
        -- upvalues: Array (upval), String (upval), u9 (val), chalk (upval), a3 (val), formatStackTrace (upval)
        -- upvalues: a2 (val), u5 (val)
        local type = a2_2.type
        local message = a2_2.message
        local origin = a2_2.origin
        local v1 = Array.join(Array.map(String.split(message, "\n"), function(a1) -- Line: 38 -- upvalues: u9 (upval)
            return u9 .. a1
        end), "\n")
        local v2 = "console." .. type
        local v3 = true
        local v4 = true
        if type == "warn" then
            v1 = chalk.yellow(v1)
            v2 = chalk.yellow(v2)
            v3 = a3.noStackTrace or false
            v4 = false
        elseif type == "error" then
            v1 = chalk.red(v1)
            v2 = chalk.red(v2)
            v3 = a3.noStackTrace or false
            v4 = false
        end
        local v5 = formatStackTrace(origin, a2, {noStackTrace = v3, noCodeFrame = v4})
        return a1 .. u5 .. (chalk.dim(v2)) .. "\n" .. (String.trimEnd(v1)) .. "\n" .. (chalk.dim(String.trimEnd(v5))) .. "\n\n"
    end, "")
    return (String.trimEnd(v1)) .. "\n"
end

return v1