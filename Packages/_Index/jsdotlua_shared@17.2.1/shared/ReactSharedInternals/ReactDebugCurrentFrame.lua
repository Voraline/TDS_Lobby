-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.ReactSharedInternals.ReactDebugCurrentFrame
-- Decompile time: 0.31 ms

local u0 = {}
local u1 = nil

function u0.setExtraStackFrame(a1) -- Line: 16 -- upvalues: u1 (ref) -- types: a1: string?
    if _G.__DEV__ then
        u1 = a1
    end
end

if _G.__DEV__ then
    u0.getCurrentStack = nil

    function u0.getStackAddendum() -- Line: 33 -- upvalues: u1 (ref), u0 (val)
        local v1 = ""
        if u1 then
            v1 = v1 .. u1
        end
        local getCurrentStack = u0.getCurrentStack
        if getCurrentStack then
            v1 = v1 .. (getCurrentStack() or "")
        end
        return v1
    end
end
return u0