-- Script path: ReplicatedStorage.Packages.Iris
-- Decompile time: 4.18 ms

require(script.Types)
local u4 = {}
local u10 = require(script.Internal)(u4)
u4.Disabled = false
u4.Args = {}
u4.Events = {}

function u4.Init(a1, a2) -- Line: 72 -- upvalues: u10 (val), u4 (val) -- types: a1: userdata?
    assert(u10._started == false, "Iris.Init() can only be called once.")
    assert(u10._shutdown == false, "Iris.Init() cannot be called once shutdown.")
    local v1 = if a1 ~= nil then a1 else game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    if a2 == nil then
        a2 = game:GetService("RunService").Heartbeat
    end
    u10.parentInstance = v1
    u10._started = true
    u10._generateRootInstance()
    u10._generateSelectionImageObject()
    for i, j in u10._initFunctions do
        j()
    end
    task.spawn(function() -- Line: 95 -- upvalues: a2 (ref), u10 (upval)
        if typeof(a2) == "function" then
            local v1
            while u10._started do
                v1 = a2()
                u10._cycle(v1)
            end
        elseif a2 ~= nil and a2 ~= false then
            u10._eventConnection = a2:Connect(function(...) -- Line: 102 -- upvalues: u10 (upval)
                u10._cycle(...)
            end)
        end
    end)
    return u4
end

function u4.Shutdown() -- Line: 117 -- upvalues: u10 (val)
    u10._started = false
    u10._shutdown = true
    if u10._eventConnection then
        u10._eventConnection:Disconnect()
    end
    u10._eventConnection = nil
    if u10._rootWidget then
        if u10._rootWidget.Instance then
            u10._widgets.Root.Discard(u10._rootWidget)
        end
        u10._rootInstance = nil
    end
    if u10.SelectionImageObject then
        u10.SelectionImageObject:Destroy()
    end
    for i, j in u10._connections do
        j:Disconnect()
    end
end

function u4.Connect(a1, a2) -- Line: 154 -- upvalues: u10 (val) -- types: a1: table, a2: function
    if u10._started == false then
        warn("Iris:Connect() was called before calling Iris.Init(); always initialise Iris first.")
    end
    local u10_2 = #u10._connectedFunctions + 1
    u10._connectedFunctions[u10_2] = a2
    return function() -- Line: 160 -- upvalues: u10 (upval), u10_2 (val)
        u10._connectedFunctions[u10_2] = nil
    end
end

function u4.Append(a1) -- Line: 175 -- upvalues: u10 (val) -- types: a1: userdata
    local v1 = u10._GetParentWidget()
    a1.Parent = if not u10._config.Parent then u10._widgets[v1.type].ChildAdded(v1, {type = "userInstance"}) else u10._config.Parent
end

function u4.End() -- Line: 213 -- upvalues: u10 (val)
    if u10._stackIndex == 1 then
        error("Too many calls to Iris.End().", 2)
    end
    u10._IDStack[u10._stackIndex] = nil
    local v1 = u10
    v1._stackIndex = v1._stackIndex - 1
end

function u4.ForceRefresh() -- Line: 238 -- upvalues: u10 (val)
    u10._globalRefreshRequested = true
end

function u4.UpdateGlobalConfig(a1) -- Line: 260 -- upvalues: u10 (val), u4 (val) -- types: a1: table
    for i, j in a1 do
        u10._rootConfig[i] = j
    end
    u4.ForceRefresh()
end

function u4.PushConfig(a1) -- Line: 285 -- upvalues: u4 (val), u10 (val) -- types: a1: table
    local v1 = u4.State(-1)
    if v1.value == -1 then
        v1:set(a1)
    elseif u10._deepCompare(v1:get(), a1) == false then
        u10._localRefreshActive = true
        v1:set(a1)
    end
    local v2 = u10
    local v3 = {__index = u10._config}
    v2._config = setmetatable(a1, v3)
end

function u4.PopConfig() -- Line: 311 -- upvalues: u10 (val)
    u10._localRefreshActive = false
    u10._config = getmetatable(u10._config).__index
end

u4.TemplateConfig = require(script.config)
u4.UpdateGlobalConfig(u4.TemplateConfig.colorDark)
u4.UpdateGlobalConfig(u4.TemplateConfig.sizeDefault)
u4.UpdateGlobalConfig(u4.TemplateConfig.utilityDefault)
u10._globalRefreshRequested = false

