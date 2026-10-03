-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
return function(a1) -- Line: 6 -- upvalues: React (val)
    local v1 = React.useRef(nil)
    local v2 = nil
    if v1.current == nil then
        v2 = a1
        if typeof(v2) == "function" then
            v2 = v2()
        end
        v1.current = true
    end
    return React.useBinding(v2)
end