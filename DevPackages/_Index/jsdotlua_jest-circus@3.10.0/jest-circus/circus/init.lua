-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-circus@3.10.0.jest-circus.circus
-- Decompile time: 3.31 ms

local afterAll, afterEach, beforeAll, beforeEach
local _dispatchDescribe = nil
local v1 = {}
require(script.Parent.Parent:WaitForChild("jest-types"))
local bind = require(script.Parent.Parent:WaitForChild("jest-each")).bind
local v2 = require(script.Parent.Parent:WaitForChild("jest-util"))
local ErrorWithStack = v2.ErrorWithStack
local convertDescriptorToString = v2.convertDescriptorToString
local isPromise = v2.isPromise
local dispatchSync = require(script:WaitForChild("state")).dispatchSync
local state = require(script:WaitForChild("state"))
v1.setState = state.setState
v1.getState = state.getState
v1.resetState = state.resetState
v1.run = require(script:WaitForChild("run")).default
require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local u68 = nil
local v3 = {
    __call = function(a1, a2, a3) -- Line: 57 -- upvalues: _dispatchDescribe (ref), u68 (ref)
        return _dispatchDescribe(a3, a2, u68)
    end,
}
u68 = setmetatable({}, v3)
local u75 = nil
local v4 = {
    __call = function(a1, a2, a3) -- Line: 63 -- upvalues: _dispatchDescribe (ref), u75 (ref)
        return _dispatchDescribe(a3, a2, u75, "only")
    end,
}
u75 = setmetatable({}, v4)
local u82 = nil
local v5 = {
    __call = function(a1, a2, a3) -- Line: 69 -- upvalues: _dispatchDescribe (ref), u82 (ref)
        return _dispatchDescribe(a3, a2, u82, "skip")
    end,
}
u82 = setmetatable({}, v5)
u68.each = bind(u68, false)
u75.each = bind(u75, false)
u82.each = bind(u82, false)
u68.only = u75
u68.skip = u82
local v6 = u68

function _dispatchDescribe(a1, a2, a3, a4) -- Line: 97
    -- upvalues: ErrorWithStack (val), convertDescriptorToString (val), dispatchSync (val), isPromise (val)
    local result, v1
    local u8 = ErrorWithStack.new(nil, a3)
    if a1 == nil then
        u8.message = "Missing second argument. It must be a callback function."
        error(u8)
    end
    if typeof(a1) ~= "function" then
        u8.message = ("Invalid second argument, %s. It must be a callback function."):format(a1)
        error(u8)
    end
    _, result, v1 = xpcall(function() -- Line: 120 -- upvalues: a2 (ref), convertDescriptorToString (upval)
        a2 = convertDescriptorToString(a2)
    end, function(a1) -- Line: 123 -- upvalues: u8 (val)
        u8.message = a1.message
        error(u8)
    end)
    if v1 then
        return result
    end
    dispatchSync({name = "start_describe_definition", asyncError = u8, blockName = a2, mode = a4})
    local v2 = a1()
    if isPromise(v2) then
        error(ErrorWithStack.new("Returning a Promise from \"describe\" is not supported. Tests must be defined synchronously.", a3))
    elseif v2 ~= nil then
        error(ErrorWithStack.new("A \"describe\" callback must not return a value.", a3))
    end
    dispatchSync({name = "finish_describe_definition", blockName = a2, mode = a4})
end

local function _addHook(a1, a2, a3, a4) -- Line: 165
    -- upvalues: ErrorWithStack (val), dispatchSync (val)
    local v1 = ErrorWithStack.new(nil, a3)
    if typeof(a1) ~= "function" then
        v1.message = "Invalid first argument. It must be a callback function."
        error(v1)
    end
    dispatchSync({
        name = "add_hook",
        asyncError = v1,
        fn = a1,
        hookType = a2,
        timeout = a4,
    })
end

function beforeEach(a1, a2) -- Line: 182 -- upvalues: _addHook (val), beforeEach (ref)
    return _addHook(a1, "beforeEach", beforeEach, a2)
end

