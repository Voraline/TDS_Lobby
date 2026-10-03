-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-mock-genv@3.10.0.jest-mock-genv
-- Decompile time: 1.70 ms

require(script.Parent:WaitForChild("luau-polyfill"))
local v1 = {}
local u9 = {}
local u10 = {}
u10.print = print
u10.warn = warn
u10.math = {random = math.random}
u9.__index = u9

function u9.new() -- Line: 60 -- upvalues: u9 (val)
    local v1 = setmetatable({}, u9)
    v1.automocks = v1:_createGlobalAutomocks()
    v1.envObject = v1:_createGlobalEnv(v1.automocks)
    v1.currentlyMocked = false
    return v1
end

function u9.isMockGlobalLibrary(a1, a2) -- Line: 70
    local v1 = false
    if typeof(a2) == "table" then
        v1 = a2._isMockGlobalLibrary == true
    end
    return v1
end

function u9._createGlobalAutomocks(a1) -- Line: 74 -- upvalues: u10 (val)
    local implement

    function implement(a1, a2) -- Line: 75 -- upvalues: implement (val) -- types: a2: table
        local v1
        for i, j in a1 do
            if typeof(j) == "function" then
                a2[i] = {_isGlobalAutomockFn = true}
            elseif typeof(j) ~= "table" then
                error("Unexpected mockable global type - this is an internal bug")
            else
                v1 = {}
                implement(j, v1)
                a2[i] = v1
            end
        end
    end

    local v1 = {}
    implement(u10, v1)
    return v1
end

function u9._createGlobalEnv(a1, a2) -- Line: 97 -- types: a1: table, a2: table
    local makeSentinelForLibrary

    function makeSentinelForLibrary(a1, a2) -- Line: 98
        -- upvalues: makeSentinelForLibrary (val)
        local v1
        local v2 = {_isMockGlobalLibrary = true, _automocksRef = a1}
        for i, j in a1 do
            if typeof(j) == "table" and not j._isGlobalAutomockFn then
                v1 = table.clone(a2)
                table.insert(v1, i)
                v2[i] = (makeSentinelForLibrary(j, v1))
            end
        end
        local v3 = {
            __index = function(a1_2, a2_2) -- Line: 117 -- upvalues: a1 (val), a2 (val) -- types: a2_2: string
                if typeof(a2_2) ~= "string" then
                    error((("Cannot index globalEnv with %* (expected string)"):format(a2_2)))
                end
                if string.sub(a2_2, 1, 2) == "$$" then
                    return nil
                end
                local v1 = a1[a2_2]
                if typeof(v1) == "table" and v1._isGlobalAutomockFn then
                    return v1._maybeUnmocked or error("globalEnv has not been initialised by Jest here")
                end
                local v2 = ""
                for i, j in a2 do
                    v2 = v2 .. j .. "."
                end
                v2 = v2 .. a2_2
                error((("Jest does not yet support mocking the %* global."):format(v2)))
            end,
        }
        setmetatable(v2, v3)
        return table.freeze(v2)
    end

    return (makeSentinelForLibrary(a2, {}))
end

v1.GlobalMocker = u9
v1.MOCKABLE_GLOBALS = u10
return v1