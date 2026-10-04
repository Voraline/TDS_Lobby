-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useConfetti
-- Decompile time: 1.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Confetti = require(ReplicatedStorage.Shared.UI.Components.Confetti)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useRef = React.useRef
local useMemo = React.useMemo
return function(a1) -- Line: 20
    -- upvalues: useRef (val), useMemo (val), Confetti (val), useEffect (val), React (val)
    local u5 = useRef(Instance.new("BindableEvent"))
    local u9 = useMemo(function() -- Line: 23 -- upvalues: Confetti (upval), u5 (val), a1 (val)
        return Confetti({AlwaysOnTop = true, Event = u5.current, Emitters = a1})
    end, a1)
    local u11 = useRef()
    local v1 = {u11}
    useEffect(function() -- Line: 29 -- upvalues: u11 (val), u9 (val)
        if u11.current then
            u11.current = u9
        end
    end, v1)
    v1 = {u9}
    useEffect(function() -- Line: 35 -- upvalues: u9 (val)
        u9.Name = "ConfettiEmitter"
        return function() -- Line: 38 -- upvalues: u9 (upval)
            u9:Destroy()
        end
    end, v1)
    return (useRef(u9)), React.useCallback(function() -- Line: 44 -- upvalues: u5 (val)
        if u5.current then
            u5.current:Fire()
        end
    end)
end