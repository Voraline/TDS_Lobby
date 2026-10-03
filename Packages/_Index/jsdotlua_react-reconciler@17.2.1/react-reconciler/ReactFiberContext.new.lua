-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberContext.new
-- Decompile time: 4.68 ms

local __DEV__ = _G.__DEV__
local __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Object = v1.Object
local Error = v1.Error
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v2 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local isFiberMounted = require(script.Parent:WaitForChild("ReactFiberTreeReflection")).isFiberMounted
local disableLegacyContext = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.disableLegacyContext
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ClassComponent = ReactWorkTags.ClassComponent
local HostRoot = ReactWorkTags.HostRoot
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local checkPropTypes = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes
local createCursor = v2.createCursor
local push = v2.push
local pop = v2.pop
local u95 = nil
if __DEV__ then
    u95 = {}
end
local u96 = {}
if __DEV__ then
    Object.freeze(u96)
end
local u107 = createCursor(u96)
local u110 = createCursor(false)
local u111 = u96
local isContextProvider = nil

function isContextProvider(a1) -- Line: 160
    if type(a1) == "function" then
        return false
    end
    return a1.childContextTypes ~= nil
end

local function processChildContext(a1, a2, a3) -- Line: 218
    -- upvalues: __DEV__ (val), getComponentName (val), u95 (ref), console (val), Error (val)
    -- upvalues: __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val), checkPropTypes (val), Object (val)
    local v1
    local stateNode = a1.stateNode
    local childContextTypes = a2.childContextTypes
    if stateNode.getChildContext ~= nil and type(stateNode.getChildContext) == "function" then
        v1 = stateNode:getChildContext()
        for i, j in v1 do
            if childContextTypes[i] == nil then
                error(Error.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", getComponentName(a2) or "Unknown", i)))
            end
        end
        if __DEV__ or __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
            checkPropTypes(childContextTypes, nil, v1, "child context", getComponentName(a2) or "Unknown")
        end
        return Object.assign({}, a3, v1)
    end
    if __DEV__ then
        v1 = getComponentName(a2) or "Unknown"
        if not u95[v1] then
            u95[v1] = true
            console.error(
                "%s.childContextTypes is specified but there is no getChildContext() method on the instance. You can either define getChildContext() on %s or remove childContextTypes from it.",
                v1,
                v1
            )
        end
    end
    return a3
end

return {
    emptyContextObject = u96,
    getUnmaskedContext = function(a1, a2, a3) -- Line: 67 -- upvalues: isContextProvider (ref), u111 (ref), u107 (val) -- types: a3: boolean
        if a3 and isContextProvider(a2) then
            return u111
        end
        return u107.current
    end,
    cacheContext = function(a1, a2, a3) -- Line: 87 -- types: a2: table, a3: table
        local stateNode = a1.stateNode
        stateNode.__reactInternalMemoizedUnmaskedChildContext = a2
        stateNode.__reactInternalMemoizedMaskedChildContext = a3
    end,
    getMaskedContext = function(a1, a2) -- Line: 102
        -- upvalues: u96 (val), __DEV__ (val), __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ (val)
        -- upvalues: getComponentName (val), checkPropTypes (val)
        local type_2 = a1.type
        if type(type_2) == "function" then
            return a2
        end
        local contextTypes = type_2.contextTypes
        if not contextTypes then
            return u96
        end
        local stateNode = a1.stateNode
        if stateNode and stateNode.__reactInternalMemoizedUnmaskedChildContext == a2 then
            return stateNode.__reactInternalMemoizedMaskedChildContext
        end
        local v1 = {}
        for i, j in contextTypes do
            v1[i] = a2[i]
        end
        if __DEV__ or __DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
            checkPropTypes(contextTypes, nil, v1, "context", getComponentName(type_2) or "Unknown")
        end
        if stateNode then
            local stateNode_2 = a1.stateNode
            stateNode_2.__reactInternalMemoizedUnmaskedChildContext = a2
            stateNode_2.__reactInternalMemoizedMaskedChildContext = v1
        end
        return v1
    end,
    hasContextChanged = function() -- Line: 151 -- upvalues: disableLegacyContext (val), u110 (val)
        if disableLegacyContext then
            return false
        end
        return u110.current
    end,
    popContext = function(a1) -- Line: 175 -- upvalues: pop (val), u110 (val), u107 (val)
        pop(u110, a1)
        pop(u107, a1)
    end,
    popTopLevelContextObject = function(a1) -- Line: 185 -- upvalues: pop (val), u110 (val), u107 (val)
        pop(u110, a1)
        pop(u107, a1)
    end,
    pushTopLevelContextObject = function(a1, a2, a3) -- Line: 195
        -- upvalues: u107 (val), u96 (val), Error (val), push (val), u110 (val)
        if u107.current ~= u96 then
            error(Error.new("Unexpected context found on stack. This error is likely caused by a bug in React. Please file an issue."))
        end
        push(u107, a2, a1)
        push(u110, a3, a1)
    end,
    processChildContext = processChildContext,
    isContextProvider = isContextProvider,
    pushContextProvider = function(a1) -- Line: 278 -- upvalues: u96 (val), u111 (ref), u107 (val), push (val), u110 (val)
        local stateNode = a1.stateNode
        local __reactInternalMemoizedMergedChildContext = stateNode and stateNode.__reactInternalMemoizedMergedChildContext or u96
        u111 = u107.current
        push(u107, __reactInternalMemoizedMergedChildContext, a1)
        push(u110, u110.current, a1)
        return true
    end,
    invalidateContextProvider = function(a1, a2, a3) -- Line: 301
        -- upvalues: Error (val), processChildContext (val), u111 (ref), pop (val), u110 (val), u107 (val), push (val)
        local stateNode = a1.stateNode
        if not stateNode then
            error(Error.new("Expected to have an instance by this point. This error is likely caused by a bug in React. Please file an issue."))
        end
        if not a3 then
            pop(u110, a1)
            push(u110, a3, a1)
            return
        end
        local v1 = processChildContext(a1, a2, u111)
        stateNode.__reactInternalMemoizedMergedChildContext = v1
        pop(u110, a1)
        pop(u107, a1)
        push(u107, v1, a1)
        push(u110, a3, a1)
    end,
    findCurrentUnmaskedContext = function(a1) -- Line: 342 -- upvalues: ClassComponent (val), isFiberMounted (val), Error (val), HostRoot (val)
        if a1.tag ~= ClassComponent or not isFiberMounted(a1) then
            error(Error.new("Expected subtree parent to be a mounted class component. This error is likely caused by a bug in React. Please file an issue."))
        end
        local return_ = a1
        while return_.tag ~= HostRoot do
            if return_.tag == ClassComponent and return_.type.childContextTypes ~= nil then
                return return_.stateNode.__reactInternalMemoizedMergedChildContext
            end
            return_ = return_.return_
            if return_ == nil then
                error(Error.new("Found unexpected detached subtree parent. This error is likely caused by a bug in React. Please file an issue."))
                return
            end
        end
        return return_.stateNode.context
    end,
}