-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactHooks
-- Decompile time: 2.92 ms

local Array = (require((script.Parent.Parent:WaitForChild("luau-polyfill")))).Array
local console = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent:WaitForChild("shared"))
local ReactCurrentDispatcher = require(script.Parent.Parent:WaitForChild("shared")).ReactSharedInternals.ReactCurrentDispatcher

local function resolveDispatcher() -- Line: 44 -- upvalues: ReactCurrentDispatcher (val), console (val)
    local current = ReactCurrentDispatcher.current
    if _G.__DEV__ and current == nil then
        console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
    end
    return current
end

return {
    useContext = function(a1, a2, ...) -- Line: 67 -- upvalues: ReactCurrentDispatcher (val), console (val), Array (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        if _G.__DEV__ then
            if a2 ~= nil then
                console.error(
                    "useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s",
                    a2,
                    if typeof(a2) ~= "number" then "" else if not Array.isArray({...}) then "" else "\n\nDid you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks"
                )
            end
            if a1._context ~= nil then
                local _context = a1._context
                if _context.Consumer == a1 then
                    console.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?")
                elseif _context.Provider == a1 then
                    console.error("Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?")
                end
            end
        end
        return current.useContext(a1, a2)
    end,
    useState = function(a1, ...) -- Line: 108 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useState(a1, ...)
    end,
    useReducer = function(a1, a2, a3) -- Line: 117
        -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useReducer(a1, a2, a3)
    end,
    useRef = function(a1) -- Line: 128 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useRef(a1)
    end,
    useBinding = function(a1) -- Line: 135 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useBinding(a1)
    end,
    useEffect = function(a1, a2) -- Line: 147 -- upvalues: ReactCurrentDispatcher (val), console (val) -- types: a1: function
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useEffect(a1, a2)
    end,
    useLayoutEffect = function(a1, a2) -- Line: 157 -- upvalues: ReactCurrentDispatcher (val), console (val) -- types: a1: function
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useLayoutEffect(a1, a2)
    end,
    useCallback = function(a1, a2) -- Line: 167 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useCallback(a1, a2)
    end,
    useMemo = function(a1, a2) -- Line: 173 -- upvalues: ReactCurrentDispatcher (val), console (val) -- types: a1: function
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useMemo(a1, a2)
    end,
    useImperativeHandle = function(a1, a2, a3) -- Line: 179 -- upvalues: ReactCurrentDispatcher (val), console (val) -- types: a2: function
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useImperativeHandle(a1, a2, a3)
    end,
    useDebugValue = function(a1, a2) -- Line: 189 -- upvalues: ReactCurrentDispatcher (val), console (val) -- types: a2: function?
        if not _G.__DEV__ then
            return nil
        end
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useDebugValue(a1, a2)
    end,
    emptyObject = {},
    useOpaqueIdentifier = function() -- Line: 214 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useOpaqueIdentifier()
    end,
    useMutableSource = function(a1, a2, a3) -- Line: 220 -- upvalues: ReactCurrentDispatcher (val), console (val)
        local current = ReactCurrentDispatcher.current
        if _G.__DEV__ and current == nil then
            console.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.")
        end
        return current.useMutableSource(a1, a2, a3)
    end,
}