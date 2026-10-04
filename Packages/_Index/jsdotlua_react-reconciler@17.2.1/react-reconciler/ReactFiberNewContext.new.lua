-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberNewContext.new
-- Decompile time: 5.05 ms

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local Number = v1.Number
local Error = v1.Error
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v2 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local ReactFiberLane = require(script.Parent:WaitForChild("ReactFiberLane"))
local v3 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
local isPrimaryRenderer = require(script.Parent:WaitForChild("ReactFiberHostConfig")).isPrimaryRenderer
local createCursor = v2.createCursor
local push = v2.push
local pop = v2.pop
local MAX_SIGNED_31_BIT_INT = require(script.Parent:WaitForChild("MaxInts")).MAX_SIGNED_31_BIT_INT
local ReactWorkTags = require(script.Parent:WaitForChild("ReactWorkTags"))
local ContextProvider = ReactWorkTags.ContextProvider
local ClassComponent = ReactWorkTags.ClassComponent
local NoLanes = ReactFiberLane.NoLanes
local NoTimestamp = ReactFiberLane.NoTimestamp
local isSubsetOfLanes = ReactFiberLane.isSubsetOfLanes
local includesSomeLane = ReactFiberLane.includesSomeLane
local mergeLanes = ReactFiberLane.mergeLanes
local pickArbitraryLane = ReactFiberLane.pickArbitraryLane
local objectIs = require(script.Parent.Parent:WaitForChild("shared")).objectIs
local createUpdate = v3.createUpdate
local ForceUpdate = v3.ForceUpdate
local u111 = {}
local u114 = createCursor(nil)
local u118 = nil
if _G.__DEV__ then
    u118 = {}
end
local u119 = nil
local u120 = nil
local u121 = nil
local u122 = false

function u111.resetContextDependencies() -- Line: 72 -- upvalues: u119 (ref), u120 (ref), u121 (ref), u122 (ref)
    u119 = nil
    u120 = nil
    u121 = nil
    if _G.__DEV__ then
        u122 = false
    end
end

function u111.enterDisallowedContextReadInDEV() -- Line: 83 -- upvalues: u122 (ref)
    if _G.__DEV__ then
        u122 = true
    end
end

function u111.exitDisallowedContextReadInDEV() -- Line: 89 -- upvalues: u122 (ref)
    if _G.__DEV__ then
        u122 = false
    end
end

function u111.pushProvider(a1, a2) -- Line: 95
    -- upvalues: isPrimaryRenderer (val), push (val), u114 (val), u118 (ref), console (val)
    local _context = a1.type._context
    if not isPrimaryRenderer then
        push(u114, _context._currentValue2, a1)
        _context._currentValue2 = a2
        if _G.__DEV__ then
            if _context._currentRenderer2 ~= nil and _context._currentRenderer2 ~= u118 then
                console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
            end
            _context._currentRenderer2 = u118
        end
        return
    end
    push(u114, _context._currentValue, a1)
    _context._currentValue = a2
    if not _G.__DEV__ then
        return
    end
    if _context._currentRenderer ~= nil and _context._currentRenderer ~= u118 then
        console.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
    end
    _context._currentRenderer = u118
end

function u111.popProvider(a1) -- Line: 133 -- upvalues: u114 (val), pop (val), isPrimaryRenderer (val)
    local current = u114.current
    pop(u114, a1)
    local _context = a1.type._context
    if isPrimaryRenderer then
        _context._currentValue = current
        return
    end
    _context._currentValue2 = current
end

function u111.calculateChangedBits(a1, a2, a3) -- Line: 147 -- upvalues: objectIs (val), MAX_SIGNED_31_BIT_INT (val)
    if objectIs(a3, a2) then
        return 0
    end
    local v1 = MAX_SIGNED_31_BIT_INT
    if typeof(a1._calculateChangedBits) == "function" then
        v1 = a1._calculateChangedBits(a3, a2)
    end
    return (math.floor(v1))
end

function u111.scheduleWorkOnParentPath(a1, a2) -- Line: 174 -- upvalues: isSubsetOfLanes (val), mergeLanes (val)
    local alternate
    local return_ = a1
    local v1 = a2
    while return_ ~= nil do
        alternate = return_.alternate
        if isSubsetOfLanes(return_.childLanes, v1) then
            if alternate == nil or isSubsetOfLanes(alternate.childLanes, v1) then
                break
            end
            alternate.childLanes = mergeLanes(alternate.childLanes, v1)
        else
            return_.childLanes = mergeLanes(return_.childLanes, v1)
            if alternate ~= nil then
                alternate.childLanes = mergeLanes(alternate.childLanes, v1)
            end
        end
        return_ = return_.return_
    end
