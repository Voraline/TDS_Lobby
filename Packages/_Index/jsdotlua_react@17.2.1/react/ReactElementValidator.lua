-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactElementValidator
-- Decompile time: 12.16 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Object = v1.Object
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local inspect = v1.util.inspect
require(script.Parent.Parent:WaitForChild("shared"))
local isValidElementType = require(script.Parent.Parent:WaitForChild("shared")).isValidElementType
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local getIteratorFn = ReactSymbols.getIteratorFn
local REACT_FORWARD_REF_TYPE = ReactSymbols.REACT_FORWARD_REF_TYPE
local REACT_MEMO_TYPE = ReactSymbols.REACT_MEMO_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local warnAboutSpreadingKeyToJSX = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.warnAboutSpreadingKeyToJSX
local checkPropTypes = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes
local ReactCurrentOwner = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentOwner
local ReactElement = require(script.Parent:WaitForChild("ReactElement"))
local isValidElement = ReactElement.isValidElement
local createElement = ReactElement.createElement
local cloneElement = ReactElement.cloneElement
local jsxDEV = ReactElement.jsxDEV
local setExtraStackFrame = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame
local describeUnknownElementTypeFrameInDEV = require(script.Parent.Parent:WaitForChild("shared")).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV
local v2 = {}

local function setCurrentlyValidatingElement(a1) -- Line: 63
    -- upvalues: describeUnknownElementTypeFrameInDEV (val), setExtraStackFrame (val)
    if _G.__DEV__ then
        if a1 then
            local _owner = a1._owner
            local type = nil
            if _owner then
                type = _owner.type
            end
            setExtraStackFrame((describeUnknownElementTypeFrameInDEV(a1.type, a1._source, type)))
            return
        end
        setExtraStackFrame(nil)
    end
end

local u140 = nil
if _G.__DEV__ then
    u140 = false
end

local function hasOwnProperty(a1, a2) -- Line: 91
    return a1[a2] ~= nil
end

local function getDeclarationErrorAddendum() -- Line: 95 -- upvalues: ReactCurrentOwner (val), getComponentName (val)
    if ReactCurrentOwner.current then
        local v1 = getComponentName(ReactCurrentOwner.current.type)
        if v1 then
            return "\n\nCheck the render method of `" .. v1 .. "`."
        end
    end
    return ""
end

local function getSourceInfoErrorAddendum(a1) -- Line: 106
    if a1 ~= nil then
        return "\n\nCheck your code at " .. (string.gsub(a1.fileName, "^.*[\\/]", "")) .. ":" .. a1.lineNumber .. "."
    end
    return ""
end

local function getSourceInfoErrorAddendumForProps(a1) -- Line: 116
    if a1 == nil then
        return ""
    end
    local __source = a1.__source
    if __source ~= nil then
        return "\n\nCheck your code at " .. (string.gsub(__source.fileName, "^.*[\\/]", "")) .. ":" .. __source.lineNumber .. "."
    end
    return ""
end

local u147 = {}

local function getCurrentComponentErrorInfo(a1) -- Line: 133
    -- upvalues: ReactCurrentOwner (val), getComponentName (val), Boolean (val)
    local v1
    if not ReactCurrentOwner.current then
        v1 = ""
    else
        local v2 = getComponentName(ReactCurrentOwner.current.type)
        v1 = if not v2 then "" else "\n\nCheck the render method of `" .. v2 .. "`."
    end
    if not Boolean.toJSBoolean(v1) then
        local displayName = if typeof(a1) ~= "string" then if typeof(a1) ~= "table" then nil else a1.displayName or a1.name else a1
        if not displayName and typeof(a1) == "function" then
            local v3 = debug.info(a1, "n")
            displayName = if v3 == "" then nil else v3
        end
        if displayName then
            v1 = string.format("\n\nCheck the top-level render call using <%s>.", displayName)
        end
    end
    return v1
end

local function validateExplicitKey(a1, a2, a3) -- Line: 175
    -- upvalues: getCurrentComponentErrorInfo (val), u147 (val), ReactCurrentOwner (val), getComponentName (val)
    -- upvalues: describeUnknownElementTypeFrameInDEV (val), setExtraStackFrame (val), console (val)
    if a1._store ~= nil and not a1._store.validated then
        a1._store.validated = true
        if a1.key ~= nil ~= (a3 ~= nil) then
            return
        end
        local v1 = getCurrentComponentErrorInfo(a2)
        if u147[v1] then
            return
        end
        u147[v1] = true
        local v2 = ""
        if a1 and a1._owner and a1._owner ~= ReactCurrentOwner.current then
            v2 = string.format(" It was passed a child from %s.", (tostring((getComponentName(a1._owner.type)))))
        end
        if _G.__DEV__ then
            if _G.__DEV__ then
                if not a1 then
                    setExtraStackFrame(nil)
                else
                    local _owner_2 = a1._owner
                    local type_2 = nil
                    if _owner_2 then
                        type_2 = _owner_2.type
                    end
                    setExtraStackFrame((describeUnknownElementTypeFrameInDEV(a1.type, a1._source, type_2)))
                end
            end
            if a1.key == nil or a3 == nil then
                console.error(
                    "Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.",
                    v1,
                    v2
                )
            else
                console.error(
                    "Child element received a \"key\" prop (\"%s\") in addition to a key in the \"children\" table of its parent (\"%s\"). Please provide only one key definition. When both are present, the \"key\" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.",
                    tostring(a1.key),
                    tostring(a3),
                    v1,
                    v2
                )
            end
            if _G.__DEV__ then
                setExtraStackFrame(nil)
            end
        end
        return
    end
