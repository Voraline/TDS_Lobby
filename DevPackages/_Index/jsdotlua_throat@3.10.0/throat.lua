-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_throat@3.10.0.throat
-- Decompile time: 5.66 ms

local v1 = require(script.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local promise = require(script.Parent:WaitForChild("promise"))
local v2 = {}
local u19 = {}
local u20 = nil

local function isCallable(a1) -- Line: 58
    local v1 = true
    if typeof(a1) ~= "function" then
        v1 = false
        if typeof(a1) == "table" then
            v1 = false
            if typeof((getmetatable(a1))) == "table" then
                v1 = typeof((getmetatable(a1)).__call) == "function"
            end
        end
    end
    return v1
end

local function throatInternal(a1) -- Line: 68 -- upvalues: u20 (ref), promise (val), u19 (val) -- types: a1: number
    local runDelayed = nil
    local onFulfill = nil
    local onReject = nil
    local release = nil
    local u7 = u20.new()
    local u11 = bit32.bor(a1, 0)

    function runDelayed(a1) -- Line: 89 -- upvalues: promise (upval), onFulfill (ref), onReject (ref)
        local success, result, v1 = pcall(function() -- Line: 90 -- upvalues: promise (upval), a1 (val), onFulfill (upval), onReject (upval)
            return ((promise.resolve((a1.fn((table.unpack(a1.args)))))):andThen(onFulfill, onReject)), true
        end)
        if not success then
            onReject(result)
        end
        if v1 then
            return result
        end
    end

    function onFulfill(a1) -- Line: 102 -- upvalues: release (ref)
        release()
        return a1
    end

    function onReject(a1) -- Line: 106 -- upvalues: release (ref)
        release()
        error(a1)
    end

    function release() -- Line: 110 -- upvalues: u7 (val), u11 (ref)
        local v1 = u7:shift()
        if v1 ~= nil then
            v1:resolve(v1)
            return
        end
        u11 = bit32.bor(u11, 0) + 1
    end

    return function(a1, a2) -- Line: 78
        -- upvalues: u11 (ref), promise (upval), onFulfill (ref), onReject (ref), u7 (val), u19 (upval)
        -- upvalues: runDelayed (ref)
        if bit32.bor(u11, 0) == 0 then
            return (promise.new(function(a1_2) -- Line: 85 -- upvalues: u7 (upval), u19 (upval), a1 (val), a2 (val)
                u7:push((u19.new(a1_2, a1, a2)))
            end)):andThen(runDelayed)
        end
        u11 = bit32.bor(u11, 0) - 1
        return (promise.new(function(a1_2) -- Line: 81 -- upvalues: a1 (val), a2 (val)
            a1_2(a1(table.unpack(a2)))
        end)):andThen(
            onFulfill,
            onReject
        )
    end
end

local function earlyBound(a1, a2) -- Line: 121 -- upvalues: throatInternal (val) -- types: a1: number, a2: function
    local u7 = throatInternal((bit32.bor(a1, 0)))
    return function(...) -- Line: 123 -- upvalues: u7 (val), a2 (val)
        local v1 = {...}
        local v2 = {}
        local v3 = #v1 - 1
        for i = 0, v3 do
            v2[i + 1] = v1[i + 1]
        end
        return u7(a2, v2)
    end
end

local function lateBound(a1) -- Line: 132 -- upvalues: throatInternal (val), Error (val) -- types: a1: number
    local u6 = throatInternal((bit32.bor(a1, 0)))
    return function(a1, ...) -- Line: 134 -- upvalues: Error (upval), u6 (val)
        local v1 = {a1, ...}
        local v2 = true
        if typeof(a1) ~= "function" then
            v2 = false
            if typeof(a1) == "table" then
                v2 = false
                if typeof((getmetatable(a1))) == "table" then
                    v2 = typeof((getmetatable(a1)).__call) == "function"
                end
            end
        end
        if not v2 then
            error(Error.new("Expected throat fn to be a function but got " .. tostring((typeof(a1)))))
        end
        v2 = {}
        local v3 = #v1 - 1
        for i = 1, v3 do
            v2[i] = v1[i + 1]
        end
        return u6(a1, v2)
    end
end

function v2.default(a1, a2) -- Line: 148
    -- upvalues: Error (val), throatInternal (val)
    local v1
    local v2 = true
    if typeof(a1) ~= "function" then
        v2 = false
        if typeof(a1) == "table" then
            v2 = false
            if typeof((getmetatable(a1))) == "table" then
                v2 = typeof((getmetatable(a1)).__call) == "function"
            end
        end
    end
    if not v2 then
        v1 = a1
    else
        v2 = a2
        a2 = a1
        v1 = v2
    end
    if typeof(v1) ~= "number" then
        error(Error.new("Expected throat size to be a number but got " .. tostring((typeof(v1)))))
    end
    if a2 ~= nil then
        v2 = true
        if typeof(a2) ~= "function" then
            v2 = false
            if typeof(a2) == "table" then
                v2 = false
                if typeof((getmetatable(a2))) == "table" then
                    v2 = typeof((getmetatable(a2)).__call) == "function"
                end
            end
        end
        if not v2 then
            error(Error.new("Expected throat fn to be a function but got " .. tostring((typeof(a2)))))
        end
    end
    if a2 ~= nil then
        v2 = true
        if typeof(a2) ~= "function" then
            v2 = false
            if typeof(a2) == "table" then
                v2 = false
                if typeof((getmetatable(a2))) == "table" then
                    v2 = typeof((getmetatable(a2)).__call) == "function"
                end
            end
        end
        if v2 then
            local u121 = throatInternal((bit32.bor(bit32.bor(v1, 0), 0)))
            return function(...) -- Line: 123 -- upvalues: u121 (val), a2 (val)
                local v1 = {...}
                local v2 = {}
                local v3 = #v1 - 1
                for i = 0, v3 do
                    v2[i + 1] = v1[i + 1]
                end
                return u121(a2, v2)
            end
        end
    end
    local u134 = throatInternal((bit32.bor(bit32.bor(v1, 0), 0)))
    return function(a1, ...) -- Line: 134 -- upvalues: Error (upval), u134 (val)
        local v1 = {a1, ...}
        local v2 = true
        if typeof(a1) ~= "function" then
            v2 = false
            if typeof(a1) == "table" then
                v2 = false
                if typeof((getmetatable(a1))) == "table" then
                    v2 = typeof((getmetatable(a1)).__call) == "function"
                end
            end
        end
        if not v2 then
            error(Error.new("Expected throat fn to be a function but got " .. tostring((typeof(a1)))))
        end
        v2 = {}
        local v3 = #v1 - 1
        for i = 1, v3 do
            v2[i] = v1[i + 1]
        end
        return u134(a1, v2)
    end
end

u19.__index = u19

function u19.new(a1, a2, a3) -- Line: 181 -- upvalues: u19 (val)
    local v1 = setmetatable({}, u19)
    v1.resolve = a1
    v1.fn = a2
    v1.args = a3
    return v1
end

local u27 = {}
u27.__index = u27

function u27.new() -- Line: 209 -- upvalues: u27 (val)
    local v1 = setmetatable({}, u27)
    v1._s1 = {}
    v1._s2 = {}
    v1._pushBlock = {}
    v1._shiftBlock = v1._pushBlock
    v1._pushIndex = 0
    v1._shiftIndex = 0
    return v1
end

function u27:push(a2) -- Line: 220
    if self._pushIndex == 64 then
        self._pushIndex = 0
        self._pushBlock = {}
        local _s1 = self._s1
        local v1 = #self._s1 + 1
        _s1[v1] = self._pushBlock
    end
    self._pushBlock[self._pushIndex + 1] = a2
    self._pushIndex = self._pushIndex + 1
end

function u27:shift() -- Line: 230 -- upvalues: Array (val)
    if self._shiftIndex == 64 then
        self._shiftIndex = 0
        local _s2 = self._s2
        if #_s2 == 0 then
            local _s1 = self._s1
            if #_s1 == 0 then
                return nil
            end
            self._s1 = _s2
            self._s2 = Array.reverse(_s1)
            _s2 = self._s2
        end
        self._shiftBlock = table.remove(_s2)
    end
    if self._pushBlock == self._shiftBlock and self._pushIndex == self._shiftIndex then
        return nil
    end
    local v1 = self._shiftBlock[self._shiftIndex + 1]
    self._shiftBlock[self._shiftIndex + 1] = nil
    self._shiftIndex = self._shiftIndex + 1
    return v1
end

return v2