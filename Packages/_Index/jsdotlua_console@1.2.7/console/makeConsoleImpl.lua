-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_console@1.2.7.console.makeConsoleImpl
-- Decompile time: 1.27 ms

local inspect = require(script.Parent.Parent:WaitForChild("collections")).inspect
return function() -- Line: 5 -- upvalues: inspect (val)
    local v1 = {}
    local u1 = 0

    local function indent() -- Line: 9 -- upvalues: u1 (ref)
        return string.rep("  ", u1)
    end

    function v1.log(a1, ...) -- Line: 13 -- upvalues: inspect (upval), u1 (ref)
        print((string.rep("  ", u1)) .. (if typeof(a1) ~= "string" then inspect(a1) else string.format(a1, ...)))
    end

    function v1.debug(a1, ...) -- Line: 23 -- upvalues: inspect (upval), u1 (ref)
        print((string.rep("  ", u1)) .. (if typeof(a1) ~= "string" then inspect(a1) else string.format(a1, ...)))
    end

    function v1.info(a1, ...) -- Line: 33 -- upvalues: inspect (upval), u1 (ref)
        print((string.rep("  ", u1)) .. (if typeof(a1) ~= "string" then inspect(a1) else string.format(a1, ...)))
    end

    function v1.warn(a1, ...) -- Line: 43 -- upvalues: inspect (upval), u1 (ref)
        warn((string.rep("  ", u1)) .. (if typeof(a1) ~= "string" then inspect(a1) else string.format(a1, ...)))
    end

    function v1.error(a1, ...) -- Line: 53 -- upvalues: inspect (upval), u1 (ref)
        warn((string.rep("  ", u1)) .. (if typeof(a1) ~= "string" then inspect(a1) else string.format(a1, ...)))
    end

    function v1.group(a1, ...) -- Line: 65 -- upvalues: inspect (upval), u1 (ref)
        print((string.rep("  ", u1)) .. (if typeof(a1) ~= "string" then inspect(a1) else string.format(a1, ...)))
        u1 = u1 + 1
    end

    function v1.groupCollapsed(a1, ...) -- Line: 76 -- upvalues: inspect (upval), u1 (ref)
        print((string.rep("  ", u1)) .. (if typeof(a1) ~= "string" then inspect(a1) else string.format(a1, ...)))
        u1 = u1 + 1
    end

    function v1.groupEnd() -- Line: 88 -- upvalues: u1 (ref)
        if u1 > 0 then
            u1 = u1 - 1
        end
    end

    return v1
end