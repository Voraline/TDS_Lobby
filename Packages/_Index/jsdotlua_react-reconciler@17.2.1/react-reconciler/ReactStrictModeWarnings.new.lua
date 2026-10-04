-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactStrictModeWarnings.new
-- Decompile time: 5.17 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local ReactCurrentFiber = require(script.Parent:WaitForChild("ReactCurrentFiber"))
local resetCurrentFiber = ReactCurrentFiber.resetCurrentFiber
local setCurrentFiber = ReactCurrentFiber.setCurrentFiber
local getComponentName = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local StrictMode = require(script.Parent:WaitForChild("ReactTypeOfMode")).StrictMode
local v1 = {
    recordUnsafeLifecycleWarnings = function(a1, a2) end,
    flushPendingUnsafeLifecycleWarnings = function() end,
    recordLegacyContextWarning = function(a1, a2) end,
    flushLegacyContextWarning = function() end,
    discardPendingWarnings = function() end,
}
if _G.__DEV__ then
    local function v2(a1) -- Line: 38 -- upvalues: StrictMode (val)
        local v1 = nil
        local return_ = a1
        while return_ ~= nil do
            if bit32.band(return_.mode, StrictMode) ~= 0 then
                v1 = return_
            end
            return_ = return_.return_
        end
        return v1
    end

    local function u56(a1) -- Line: 53
        local v1 = {}
        for i, j in a1 do
            table.insert(v1, i)
        end
        table.sort(v1)
        return table.concat(v1, ", ")
    end

    local u57 = {}
    local u58 = {}
    local u59 = {}
    local u60 = {}
    local u61 = {}
    local u62 = {}
    local u63 = {}

    function v1.recordUnsafeLifecycleWarnings(a1, a2) -- Line: 73
        -- upvalues: u63 (val), u57 (val), StrictMode (val), u58 (val), u59 (val), u60 (val), u61 (val), u62 (val)
        if u63[a1.type] then
            return
        end
        if typeof(a2.componentWillMount) == "function" then
            table.insert(u57, a1)
        end
        if bit32.band(a1.mode, StrictMode) ~= 0 and typeof(a2.UNSAFE_componentWillMount) == "function" then
            table.insert(u58, a1)
        end
        if typeof(a2.componentWillReceiveProps) == "function" then
            table.insert(u59, a1)
        end
        if bit32.band(a1.mode, StrictMode) ~= 0 and typeof(a2.UNSAFE_componentWillReceiveProps) == "function" then
            table.insert(u60, a1)
        end
        if typeof(a2.componentWillUpdate) == "function" then
            table.insert(u61, a1)
        end
        if bit32.band(a1.mode, StrictMode) ~= 0 and typeof(a2.UNSAFE_componentWillUpdate) == "function" then
            table.insert(u62, a1)
        end
    end

    function v1.flushPendingUnsafeLifecycleWarnings() -- Line: 126
        -- upvalues: u57 (val), getComponentName (val), u63 (val), u58 (val), u59 (val), u60 (val), u61 (val), u62 (val)
        -- upvalues: u56 (val), console (val)
        local v1 = {}
        if #u57 > 0 then
            for i, j in u57 do
                v1[getComponentName(j.type) or "Component"] = true
                u63[j.type] = true
            end
            table.clear(u57)
        end
        local v2 = {}
        if #u58 > 0 then
            for k, n in u58 do
                v2[getComponentName(n.type) or "Component"] = true
                u63[n.type] = true
            end
            table.clear(u58)
        end
        local v3 = {}
        if #u59 > 0 then
            for m, i5 in u59 do
                v3[getComponentName(i5.type) or "Component"] = true
                u63[i5.type] = true
            end
            table.clear(u59)
        end
        local v4 = {}
        if #u60 > 0 then
            for i6, i7 in u60 do
                v4[getComponentName(i7.type) or "Component"] = true
                u63[i7.type] = true
            end
            table.clear(u60)
        end
        local v5 = {}
        if #u61 > 0 then
            for i8, i9 in u61 do
                v5[getComponentName(i9.type) or "Component"] = true
                u63[i9.type] = true
            end
            table.clear(u61)
        end
        local v6 = {}
        if #u62 > 0 then
            for i10, i11 in u62 do
                v6[getComponentName(i11.type) or "Component"] = true
                u63[i11.type] = true
            end
            table.clear(u62)
        end
        if next(v2) ~= nil then
            console.error(
                "Using UNSAFE_componentWillMount in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n\nPlease update the following components: %s",
                (u56(v2))
            )
        end
        if next(v4) ~= nil then
            console.error(
                "Using UNSAFE_componentWillReceiveProps in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n\nPlease update the following components: %s",
                (u56(v4))
            )
        end
        if next(v6) ~= nil then
            console.error(
                "Using UNSAFE_componentWillUpdate in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n\nPlease update the following components: %s",
                (u56(v6))
            )
        end
        if next(v1) ~= nil then
            console.warn(
                "componentWillMount has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n* Rename componentWillMount to UNSAFE_componentWillMount to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s",
                (u56(v1))
            )
        end
        if next(v3) ~= nil then
            console.warn(
                "componentWillReceiveProps has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n* Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s",
                (u56(v3))
            )
        end
        if next(v5) ~= nil then
            console.warn(
                "componentWillUpdate has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* Rename componentWillUpdate to UNSAFE_componentWillUpdate to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s",
                (u56(v5))
            )
        end
    end

    local u66 = {}
    local u67 = {}

    function v1.recordLegacyContextWarning(a1, a2) -- Line: 300
        -- upvalues: StrictMode (val), console (val), u67 (val), u66 (val)
        local v1 = nil
        local return_ = a1
        local v2, v3 = a1, a2
        while return_ ~= nil do
            if bit32.band(return_.mode, StrictMode) ~= 0 then
                v1 = return_
            end
            return_ = return_.return_
        end
        local v4 = v1
        if v4 == nil then
            console.error("Expected to find a StrictMode component in a strict mode tree. This error is likely caused by a bug in React. Please file an issue.")
            return
        end
        if u67[v2.type] then
            return
        end
        v1 = u66[v4]
        if typeof(v2.type) ~= "function" then
            if v2.type.contextTypes ~= nil
                or v2.type.childContextTypes ~= nil
                or v3 ~= nil and typeof(v3.getChildContext) == "function" then
                if v1 == nil then
                    u66[v4] = {}
                end
                table.insert(v1, v2)
            end
        end
    end

    function v1.flushLegacyContextWarning() -- Line: 339
        -- upvalues: u66 (val), getComponentName (val), u67 (val), u56 (val), setCurrentFiber (val), console (val)
        -- upvalues: resetCurrentFiber (val)
        local result, success, v1
        local v2 = nil
        local v3 = nil
        for i, j in u66, v2, v3 do
            if #j == 0 then
                return
            end
            local u11 = j[1]
            v1 = {}
            for k, n in j do
                v1[getComponentName(n.type) or "Component"] = true
                u67[n.type] = true
            end
            local u26 = u56(v1)
            success, result = pcall(function() -- Line: 354 -- upvalues: setCurrentFiber (upval), u11 (val), console (upval), u26 (val)
                setCurrentFiber(u11)
                console.error(
                    "Legacy context API has been detected within a strict-mode tree.\n\nThe old API will be supported in all 16.x releases, but applications using it should migrate to the new version.\n\nPlease update the following components: %s\n\nLearn more about this warning here: https://reactjs.org/link/legacy-context",
                    u26
                )
            end)
            resetCurrentFiber()
            if not success then
                error(result)
            end
        end
    end

    function v1.discardPendingWarnings() -- Line: 377
        -- upvalues: u57 (val), u58 (val), u59 (val), u60 (val), u61 (val), u62 (val), u66 (val)
        table.clear(u57)
        table.clear(u58)
        table.clear(u59)
        table.clear(u60)
        table.clear(u61)
        table.clear(u62)
        table.clear(u66)
    end
end
return v1