end

local function validateChildKeys(a1, a2) -- Line: 250
    -- upvalues: Array (val), isValidElement (val), validateExplicitKey (val), getIteratorFn (val)
    local v1
    if typeof(a1) ~= "table" then
        return
    end
    if Array.isArray(a1) then
        local v2
        v1 = #a1
        local v3, v4 = a1, a2
        for i = 1, v1 do
            v2 = v3[i]
            if isValidElement(v2) then
                validateExplicitKey(v2, v4)
            end
        end
        return
    end
    if isValidElement(a1) then
        if not a1._store then
            return
        end
        a1._store.validated = true
        return
    end
    if a1 then
        v1 = getIteratorFn(a1)
        if typeof(v1) == "function" and v1 ~= a1.entries then
            local v5 = v1(a1)
            local v6 = v5.next()
            while not v6.done do
                if isValidElement(v6.value) then
                    validateExplicitKey(v6.value, a2, v6.key)
                end
                v6 = v5.next()
            end
        end
    end
end

local function validatePropTypes(a1) -- Line: 293
    -- upvalues: getComponentName (val), checkPropTypes (val), u140 (ref), console (val)
    if not _G.__DEV__ and not _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        return
    end
    local type = a1.type
    if type ~= nil and typeof(type) ~= "string" then
        if typeof(type) == "function" or typeof(type) ~= "table" then
            return
        end
        local propTypes = type.propTypes
        local validateProps = type.validateProps
        if propTypes or validateProps then
            checkPropTypes(propTypes, validateProps, a1.props, "prop", getComponentName(type), a1)
        elseif type.PropTypes ~= nil and not u140 then
            u140 = true
            console.error(
                "Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?",
                (getComponentName(type)) or "Unknown"
            )
        end
        if type.getDefaultProps ~= nil then
            console.error("getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.")
        end
        return
    end
end

local function validateFragmentProps(a1) -- Line: 343
    -- upvalues: Object (val), describeUnknownElementTypeFrameInDEV (val), setExtraStackFrame (val), console (val)
    if _G.__DEV__ then
        local _owner, type, v1
        local v2 = Object.keys(a1.props)
        local v3 = #v2
        for i = 1, v3 do
            v1 = v2[i]
            if v1 ~= "children" and v1 ~= "key" then
                if _G.__DEV__ then
                    if not a1 then
                        setExtraStackFrame(nil)
                    else
                        _owner = a1._owner
                        type = nil
                        if _owner then
                            type = _owner.type
                        end
                        setExtraStackFrame((describeUnknownElementTypeFrameInDEV(a1.type, a1._source, type)))
                    end
                end
                console.error(
                    "Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.",
                    v1
                )
                if not _G.__DEV__ then
                    break
                end
                setExtraStackFrame(nil)
                break
            end
        end
        if a1.ref ~= nil then
            if _G.__DEV__ then
                if not a1 then
                    setExtraStackFrame(nil)
                else
                    local _owner_2 = a1._owner
                    local type_2 = nil
                    if _owner_2 then
                        type_2 = _owner_2.type
                    end
                    setExtraStackFrame((describeUnknownElementTypeFrameInDEV(a1.type, a1._source, type_2)))
                end
            end
            console.error("Invalid attribute `ref` supplied to `React.Fragment`.")
            if _G.__DEV__ then
                setExtraStackFrame(nil)
            end
        end
    end
end

