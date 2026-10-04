-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useDispatchTracker
-- Decompile time: 5.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local u17 = RunService:IsStudio()
local useEffect = React.useEffect
local u19 = {}

local function cleanStackTrace(a1) -- Line: 11 -- types: a1: string?
    local v1 = {}
    local v2 = false
    local v3 = a1
    for i, j in string.split(debug.traceback(), "\n") do
        if not string.match(j, "^ReplicatedStorage%.Packages%.React")
            and not string.match(j, "^ReplicatedStorage%.Client%.Interfaces%.Hooks%.useDispatchTracker") then
            if v3 and string.match(j, v3) then
                v2 = true
            end
            table.insert(v1, j)
        end
    end
    return v1, v2
end

local function globalHook() -- Line: 36 -- upvalues: cleanStackTrace (val)
    local v1 = cleanStackTrace()
    if #v1 == 0 then
        return
    end
    warn((("[dispatch-tracker] global re-render triggered:\n%*"):format((table.concat(v1, "\n")))))
end

local function localHook(a1) -- Line: 45 -- upvalues: cleanStackTrace (val) -- types: a1: string
    return function() -- Line: 46 -- upvalues: cleanStackTrace (upval), a1 (val)
        local v1, v2 = cleanStackTrace(a1)
        if v2 and #v1 ~= 0 then
            warn((("[dispatch-tracker] local re-render triggered:\n%*"):format((table.concat(v1, "\n")))))
            return
        end
    end
end

local function setupDispatchHook(a1) -- Line: 56
    -- upvalues: u19 (val), useEffect (val), globalHook (val), cleanStackTrace (val)
    if not _G.__ON_DISPATCH_ then
        local v1 = _G

        function v1.__ON_DISPATCH_() -- Line: 58 -- upvalues: u19 (upval)
            for i in u19 do
                i()
            end
        end
    end
    local u8 = debug.info(3, "s")
    useEffect(function() -- Line: 67 -- upvalues: a1 (val), globalHook (upval), u8 (val), cleanStackTrace (upval), u19 (upval)
        local u3
        if not a1 then
            local u2 = u8

            function u3() -- Line: 46 -- upvalues: cleanStackTrace (upval), u2 (val)
                local v1, v2 = cleanStackTrace(u2)
                if v2 and #v1 ~= 0 then
                    warn((("[dispatch-tracker] local re-render triggered:\n%*"):format((table.concat(v1, "\n")))))
                    return
                end
            end
        else
            u3 = globalHook
        end
        u19[u3] = true
        return function() -- Line: 71 -- upvalues: u19 (upval), u3 (val)
            u19[u3] = nil
        end
    end, {})
end

return function(a1) -- Line: 77 -- upvalues: u17 (val), setupDispatchHook (val) -- types: a1: boolean?
    if not u17 then
        return false
    end
    setupDispatchHook(a1)
    return true
end