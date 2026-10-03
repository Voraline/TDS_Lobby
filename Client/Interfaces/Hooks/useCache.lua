-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useCache
-- Decompile time: 1.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useState = React.useState
local useEffect = React.useEffect
local useCallback = React.useCallback
local useRef = React.useRef
local useMemo = React.useMemo
local u36 = NewNetwork.Channel("Cache", {functions = {"updateCache"}})
return function(a1, a2, a3) -- Line: 19
    -- upvalues: useRef (val), useMemo (val), Cache (val), useState (val), useCallback (val), u36 (val), useEffect (val)
    -- upvalues: useEvent (val)
    local u4 = a3 ~= false
    local u7 = useRef(nil)
    local v1 = {a1}
    local u13 = useMemo(function() -- Line: 23 -- upvalues: Cache (upval), a1 (val)
        return Cache(a1)
    end, v1)
    local v2, u18 = useState(function() -- Line: 27 -- upvalues: u13 (val), a2 (val)
        local Value = u13:GetValue()
        if Value == nil then
            return a2
        end
        return Value
    end)
    local v3 = {u13}
    local v4 = useCallback(function(a1_2, a2) -- Line: 32
        -- upvalues: u7 (val), u13 (val), u36 (upval), a1 (val)
        task.spawn(function() -- Line: 33 -- upvalues: u7 (upval), u13 (upval), a1_2 (val), a2 (val), u36 (upval), a1 (upval)
            local current = u7.current
            u13:Update(a1_2)
            u7.current = a1_2
            if a2 ~= false then
                return
            end
            local v1, v2 = u36:invokeServer("updateCache", a1, a1_2)
            if not v1 then
                u13:Update(current)
                u7.current = current
                if v2 then
                    warn((("[Cache] Error updating cache \"%*\""):format(v2)))
                end
            end
        end)
    end, v3)
    local v5 = {u13, u4}
    useEffect(function() -- Line: 55 -- upvalues: u4 (val), u13 (val), u7 (val), u18 (val)
        if not u4 then
            return
        end
        local u1 = true
        ;(u13:Get()):andThen(function(a1) -- Line: 61 -- upvalues: u1 (ref), u7 (upval), u18 (upval)
            if not u1 then
                return
            end
            if a1 then
                u7.current = a1
                u18(a1)
            end
        end)
        return function() -- Line: 72 -- upvalues: u1 (ref)
            u1 = false
        end
    end, v5)
    local v6 = {u13, u4}
    useEvent(u13.Updated, function(a1) -- Line: 77 -- upvalues: u18 (val), u7 (val)
        u18(a1)
        u7.current = a1
    end, v6, function() -- Line: 80 -- upvalues: u4 (val)
        return u4
    end)
    return v2, v4
end