function beforeAll(a1, a2) -- Line: 186 -- upvalues: _addHook (val), beforeAll (ref)
    return _addHook(a1, "beforeAll", beforeAll, a2)
end

function afterEach(a1, a2) -- Line: 190 -- upvalues: _addHook (val), afterEach (ref)
    return _addHook(a1, "afterEach", afterEach, a2)
end

function afterAll(a1, a2) -- Line: 194 -- upvalues: _addHook (val), afterAll (ref)
    return _addHook(a1, "afterAll", afterAll, a2)
end

local _addTest = nil
local u113 = nil
local v7 = {
    __call = function(a1, a2, a3, a4) -- Line: 212 -- upvalues: _addTest (ref), u113 (ref) -- types: a4: number?
        return _addTest(a2, nil, a3, u113, a4)
    end,
}
u113 = setmetatable({}, v7)
local u120 = nil
local v8 = {
    __call = function(a1, a2, a3, a4) -- Line: 218 -- upvalues: _addTest (ref), u120 (ref) -- types: a4: number?
        return _addTest(a2, "skip", a3, u120, a4)
    end,
}
u120 = setmetatable({}, v8)
local v9 = {
    __call = function(a1, a2, a3, a4) -- Line: 224 -- upvalues: _addTest (ref), u113 (ref) -- types: a4: number?
        return _addTest(a2, "only", a3, u113.only, a4)
    end,
}
local v10 = setmetatable({}, v9)

function bindFailing(a1) -- Line: 229 -- upvalues: _addTest (ref)
    function failing(a1_2, a2, a3) -- Line: 230 -- upvalues: _addTest (upval), a1 (val) -- types: a3: number?
        return _addTest(a1_2, a1, a2, failing, a3, true)
    end

    return failing
end

function u113.todo(a1, ...) -- Line: 236 -- upvalues: ErrorWithStack (val), u113 (ref), _addTest (ref)
    local v1 = {...}
    if #v1 > 0 or typeof(a1) ~= "string" then
        error(ErrorWithStack.new("Todo must be called with only a description.", u113.todo))
    end
    return _addTest(a1, "todo", function() end, u113.todo)
end

function _addTest(a1, a2, a3, a4, a5, a6) -- Line: 244
    -- upvalues: ErrorWithStack (val), convertDescriptorToString (val), dispatchSync (val)
    local result, v1
    local u11 = ErrorWithStack.new(nil, a4)
    local u12 = false
    _, result, v1 = xpcall(function() -- Line: 255 -- upvalues: a1 (ref), convertDescriptorToString (upval)
        a1 = convertDescriptorToString(a1)
    end, function(a1) -- Line: 257 -- upvalues: u11 (val), u12 (ref)
        u11.message = a1.message
        u12 = true
    end)
    if v1 then
        return result
    end
    if u12 then
        error(u11)
    end
    if a3 == nil then
        u11.message = "Missing second argument. It must be a callback function. Perhaps you want to use `test.todo` for a test placeholder."
        error(u11)
    end
    if typeof(a3) ~= "function" then
        u11.message = ("Invalid second argument, %s. It must be a callback function."):format((tostring(a3)))
        error(u11)
    end
    return (dispatchSync({
        name = "add_test",
        asyncError = u11,
        fn = a3,
        failing = if a6 ~= nil then a6 else false,
        mode = a2,
        testName = a1,
        timeout = a5,
    }))
end

u113.each = bind(u113)
v10.each = bind(v10)
u120.each = bind(u120)
v10.failing = bindFailing("only")
u120.failing = bindFailing("skip")
u113.failing = bindFailing()
u113.only = v10
u113.skip = u120
v5 = u113
v1.afterAll = afterAll
v1.afterEach = afterEach
v1.beforeAll = beforeAll
v1.beforeEach = beforeEach
v1.describe = v6
v1.it = v5
v1.test = v5
v1.default = {
    afterAll = afterAll,
    afterEach = afterEach,
    beforeAll = beforeAll,
    beforeEach = beforeEach,
    describe = v6,
    it = v5,
    test = v5,
}
return v1