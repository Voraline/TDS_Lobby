a1,
            a2,
            a3,
            if not v3 then v1 else string.gsub(v3, "^%.", ""),
            (tostring(v2))
        )
    end
end

local u62 = {
    didMount = "componentDidMount",
    shouldUpdate = "shouldComponentUpdate",
    willUpdate = "UNSAFE_componentWillUpdate",
    didUpdate = "componentDidUpdate",
    willUnmount = "componentWillUnmount",
}

local function handleNewLifecycle(a1, a2, a3)                     __componentName_3,
                    a2,
                    v1,
                    if not v4 then v2 else string.gsub(v4, "^%.", ""),
                    (tostring(v3))
                )
            end
        else
            local __componentName_2 = a1.__componentName
            console.warn(
                "%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.",
                __componentName_2,
                "UNSAFE_componentWillUpdate",
                a2,
                __componentName_2
            )
        end
        a2 = u62[a2]
    end
    rawset(a1, a2, a3)
end

local v2 = {
    __newindex = handleNewLifecycle,
    __index = {isReactComponent = true},
    __tostring = function(a1) -- Line: 124
        return a1.__componentName
    end,
}
local u69 = setmetatable({__componentName = "Component"}, v2)
local u73 = if _G.__TESTEZ_RUNNING_TEST__ then 0 else 900
local u74 = 1
local u78 = table.create(u73)
for i = 1, u73 do
    table.insert(u78, {state = UninitializedState, __refs = u41, __updater = ReactNoopUpdateQueue})
end

local function setStateInInit(a1, a2, a3) -- Line: 160
    -- upvalues: __DEV__ (val), console (val), Object (val)
    if __DEV__ and a3 ~= nil then
        console.warn(
            "Received a `callback` argument to `setState` during initialization of \"%s\". The callback behavior is not supported when using `setState` in `init`.\n\nConsider defining similar behavior in a `compontentDidMount` method instead.",
            a1.__componentName
        )
    end
    local v1 = a2 and type(a2)
    if a2 == nil or v1 ~= "table" and v1 ~= "function" then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
    end
    local state = a1.state
    a1.state = Object.assign({}, state, if v1 ~= "function" then a2 else a2(state, a1.props))
end

function u69:extend(a2) -- Line: 200
    -- upvalues: __COMPAT_WARNINGS__ (val), console (val), u74 (ref), u73 (val), u78 (val), UninitializedState (val)
    -- upvalues: u41 (val), ReactNoopUpdateQueue (val), setStateInInit (val)
    if a2 == nil then
        if __COMPAT_WARNINGS__ then
            console.warn("Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.")
        end
        a2 = ""
    elseif type(a2) ~= "string" then
        error("Component class name must be a string")
    end
    local u14 = {__componentName = a2, setState = self.setState, forceUpdate = self.forceUpdate}
    u14.__index = u14

    function u14.__ctor(a1, a2, a3) -- Line: 234
        -- upvalues: u74 (upval), u73 (upval), u78 (upval), UninitializedState (upval), u41 (upval)
        -- upvalues: ReactNoopUpdateQueue (upval), u14 (val), setStateInInit (upval)
        local v1
        if not (u74 <= u73) then
            v1 = {
                props = a1,
                context = a2,
                state = UninitializedState,
                __refs = u41,
                __updater = a3 or ReactNoopUpdateQueue,
            }
        else
            v1 = u78[u74]
            v1.props = a1
            v1.context = a2
            u78[u74] = nil
            u74 = u74 + 1
        end
        v1 = setmetatable(v1, u14)
        if u14.init and type(u14.init) == "function" then
            v1.setState = setStateInInit
            u14.init(v1, a1, a2)
            v1.setState = nil
        end
        return v1
    end

    local v1 = getmetatable(self)
    setmetatable(u14, v1)
    return u14
end

function u69.setState(a1, a2, a3) -- Line: 326
    if a2 ~= nil and type(a2) ~= "table" and type(a2) ~= "function" then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.")
    end
    a1.__updater.enqueueSetState(a1, a2, a3, "setState")
end

function u69.forceUpdate(a1, a2) -- Line: 355
    a1.__updater.enqueueForceUpdate(a1, a2, "forceUpdate")
end

if __DEV__ then
    v1 = {
        isMounted = {
            "isMounted",
            "Instead, make sure to clean up subscriptions and pending requests in componentWillUnmount to prevent memory leaks.",
        },
        replaceState = {
            "replaceState",
            "Refactor your code to use setState instead (see https://github.com/facebook/react/issues/3236).",
        },
    }

    local function v3(a1, a2) -- Line: 379 -- upvalues: u69 (val), console (val)
        u69[a1] = function() -- Line: 380 -- upvalues: console (upval), a2 (val)
            console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", a2[1], a2[2])
            return nil
        end
    end

    for j, k in v1 do
        if v1[j] ~= nil then
            local u150 = v1[j]

            u69[j] = function() -- Line: 380 -- upvalues: console (val), u150 (val)
                console.warn("%s(...) is deprecated in plain JavaScript React classes. %s", u150[1], u150[2])
                return nil
            end
        end
    end
end
v1 = u69:extend("PureComponent")
v1.extend = u69.extend
local v4 = {
    __newindex = handleNewLifecycle,
    __index = {isReactComponent = true, isPureReactComponent = true},
    __tostring = function(a1) -- Line: 427
        return a1.__componentName
    end,
}
setmetatable(v1, v4)
return {Component = u69, PureComponent = v1}