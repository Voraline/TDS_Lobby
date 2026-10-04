-- Script path: ReplicatedStorage.Packages.Iris.Internal
-- Decompile time: 12.33 ms

local HttpService = game:GetService("HttpService")
require(script.Parent.Types)
return function(a1) -- Line: 5 -- upvalues: HttpService (val)
    local u1 = {
        _version = " 2.4.1 ",
        _started = false,
        _shutdown = false,
        _cycleTick = 0,
        _deltaTime = 0,
        _globalRefreshRequested = false,
        _localRefreshActive = false,
        _widgets = {},
        _stackIndex = 1,
        _rootInstance = nil,
    }
    u1._rootWidget = {
        ID = "R",
        type = "Root",
        ZIndex = 0,
        ZOffset = 0,
        Instance = u1._rootInstance,
    }
    u1._lastWidget = u1._rootWidget
    u1._rootConfig = {}
    u1._config = u1._rootConfig
    u1._IDStack = {"R"}
    u1._usedIDs = {}
    u1._pushedId = nil
    u1._nextWidgetId = nil
    u1._states = {}
    u1._postCycleCallbacks = {}
    u1._connectedFunctions = {}
    u1._connections = {}
    u1._initFunctions = {}
    u1._fullErrorTracebacks = game:GetService("RunService"):IsStudio()
    u1._cycleCoroutine = coroutine.create(function() -- Line: 72 -- upvalues: u1 (val)
        local result, success
        while u1._started do
            for i, j in u1._connectedFunctions do
                debug.profilebegin("Iris/Connection")
                success, result = pcall(j)
                debug.profileend()
                if not success then
                    u1._stackIndex = 1
                    coroutine.yield(false, result)
                end
            end
            coroutine.yield(true)
        end
    end)
    local v1 = {}
    v1.__index = v1

    function v1.get(a1) -- Line: 130
        return a1.value
    end

    function v1.set(a1_2, a2, a3) -- Line: 143 -- upvalues: a1 (val), u1 (val) -- types: a1_2: table, a3: boolean?
        if a2 == a1_2.value and a3 ~= true then
            return a1_2.value
        end
        a1_2.value = a2
        a1_2.lastChangeTick = a1.Internal._cycleTick
        for i, j in a1_2.ConnectedWidgets do
            if j.lastCycleTick ~= -1 then
                u1._widgets[j.type].UpdateState(j)
            end
        end
        for k, n in a1_2.ConnectedFunctions do
            n(a2)
        end
        return a1_2.value
    end

    function v1.onChange(a1, a2) -- Line: 175 -- types: a1: table, a2: function
        local u4 = #a1.ConnectedFunctions + 1
        a1.ConnectedFunctions[u4] = a2
        return function() -- Line: 178 -- upvalues: a1 (val), u4 (val)
            a1.ConnectedFunctions[u4] = nil
        end
    end

    function v1.changed(a1) -- Line: 190 -- upvalues: u1 (val)
        return a1.lastChangeTick + 1 == u1._cycleTick
    end

    u1.StateClass = v1

    function u1._cycle(a1_2) -- Line: 208 -- upvalues: a1 (val), u1 (val) -- types: a1_2: number
        if a1.Disabled then
            return
        end
        u1._rootWidget.lastCycleTick = u1._cycleTick
        if u1._rootInstance == nil or u1._rootInstance.Parent == nil then
            a1.ForceRefresh()
        end
        for i, j in u1._lastVDOM do
            if j.lastCycleTick ~= u1._cycleTick and j.lastCycleTick ~= -1 then
                u1._DiscardWidget(j)
            end
        end
        setmetatable(u1._lastVDOM, {__mode = "kv"})
        u1._lastVDOM = u1._VDOM
        u1._VDOM = u1._generateEmptyVDOM()
        task.spawn(function() -- Line: 234 -- upvalues: u1 (upval)
            for i, j in u1._postCycleCallbacks do
                j()
            end
        end)
        if u1._globalRefreshRequested then
            u1._generateSelectionImageObject()
            u1._globalRefreshRequested = false
            for k, n in u1._lastVDOM do
                u1._DiscardWidget(n)
            end
            u1._generateRootInstance()
            u1._lastVDOM = u1._generateEmptyVDOM()
        end
        local v1 = u1
        v1._cycleTick = v1._cycleTick + 1
        u1._deltaTime = a1_2
        table.clear(u1._usedIDs)
        v1 = u1.parentInstance:IsA("GuiBase2d") or u1.parentInstance:IsA("CoreGui") or u1.parentInstance:IsA("PluginGui") or u1.parentInstance:IsA("PlayerGui")
        if v1 == false then
            error("The Iris parent instance will not display any GUIs.")
        end
        if not u1._fullErrorTracebacks then
            local v2 = coroutine.status(u1._cycleCoroutine)
            if v2 == "suspended" then
                local v3, v4
                _, v3, v4 = coroutine.resume(u1._cycleCoroutine)
                if v3 == false then
                    error(v4, 0)
                end
            elseif v2 ~= "running" then
                error("unrecoverable state")
            else
                error("Iris cycleCoroutine took to long to yield. Connected functions should not yield.")
            end
        else
            for m, i5 in u1._connectedFunctions do
                i5()
            end
        end
        if u1._stackIndex ~= 1 then
            u1._stackIndex = 1
            error("Too few calls to Iris.End().", 0)
        end
    end

    function u1._NoOp() end

    function u1.WidgetConstructor(a1_2, a2) -- Line: 326 -- upvalues: u1 (val), a1 (val) -- types: a1_2: string
        local v1
        local v2 = {
            All = {
                Required = {"Generate", "Discard", "Update", "Args", "Events", "hasChildren", "hasState"},
                Optional = {},
            },
            IfState = {Required = {"GenerateState", "UpdateState"}, Optional = {}},
            IfChildren = {Required = {"ChildAdded"}, Optional = {"ChildDiscarded"}},
        }
        local v3 = {}
        local v4 = nil
        local v5 = nil
        local v6 = a2
        for i, j in v2.All.Required, v4, v5 do
            assert(v6[j] ~= nil, (("field %* is missing from widget %*, it is required for all widgets"):format(j, v1)))
            v3[j] = v6[j]
        end
        v4 = nil
        v5 = nil
        for k, n in v2.All.Optional, v4, v5 do
            if v6[n] ~= nil then
                v3[n] = v6[n]
            else
                v3[n] = u1._NoOp
            end
        end
        if v6.hasState then
            v4 = nil
            v5 = nil
            for m, i5 in v2.IfState.Required, v4, v5 do
                assert(v6[i5] ~= nil, (("field %* is missing from widget %*, it is required for all widgets with state"):format(i5, v1)))
                v3[i5] = v6[i5]
            end
            for i6, i7 in v2.IfState.Optional do
                if v6[i7] ~= nil then
                    v3[i7] = v6[i7]
                else
                    v3[i7] = u1._NoOp
                end
            end
        end
        if v6.hasChildren then
            v4 = nil
            v5 = nil
            for i8, i9 in v2.IfChildren.Required, v4, v5 do
                assert(v6[i9] ~= nil, (("field %* is missing from widget %*, it is required for all widgets with children"):format(i9, v1)))
                v3[i9] = v6[i9]
            end
            for i10, i11 in v2.IfChildren.Optional do
                if v6[i11] ~= nil then
                    v3[i11] = v6[i11]
                else
                    v3[i11] = u1._NoOp
                end
            end
        end
        u1._widgets[v1] = v3
        a1.Args[v1] = v3.Args
        local v7 = {}
        for i12, i13 in v3.Args do
            v7[i13] = i12
        end
        v3.ArgNames = v7
        for i14, i15 in v3.Events do
            if a1.Events[i14] == nil then
                a1.Events[i14] = function() -- Line: 417 -- upvalues: u1 (upval), i14 (val)
                    return u1._EventCall(u1._lastWidget, i14)
                end
            end
        end
    end

    function u1._Insert(a1, a2, a3) -- Line: 435 -- upvalues: u1 (val) -- types: a1: string
        local v1
        local v2 = u1._getID(3)
        local v3 = u1._widgets[a1]
        if u1._VDOM[v2] then
            return u1._ContinueWidget(v2, a1)
        end
        local v4 = {}
        if a2 ~= nil then
            local v5, v6
            if type(a2) ~= "table" then
                a2 = {a2}
            end
            v1 = nil
            local v7 = nil
            for i, j in a2, v1, v7 do
                v6 = typeof(i)
                v5 = ("Widget Arguments must be a positive number, not %* of type %* for %*."):format(i, v6, j)
                assert(i > 0, v5)
                v4[v3.ArgNames[i]] = j
            end
        end
        table.freeze(v4)
        local v8 = u1._lastVDOM[v2]
        if v8 and a1 == v8.type and u1._localRefreshActive then
            u1._DiscardWidget(v8)
            v8 = nil
        end
        local parentWidget = (if v8 ~= nil then v8 else u1._GenNewWidget(a1, v4, a3, v2)).parentWidget
        if v1.type ~= "Window" and v1.type ~= "Tooltip" then
            if v1.ZIndex ~= parentWidget.ZOffset then
                parentWidget.ZUpdate = true
            end
            if parentWidget.ZUpdate then
                v1.ZIndex = parentWidget.ZOffset
                if v1.Instance then
                    v1.Instance.ZIndex = v1.ZIndex
                    v1.Instance.LayoutOrder = v1.ZIndex
                end
            end
        end
        if u1._deepCompare(v1.providedArguments, v4) == false then
            v1.arguments = u1._deepCopy(v4)
            v1.providedArguments = v4
            v3.Update(v1)
        end
        v1.lastCycleTick = u1._cycleTick
        parentWidget.ZOffset = parentWidget.ZOffset + 1
        if v3.hasChildren then
            v1.ZOffset = 0
            v1.ZUpdate = false
            local v9 = u1
            v9._stackIndex = v9._stackIndex + 1
            u1._IDStack[u1._stackIndex] = v1.ID
        end
        u1._VDOM[v2] = v1
        u1._lastWidget = v1
        return v1
    end

    function u1._GenNewWidget(a1, a2, a3, a4) -- Line: 530
        -- upvalues: u1 (val), HttpService (upval)
        local stateMT_2
        local v1 = u1._IDStack[u1._stackIndex]
        local v2 = u1._VDOM[v1]
        local v3 = u1._widgets[a1]
        local u113 = {}
        setmetatable(u113, u113)
        u113.ID = a4
        u113.type = a1
        u113.parentWidget = v2
        u113.trackedEvents = {}
        u113.UID = (HttpService:GenerateGUID(false)):sub(0, 8)
        u113.ZIndex = v2.ZOffset
        u113.Instance = v3.Generate(u113)
        local parentWidget = u113.parentWidget
        if not u1._config.Parent then
            u113.Instance.Parent = u1._widgets[parentWidget.type].ChildAdded(parentWidget, u113)
        else
            u113.Instance.Parent = u1._config.Parent
        end
        u113.providedArguments = a2
        u113.arguments = u1._deepCopy(a2)
        v3.Update(u113)
        if not v3.hasState then
            stateMT_2 = u113
        else
            if not a3 then
                u113.state = {}
            else
                local v4 = nil
                local v5 = nil
                local v6 = a3
                for i, j in a3, v4, v5 do
                    if type(j) ~= "table" or (getmetatable(j)) ~= u1.StateClass then
                        v6[i] = (u1._widgetState(u113, i, j))
                    end
                    v6[i].lastChangeTick = u1._cycleTick
                end
                u113.state = v6
                for k, n in v6 do
                    n.ConnectedWidgets[u113.ID] = u113
                end
            end
            v3.GenerateState(u113)
            v3.UpdateState(u113)
            u113.stateMT = {}
            local state = u113.state
            local stateMT = u113.stateMT
            setmetatable(state, stateMT)
            u113.__index = u113.state
            stateMT_2 = u113.stateMT
        end

        function stateMT_2.__index(a1, a2) -- Line: 596 -- upvalues: u1 (upval), u113 (val) -- types: a2: string
            return function() -- Line: 597 -- upvalues: u1 (upval), u113 (upval), a2 (val)
                return u1._EventCall(u113, a2)
            end
        end

        return u113
    end

    function u1._ContinueWidget(a1, a2) -- Line: 615 -- upvalues: u1 (val) -- types: a2: string
        local v1 = u1._widgets[a2]
        local v2 = u1._VDOM[a1]
        if v1.hasChildren then
            local v3 = u1
            v3._stackIndex = v3._stackIndex + 1
            u1._IDStack[u1._stackIndex] = v2.ID
        end
        u1._lastWidget = v2
        return v2
    end

    function u1._DiscardWidget(a1) -- Line: 638 -- upvalues: u1 (val)
        local parentWidget = a1.parentWidget
        if parentWidget then
            u1._widgets[parentWidget.type].ChildDiscarded(parentWidget, a1)
        end
        u1._widgets[a1.type].Discard(a1)
        a1.lastCycleTick = -1
    end

    function u1._widgetState(a1, a2, a3) -- Line: 663 -- upvalues: u1 (val) -- types: a2: string
        local v1 = a1.ID .. a2
        if u1._states[v1] then
            u1._states[v1].ConnectedWidgets[a1.ID] = a1
            local v2 = u1._states[v1]
            v2.lastChangeTick = u1._cycleTick
            return u1._states[v1]
        end
        u1._states[v1] = {
            ID = v1,
            value = a3,
            lastChangeTick = u1._cycleTick,
            ConnectedWidgets = {[a1.ID] = a1},
            ConnectedFunctions = {},
        }
        local v3 = u1._states[v1]
        local StateClass = u1.StateClass
        setmetatable(v3, StateClass)
        return u1._states[v1]
    end

    function u1._EventCall(a1, a2) -- Line: 692 -- upvalues: u1 (val) -- types: a2: string
        local v1 = u1._widgets[a1.type].Events[a2]
        local v2 = ("widget %* has no event of name %*"):format(a1.type, a2)
        assert(v1 ~= nil, v2)
        if a1.trackedEvents[a2] == nil then
            v1.Init(a1)
            a1.trackedEvents[a2] = true
        end
        return v1.Get(a1)
    end

    function u1._GetParentWidget() -- Line: 711 -- upvalues: u1 (val)
        return u1._VDOM[u1._IDStack[u1._stackIndex]]
    end

    function u1._generateEmptyVDOM() -- Line: 725 -- upvalues: u1 (val)
        return {R = u1._rootWidget}
    end

    function u1._generateRootInstance() -- Line: 738 -- upvalues: u1 (val)
        u1._rootInstance = u1._widgets.Root.Generate(u1._widgets.Root)
        u1._rootInstance.Parent = u1.parentInstance
        u1._rootWidget.Instance = u1._rootInstance
    end

    function u1._generateSelectionImageObject() -- Line: 752 -- upvalues: u1 (val)
        if u1.SelectionImageObject then
            u1.SelectionImageObject:Destroy()
        end
        local Frame = Instance.new("Frame")
        Frame.Position = UDim2.fromOffset(-1, -1)
        Frame.Size = UDim2.new(1, 2, 1, 2)
        Frame.BackgroundColor3 = u1._config.SelectionImageObjectColor
        Frame.BackgroundTransparency = u1._config.SelectionImageObjectTransparency
        Frame.BorderSizePixel = 0
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Thickness = 1
        UIStroke.Color = u1._config.SelectionImageObjectBorderColor
        UIStroke.Transparency = u1._config.SelectionImageObjectBorderTransparency
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Parent = Frame
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 2)
        UICorner.Parent = Frame
        u1.SelectionImageObject = Frame
    end

    function u1._getID(a1) -- Line: 793 -- upvalues: u1 (val) -- types: a1: number
        if u1._nextWidgetId then
            local _nextWidgetId = u1._nextWidgetId
            u1._nextWidgetId = nil
            return _nextWidgetId
        end
        local v1 = 1 + (a1 or 1)
        local v2 = ""
        local v3 = debug.info(v1, "l")
        while v3 ~= -1 do
            if v3 == nil then
                break
            end
            v2 = v2 .. "+" .. v3
            v1 = v1 + 1
            v3 = debug.info(v1, "l")
        end
        if not u1._usedIDs[v2] then
            u1._usedIDs[v2] = 1
        else
            local _usedIDs = u1._usedIDs
            _usedIDs[v2] = _usedIDs[v2] + 1
        end
        local _pushedId = if not u1._pushedId then u1._usedIDs[v2] else u1._pushedId
        return v2 .. ":" .. _pushedId
    end

    function u1._deepCompare(a1, a2) -- Line: 832 -- upvalues: u1 (val) -- types: a1: table, a2: table
        local v1
        local v2 = nil
        local v3 = nil
        for i, j in a1, v2, v3 do
            v1 = a2[i]
            if type(j) ~= "table" then
                if (type(j)) == type(v1) and j == v1 then
                    continue
                end
                return false
            end
            if v1 and type(v1) == "table" then
                if u1._deepCompare(j, v1) ~= false then
                    continue
                end
                return false
            end
            return false
        end
        return true
    end

    function u1._deepCopy(a1) -- Line: 863 -- upvalues: u1 (val) -- types: a1: table
        local v1 = table.clone(a1)
        for k, v in pairs(a1) do
            if type(v) == "table" then
                v1[k] = (u1._deepCopy(v))
            end
        end
        return v1
    end

    u1._lastVDOM = u1._generateEmptyVDOM()
    u1._VDOM = u1._generateEmptyVDOM()
    a1.Internal = u1
    a1._config = u1._config
    return u1
end