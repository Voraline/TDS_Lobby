-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactChildFiber.new
-- Decompile time: 36.15 ms

local __DEV__ = _G.__DEV__
local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Array = v1.Array
local Error = v1.Error
local console = require(script.Parent.Parent:WaitForChild("shared")).console
local describeError = require(script.Parent.Parent:WaitForChild("shared")).describeError
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent:WaitForChild("react"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactFiberLane"))
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local ReactFiberFlags = require(script.Parent:WaitForChild("ReactFiberFlags"))
local Placement = ReactFiberFlags.Placement
local Deletion = ReactFiberFlags.Deletion
local ReactSymbols = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local getIteratorFn = ReactSymbols.getIteratorFn
local REACT_ELEMENT_TYPE = ReactSymbols.REACT_ELEMENT_TYPE
local REACT_FRAGMENT_TYPE = ReactSymbols.REACT_FRAGMENT_TYPE
local REACT_PORTAL_TYPE = ReactSymbols.REACT_PORTAL_TYPE
local REACT_LAZY_TYPE = ReactSymbols.REACT_LAZY_TYPE
local REACT_BLOCK_TYPE = ReactSymbols.REACT_BLOCK_TYPE
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local FunctionComponent = ReactWorkTags.FunctionComponent
local ClassComponent = ReactWorkTags.ClassComponent
local HostText = ReactWorkTags.HostText
local HostPortal = ReactWorkTags.HostPortal
local ForwardRef = ReactWorkTags.ForwardRef
local Fragment = ReactWorkTags.Fragment
local SimpleMemoComponent = ReactWorkTags.SimpleMemoComponent
local Block = ReactWorkTags.Block
local invariant = require(script.Parent.Parent:WaitForChild("shared")).invariant
local ReactFeatureFlags = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags
local enableLazyElements = ReactFeatureFlags.enableLazyElements
local enableBlocksAPI = ReactFeatureFlags.enableBlocksAPI
local v2 = require(script.Parent:WaitForChild("ReactFiber.new"))
local createWorkInProgress = v2.createWorkInProgress
local resetWorkInProgress = v2.resetWorkInProgress
local createFiberFromElement = v2.createFiberFromElement
local createFiberFromFragment = v2.createFiberFromFragment
local createFiberFromText = v2.createFiberFromText
local createFiberFromPortal = v2.createFiberFromPortal
local v3 = {}
local u160 = nil
local u162 = nil

local function u163(a1, a2) end

if __DEV__ then
    u160 = false
    local u161 = {}
    u162 = {}

    function u163(a1, a2) -- Line: 112 -- upvalues: invariant (val), getComponentName (val), u161 (ref), console (val)
        if a1 ~= nil and type(a1) == "table" then
            if a1._store and not a1._store.validated and a1.key == nil then
                local v1 = false
                if a1._store ~= nil then
                    v1 = type(a1._store) == "table"
                end
                invariant(
                    v1,
                    "React Component in warnForMissingKey should have a _store. This error is likely caused by a bug in React. Please file an issue."
                )
                a1._store.validated = true
                local v2 = getComponentName(a2.type) or "Component"
                if u161[v2] then
                    return
                end
                u161[v2] = true
                console.error("Each child in a list should have a unique \"key\" prop. See https://reactjs.org/link/warning-keys for more information.")
                return
            end
            return
        end
    end
end
local isArray = Array.isArray

function coerceRef(a1, a2, a3) -- Line: 143 -- upvalues: __DEV__ (val), getComponentName (val), Error (val)
    local ref = a3.ref
    if ref ~= nil and type(ref) == "string" then
        if not a3._owner or not a3._self or a3._owner.stateNode == a3._self then
            error(Error.new(string.format(
                "Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref",
                if not __DEV__ then "<enable __DEV__ mode for component names>" else getComponentName(a1.type) or "Component",
                (tostring(ref))
            )))
        end
        if not a3._owner then
            error("Expected ref to be a function or an object returned by React.createRef(), or nil.")
        end
    end
    return ref
end

local function warnOnFunctionType(a1) -- Line: 316
    -- upvalues: __DEV__ (val), getComponentName (val), u162 (ref), console (val)
    if __DEV__ then
        local v1 = getComponentName(a1.type) or "Component"
        if u162[v1] then
            return
        end
        u162[v1] = true
        console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
    end
end

function resolveLazyType(a1) -- Line: 335 -- upvalues: describeError (val)
    local success, result = xpcall(a1._init, describeError, a1._payload)
    if not success then
        return a1
    end
    return result
end

local function ChildReconciler(a1) -- Line: 353
    -- upvalues: Deletion (val), createWorkInProgress (val), Placement (val), HostText (val), createFiberFromText (val)
    -- upvalues: __DEV__ (val), enableBlocksAPI (val), Block (val), REACT_LAZY_TYPE (val), REACT_BLOCK_TYPE (val)
    -- upvalues: createFiberFromElement (val), HostPortal (val), createFiberFromPortal (val), Fragment (val)
    -- upvalues: createFiberFromFragment (val), REACT_ELEMENT_TYPE (val), REACT_PORTAL_TYPE (val)
    -- upvalues: enableLazyElements (val), getComponentName (val), u162 (ref), console (val), REACT_FRAGMENT_TYPE (val)
    -- upvalues: u163 (ref), u160 (ref), isArray (val), getIteratorFn (val)
    local createChild, reconcileChildFibers, updateFromMap, updateSlot, warnOnInvalidKey

    local function deleteChild(a1_2, a2) -- Line: 354 -- upvalues: a1 (val), Deletion (upval)
        if not a1 then
            return
        end
        local deletions = a1_2.deletions
        if deletions ~= nil then
            table.insert(deletions, a2)
            return
        end
        a1_2.deletions = {a2}
        a1_2.flags = bit32.bor(a1_2.flags, Deletion)
    end

    local function deleteRemainingChildren(a1_2, a2) -- Line: 368 -- upvalues: a1 (val), Deletion (upval)
        local deletions
        if not a1 then
            return nil
        end
        local sibling = a2
        local v1 = a1_2
        while sibling ~= nil do
            if a1 then
                deletions = v1.deletions
                if deletions ~= nil then
                    table.insert(deletions, sibling)
                else
                    v1.deletions = {sibling}
                    v1.flags = bit32.bor(v1.flags, Deletion)
                end
            end
            sibling = sibling.sibling
        end
        return nil
    end

    local function mapRemainingChildren(a1, a2) -- Line: 387
        local v1 = {}
        local sibling = a2
        while sibling ~= nil do
            if sibling.key == nil then
                v1[sibling.index] = sibling
            else
                v1[sibling.key] = sibling
            end
            sibling = sibling.sibling
        end
        return v1
    end

    local function useFiber(a1, a2) -- Line: 409 -- upvalues: createWorkInProgress (upval)
        local v1 = createWorkInProgress(a1, a2)
        v1.index = 1
        v1.sibling = nil
        return v1
    end

    local function placeChild(a1_2, a2, a3) -- Line: 419
        -- upvalues: a1 (val), Placement (upval)
        a1_2.index = a3
        if not a1 then
            return a2
        end
        local alternate = a1_2.alternate
        if alternate == nil then
            a1_2.flags = bit32.bor(a1_2.flags, Placement)
            return a2
        end
        local index = alternate.index
        if not (index < a2) then
            return index
        end
        a1_2.flags = bit32.bor(a1_2.flags, Placement)
        return a2
    end

    local function placeSingleChild(a1_2) -- Line: 447 -- upvalues: a1 (val), Placement (upval)
        if a1 and a1_2.alternate == nil then
            a1_2.flags = bit32.bor(a1_2.flags, Placement)
        end
        return a1_2
    end

    local function updateTextNode(a1, a2, a3, a4) -- Line: 456
        -- upvalues: HostText (upval), createFiberFromText (upval), createWorkInProgress (upval)
        local v1
        if a2 ~= nil and a2.tag == HostText then
            v1 = createWorkInProgress(a2, a3)
            v1.index = 1
            v1.sibling = nil
            v1.return_ = a1
            return v1
        end
        v1 = createFiberFromText(a3, a1.mode, a4)
        v1.return_ = a1
        return v1
    end

    local function updateElement(a1, a2, a3, a4) -- Line: 476
        -- upvalues: createWorkInProgress (upval), __DEV__ (upval), enableBlocksAPI (upval), Block (upval)
        -- upvalues: REACT_LAZY_TYPE (upval), REACT_BLOCK_TYPE (upval), createFiberFromElement (upval)
        local v1
        if a2 ~= nil then
            if a2.elementType == a3.type then
                local props = a3.props
                v1 = createWorkInProgress(a2, props)
                v1.index = 1
                v1.sibling = nil
                v1.ref = coerceRef(a1, a2, a3)
                v1.return_ = a1
                if __DEV__ then
                    v1._debugSource = a3._source
                    v1._debugOwner = a3._owner
                end
                return v1
            end
            if enableBlocksAPI and a2.tag == Block then
                local type_2 = a3.type
                if type(type_2) == "table" and type_2["$$typeof"] == REACT_LAZY_TYPE then
                    type_2 = resolveLazyType(type_2)
                end
                if type_2["$$typeof"] == REACT_BLOCK_TYPE and type_2._render == a2.type._render then
                    local props_2 = a3.props
                    local v2 = createWorkInProgress(a2, props_2)
                    v2.index = 1
                    v2.sibling = nil
                    v2.return_ = a1
                    v2.type = type_2
                    if __DEV__ then
                        v2._debugSource = a3._source
                        v2._debugOwner = a3._owner
                    end
                    return v2
                end
            end
        end
        v1 = createFiberFromElement(a3, a1.mode, a4)
        v1.ref = coerceRef(a1, a2, a3)
        v1.return_ = a1
        return v1
    end

    local function updatePortal(a1, a2, a3, a4) -- Line: 529
        -- upvalues: HostPortal (upval), createFiberFromPortal (upval), createWorkInProgress (upval)
        local v1
        if a2 ~= nil
            and a2.tag == HostPortal
            and a2.stateNode.containerInfo == a3.containerInfo
            and a2.stateNode.implementation == a3.implementation then
            local children = a3.children or {}
            v1 = createWorkInProgress(a2, children)
            v1.index = 1
            v1.sibling = nil
            v1.return_ = a1
            return v1
        end
        v1 = createFiberFromPortal(a3, a1.mode, a4)
        v1.return_ = a1
        return v1
    end

    local function updateFragment(a1, a2, a3, a4, a5) -- Line: 554
        -- upvalues: Fragment (upval), createFiberFromFragment (upval), createWorkInProgress (upval)
        local v1
        if a2 ~= nil and a2.tag == Fragment then
            v1 = createWorkInProgress(a2, a3)
            v1.index = 1
            v1.sibling = nil
            v1.return_ = a1
            return v1
        end
        v1 = createFiberFromFragment(a3, a1.mode, a4, a5)
        v1.return_ = a1
        return v1
    end

    local function assignStableKey(a1, a2) -- Line: 581 -- types: a2: table
        if a2.key ~= nil then
            return
        end
        local v1 = type(a1)
        if v1 ~= "string" and v1 ~= "number" then
            if v1 == "table" then
                a2.key = tostring(a1)
            end
            return
        end
        a2.key = a1
    end

    function createChild(a1, a2, a3, a4) -- Line: 600
        -- upvalues: REACT_ELEMENT_TYPE (upval), createFiberFromElement (upval), REACT_PORTAL_TYPE (upval)
        -- upvalues: createFiberFromPortal (upval), REACT_LAZY_TYPE (upval), enableLazyElements (upval)
        -- upvalues: createChild (val), createFiberFromFragment (upval), createFiberFromText (upval), __DEV__ (upval)
        -- upvalues: getComponentName (upval), u162 (upval), console (upval)
        local v1, v2
        if a2 == nil then
            return nil
        end
        local v3 = type(a2)
        if v3 ~= "table" then
            if v3 ~= "string" and v3 ~= "number" then
                if __DEV__ and v3 == "function" and __DEV__ then
                    v1 = getComponentName(a1.type) or "Component"
                    if not u162[v1] then
                        u162[v1] = true
                        console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                    end
                end
                return nil
            end
            v1 = createFiberFromText(tostring(a2), a1.mode, a3)
            v1.return_ = a1
            return v1
        end
        if a2.key == nil then
            v1 = type(a4)
            if v1 == "string" or v1 == "number" then
                a2.key = a4
            elseif v1 == "table" then
                a2.key = tostring(a4)
            end
        end
        v1 = a2["$$typeof"]
        if v1 == REACT_ELEMENT_TYPE then
            v2 = createFiberFromElement(a2, a1.mode, a3)
            v2.ref = coerceRef(a1, nil, a2)
            v2.return_ = a1
            return v2
        end
        if v1 == REACT_PORTAL_TYPE then
            v2 = createFiberFromPortal(a2, a1.mode, a3)
            v2.return_ = a1
            return v2
        end
        if v1 == REACT_LAZY_TYPE and enableLazyElements then
            return createChild(a1, a2._init(a2._payload), a3)
        end
        v2 = createFiberFromFragment(a2, a1.mode, a3, nil)
        v2.return_ = a1
        return v2
    end

    function updateSlot(a1, a2, a3, a4, a5) -- Line: 671
        -- upvalues: REACT_ELEMENT_TYPE (upval), REACT_FRAGMENT_TYPE (upval), Fragment (upval)
        -- upvalues: createFiberFromFragment (upval), createWorkInProgress (upval), updateElement (val)
        -- upvalues: REACT_PORTAL_TYPE (upval), updatePortal (val), REACT_LAZY_TYPE (upval), enableLazyElements (upval)
        -- upvalues: updateSlot (val), HostText (upval), createFiberFromText (upval), __DEV__ (upval)
        -- upvalues: getComponentName (upval), u162 (upval), console (upval)
        local v1, v2
        if a3 == nil then
            return nil
        end
        local key = if a2 == nil then nil else a2.key
        local v3 = type(a3)
        if v3 ~= "table" then
            if v3 ~= "string" and v3 ~= "number" then
                if __DEV__ and v3 == "function" and __DEV__ then
                    v1 = getComponentName(a1.type) or "Component"
                    if not u162[v1] then
                        u162[v1] = true
                        console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                    end
                end
                return nil
            end
            if key ~= nil then
                return nil
            end
            local v4 = tostring(a3)
            if a2 ~= nil and a2.tag == HostText then
                v2 = createWorkInProgress(a2, v4)
                v2.index = 1
                v2.sibling = nil
                v2.return_ = a1
                return v2
            end
            v2 = createFiberFromText(v4, a1.mode, a4)
            v2.return_ = a1
            return v2
        end
        if a3.key == nil then
            v1 = type(a5)
            if v1 == "string" or v1 == "number" then
                a3.key = a5
            elseif v1 == "table" then
                a3.key = tostring(a5)
            end
        end
        v1 = a3["$$typeof"]
        if v1 == REACT_ELEMENT_TYPE then
            local v5
            if a3.key ~= key then
                return nil
            end
            if a3.type ~= REACT_FRAGMENT_TYPE then
                return (updateElement(a1, a2, a3, a4))
            end
            local children = a3.props.children
            if a2 ~= nil and a2.tag == Fragment then
                v5 = createWorkInProgress(a2, children)
                v5.index = 1
                v5.sibling = nil
                v5.return_ = a1
                return v5
            end
            v5 = createFiberFromFragment(children, a1.mode, a4, key)
            v5.return_ = a1
            return v5
        end
        if v1 == REACT_PORTAL_TYPE then
            if a3.key == key then
                return (updatePortal(a1, a2, a3, a4))
            end
            return nil
        end
        if v1 == REACT_LAZY_TYPE and enableLazyElements then
            return updateSlot(a1, a2, a3._init(a3._payload), a4)
        end
        if key ~= nil then
            return nil
        end
        if a2 ~= nil and a2.tag == Fragment then
            v2 = createWorkInProgress(a2, a3)
            v2.index = 1
            v2.sibling = nil
            v2.return_ = a1
            return v2
        end
        v2 = createFiberFromFragment(a3, a1.mode, a4, nil)
        v2.return_ = a1
        return v2
    end

    function updateFromMap(a1, a2, a3, a4, a5, a6) -- Line: 759
        -- upvalues: REACT_ELEMENT_TYPE (upval), REACT_FRAGMENT_TYPE (upval), Fragment (upval)
        -- upvalues: createFiberFromFragment (upval), createWorkInProgress (upval), updateElement (val)
        -- upvalues: REACT_PORTAL_TYPE (upval), updatePortal (val), REACT_LAZY_TYPE (upval), enableLazyElements (upval)
        -- upvalues: updateFromMap (val), HostText (upval), createFiberFromText (upval), __DEV__ (upval)
        -- upvalues: getComponentName (upval), u162 (upval), console (upval)
        local v1, v2, v3
        if a4 == nil then
            return nil
        end
        local v4 = type(a4)
        if v4 ~= "table" then
            local v5
            if v4 ~= "string" and v4 ~= "number" then
                if __DEV__ and v4 == "function" and __DEV__ then
                    v2 = getComponentName(a2.type) or "Component"
                    if not u162[v2] then
                        u162[v2] = true
                        console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                    end
                end
                return nil
            end
            v2 = a1[a3] or nil
            v3 = tostring(a4)
            if v2 ~= nil and v2.tag == HostText then
                v5 = createWorkInProgress(v2, v3)
                v5.index = 1
                v5.sibling = nil
                v5.return_ = a2
                return v5
            end
            v5 = createFiberFromText(v3, a2.mode, a5)
            v5.return_ = a2
            return v5
        end
        if a4.key == nil then
            v2 = type(a6)
            if v2 == "string" or v2 == "number" then
                a4.key = a6
            elseif v2 == "table" then
                a4.key = tostring(a6)
            end
        end
        local v6 = a4["$$typeof"]
        if v6 == REACT_ELEMENT_TYPE then
            local v7
            v3 = a1[if a4.key ~= nil then a4.key else a3]
            if a4.type ~= REACT_FRAGMENT_TYPE then
                return (updateElement(a2, v3, a4, a5))
            end
            local children = a4.props.children
            local key_2 = a4.key
            if v3 ~= nil and v3.tag == Fragment then
                v7 = createWorkInProgress(v3, children)
                v7.index = 1
                v7.sibling = nil
                v7.return_ = a2
                return v7
            end
            v7 = createFiberFromFragment(children, a2.mode, a5, key_2)
            v7.return_ = a2
            return v7
        end
        if v6 == REACT_PORTAL_TYPE then
            return (updatePortal(a2, a1[if a4.key ~= nil then a4.key else a3], a4, a5))
        end
        if v6 == REACT_LAZY_TYPE and enableLazyElements then
            return updateFromMap(a1, a2, a3, a4._init(a4._payload), a5)
        end
        v3 = a1[a3]
        if v3 ~= nil and v3.tag == Fragment then
            v1 = createWorkInProgress(v3, a4)
            v1.index = 1
            v1.sibling = nil
            v1.return_ = a2
            return v1
        end
        v1 = createFiberFromFragment(a4, a2.mode, a5, nil)
        v1.return_ = a2
        return v1
    end

    function warnOnInvalidKey(a1, a2, a3) -- Line: 853
        -- upvalues: __DEV__ (upval), REACT_ELEMENT_TYPE (upval), REACT_PORTAL_TYPE (upval), u163 (upval)
        -- upvalues: console (upval), REACT_LAZY_TYPE (upval), enableLazyElements (upval), warnOnInvalidKey (val)
        if not __DEV__ then
            return a2
        end
        if a1 ~= nil and type(a1) == "table" then
            local v1 = a1["$$typeof"]
            if v1 ~= REACT_ELEMENT_TYPE and v1 ~= REACT_PORTAL_TYPE then
                if v1 == REACT_LAZY_TYPE and enableLazyElements then
                    warnOnInvalidKey(a1._init(a1._payload), a2, a3)
                end
                return a2
            end
            u163(a1, a3)
            local key = a1.key
            if type(key) ~= "string" then
                return a2
            end
            if a2 == nil then
                return {[key] = true}
            end
            if not a2[key] then
                a2[key] = true
                return a2
            end
            console.error(
                "Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted — the behavior is unsupported and could change in a future version.",
                key
            )
            return a2
        end
        return a2
    end

    local function reconcileChildrenArray(a1_2, a2, a3, a4) -- Line: 895
        -- upvalues: __DEV__ (upval), warnOnInvalidKey (val), updateSlot (val), a1 (val), Deletion (upval)
        -- upvalues: Placement (upval), createChild (val), mapRemainingChildren (val), updateFromMap (val)
        local alternate, alternate_3, deletions, index, index_3, sibling, v1, v2, v3, v4
        if __DEV__ then
            v4 = nil
            for i, j in a3 do
                v4 = warnOnInvalidKey(j, v4, a1_2)
            end
        end
        v4 = nil
        local v5 = nil
        local v6 = a2
        local v7 = 1
        local v8 = 1
        local v9 = #a3
        while v6 ~= nil do
            if not (v8 <= v9) then
                break
            end
            if not (v8 < v6.index) then
                sibling = v6.sibling
            else
                sibling = v6
                v6 = nil
            end
            v2 = a3[v8]
            if (if v2 == nil then updateSlot(a1_2, v6, v2, a4) else if type(v2) ~= "table" then updateSlot(a1_2, v6, v2, a4) else if v2["$$typeof"] == nil then updateSlot(a1_2, v6, v2, a4) else updateSlot(a1_2, v6, v2, a4, v8)) == nil then
                if v6 ~= nil then
                    break
                end
                v6 = sibling
                break
            end
            if a1 and v6 and v1.alternate == nil and a1 then
                deletions = a1_2.deletions
                if deletions ~= nil then
                    table.insert(deletions, v6)
                else
                    a1_2.deletions = {v6}
                    a1_2.flags = bit32.bor(a1_2.flags, Deletion)
                end
            end
            v3 = v7
            v1.index = v8
            if a1 then
                alternate = v1.alternate
                if alternate == nil then
                    v1.flags = bit32.bor(v1.flags, Placement)
                    v7 = v3
                else
                    index = alternate.index
                    if not (index < v3) then
                        v7 = index
                    else
                        v1.flags = bit32.bor(v1.flags, Placement)
                        v7 = v3
                    end
                end
            else
                v7 = v3
            end
            if v5 ~= nil then
                v5.sibling = v1
            else
                v4 = v1
            end
            v5 = v1
            v6 = sibling
            v8 = v8 + 1
        end
        if v9 < v8 then
            local deletions_2
            if not a1 then
                return v4
            end
            local sibling_2 = v6
            while sibling_2 ~= nil do
                if a1 then
                    deletions_2 = a1_2.deletions
                    if deletions_2 ~= nil then
                        table.insert(deletions_2, sibling_2)
                    else
                        a1_2.deletions = {sibling_2}
                        a1_2.flags = bit32.bor(a1_2.flags, Deletion)
                    end
                end
                sibling_2 = sibling_2.sibling
            end
            return v4
        end
        if v6 == nil then
            local alternate_2, index_2
            while v8 <= v9 do
                v2 = a3[v8]
                v1 = if v2 == nil then createChild(a1_2, v2, a4) else if type(v2) ~= "table" then createChild(a1_2, v2, a4) else if v2["$$typeof"] == nil then createChild(a1_2, v2, a4) else createChild(a1_2, v2, a4, v8)
                if v1 ~= nil then
                    v3 = v7
                    v1.index = v8
                    if a1 then
                        alternate_2 = v1.alternate
                        if alternate_2 == nil then
                            v1.flags = bit32.bor(v1.flags, Placement)
                            v7 = v3
                        else
                            index_2 = alternate_2.index
                            if not (index_2 < v3) then
                                v7 = index_2
                            else
                                v1.flags = bit32.bor(v1.flags, Placement)
                                v7 = v3
                            end
                        end
                    else
                        v7 = v3
                    end
                    if v5 ~= nil then
                        v5.sibling = v1
                    else
                        v4 = v1
                    end
                    v5 = v1
                end
                v8 = v8 + 1
            end
            return v4
        end
        v1 = mapRemainingChildren(a1_2, v6)
        while v8 <= v9 do
            v2 = updateFromMap(v1, a1_2, v8, a3[v8], a4, v8)
            if v2 ~= nil then
                if a1 and v2.alternate ~= nil then
                    v1[if v2.key ~= nil then v2.key else v8] = nil
                end
                v2.index = v8
                if a1 then
                    alternate_3 = v2.alternate
                    if alternate_3 == nil then
                        v2.flags = bit32.bor(v2.flags, Placement)
                    else
                        index_3 = alternate_3.index
                        if index_3 < v7 then
                            v2.flags = bit32.bor(v2.flags, Placement)
                        end
                    end
                end
                if v5 ~= nil then
                    v5.sibling = v2
                else
                    v4 = v2
                end
            end
            v8 = v8 + 1
        end
        if a1 then
            local deletions_3
            for k, n in v1 do
                if a1 then
                    deletions_3 = a1_2.deletions
                    if deletions_3 ~= nil then
                        table.insert(deletions_3, n)
                    else
                        a1_2.deletions = {n}
                        a1_2.flags = bit32.bor(a1_2.flags, Deletion)
                    end
                end
            end
        end
        return v4
    end

    local function reconcileChildrenIterator(a1_2, a2, a3, a4, a5) -- Line: 1102
        -- upvalues: __DEV__ (upval), u160 (upval), console (upval), warnOnInvalidKey (val), updateSlot (val), a1 (val)
        -- upvalues: Deletion (upval), Placement (upval), createChild (val), mapRemainingChildren (val)
        -- upvalues: updateFromMap (val)
        local alternate, alternate_3, deletions, index, index_3, sibling, v1, v2, v3, v4, v5
        if __DEV__ then
            if a3.entries == a5 then
                if not u160 then
                    console.error("Using Maps as children is not supported. Use an array of keyed ReactElements instead.")
                end
                u160 = true
            end
            v3 = a5(a3)
            if v3 then
                v4 = nil
                v5 = v3.next()
                while not v5.done do
                    v4 = warnOnInvalidKey((v3.next()).value, v4, a1_2)
                end
            end
        end
        v3 = a5(a3)
        v4 = nil
        v5 = nil
        local v6 = a2
        local v7 = 1
        local v8 = 1
        local v9 = v3.next()
        while v6 ~= nil do
            if v9.done then
                break
            end
            if not (v8 < v6.index) then
                sibling = v6.sibling
            else
                sibling = v6
                v6 = nil
            end
            v1 = updateSlot(a1_2, v6, v9.value, a4, v9.key)
            if v1 == nil then
                if v6 ~= nil then
                    break
                end
                v6 = sibling
                break
            end
            if a1 and v6 and v1.alternate == nil and a1 then
                deletions = a1_2.deletions
                if deletions ~= nil then
                    table.insert(deletions, v6)
                else
                    a1_2.deletions = {v6}
                    a1_2.flags = bit32.bor(a1_2.flags, Deletion)
                end
            end
            v2 = v7
            v1.index = v8
            if a1 then
                alternate = v1.alternate
                if alternate == nil then
                    v1.flags = bit32.bor(v1.flags, Placement)
                    v7 = v2
                else
                    index = alternate.index
                    if not (index < v2) then
                        v7 = index
                    else
                        v1.flags = bit32.bor(v1.flags, Placement)
                        v7 = v2
                    end
                end
            else
                v7 = v2
            end
            if v5 ~= nil then
                v5.sibling = v1
            else
                v4 = v1
            end
            v5 = v1
            v6 = sibling
            v8 = v8 + 1
            v9 = v3.next()
        end
        if v9.done then
            local deletions_2
            if not a1 then
                return v4
            end
            local sibling_2 = v6
            while sibling_2 ~= nil do
                if a1 then
                    deletions_2 = a1_2.deletions
                    if deletions_2 ~= nil then
                        table.insert(deletions_2, sibling_2)
                    else
                        a1_2.deletions = {sibling_2}
                        a1_2.flags = bit32.bor(a1_2.flags, Deletion)
                    end
                end
                sibling_2 = sibling_2.sibling
            end
            return v4
        end
        if v6 == nil then
            local alternate_2, index_2
            while not v9.done do
                v1 = createChild(a1_2, v9.value, a4, v9.key)
                if v1 ~= nil then
                    v2 = v7
                    v1.index = v8
                    if a1 then
                        alternate_2 = v1.alternate
                        if alternate_2 == nil then
                            v1.flags = bit32.bor(v1.flags, Placement)
                            v7 = v2
                        else
                            index_2 = alternate_2.index
                            if not (index_2 < v2) then
                                v7 = index_2
                            else
                                v1.flags = bit32.bor(v1.flags, Placement)
                                v7 = v2
                            end
                        end
                    else
                        v7 = v2
                    end
                    if v5 ~= nil then
                        v5.sibling = v1
                    else
                        v4 = v1
                    end
                    v5 = v1
                end
                v8 = v8 + 1
                v9 = v3.next()
            end
            return v4
        end
        v1 = nil
        while not v9.done do
            if not v1 then
                v1 = mapRemainingChildren(a1_2, v6)
            end
            v2 = updateFromMap(v1, a1_2, v8, v9.value, a4, v9.key)
            if v2 ~= nil then
                if a1 and v2.alternate ~= nil then
                    if v2.key ~= nil then
                        v1[v2.key] = nil
                    else
                        v1[v8] = nil
                    end
                end
                v2.index = v8
                if a1 then
                    alternate_3 = v2.alternate
                    if alternate_3 == nil then
                        v2.flags = bit32.bor(v2.flags, Placement)
                    else
                        index_3 = alternate_3.index
                        if index_3 < v7 then
                            v2.flags = bit32.bor(v2.flags, Placement)
                        end
                    end
                end
                if v5 ~= nil then
                    v5.sibling = v2
                else
                    v4 = v2
                end
            end
            v8 = v8 + 1
            v9 = v3.next()
        end
        if a1 then
            local deletions_3
            for i, j in v1 do
                if a1 then
                    deletions_3 = a1_2.deletions
                    if deletions_3 ~= nil then
                        table.insert(deletions_3, j)
                    else
                        a1_2.deletions = {j}
                        a1_2.flags = bit32.bor(a1_2.flags, Deletion)
                    end
                end
            end
        end
        return v4
    end

    local function reconcileSingleTextNode(a1_2, a2, a3, a4) -- Line: 1315
        -- upvalues: HostText (upval), a1 (val), Deletion (upval), createWorkInProgress (upval)
        -- upvalues: createFiberFromText (upval)
        local v1, v2
        if a2 ~= nil and a2.tag == HostText then
            local sibling = a2.sibling
            if a1 then
                local deletions
                local sibling_2 = sibling
                while sibling_2 ~= nil do
                    if a1 then
                        deletions = a1_2.deletions
                        if deletions ~= nil then
                            table.insert(deletions, sibling_2)
                        else
                            a1_2.deletions = {sibling_2}
                            a1_2.flags = bit32.bor(a1_2.flags, Deletion)
                        end
                    end
                    sibling_2 = sibling_2.sibling
                end
            end
            v2 = createWorkInProgress(a2, a3)
            v2.index = 1
            v2.sibling = nil
            v2.return_ = a1_2
            return v2
        end
        if a1 then
            local deletions_2
            local sibling_3 = a2
            v1 = a4
            while sibling_3 ~= nil do
                if a1 then
                    deletions_2 = a1_2.deletions
                    if deletions_2 ~= nil then
                        table.insert(deletions_2, sibling_3)
                    else
                        a1_2.deletions = {sibling_3}
                        a1_2.flags = bit32.bor(a1_2.flags, Deletion)
                    end
                end
                sibling_3 = sibling_3.sibling
            end
        else
            v1 = a4
        end
        v2 = createFiberFromText(a3, a1_2.mode, v1)
        v2.return_ = a1_2
        return v2
    end

    local function reconcileSingleElement(a1_2, a2, a3, a4) -- Line: 1340
        -- upvalues: Fragment (upval), REACT_FRAGMENT_TYPE (upval), a1 (val), Deletion (upval)
        -- upvalues: createWorkInProgress (upval), __DEV__ (upval), createFiberFromFragment (upval)
        -- upvalues: createFiberFromElement (upval)
        local children, deletions, deletions_2, deletions_3, deletions_4, props_2, sibling, sibling_2, sibling_3, sibling_4, sibling_5, v1
        local key = a3.key
        local sibling_6 = a2
        local v2, v3, v4, v5 = a3, a1_2, a2, a4
        while sibling_6 ~= nil do
            if sibling_6.key == key then
                if sibling_6.tag == Fragment then
                    if v2.type ~= REACT_FRAGMENT_TYPE then
                        if not a1 then
                            break
                        end
                        sibling_5 = sibling_6
                        while sibling_5 ~= nil do
                            if a1 then
                                deletions_3 = v3.deletions
                                if deletions_3 ~= nil then
                                    table.insert(deletions_3, sibling_5)
                                else
                                    v3.deletions = {sibling_5}
                                    v3.flags = bit32.bor(v3.flags, Deletion)
                                end
                            end
                            sibling_5 = sibling_5.sibling
                        end
                        break
                    end
                    sibling = sibling_6.sibling
                    if a1 then
                        sibling_2 = sibling
                        while sibling_2 ~= nil do
                            if a1 then
                                deletions = v3.deletions
                                if deletions ~= nil then
                                    table.insert(deletions, sibling_2)
                                else
                                    v3.deletions = {sibling_2}
                                    v3.flags = bit32.bor(v3.flags, Deletion)
                                end
                            end
                            sibling_2 = sibling_2.sibling
                        end
                    end
                    children = v2.props.children
                    v1 = createWorkInProgress(sibling_6, children)
                    v1.index = 1
                    v1.sibling = nil
                    v1.return_ = v3
                    if __DEV__ then
                        v1._debugSource = v2._source
                        v1._debugOwner = v2._owner
                    end
                    return v1
                end
                if sibling_6.elementType ~= v2.type then
                    if not a1 then
                        break
                    end
                    sibling_5 = sibling_6
                    while sibling_5 ~= nil do
                        if a1 then
                            deletions_3 = v3.deletions
                            if deletions_3 ~= nil then
                                table.insert(deletions_3, sibling_5)
                            else
                                v3.deletions = {sibling_5}
                                v3.flags = bit32.bor(v3.flags, Deletion)
                            end
                        end
                        sibling_5 = sibling_5.sibling
                    end
                    break
                end
                sibling_3 = sibling_6.sibling
                if a1 then
                    sibling_4 = sibling_3
                    while sibling_4 ~= nil do
                        if a1 then
                            deletions_2 = v3.deletions
                            if deletions_2 ~= nil then
                                table.insert(deletions_2, sibling_4)
                            else
                                v3.deletions = {sibling_4}
                                v3.flags = bit32.bor(v3.flags, Deletion)
                            end
                        end
                        sibling_4 = sibling_4.sibling
                    end
                end
                props_2 = v2.props
                v1 = createWorkInProgress(sibling_6, props_2)
                v1.index = 1
                v1.sibling = nil
                v1.ref = coerceRef(v3, sibling_6, v2)
                v1.return_ = v3
                if __DEV__ then
                    v1._debugSource = v2._source
                    v1._debugOwner = v2._owner
                end
                return v1
            end
            if a1 then
                deletions_4 = v3.deletions
                if deletions_4 ~= nil then
                    table.insert(deletions_4, sibling_6)
                else
                    v3.deletions = {sibling_6}
                    v3.flags = bit32.bor(v3.flags, Deletion)
                end
            end
            sibling_6 = sibling_6.sibling
        end
        if v2.type == REACT_FRAGMENT_TYPE then
            v1 = createFiberFromFragment(v2.props.children, v3.mode, v5, v2.key)
            v1.return_ = v3
            return v1
        end
        v1 = createFiberFromElement(v2, v3.mode, v5)
        v1.ref = coerceRef(v3, v4, v2)
        v1.return_ = v3
        return v1
    end

    local function reconcileSinglePortal(a1_2, a2, a3, a4) -- Line: 1440
        -- upvalues: HostPortal (upval), a1 (val), Deletion (upval), createWorkInProgress (upval)
        -- upvalues: createFiberFromPortal (upval)
        local children, deletions, deletions_2, deletions_3, sibling, sibling_2, sibling_3, v1
        local key = a3.key
        local sibling_4 = a2
        local v2, v3, v4 = a3, a1_2, a4
        while sibling_4 ~= nil do
            if sibling_4.key == key then
                if sibling_4.tag == HostPortal
                    and sibling_4.stateNode.containerInfo == v2.containerInfo
                    and sibling_4.stateNode.implementation == v2.implementation then
                    sibling = sibling_4.sibling
                    if a1 then
                        sibling_2 = sibling
                        while sibling_2 ~= nil do
                            if a1 then
                                deletions = v3.deletions
                                if deletions ~= nil then
                                    table.insert(deletions, sibling_2)
                                else
                                    v3.deletions = {sibling_2}
                                    v3.flags = bit32.bor(v3.flags, Deletion)
                                end
                            end
                            sibling_2 = sibling_2.sibling
                        end
                    end
                    children = v2.children or {}
                    v1 = createWorkInProgress(sibling_4, children)
                    v1.index = 1
                    v1.sibling = nil
                    v1.return_ = v3
                    return v1
                end
                if not a1 then
                    break
                end
                sibling_3 = sibling_4
                while sibling_3 ~= nil do
                    if a1 then
                        deletions_2 = v3.deletions
                        if deletions_2 ~= nil then
                            table.insert(deletions_2, sibling_3)
                        else
                            v3.deletions = {sibling_3}
                            v3.flags = bit32.bor(v3.flags, Deletion)
                        end
                    end
                    sibling_3 = sibling_3.sibling
                end
                break
            end
            if a1 then
                deletions_3 = v3.deletions
                if deletions_3 ~= nil then
                    table.insert(deletions_3, sibling_4)
                else
                    v3.deletions = {sibling_4}
                    v3.flags = bit32.bor(v3.flags, Deletion)
                end
            end
            sibling_4 = sibling_4.sibling
        end
        v1 = createFiberFromPortal(v2, v3.mode, v4)
        v1.return_ = v3
        return v1
    end

    function reconcileChildFibers(a1_2, a2, a3, a4) -- Line: 1479
        -- upvalues: REACT_FRAGMENT_TYPE (upval), isArray (upval), REACT_ELEMENT_TYPE (upval)
        -- upvalues: reconcileSingleElement (val), a1 (val), Placement (upval), REACT_PORTAL_TYPE (upval)
        -- upvalues: reconcileSinglePortal (val), REACT_LAZY_TYPE (upval), enableLazyElements (upval)
        -- upvalues: reconcileChildFibers (val), reconcileChildrenArray (val), reconcileSingleTextNode (val)
        -- upvalues: getIteratorFn (upval), reconcileChildrenIterator (val), __DEV__ (upval), getComponentName (upval)
        -- upvalues: u162 (upval), console (upval), Deletion (upval)
        local children, deletions, sibling, v1, v2, v3, v4, v5
        local v6 = type(a3)
        local v7 = false
        if a3 ~= nil then
            v7 = false
            if v6 == "table" then
                v7 = false
                if a3.type == REACT_FRAGMENT_TYPE then
                    v7 = a3.key == nil
                end
            end
        end
        if not v7 then
            children = a3
        else
            v6 = type(a3.props.children)
        end
        local v8 = isArray(children)
        local v9 = false
        if children ~= nil then
            v9 = false
            if v6 == "table" then
                v9 = not v8
            end
        end
        if not v9 then
            if v8 then
                return (reconcileChildrenArray(a1_2, a2, children, a4))
            end
            if v6 ~= "string" and v6 ~= "number" then
                v1, v2, v3 = a1_2, a2, a4
                v4 = getIteratorFn(children)
                if v4 then
                    return (reconcileChildrenIterator(v1, v2, children, v3, v4))
                end
                if __DEV__ and v6 == "function" and __DEV__ then
                    v5 = getComponentName(v1.type) or "Component"
                    if not u162[v5] then
                        u162[v5] = true
                        console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
                    end
                end
                if children ~= nil then end
                if not a1 then
                    return nil
                end
                sibling = v2
                while sibling ~= nil do
                    if a1 then
                        deletions = v1.deletions
                        if deletions ~= nil then
                            table.insert(deletions, sibling)
                        else
                            v1.deletions = {sibling}
                            v1.flags = bit32.bor(v1.flags, Deletion)
                        end
                    end
                    sibling = sibling.sibling
                end
                return nil
            end
            v4 = reconcileSingleTextNode(a1_2, a2, tostring(children), a4)
            if a1 and v4.alternate == nil then
                v4.flags = bit32.bor(v4.flags, Placement)
            end
            return v4
        end
        v4 = children["$$typeof"]
        if v4 == REACT_ELEMENT_TYPE then
            v5 = reconcileSingleElement(a1_2, a2, children, a4)
            if a1 and v5.alternate == nil then
                v5.flags = bit32.bor(v5.flags, Placement)
            end
            return v5
        end
        if v4 == REACT_PORTAL_TYPE then
            v5 = reconcileSinglePortal(a1_2, a2, children, a4)
            if a1 and v5.alternate == nil then
                v5.flags = bit32.bor(v5.flags, Placement)
            end
            return v5
        end
        if v4 == REACT_LAZY_TYPE then
            if enableLazyElements then
                return reconcileChildFibers(a1_2, a2, children._init(children._payload), a4)
            end
        end
        v1, v2, v3 = a1_2, a2, a4
        v4 = getIteratorFn(children)
        if v4 then
            return (reconcileChildrenIterator(v1, v2, children, v3, v4))
        end
        if __DEV__ and v6 == "function" and __DEV__ then
            v5 = getComponentName(v1.type) or "Component"
            if not u162[v5] then
                u162[v5] = true
                console.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.")
            end
        end
        if children ~= nil then end
        if not a1 then
            return nil
        end
        sibling = v2
        while sibling ~= nil do
            if a1 then
                deletions = v1.deletions
                if deletions ~= nil then
                    table.insert(deletions, sibling)
                else
                    v1.deletions = {sibling}
                    v1.flags = bit32.bor(v1.flags, Deletion)
                end
            end
            sibling = sibling.sibling
        end
        return nil
    end

    return reconcileChildFibers
end

v3.reconcileChildFibers = ChildReconciler(true)
v3.mountChildFibers = ChildReconciler(false)

function v3.cloneChildFibers(a1, a2) -- Line: 1627 -- upvalues: createWorkInProgress (val)
    if a2.child == nil then
        return
    end
    local child = a2.child
    local sibling = createWorkInProgress(child, child.pendingProps)
    a2.child = sibling
    sibling.return_ = a2
    while child.sibling ~= nil do
        child = child.sibling
        sibling.sibling = createWorkInProgress(child, child.pendingProps)
        sibling = sibling.sibling
        sibling.return_ = a2
    end
    sibling.sibling = nil
end

function v3.resetChildFibers(a1, a2) -- Line: 1654 -- upvalues: resetWorkInProgress (val)
    local child = a1.child
    while child ~= nil do
        resetWorkInProgress(child, a2)
        child = child.sibling
    end
end

return v3