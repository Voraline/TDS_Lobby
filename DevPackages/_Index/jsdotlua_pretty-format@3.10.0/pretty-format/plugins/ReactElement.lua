-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format.plugins.ReactElement
-- Decompile time: 3.88 ms

local getChildren
local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Boolean = v1.Boolean
local Object = v1.Object
local v2 = {}
local u23 = require(script.Parent.Parent.Parent:WaitForChild("react-is"))
require(script.Parent.Parent:WaitForChild("Types"))
local markup = require((script.Parent:WaitForChild("lib")):WaitForChild("markup"))
local printChildren = markup.printChildren
local printElement = markup.printElement
local printElementAsLeaf = markup.printElementAsLeaf
local printProps = markup.printProps

function getChildren(a1, a2) -- Line: 29 -- upvalues: Array (val), getChildren (val)
    local u3 = a2
    if not u3 then
        u3 = {}
    end
    if Array.isArray(a1) then
        Array.forEach(a1, function(a1) -- Line: 32 -- upvalues: getChildren (upval), u3 (val)
            getChildren(a1, u3)
        end)
        return u3
    end
    if a1 ~= nil and a1 ~= false then
        table.insert(u3, a1)
    end
    return u3
end

local function getType(a1) -- Line: 41 -- upvalues: Boolean (val), u23 (val)
    local v1
    local type = a1.type
    if typeof(type) == "string" then
        return type
    end
    if typeof(type) == "function" then
        v1 = debug.info(type, "n")
        if Boolean.toJSBoolean(v1) then
            return v1
        end
        return "Unknown"
    end
    if typeof(type) == "table" then
        v1 = getmetatable(type)
        if v1 ~= nil and typeof(v1.__call) == "function" then
            if Boolean.toJSBoolean(type.displayName) then
                return type.displayName
            end
            if Boolean.toJSBoolean(type.name) then
                return type.name
            end
            return "Unknown"
        end
    end
    if u23.isFragment(a1) then
        return "React.Fragment"
    end
    if u23.isSuspense(a1) then
        return "React.Suspense"
    end
    if typeof(type) == "table" and type ~= nil then
        if u23.isContextProvider(a1) then
            return "Context.Provider"
        end
        if u23.isContextConsumer(a1) then
            return "Context.Consumer"
        end
        if u23.isForwardRef(a1) then
            if Boolean.toJSBoolean(type.displayName) then
                return type.displayName
            end
            local displayName = if typeof(type.render) ~= "function" or not Boolean.toJSBoolean(debug.info(type.render, "n")) then if typeof(type.render) ~= "table" then "" else if not Boolean.toJSBoolean(type.render.displayName) then if not Boolean.toJSBoolean(type.render.name) then "" else type.render.name else type.render.displayName else debug.info(type.render, "n")
            if displayName ~= "" then
                return "ForwardRef(" .. displayName .. ")"
            end
            return "ForwardRef"
        end
        if u23.isMemo(a1) then
            local displayName_2 = if Boolean.toJSBoolean(type.displayName) then type.displayName else if typeof(type.type) ~= "table" or not Boolean.toJSBoolean(type.type.displayName) then if typeof(type.type) ~= "function" then "" else if not Boolean.toJSBoolean(debug.info(type.type, "n")) then "" else debug.info(type.type, "n") else type.type.displayName
            if displayName_2 ~= "" then
                return "Memo(" .. displayName_2 .. ")"
            end
            return "Memo"
        end
    end
    return "UNDEFINED"
end

local function getPropKeys(a1) -- Line: 114 -- upvalues: Array (val), Object (val)
    local props = a1.props
    return Array.sort(Array.filter(Object.keys(props), function(a1) -- Line: 117 -- upvalues: props (val)
        local v1 = false
        if a1 ~= "children" then
            v1 = props[a1] ~= nil
        end
        return v1
    end))
end

local function serialize(a1, a2, a3, a4, a5, a6) -- Line: 124
    -- upvalues: printElementAsLeaf (val), getType (val), printElement (val), printProps (val), Array (val)
    -- upvalues: Object (val), printChildren (val), getChildren (val)
    local v1 = a4 + 1
    if a2.maxDepth < v1 then
        return (printElementAsLeaf(getType(a1), a2))
    end
    local v2 = printElement
    local v3 = getType(a1)
    local v4 = printProps
    local props = a1.props
    v4 = v4(Array.sort(Array.filter(Object.keys(props), function(a1) -- Line: 117 -- upvalues: props (val)
        local v1 = false
        if a1 ~= "children" then
            v1 = props[a1] ~= nil
        end
        return v1
    end)), a1.props, a2, a3 .. a2.indent, v1, a5, a6)
    return (v2(v3, v4, printChildren(getChildren(a1.props.children), a2, a3 .. a2.indent, v1, a5, a6), a2, a3))
end

v2.serialize = serialize

local function test(a1) -- Line: 154 -- upvalues: u23 (val)
    local v1 = false
    if a1 ~= nil then
        v1 = u23.isElement(a1)
    end
    return v1
end

v2.test = test
v2.default = {serialize = serialize, test = test}
return v2