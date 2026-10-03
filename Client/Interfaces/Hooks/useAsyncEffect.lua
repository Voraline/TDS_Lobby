-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useAsyncEffect
-- Decompile time: 0.31 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.PromiseTypes)
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1, a2) -- Line: 6 -- upvalues: React (val) -- types: a1: function, a2: table
    React.useEffect(function() -- Line: 7 -- upvalues: a1 (val)
        local u1 = a1()
        return function() -- Line: 10 -- upvalues: u1 (val)
            u1:cancel()
        end
    end, a2)
end