function u4.PushId(a1) -- Line: 341 -- upvalues: u10 (val)
    assert(typeof(a1) == "string", "The ID argument to Iris.PushId() to be a string.")
    u10._pushedId = tostring(a1)
end

function u4.PopId() -- Line: 353 -- upvalues: u10 (val)
    u10._pushedId = nil
end

function u4.SetNextWidgetID(a1) -- Line: 379 -- upvalues: u10 (val)
    u10._nextWidgetId = a1
end

function u4.State(a1) -- Line: 421 -- upvalues: u10 (val), u4 (val)
    local v1 = u10._getID(2)
    if u10._states[v1] then
        return u10._states[v1]
    end
    u10._states[v1] = {
        ID = v1,
        value = a1,
        lastChangeTick = u4.Internal._cycleTick,
        ConnectedWidgets = {},
        ConnectedFunctions = {},
    }
    local v2 = u10._states[v1]
    local StateClass = u10.StateClass
    setmetatable(v2, StateClass)
    return u10._states[v1]
end

function u4.WeakState(a1) -- Line: 446 -- upvalues: u10 (val), u4 (val)
    local v1 = u10._getID(2)
    if u10._states[v1] then
        if next(u10._states[v1].ConnectedWidgets) ~= nil then
            return u10._states[v1]
        else
            u10._states[v1] = nil
        end
    end
    u10._states[v1] = {
        ID = v1,
        value = a1,
        lastChangeTick = u4.Internal._cycleTick,
        ConnectedWidgets = {},
        ConnectedFunctions = {},
    }
    local v2 = u10._states[v1]
    local StateClass = u10.StateClass
    setmetatable(v2, StateClass)
    return u10._states[v1]
end

function u4.VariableState(a1, a2) -- Line: 504 -- upvalues: u10 (val), u4 (val) -- types: a2: function
    local v1 = u10._getID(2)
    local v2 = u10._states[v1]
    if v2 then
        if a1 ~= v2.value then
            v2:set(a1)
        end
        return v2
    end
    local v3 = {
        ID = v1,
        value = a1,
        lastChangeTick = u4.Internal._cycleTick,
        ConnectedWidgets = {},
        ConnectedFunctions = {},
    }
    local StateClass = u10.StateClass
    setmetatable(v3, StateClass)
    u10._states[v1] = v3
    v3:onChange(a2)
    return v3
end

function u4.TableState(a1, a2, a3) -- Line: 584 -- upvalues: u10 (val), u4 (val) -- types: a1: table, a3: function?
    local v1 = a1[a2]
    local v2 = u10._getID(2)
    local v3 = u10._states[v2]
    if v3 then
        if v1 ~= v3.value then
            v3:set(v1)
        end
        return v3
    end
    local u17 = {ID = v2, value = v1, lastChangeTick = u4.Internal._cycleTick}
    u17.ConnectedWidgets = {}
    u17.ConnectedFunctions = {}
    local StateClass = u10.StateClass
    setmetatable(u17, StateClass)
    u10._states[v2] = u17
    u17:onChange(function() -- Line: 608 -- upvalues: a3 (val), u17 (val), a1 (val), a2 (val)
        if a3 == nil then
            a1[a2] = u17.value
            return
        end
        if not a3(u17.value) then
            return
        end
        a1[a2] = u17.value
    end)
    return u17
end

function u4.ComputedState(a1, a2) -- Line: 637 -- upvalues: u10 (val), u4 (val) -- types: a2: function
    local u5 = u10._getID(2)
    if u10._states[u5] then
        return u10._states[u5]
    end
    u10._states[u5] = {
        ID = u5,
        value = a2(a1.value),
        lastChangeTick = u4.Internal._cycleTick,
        ConnectedWidgets = {},
        ConnectedFunctions = {},
    }
    a1:onChange(function(a1) -- Line: 650 -- upvalues: u10 (upval), u5 (val), a2 (val) -- types: a1: userdata
        u10._states[u5]:set((a2(a1)))
    end)
    local v1 = u10._states[u5]
    local StateClass = u10.StateClass
    setmetatable(v1, StateClass)
    return u10._states[u5]
end

u4.ShowDemoWindow = require(script.demoWindow)(u4)
require(script.widgets)(u10)
require(script.API)(u4)
return u4