-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactErrorUtils
-- Decompile time: 0.73 ms

local invariant = require(script.Parent:WaitForChild("invariant"))
local invokeGuardedCallbackImpl = require(script.Parent:WaitForChild("invokeGuardedCallbackImpl"))
local u16 = nil
local u17 = false
local u18 = nil
local u19 = false
local u20 = nil
local u21 = {}

function u21.onError(a1) -- Line: 25 -- upvalues: u17 (ref), u18 (ref)
    u17 = true
    u18 = a1
end

local u23 = {}

function u23.invokeGuardedCallback(...) -- Line: 45
    -- upvalues: u17 (ref), u18 (ref), invokeGuardedCallbackImpl (val), u21 (val)
    u17 = false
    u18 = nil
    invokeGuardedCallbackImpl(u21, ...)
end

function u23.invokeGuardedCallbackAndCatchFirstError(...) -- Line: 62
    -- upvalues: u23 (val), u17 (ref), u16 (ref), u19 (ref), u20 (ref)
    u23.invokeGuardedCallback(...)
    if u17 then
        local v1 = u16()
        if not u19 then
            u19 = true
            u20 = v1
        end
    end
end

function u23.rethrowCaughtError() -- Line: 80 -- upvalues: u19 (ref), u20 (ref)
    if u19 then
        local v1 = u20
        u19 = false
        u20 = nil
        error(v1)
    end
end

function u23.hasCaughtError() -- Line: 89 -- upvalues: u17 (ref)
    return u17
end

function u16() -- Line: 93 -- upvalues: u17 (ref), u18 (ref), invariant (val)
    if not u17 then
        invariant(
            false,
            "clearCaughtError was called but no error was captured. This error is likely caused by a bug in React. Please file an issue."
        )
        return nil
    end
    local v1 = u18
    u17 = false
    u18 = nil
    return v1
end

u23.clearCaughtError = u16
return u23