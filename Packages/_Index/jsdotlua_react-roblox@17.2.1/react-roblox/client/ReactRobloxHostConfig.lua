-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxHostConfig
-- Decompile time: 3.83 ms

local function unimplemented(a1) -- Line: 13 -- types: a1: string
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring(a1))
    error("FIXME (roblox): " .. a1 .. " is unimplemented", 2)
end

local CollectionService = game:GetService("CollectionService")
local v1 = require(script.Parent.Parent.Parent:WaitForChild("luau-polyfill"))
local inspect = v1.util.inspect
local console = require(script.Parent.Parent.Parent:WaitForChild("shared")).console
local Object = v1.Object
local setTimeout = v1.setTimeout
local clearTimeout = v1.clearTimeout
require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
local ReactRobloxComponentTree = require(script.Parent:WaitForChild("ReactRobloxComponentTree"))
local precacheFiberNode = ReactRobloxComponentTree.precacheFiberNode
local uncacheFiberNode = ReactRobloxComponentTree.uncacheFiberNode
local updateFiberProps = ReactRobloxComponentTree.updateFiberProps
local ReactRobloxComponent = require(script.Parent:WaitForChild("ReactRobloxComponent"))
local setInitialProperties = ReactRobloxComponent.setInitialProperties
local diffProperties = ReactRobloxComponent.diffProperties
local updateProperties = ReactRobloxComponent.updateProperties
local cleanupHostComponent = ReactRobloxComponent.cleanupHostComponent
local enableCreateEventHandleAPI = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableCreateEventHandleAPI

local function recursivelyUncacheFiberNode(a1) -- Line: 204 -- upvalues: uncacheFiberNode (val)
    if typeof(a1) ~= "Instance" then
        return
    end
    uncacheFiberNode(a1)
    for i, j in a1:GetDescendants() do
        uncacheFiberNode(j)
    end
end

local u76 = {}
Object.assign(u76, require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFiberHostConfig.WithNoPersistence)

function u76.getRootHostContext(a1) -- Line: 225
    return a1.ClassName
end

function u76.getChildHostContext(a1, a2, a3) -- Line: 263 -- types: a2: string
    return a1
end

function u76.getPublicInstance(a1) -- Line: 284 -- types: a1: userdata
    return a1
end

function u76.prepareForCommit(a1) -- Line: 288 -- upvalues: enableCreateEventHandleAPI (val)
    if enableCreateEventHandleAPI then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
    end
    return nil
end

function u76.beforeActiveInstanceBlur() -- Line: 303 -- upvalues: enableCreateEventHandleAPI (val)
    if enableCreateEventHandleAPI then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
    end
end

function u76.afterActiveInstanceBlur() -- Line: 312 -- upvalues: enableCreateEventHandleAPI (val)
    if enableCreateEventHandleAPI then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"))
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2)
    end
end

function u76.resetAfterCommit(a1) end

function u76.createInstance(a1, a2, a3, a4, a5) -- Line: 329
    -- upvalues: precacheFiberNode (val), updateFiberProps (val)
    local v1 = Instance.new(a1)
    if not a5.key then
        local return_ = a5.return_
        while return_ do
            if return_.key then
                v1.Name = return_.key
                break
            end
            return_ = return_.return_
        end
    else
        v1.Name = a5.key
    end
    precacheFiberNode(a5, v1)
    updateFiberProps(v1, a2)
    return v1
end

function u76.appendInitialChild(a1, a2) -- Line: 396 -- types: a1: userdata, a2: userdata
    a2.Parent = a1
end

function u76.finalizeInitialChildren(a1, a2, a3, a4, a5) -- Line: 401
    -- upvalues: setInitialProperties (val)
    setInitialProperties(a1, a2, a3, a4)
    return false
end

function u76.prepareUpdate(a1, a2, a3, a4, a5, a6) -- Line: 413
    -- upvalues: diffProperties (val)
    return diffProperties(a1, a2, a3, a4, a5)
end

function u76.shouldSetTextContent(a1, a2) -- Line: 440 -- types: a1: string
    return false
end

