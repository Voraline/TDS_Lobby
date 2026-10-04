-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus.__mocks__.Module
-- Decompile time: 5.64 ms

local requireOverride
local u0 = {}
local u1 = {}
local u2 = {}
if _G.__NO_LOADMODULE__ then
    warn("debug.loadmodule not enabled. Test plans relying on resetModules will not work properly.")
    return {
        requireOverride = require,
        resetModules = function() end,
        mock = function(a1, a2) -- Line: 30 -- types: a1: userdata, a2: function
            local v1 = a2()
            local v2 = require(a1)
            for k, v in pairs(v1) do
                v2[k] = v
            end
            for k2, i in pairs(v2) do
                if v1[k2] == nil then
                    v2[k2] = nil
                end
            end
        end,
        unmock = function(a1) end,
    }
end

function requireOverride(a1) -- Line: 50
    -- upvalues: u0 (ref), u2 (val), requireOverride (val), u1 (ref)
    if a1 ~= script and a1 ~= script.Parent and a1.Name ~= "jest-roblox" and a1.Name ~= "DeveloperTools" then
        if a1.Name ~= "RegExp" and a1.Name ~= "luau-regexp" then
            local v1
            if u0[a1] ~= nil then
                return u0[a1]
            end
            local v2 = u2[a1]
            if typeof(v2) ~= "function" then
                local v3, v4
                v2, v3, v4 = debug.loadmodule(a1)
                assert(v2 ~= nil, v3)
                local v5 = getfenv(v2)
                v5.require = requireOverride
                if (v2()) == nil then
                    error(string.format(
                        "[Module Error]: %s did not return a valid result\n\tModuleScripts must return a non-nil value",
                        (tostring(a1))
                    ))
                end
                u1[a1] = v4
            elseif (u2[a1]()) == nil then
                error(string.format("[Mock Error]: %s did not return a valid result\n\tmocks must return a non-nil value", (tostring(a1))))
            end
            u0[a1] = v1
            return v1
        end
        return (require(a1))
    end
    return (require(a1))
end

return {
    requireOverride = requireOverride,
    resetModules = function() -- Line: 124 -- upvalues: u0 (ref), u1 (ref)
        u0 = {}
        for k, v in pairs(u1) do
            v()
        end
        u1 = {}
    end,
    mock = function(a1, a2) -- Line: 135
        -- upvalues: u0 (ref), u1 (ref), requireOverride (val), u2 (val)
        if u0[a1] ~= nil then
            u0[a1] = nil
            local v1 = u1[a1]
            if v1 then
                v1()
                u1[a1] = nil
            end
        end
        local v2 = getfenv(a2)
        v2.require = requireOverride
        u2[a1] = a2
    end,
    unmock = function(a1) -- Line: 157 -- upvalues: u0 (ref), u1 (ref), u2 (val) -- types: a1: userdata
        if u0[a1] ~= nil then
            u0[a1] = nil
            local v1 = u1[a1]
            if v1 then
                v1()
                u1[a1] = nil
            end
        end
        u2[a1] = nil
    end,
}