-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useModifiers
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientGameMiddleware = require(ReplicatedStorage.Client.Modules.Replicators.ClientGameMiddleware)
local React = require(ReplicatedStorage.Shared.UI.React)
return function() -- Line: 7 -- upvalues: React (val), ClientGameMiddleware (val)
    local v1, u4 = React.useState({})
    local useEffect = React.useEffect
    local v2 = {ClientGameMiddleware.Modifiers}
    useEffect(function() -- Line: 11 -- upvalues: ClientGameMiddleware (upval), u4 (val)
        local v1 = {}
        for i, j in ClientGameMiddleware.Modifiers do
            if j.ServerIdentifier then
                v1[i] = j
            end
        end
        u4(v1)
    end, v2)
    return v1
end