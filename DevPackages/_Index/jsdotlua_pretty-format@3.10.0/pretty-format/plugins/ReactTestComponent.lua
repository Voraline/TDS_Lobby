-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_pretty-format@3.10.0.pretty-format.plugins.ReactTestComponent
-- Decompile time: 1.25 ms

local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Object = v1.Object
local Symbol = v1.Symbol
local v2 = {}
require(script.Parent.Parent:WaitForChild("Types"))
local markup = require((script.Parent:WaitForChild("lib")):WaitForChild("markup"))
local printChildren = markup.printChildren
local printElement = markup.printElement
local printElementAsLeaf = markup.printElementAsLeaf
local printProps = markup.printProps
local u41 = Symbol.for_("react.test.json")

local function getPropKeys(a1) -- Line: 44 -- upvalues: Array (val), Object (val) -- types: a1: table
    local props = a1.props
    if props ~= nil then
        return (Array.sort(Array.filter(Object.keys(props), function(a1) -- Line: 48 -- upvalues: props (val)
            return props[a1] ~= nil
        end)))
    end
    return {}
end

local function serialize(a1, a2, a3, a4, a5, a6) -- Line: 55
    -- upvalues: printElementAsLeaf (val), printElement (val), printProps (val), getPropKeys (val), printChildren (val)
    local v1 = a4 + 1
    if a2.maxDepth < v1 then
        return (printElementAsLeaf(a1.type, a2))
    end
    return (printElement(
        a1.type,
        if a1.props == nil then "" else printProps(getPropKeys(a1), a1.props, a2, a3 .. a2.indent, v1, a5, a6),
        if a1.children == nil then "" else printChildren(a1.children, a2, a3 .. a2.indent, v1, a5, a6),
        a2,
        a3
    ))
end

v2.serialize = serialize

local function test(a1) -- Line: 89 -- upvalues: u41 (val)
    local v1 = false
    if typeof(a1) == "table" then
        v1 = a1["$$typeof"] == u41
    end
    return v1
end

v2.test = test
v2.default = {serialize = serialize, test = test}
return v2