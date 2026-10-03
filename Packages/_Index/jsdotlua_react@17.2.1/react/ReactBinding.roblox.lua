-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactBinding.roblox
-- Decompile time: 2.87 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
require(script.Parent.Parent:WaitForChild("shared"))
local Symbol = v1.Symbol
local u36 = require(script.Parent:WaitForChild("createSignal.roblox"))
local BindingImpl = Symbol("BindingImpl")
local u40 = {}
local u44 = {
    __index = {
        getValue = function(a1) -- Line: 45 -- upvalues: u40 (val) -- types: a1: table
            return u40.getValue(a1)
        end,
        map = function(a1, a2) -- Line: 49 -- upvalues: u40 (val) -- types: a1: table, a2: function
            return u40.map(a1, a2)
        end,
    },
}

function u44.__tostring(a1) -- Line: 58
    return string.format("RoactBinding(%s)", (tostring((a1:getValue()))))
end

function u40.update(a1, a2) -- Line: 63 -- upvalues: BindingImpl (val)
    return a1[BindingImpl].update(a2)
end

function u40.subscribe(a1, a2) -- Line: 67 -- upvalues: BindingImpl (val) -- types: a2: function
    return a1[BindingImpl].subscribe(a2)
end

function u40:getValue() -- Line: 71 -- upvalues: BindingImpl (val)
    return self[BindingImpl]:getValue()
end

function u40.create(a1) -- Line: 75 -- upvalues: u36 (val), ReactSymbols (val), BindingImpl (val), u44 (val)
    local v1, u3 = u36()
    local u4 = {value = a1, subscribe = v1}

    function u4.update(a1) -- Line: 82 -- upvalues: u4 (val), u3 (val) -- types: a1: userdata
        u4.value = a1
        u3(a1)
    end

    function u4.getValue() -- Line: 87 -- upvalues: u4 (val)
        return u4.value
    end

    local v2 = nil
    if _G.__DEV__ then
        v2 = debug.traceback("Binding created at:", 3)
    end
    local v3 = {["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE, [BindingImpl] = u4, ["_source"] = v2}
    return (setmetatable(v3, u44)), u4.update
end

function u40.map(a1, a2) -- Line: 105
    -- upvalues: ReactSymbols (val), u40 (val), BindingImpl (val), u44 (val)
    local v1
    if _G.__DEV__ then
        v1 = false
        if typeof(a1) == "table" then
            v1 = a1["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE
        end
        assert(v1, "Expected `self` to be a binding")
        assert(typeof(a2) == "function", "Expected arg #1 to be a function")
    end
    local v2 = {
        subscribe = function(a1_2) -- Line: 121 -- upvalues: u40 (upval), a1 (val), a2 (val)
            return u40.subscribe(a1, function(a1) -- Line: 122 -- upvalues: a1_2 (val), a2 (upval)
                a1_2(a2(a1))
            end)
        end,
        update = function(a1) -- Line: 127
            error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
        end,
        getValue = function() -- Line: 131 -- upvalues: a2 (val), a1 (val)
            return a2(a1:getValue())
        end,
    }
    v1 = nil
    if _G.__DEV__ then
        v1 = debug.traceback("Mapped binding created at:", 3)
    end
    return (setmetatable({["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE, [BindingImpl] = v2, ["_source"] = v1}, u44))
end

function u40.join(a1) -- Line: 152
    -- upvalues: ReactSymbols (val), u40 (val), BindingImpl (val), u44 (val)
    local v1
    if _G.__DEV__ then
        assert(typeof(a1) == "table", "Expected arg #1 to be of type table")
        local v2 = nil
        v1 = nil
        for i, j in a1, v2, v1 do
            if typeof(j) ~= "table" or j["$$typeof"] ~= ReactSymbols.REACT_BINDING_TYPE then
                error(("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(i))), 2)
            end
        end
    end
    local v3 = {}

    local function getValue() -- Line: 173 -- upvalues: a1 (val)
        local v1 = {}
        for k, v in pairs(a1) do
            v1[k] = (v:getValue())
        end
        return v1
    end

    function v3.subscribe(a1_2) -- Line: 184 -- upvalues: a1 (val), u40 (upval), getValue (val)
        local u1 = {}
        for i, j in a1 do
            u1[i] = (u40.subscribe(j, function(a1) -- Line: 189 -- upvalues: a1_2 (val), getValue (upval)
                a1_2((getValue()))
            end))
        end
        return function() -- Line: 194 -- upvalues: u1 (ref)
            if u1 == nil then
                return
            end
            for i, j in u1 do
                j()
            end
            u1 = nil
        end
    end

    function v3.update(a1) -- Line: 207
        error("Bindings created by joinBindings(...) cannot be updated directly", 2)
    end

    function v3.getValue() -- Line: 211 -- upvalues: getValue (val)
        return (getValue())
    end

    v1 = nil
    if _G.__DEV__ then
        v1 = debug.traceback("Joined binding created at:", 2)
    end
    return (setmetatable({["$$typeof"] = ReactSymbols.REACT_BINDING_TYPE, [BindingImpl] = v3, ["_source"] = v1}, u44))
end

return u40