-- Script path: ReplicatedStorage.Packages.Lyra.Log
-- Decompile time: 1.12 ms

local u0 = {"fatal", "error", "warn", "info", "debug", "trace"}
local u7 = {level = "info"}

function u7.setLevel(a1) -- Line: 105 -- upvalues: u0 (val), u7 (val) -- types: a1: string
    if table.find(u0, a1) == nil then
        error((("Invalid log level: '%*'"):format(a1)))
    end
    u7.level = a1
end

local u9 = {}
u9.__index = u9

function u9.log(a1, a2, a3, a4) -- Line: 127
    -- upvalues: u0 (val), u7 (val)
    local v1 = table.find(u0, a2)
    if table.find(u0, u7.level) < v1 then
        return
    end
    local u15 = table.clone(a1._context)
    if a4 then
        for i, j in a4 do
            u15[i] = j
        end
    end
    local success, result = pcall(function() -- Line: 142 -- upvalues: a1 (val), a2 (val), a3 (val), u15 (val)
        a1._logCallback({level = a2, message = a3, context = u15})
    end)
    if not success then
        warn((("Error in log callback: %*"):format(result)))
    end
end

function u9.extend(a1, a2) -- Line: 167 -- upvalues: u9 (val) -- types: a1: table, a2: table
    local v1 = table.clone(a1._context)
    for i, j in a2 do
        v1[i] = j
    end
    return (setmetatable({_logCallback = a1._logCallback, _context = v1}, u9))
end

function u7.createLogger(a1, a2) -- Line: 189 -- upvalues: u9 (val) -- types: a1: function, a2: table?
    return (setmetatable({_logCallback = a1, _context = a2 or {}}, u9))
end

return u7