-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useOneShot
-- Decompile time: 3.10 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local React = require(ReplicatedStorage.Shared.UI.React)
local useState = React.useState
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local LinearValue = require(ReplicatedStorage.Client.Interfaces.Hooks.Utility.LinearValue)
return function(a1, a2, a3, a4, a5) -- Line: 14
    -- upvalues: React (val), useMemo (val), useRef (val), TweenService (val), LinearValue (val), useEffect (val)
    local v1 = nil
    local u6 = nil
    if not a5 then
        assert(false, "useOneShot must be used with a binding")
    else
        local v2, v3 = React.useBinding(a4 or a1)
        v1 = v2
        u6 = v3
    end
    local u21 = useMemo(function() -- Line: 29
        return Instance.new("NumberValue")
    end, {})
    local u31 = useRef(TweenService:Create(u21, a3, {Value = 1}))
    local u34 = useRef({})
    local u39 = LinearValue.fromValue(a1)
    local u44 = LinearValue.fromValue(a2)
    local u47 = useRef(u39)
    local u50 = useRef(u44)
    useEffect(function() -- Line: 42 -- upvalues: u21 (val), u47 (val), u50 (val), u6 (ref), u31 (val), u34 (val)
        local u8 = (u21:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 43 -- upvalues: u47 (upval), u50 (upval), u21 (upval), u6 (upval)
            local v1 = u47.current:Lerp(u50.current, u21.Value)
            u6(v1:ToValue())
        end)
        u31.current.Completed:Connect(function() -- Line: 48 -- upvalues: u47 (upval), u50 (upval)
            u47.current = u50.current
        end)
        return function() -- Line: 52 -- upvalues: u8 (val), u34 (upval), u21 (upval)
            u8:Disconnect()
            for i, v in ipairs(u34.current) do
                v:Disconnect()
            end
            table.clear(u34.current)
            u34.current = nil
            u21:Destroy()
        end
    end, {})
    return v1, (React.useCallback(function() -- Line: 67 -- upvalues: u31 (val), u21 (val), u47 (val), u39 (val), u50 (val), u44 (val)
        u31.current:Cancel()
        u21.Value = 0
        u47.current = u39
        u50.current = u44
        u31.current:Play()
    end, {}))
end