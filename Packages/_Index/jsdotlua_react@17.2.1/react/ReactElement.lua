-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactElement
-- Decompile time: 7.47 ms

local __DEV__ = _G.__DEV__
local Error = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactLazy"))
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local REACT_ELEMENT_TYPE = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_ELEMENT_TYPE
local ReactCurrentOwner = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner
local u71 = {key = true, ref = true, __self = true, __source = true}
local u72 = nil
local u73 = nil
local u75 = nil
if __DEV__ then
    u75 = {}
end
local v1 = {}

local function hasValidRef(a1) -- Line: 59 -- upvalues: __DEV__ (val)
    if __DEV__ and a1.ref ~= nil and type(a1.ref) == "table" and a1.ref.isReactWarning then
        return false
    end
    return a1.ref ~= nil
end

local function hasValidKey(a1) -- Line: 73 -- upvalues: __DEV__ (val)
    if __DEV__ and a1.key ~= nil and type(a1.key) == "table" and a1.key.isReactWarning then
        return false
    end
    return a1.key ~= nil
end

local u80 = {isReactWarning = true}

local function defineKeyPropWarningGetter(a1, a2) -- Line: 92
    -- upvalues: __DEV__ (val), u72 (ref), console (val), u80 (val)
    local function v1() -- Line: 93 -- upvalues: __DEV__ (upval), u72 (upval), console (upval), a2 (val)
        if __DEV__ and not u72 then
            u72 = true
            console.error(
                "%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)",
                a2
            )
        end
    end

    a1.key = nil
    local v2 = {
        __index = function(a1, a2_2) -- Line: 112 -- upvalues: __DEV__ (upval), u72 (upval), console (upval), a2 (val), u80 (upval)
            if a2_2 ~= "key" then
                return nil
            end
            if __DEV__ and not u72 then
                u72 = true
                console.error(
                    "%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)",
                    a2
                )
            end
            return u80
        end,
    }
    setmetatable(a1, v2)
end

local function defineRefPropWarningGetter(a1, a2) -- Line: 124
    -- upvalues: __DEV__ (val), u73 (ref), console (val), u80 (val)
    local function v1() -- Line: 127 -- upvalues: __DEV__ (upval), u73 (upval), console (upval), a2 (val)
        if __DEV__ and not u73 then
            u73 = true
            console.error(
                "%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)",
                a2
            )
        end
    end

    a1.ref = nil
    local v2 = {
        __index = function(a1, a2_2) -- Line: 146 -- upvalues: __DEV__ (upval), u73 (upval), console (upval), a2 (val), u80 (upval)
            if a2_2 ~= "ref" then
                return nil
            end
            if __DEV__ and not u73 then
                u73 = true
                console.error(
                    "%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)",
                    a2
                )
            end
            return u80
        end,
    }
    setmetatable(a1, v2)
end

local function warnIfStringRefCannotBeAutoConverted(a1) -- Line: 158
    -- upvalues: __DEV__ (val), ReactCurrentOwner (val), getComponentName (val), u75 (ref)
    if __DEV__ and type(a1.ref) == "string" and ReactCurrentOwner.current then
        local v1 = getComponentName(ReactCurrentOwner.current.type)
        if not u75[v1] then
            error(string.format(
                "Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref",
                v1 or "Unknown",
                a1.ref
            ))
        end
    end
end

local function ReactElement(a1, a2, a3, a4, a5, a6, a7) -- Line: 209
    -- upvalues: REACT_ELEMENT_TYPE (val), __DEV__ (val)
    local v1 = {
        type = a1,
        key = a2,
        ref = a3,
        props = a7,
        _owner = a6,
        ["$$typeof"] = REACT_ELEMENT_TYPE,
    }
    if __DEV__ then
        local u10 = {validated = false}
        local v2 = {
            __index = u10,
            __newindex = function(a1, a2, a3) -- Line: 246 -- upvalues: u10 (val)
                if a2 == "validated" then
                    u10.validated = a3
                    return
                end
                rawset(a1, a2, a3)
            end,
        }
        v1._store = setmetatable({}, v2)
        v2 = {__index = {_self = a4, _source = a5}}
        setmetatable(v1, v2)
    end
    return v1
end

function v1.jsx(a1, a2, a3) -- Line: 277
    error("JSX is currently unsupported")
end

function v1.jsxDEV(a1, a2, a3, a4, a5) -- Line: 332
    error("JSX is currently unsupported")
    return nil
end