function u76.createTextInstance(a1, a2, a3, a4) -- Line: 456 -- types: a1: string, a4: table
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"))
    error("FIXME (roblox): createTextInstance is unimplemented", 2)
    return nil
end

u76.isPrimaryRenderer = true
u76.warnsIfNotActing = true
u76.scheduleTimeout = setTimeout
u76.cancelTimeout = clearTimeout
u76.noTimeout = -1
u76.supportsMutation = true

function u76.commitMount(a1, a2, a3, a4) -- Line: 482 -- types: a1: userdata, a2: string, a4: table
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"))
    error("FIXME (roblox): commitMount is unimplemented", 2)
end

function u76.commitUpdate(a1, a2, a3, a4, a5, a6) -- Line: 504
    -- upvalues: updateFiberProps (val), updateProperties (val)
    updateFiberProps(a1, a5)
    updateProperties(a1, a2, a4)
end

local function checkTags(a1) -- Line: 533
    -- upvalues: console (val), inspect (val), CollectionService (val)
    if typeof(a1) ~= "Instance" then
        console.warn("Could not check tags on non-instance %s.", inspect(a1))
        return
    end
    if not a1:IsDescendantOf(game) and #CollectionService:GetTags(a1) > 0 then
        console.warn(
            "Tags applied to orphaned %s \"%s\" cannot be accessed via CollectionService:GetTagged. If you're relying on tag behavior in a unit test, consider mounting your test root into the DataModel.",
            a1.ClassName,
            a1.Name
        )
    end
end

function u76.appendChild(a1, a2) -- Line: 552 -- upvalues: checkTags (val) -- types: a1: userdata, a2: userdata
    a2.Parent = a1
    if _G.__DEV__ then
        checkTags(a2)
    end
end

function u76.appendChildToContainer(a1, a2) -- Line: 561 -- upvalues: u76 (val) -- types: a2: userdata
    u76.appendChild(a1, a2)
end

function u76.insertBefore(a1, a2, a3) -- Line: 591
    -- upvalues: checkTags (val)
    a2.Parent = a1
    if _G.__DEV__ then
        checkTags(a2)
    end
end

function u76.insertInContainerBefore(a1, a2, a3) -- Line: 601
    -- upvalues: u76 (val)
    u76.insertBefore(a1, a2, a3)
end

function u76.removeChild(a1, a2) -- Line: 639
    -- upvalues: uncacheFiberNode (val), cleanupHostComponent (val)
    if typeof(a2) == "Instance" then
        uncacheFiberNode(a2)
        for i, j in a2:GetDescendants() do
            uncacheFiberNode(j)
        end
    end
    cleanupHostComponent(a2)
    a2.Parent = nil
    a2:Destroy()
end

function u76.removeChildFromContainer(a1, a2) -- Line: 651 -- upvalues: u76 (val) -- types: a2: userdata
    u76.removeChild(a1, a2)
end

function u76.clearSuspenseBoundary(a1, a2) -- Line: 663 -- types: a1: userdata
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"))
    error("FIXME (roblox): clearSuspenseBoundary is unimplemented", 2)
end

function u76.clearSuspenseBoundaryFromContainer(a1, a2) -- Line: 701
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"))
    error("FIXME (roblox): clearSuspenseBoundaryFromContainer is unimplemented", 2)
end

function u76.hideInstance(a1) -- Line: 715 -- types: a1: userdata
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"))
    error("FIXME (roblox): hideInstance is unimplemented", 2)
end

function u76.hideTextInstance(a1) -- Line: 729
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"))
    error("FIXME (roblox): hideTextInstance is unimplemented", 2)
end

function u76.unhideInstance(a1, a2) -- Line: 734 -- types: a1: userdata
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"))
    error("FIXME (roblox): unhideInstance is unimplemented", 2)
end

function u76.unhideTextInstance(a1, a2) -- Line: 748 -- types: a2: string
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"))
    error("FIXME (roblox): unhideTextInstance is unimplemented", 2)
end

function u76.clearContainer(a1) -- Line: 753 -- upvalues: u76 (val)
    for i, j in a1:GetChildren() do
        u76.removeChild(a1, j)
    end
end

function u76.preparePortalMount(a1) end

return u76