-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.roblox.RobloxComponentProps
-- Decompile time: 5.74 ms

local __DEV__ = _G.__DEV__
local CollectionService = game:GetService("CollectionService")
local v1 = require(script.Parent.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local inspect = v1.util.inspect
local console = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).console
local react = require(script.Parent.Parent.Parent.Parent:WaitForChild("react"))
local ReactSymbols = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).ReactSymbols
local SingleEventManager = require(script.Parent:WaitForChild("SingleEventManager"))
local Type = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).Type
local getDefaultInstanceProperty = require(script.Parent:WaitForChild("getDefaultInstanceProperty"))
require(script.Parent.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
local Tag = (require((script.Parent.Parent.Parent.Parent:WaitForChild("react")))).Tag
local u105 = {}
local u106 = {}

local function identity(...) -- Line: 69
    return ...
end

local function setRobloxInstanceProperty(a1, a2, a3) -- Line: 73 -- upvalues: getDefaultInstanceProperty (val)
    if a3 == nil then
        local v1
        if (pcall(a1.ResetPropertyToDefault, a1, a2)) then
            return
        end
        _, v1 = getDefaultInstanceProperty(a1.ClassName, a2)
        a3 = v1
    end
    a1[a2] = a3
end

local function removeBinding(a1, a2) -- Line: 89 -- upvalues: u106 (val)
    local v1 = u106[a1]
    if v1 ~= nil then
        v1[a2]()
        v1[a2] = nil
    end
end

local function attachBinding(a1, a2, a3) -- Line: 98
    -- upvalues: setRobloxInstanceProperty (val), identity (val), console (val), u106 (val), react (val)
    local function updateBoundProperty(a1_2) -- Line: 99
        -- upvalues: setRobloxInstanceProperty (upval), identity (upval), a1 (val), a2 (val), a3 (val), console (upval)
        local success, result = xpcall(setRobloxInstanceProperty, identity, a1, a2, a1_2)
        if not success then
            local v1 = a3._source or "<enable DEV mode for stack>"
            local v2 = string.format(
                "Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n",
                a2,
                a1.Name,
                a1.ClassName,
                tostring(a1_2),
                result,
                v1
            )
            console.error(v2)
            error(v2, 0)
        end
    end

    if u106[a1] == nil then
        u106[a1] = {}
    end
    local v1 = u106[a1]
    v1[a2] = (react.__subscribeToBinding(a3, updateBoundProperty))
    updateBoundProperty(a3:getValue())
end

local function applyTags(a1, a2, a3) -- Line: 131
    -- upvalues: __DEV__ (val), console (val), inspect (val), CollectionService (val)
    if __DEV__ and a3 ~= nil and typeof(a3) ~= "string" then
        console.error(
            "Type provided for ReactRoblox.Tag is invalid - tags should be specified as a single string, with individual tags delimited by spaces. Instead received:\n%s",
            inspect(a3)
        )
        return
    end
    local v1 = {}
    for i in string.gmatch(a2 or "", "%S+") do
        v1[i] = true
    end
    local v2 = {}
    for j in string.gmatch(a3 or "", "%S+") do
        v2[j] = true
    end
    for k, n in v1 do
        if not v2[k] then
            CollectionService:RemoveTag(a1, k)
        end
    end
    for m, i5 in v2 do
        if not v1[m] then
            CollectionService:AddTag(a1, m)
        end
    end
end

local function removeAllTags(a1) -- Line: 165 -- upvalues: CollectionService (val) -- types: a1: userdata
    for i, j in CollectionService:GetTags(a1) do
        CollectionService:RemoveTag(a1, j)
    end
end

local function applyProp(a1, a2, a3, a4) -- Line: 171
    -- upvalues: Type (val), u105 (val), SingleEventManager (val), ReactSymbols (val), u106 (val), attachBinding (val)
    -- upvalues: Tag (val), applyTags (val), getDefaultInstanceProperty (val)
    local v1
    local v2 = Type.of(a2)
    if v2 ~= Type.HostEvent and v2 ~= Type.HostChangeEvent then
        local v3
        v1 = false
        if typeof(a3) == "table" then
            v1 = a3["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE
        end
        local v4 = false
        if a4 ~= nil then
            v4 = false
            if typeof(a4) == "table" then
                v4 = a4["$$typeof"] == ReactSymbols.REACT_BINDING_TYPE
            end
        end
        if v4 then
            v3 = u106[a1]
            if v3 ~= nil then
                v3[a2]()
                v3[a2] = nil
            end
        end
        if v1 then
            attachBinding(a1, a2, a3)
            return
        end
        if a2 == Tag then
            applyTags(a1, a4, a3)
            return
        end
        v3 = a3
        if v3 == nil then
            local v5
            if (pcall(a1.ResetPropertyToDefault, a1, a2)) then
                return
            end
            _, v5 = getDefaultInstanceProperty(a1.ClassName, a2)
            v3 = v5
        end
        a1[a2] = v3
        return
    end
    v1 = u105[a1]
    if v1 == nil then
        u105[a1] = (SingleEventManager.new(a1))
    end
    local name = a2.name
    if v2 == Type.HostChangeEvent then
        v1:connectPropertyChange(name, a3)
        return
    end
    v1:connectEvent(name, a3)
end

local function applyProps(a1, a2) -- Line: 216 -- upvalues: applyProp (val) -- types: a1: userdata, a2: table
    for i, j in a2 do
        if i ~= "ref" and i ~= "children" then
            applyProp(a1, i, j)
        end
    end
end

local function safelyApplyProperties(a1, a2, a3) -- Line: 256
    -- upvalues: Object (val), applyProp (val)
    local v1, v2
    local v3 = #a2
    local v4 = a2
    for i = 1, v3, 2 do
        v1 = v4[i]
        v2 = v4[i + 1]
        if v2 == Object.None then
            v2 = nil
        end
        if v1 ~= "ref" and v1 ~= "children" then
            applyProp(v5, v1, v2, v6[v1])
        end
    end
end

local function cleanupBindings(a1) -- Line: 309 -- upvalues: u106 (val)
    local v1 = u106[a1]
    if v1 ~= nil then
        for i, j in v1 do
            j()
        end
        u106[a1] = nil
    end
end

return {
    setInitialProperties = function(a1, a2, a3, a4) -- Line: 227
        -- upvalues: applyProps (val), identity (val), console (val), u105 (val)
        local success, result = xpcall(applyProps, identity, a1, a3)
        if not success then
            local v1 = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", a1.Name, a1.ClassName, result)
            console.error(v1)
            error(v1, 0)
        end
        if u105[a1] ~= nil then
            u105[a1]:resume()
        end
    end,
    updateProperties = function(a1, a2, a3) -- Line: 275
        -- upvalues: u105 (val), safelyApplyProperties (val), identity (val), console (val)
        if u105[a1] ~= nil then
            u105[a1]:suspend()
        end
        local success, result = xpcall(safelyApplyProperties, identity, a1, a2, a3)
        if not success then
            local v1 = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", a1.Name, a1.ClassName, result)
            console.error(v1)
            error(v1, 0)
        end
        if u105[a1] ~= nil then
            u105[a1]:resume()
        end
    end,
    cleanupHostComponent = function(a1) -- Line: 321 -- upvalues: u105 (val), u106 (val), CollectionService (val)
        local v1, v2
        if u105[a1] ~= nil then
            u105[a1] = nil
        end
        local v3 = u106[a1]
        if v3 ~= nil then
            for i, j in v3 do
                j()
            end
            u106[a1] = nil
        end
        if typeof(a1) ~= "Instance" then
            return
        end
        for k, n in CollectionService:GetTags(a1) do
            CollectionService:RemoveTag(a1, n)
        end
        for m, i5 in a1:GetDescendants() do
            if u105[i5] ~= nil then
                u105[i5] = nil
            end
            v2 = u106[i5]
            if v2 ~= nil then
                for i6, i7 in v2 do
                    i7()
                end
                u106[i5] = nil
            end
            for i8, i9 in CollectionService:GetTags(v1) do
                CollectionService:RemoveTag(v1, i9)
            end
        end
    end,
    _instanceToEventManager = u105,
    _instanceToBindings = u106,
}