local function jsxWithValidation(a1, a2, a3, a4, a5, a6) -- Line: 369
    -- upvalues: isValidElementType (val), Object (val), ReactCurrentOwner (val), getComponentName (val), Array (val)
    -- upvalues: REACT_ELEMENT_TYPE (val), inspect (val), console (val), jsxDEV (val), validateChildKeys (val)
    -- upvalues: warnAboutSpreadingKeyToJSX (val), REACT_FRAGMENT_TYPE (val), validateFragmentProps (val)
    -- upvalues: validatePropTypes (val)
    local v1, v2
    local v3 = isValidElementType(a1)
    if not v3 then
        v1 = ""
        if a1 == nil or typeof(a1) == "table" and #Object.keys(a1) == 0 then
            v1 = v1 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
        end
        local v4 = if a5 == nil then "" else "\n\nCheck your code at " .. (string.gsub(a5.fileName, "^.*[\\/]", "")) .. ":" .. a5.lineNumber .. "."
        if not v4 then
            local v5
            if not ReactCurrentOwner.current then
                v5 = ""
            else
                local v6 = getComponentName(ReactCurrentOwner.current.type)
                v5 = if not v6 then "" else "\n\nCheck the render method of `" .. v6 .. "`."
            end
            v1 = v1 .. v5
        else
            v1 = v1 .. v4
        end
        if a1 == nil then
            v2 = "nil"
        elseif Array.isArray(a1) then
            v2 = "array"
        elseif typeof(a1) ~= "table" or a1["$$typeof"] ~= REACT_ELEMENT_TYPE then
            v2 = typeof(a1)
            v1 = v1 .. "\n" .. inspect(a1)
        else
            v2 = string.format("<%s />", getComponentName(a1.type) or "Unknown")
            v1 = v1 .. " Did you accidentally export a JSX literal or Element instead of a component?"
        end
        if _G.__DEV__ then
            console.error(
                "React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s",
                v2,
                v1
            )
        end
    end
    v1 = jsxDEV(a1, a2, a3, a5, a6)
    if v1 == nil then
        return v1
    end
    if v3 then
        local children = a2.children
        if children ~= nil then
            if not a4 then
                validateChildKeys(children, a1)
            elseif Array.isArray(children) then
                v2 = #children
                for i = 1, v2 do
                    validateChildKeys(children[i], a1)
                end
                Object.freeze(children)
            elseif _G.__DEV__ then
                console.error("React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.")
            end
        end
    end
    if _G.__DEV__ and warnAboutSpreadingKeyToJSX and a2.key ~= nil then
        console.error(
            "React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />",
            getComponentName(a1) or "ComponentName"
        )
    end
    if a1 == REACT_FRAGMENT_TYPE then
        validateFragmentProps(v1)
        return v1
    end
    validatePropTypes(v1)
    return v1
end

v2.jsxWithValidation = jsxWithValidation

function v2.jsxWithValidationStatic(a1, a2, a3) -- Line: 491 -- upvalues: jsxWithValidation (val)
    return (jsxWithValidation(a1, a2, a3, true))
end

function v2.jsxWithValidationDynamic(a1, a2, a3) -- Line: 495 -- upvalues: jsxWithValidation (val)
    return (jsxWithValidation(a1, a2, a3, false))
end

function v2.createElementWithValidation(a1, a2, ...) -- Line: 500
    -- upvalues: isValidElementType (val), Object (val), ReactCurrentOwner (val), getComponentName (val), Array (val)
    -- upvalues: REACT_ELEMENT_TYPE (val), inspect (val), console (val), createElement (val), validateChildKeys (val)
    -- upvalues: REACT_FRAGMENT_TYPE (val), validateFragmentProps (val), validatePropTypes (val)
    local v1
    local v2 = isValidElementType(a1)
    if not v2 then
        local v3, v4
        v1 = ""
        if a1 == nil or typeof(a1) == "table" and #Object.keys(a1) == 0 then
            v1 = v1 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports."
        end
        if a2 == nil then
            v3 = ""
        else
            local __source = a2.__source
            v3 = if __source == nil then "" else "\n\nCheck your code at " .. (string.gsub(__source.fileName, "^.*[\\/]", "")) .. ":" .. __source.lineNumber .. "."
        end
        if not v3 then
            local v5
            if not ReactCurrentOwner.current then
                v5 = ""
            else
                local v6 = getComponentName(ReactCurrentOwner.current.type)
                v5 = if not v6 then "" else "\n\nCheck the render method of `" .. v6 .. "`."
            end
            v1 = v1 .. v5
        else
            v1 = v1 .. v3
        end
        if a1 == nil then
            v4 = "nil"
        elseif Array.isArray(a1) then
            v4 = "array"
        elseif a1 == nil or typeof(a1) ~= "table" or a1["$$typeof"] ~= REACT_ELEMENT_TYPE then
            v4 = typeof(a1)
            if a1 ~= nil then
                v1 = v1 .. "\n" .. inspect(a1)
            end
        else
            v4 = string.format("<%s />", getComponentName(a1.type) or "Unknown")
            v1 = v1 .. " Did you accidentally export a JSX literal or Element instead of a component?"
        end
        if _G.__DEV__ then
            console.error(
                "React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s",
                v4,
                v1
            )
        end
    end
    v1 = createElement(a1, a2, ...)
    if v1 == nil then
        return v1
    end
    if v2 then
        for i = 1, (select("#", ...)) do
            validateChildKeys(select(i, ...), a1)
        end
    end
    if a1 == REACT_FRAGMENT_TYPE then
        validateFragmentProps(v1)
        return v1
    end
    validatePropTypes(v1)
    return v1
end

function v2.cloneElementWithValidation(a1, a2, ...) -- Line: 633
    -- upvalues: cloneElement (val), validateChildKeys (val), validatePropTypes (val)
    local v1 = {a1, a2, ...}
    local v2 = cloneElement(a1, a2, ...)
    local v3 = #v1
    for i = 3, v3 do
        validateChildKeys(v1[i], v2.type)
    end
    validatePropTypes(v2)
    return v2
end

return v2