end

function u111.propagateContextChange(a1, a2, a3, a4) -- Line: 197
    -- upvalues: ClassComponent (val), createUpdate (val), NoTimestamp (val), pickArbitraryLane (val), ForceUpdate (val)
    -- upvalues: u111 (val), ContextProvider (val)
    local alternate, child_2, dependencies, firstContext, pending, shared, sibling, updateQueue, v1
    local child = a1.child
    if child ~= nil then
        child.return_ = a1
    end
    local v2, v3, v4, v5 = a2, a3, a4, a1
    while child ~= nil do
        dependencies = child.dependencies
        if dependencies == nil then
            child_2 = if child.tag ~= ContextProvider then child.child else if child.type ~= v5.type then child.child else nil
        else
            child_2 = child.child
            firstContext = dependencies.firstContext
            while firstContext ~= nil do
                if firstContext.context == v2 and bit32.band(firstContext.observedBits, v3) ~= 0 then
                    if child.tag == ClassComponent then
                        v1 = createUpdate(NoTimestamp, pickArbitraryLane(v4))
                        v1.tag = ForceUpdate
                        updateQueue = child.updateQueue
                        if updateQueue ~= nil then
                            shared = updateQueue.shared
                            pending = shared.pending
                            if pending ~= nil then
                                v1.next = pending.next
                                pending.next = v1
                            else
                                v1.next = v1
                            end
                            shared.pending = v1
                        end
                    end
                    child.lanes = bit32.bor(child.lanes, v4)
                    alternate = child.alternate
                    if alternate ~= nil then
                        alternate.lanes = bit32.bor(alternate.lanes, v4)
                    end
                    u111.scheduleWorkOnParentPath(child.return_, v4)
                    dependencies.lanes = bit32.bor(dependencies.lanes, v4)
                    break
                end
                firstContext = firstContext.next
            end
        end
        if child_2 == nil then
            child_2 = child
            while child_2 ~= nil do
                if child_2 == v5 then
                    child_2 = nil
                    break
                end
                sibling = child_2.sibling
                if sibling ~= nil then
                    sibling.return_ = child_2.return_
                    child_2 = sibling
                    break
                end
                child_2 = child_2.return_
            end
        else
            child_2.return_ = child
        end
        child = child_2
    end
end

function u111.prepareToReadContext(a1, a2, a3) -- Line: 336
    -- upvalues: u119 (ref), u120 (ref), u121 (ref), includesSomeLane (val)
    u119 = a1
    u120 = nil
    u121 = nil
    local dependencies = a1.dependencies
    if dependencies ~= nil and dependencies.firstContext ~= nil then
        if includesSomeLane(dependencies.lanes, a2) then
            a3()
        end
        dependencies.firstContext = nil
    end
end

function u111.readContext(a1, a2) -- Line: 360
    -- upvalues: u122 (ref), console (val), u121 (ref), Number (val), u120 (ref), u119 (ref), Error (val), NoLanes (val)
    -- upvalues: isPrimaryRenderer (val)
    if _G.__DEV__ and u122 then
        console.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
    end
    if u121 ~= a1 and a2 ~= false and a2 ~= 0 then
        local MAX_SAFE_INTEGER
        if typeof(a2) ~= "number" then
            u121 = a1
            MAX_SAFE_INTEGER = Number.MAX_SAFE_INTEGER
        elseif a2 ~= Number.MAX_SAFE_INTEGER then
            MAX_SAFE_INTEGER = a2
        else
            u121 = a1
            MAX_SAFE_INTEGER = Number.MAX_SAFE_INTEGER
        end
        local v1 = {context = a1, observedBits = MAX_SAFE_INTEGER}
        if u120 ~= nil then
            u120.next = v1
            u120 = v1
        else
            if u119 == nil then
                error(Error.new("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo()."))
            end
            u120 = v1
            u119.dependencies = {lanes = NoLanes, firstContext = v1}
        end
    end
    if isPrimaryRenderer then
        return a1._currentValue
    end
    return a1._currentValue2
end

return u111