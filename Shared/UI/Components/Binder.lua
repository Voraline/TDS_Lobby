-- Script path: ReplicatedStorage.Shared.UI.Components.Binder
-- Decompile time: 0.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Observer = require(ReplicatedStorage.Shared.UI.Fusion).Observer
return function(a1, a2) -- Line: 6 -- upvalues: Observer (val)
    a2(a1:get(false))
    return (Observer(a1)):onChange(function() -- Line: 9 -- upvalues: a2 (val), a1 (val)
        a2(a1:get(false))
    end)
end