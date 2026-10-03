-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTrigger
-- Decompile time: 0.34 ms

local UI = (game:GetService("ReplicatedStorage")).Shared.UI
local React = require(UI.React)
local useState = React.useState
local useCallback = React.useCallback
return function() -- Line: 16 -- upvalues: useState (val), useCallback (val)
    local v1, u3 = useState({})
    return v1, useCallback(function() -- Line: 19 -- upvalues: u3 (val)
        u3({})
    end, {})
end