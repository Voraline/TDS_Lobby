-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react@17.2.1.react.ReactNoopUpdateQueue
-- Decompile time: 1.05 ms

local console = require(script.Parent.Parent:WaitForChild("shared")).console
local u10 = {}

local function warnNoop(a1, a2) -- Line: 14 -- upvalues: u10 (val), console (val) -- types: a2: string
    if _G.__DEV__ then
        local v1 = a1.__componentName or "ReactClass"
        local v2 = v1 .. "." .. a2
        if u10[v2] then
            return
        end
        console.error(
            "Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.",
            a2,
            v1
        )
        u10[v2] = true
    end
end

return {
    isMounted = function(a1) -- Line: 49
        return false
    end,
    enqueueForceUpdate = function(a1, a2, a3) -- Line: 67 -- upvalues: u10 (val), console (val)
        if _G.__DEV__ then
            local v1 = a1.__componentName or "ReactClass"
            local v2 = v1 .. ".forceUpdate"
            if u10[v2] then
                return
            end
            console.error(
                "Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.",
                "forceUpdate",
                v1
            )
            u10[v2] = true
        end
    end,
    enqueueReplaceState = function(a1, a2, a3, a4) -- Line: 83 -- upvalues: u10 (val), console (val)
        if _G.__DEV__ then
            local v1 = a1.__componentName or "ReactClass"
            local v2 = v1 .. ".replaceState"
            if u10[v2] then
                return
            end
            console.error(
                "Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.",
                "replaceState",
                v1
            )
            u10[v2] = true
        end
    end,
    enqueueSetState = function(a1, a2, a3, a4) -- Line: 98 -- upvalues: u10 (val), console (val)
        if _G.__DEV__ then
            local v1 = a1.__componentName or "ReactClass"
            local v2 = v1 .. ".setState"
            if u10[v2] then
                return
            end
            console.error(
                "Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.",
                "setState",
                v1
            )
            u10[v2] = true
        end
    end,
}