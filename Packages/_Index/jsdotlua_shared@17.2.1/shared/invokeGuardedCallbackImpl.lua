-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.invokeGuardedCallbackImpl
-- Decompile time: 0.61 ms

local describeError = require(script.Parent:WaitForChild("ErrorHandling.roblox")).describeError
return function(a1, a2, a3, a4, ...) -- Line: 15 -- upvalues: describeError (val)
    local v1
    local v2 = nil
    if _G.__YOLO__ then
        v1 = true
        if a4 ~= nil then
            a3(a4, ...)
        else
            a3(...)
        end
    elseif a4 ~= nil then
        local success_2, result_2 = xpcall(a3, describeError, a4, ...)
        v1 = success_2
        v2 = result_2
    else
        local success, result = xpcall(a3, describeError, ...)
        v1 = success
        v2 = result
    end
    if not v1 then
        a1.onError(v2)
    end
end