function v1.createElement(a1, a2, ...) -- Line: 408
    -- upvalues: __DEV__ (val), warnIfStringRefCannotBeAutoConverted (val), defineKeyPropWarningGetter (val)
    -- upvalues: defineRefPropWarningGetter (val), ReactElement (val), ReactCurrentOwner (val)
    local v1
    local v2 = if a2 == nil then {} else table.clone(a2)
    local v3 = nil
    local ref_2 = nil
    local __source = nil
    if a2 ~= nil then
        if if not __DEV__ or a2.ref == nil then a2.ref ~= nil else if type(a2.ref) ~= "table" then a2.ref ~= nil else if not a2.ref.isReactWarning then a2.ref ~= nil else false then
            ref_2 = a2.ref
            if __DEV__ then
                warnIfStringRefCannotBeAutoConverted(a2)
            end
        end
        if if not __DEV__ or a2.key == nil then a2.key ~= nil else if type(a2.key) ~= "table" then a2.key ~= nil else if not a2.key.isReactWarning then a2.key ~= nil else false then
            local key_2 = a2.key
            v3 = if type(key_2) ~= "number" then tostring(key_2) else key_2
        end
        __source = if a2.__source ~= nil then a2.__source else nil
        if v2.key ~= nil then
            v2.key = nil
        end
        if v2.ref ~= nil then
            v2.ref = nil
        end
        if v2.__self ~= nil then
            v2.__self = nil
        end
        if v2.__source ~= nil then
            v2.__source = nil
        end
    end
    local v4 = select("#", ...)
    if v4 == 1 then
        v2.children = select(1, ...)
    elseif v4 > 1 then
        v1 = table.create(v4)
        for i = 1, v4 do
            table.insert(v1, (select(i, ...)))
        end
        if __DEV__ then
            table.freeze(v1)
        end
        v2.children = v1
    end
    if type(a1) == "table" and a1.defaultProps then
        local defaultProps = a1.defaultProps
        for j, k in defaultProps do
            if v2[j] == nil then
                v2[j] = defaultProps[j]
            end
        end
    end
    if __DEV__ then
        if v3 or ref_2 then
            v1 = if type(a1) == "function" then debug.info(a1, "n") or "<function>" else if type(a1) ~= "table" then a1 else a1.displayName or a1.name or "Unknown"
            if v3 then
                defineKeyPropWarningGetter(v2, v1)
            end
            if ref_2 then
                defineRefPropWarningGetter(v2, v1)
            end
        end
        if __source == nil then
            __source = {fileName = debug.info(3, "s"), lineNumber = debug.info(3, "l")}
        end
    end
    return (ReactElement(a1, v3, ref_2, nil, __source, ReactCurrentOwner.current, v2))
end

function v1.cloneAndReplaceKey(a1, a2) -- Line: 587 -- upvalues: ReactElement (val)
    return (ReactElement(a1.type, a2, a1.ref, a1._self, a1._source, a1._owner, a1.props))
end

function v1.cloneElement(a1, a2, ...) -- Line: 605
    -- upvalues: Error (val), ReactCurrentOwner (val), __DEV__ (val), u71 (val), ReactElement (val)
    local v1
    if a1 == nil then
        error(Error.new("React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(a1)))
    end
    local props = a1.props
    local v2 = if props == nil then {} else table.clone(props)
    local key = a1.key
    local ref = a1.ref
    local _source = a1._source
    local _owner = a1._owner
    if a2 ~= nil then
        local ref_2 = a2.ref
        if ref_2 ~= nil then
            ref = ref_2
            _owner = ReactCurrentOwner.current
        elseif not __DEV__ or a2.ref == nil or type(a2.ref) ~= "table" then
            if a2.ref ~= nil then end
        elseif not a2.ref.isReactWarning and a2.ref ~= nil then
        end
        local key_2 = a2.key
        if key_2 ~= nil then
            key = if type(key_2) ~= "number" then key_2 or "nil" else key_2
        elseif not __DEV__ or a2.key == nil or type(a2.key) ~= "table" then
            if a2.key ~= nil then end
        elseif not a2.key.isReactWarning and a2.key ~= nil then
        end
    end
    local type_2 = a1.type
    local defaultProps = if type(type_2) ~= "table" then nil else type_2.defaultProps
    if a2 ~= nil then
        local v3
        local v4 = nil
        local v5 = nil
        v3, v1 = a2, a1
        for i, j in a2, v4, v5 do
            if v3[i] ~= nil and not u71[i] then
                if v3[i] ~= nil or defaultProps == nil then
                    v2[i] = v3[i]
                else
                    v2[i] = defaultProps[i]
                end
            end
        end
    end
    local v6 = select("#", ...)
    if v6 == 1 then
        v2.children = select(1, ...)
    elseif v6 > 1 then
        v2.children = {...}
    end
    return (ReactElement(v1.type, key, ref, nil, _source, _owner, v2))
end

function v1.isValidElement(a1) -- Line: 721 -- upvalues: REACT_ELEMENT_TYPE (val)
    local v1 = false
    if type(a1) == "table" then
        v1 = a1["$$typeof"] == REACT_ELEMENT_TYPE
    end
    return v1
end

return v1