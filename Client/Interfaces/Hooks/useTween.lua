-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTween
-- Decompile time: 3.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local TweenService_2 = require(ReplicatedStorage.Client.Modules.TweenService)
local LinearValue = require(ReplicatedStorage.Client.Interfaces.Hooks.Utility.LinearValue)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useMemo = React.useMemo

local function makeTween(a1, a2, a3, a4, a5) -- Line: 11
    -- upvalues: LinearValue (val), TweenService_2 (val), TweenService (val)
    local u8 = LinearValue.fromValue(a1)
    local u9 = u8
    local u10 = u8
    local u11 = {updateState = a3}
    local NumberValue = Instance.new("NumberValue")
    local u31 = if not a5 then TweenService:Create(NumberValue, a2, {Value = 1}) else TweenService_2:Create(NumberValue, a2, {Value = 1})
    NumberValue.Value = 0
    NumberValue.Changed:Connect(function(a1) -- Line: 33 -- upvalues: u9 (ref), u8 (ref), u10 (ref), u11 (val)
        u9 = u8:Lerp(u10, a1)
        if u11.updateState then
            u11.updateState(u9:ToValue())
        end
    end)

    function u11.play(a1_2, a2) -- Line: 41
        -- upvalues: u10 (ref), u31 (ref), u8 (ref), a4 (val), u9 (ref), LinearValue (upval), a1 (val)
        -- upvalues: NumberValue (val)
        if not a2 and a1_2 == u10:ToValue() then
            return
        end
        u31:Cancel()
        u8 = a4 and u9 or LinearValue.fromValue(a1)
        u10 = LinearValue.fromValue(a1_2)
        NumberValue.Value = 0
        u31:Play()
    end

    function u11.stop() -- Line: 53
        -- upvalues: u31 (ref), u8 (ref), a4 (val), u9 (ref), LinearValue (upval), a1 (val), u10 (ref)
        -- upvalues: NumberValue (val)
        u31:Cancel()
        u8 = a4 and u9 or LinearValue.fromValue(a1)
        u10 = u8
        NumberValue.Value = 0
    end

    function u11.Destroy() -- Line: 60 -- upvalues: NumberValue (val)
        NumberValue:Destroy()
    end

    return u11
end

return function(a1, a2, a3, a4, a5) -- Line: 67
    -- upvalues: React (val), useMemo (val), makeTween (val), useEffect (val)
    local v1 = nil
    local u6 = nil
    if not a4 then
        assert(false, "useTween must be used with a binding")
    else
        local v2, v3 = React.useBinding(a1)
        v1 = v2
        u6 = v3
    end
    local u26 = useMemo(function() -- Line: 81 -- upvalues: makeTween (upval), a1 (val), a2 (val), u6 (ref), a3 (val), a5 (val)
        return (makeTween(a1, a2, u6, a3, a5))
    end, {})
    u26.updateState = u6
    useEffect(function() -- Line: 87 -- upvalues: u26 (val)
        return function() -- Line: 88 -- upvalues: u26 (upval)
            u26:Destroy()
        end
    end, {})
    return v1, u26.play, u26.stop, u26.Destroy
end