-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useDebounce
-- Decompile time: 0.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1, a2) -- Line: 5 -- upvalues: React (val) -- types: a1: number, a2: function
    local u7 = React.useRef(tick() - a1)
    return React.useCallback(function() -- Line: 8 -- upvalues: u7 (val), a1 (val), a2 (val)
        if not (a1 <= tick() - u7.current) then
            return nil
        end
        u7.current = tick()
        return a2()
    end, {a1, a2})
end