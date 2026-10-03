-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useExperiment
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ABController = require(ReplicatedStorage.Client.Controllers.Shared.ABController)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useState = React.useState
return function(a1) -- Line: 9 -- upvalues: useState (val), useEffect (val), ABController (val) -- types: a1: string
    local v1, u4 = useState(false)
    local v2 = {a1}
    useEffect(function() -- Line: 12 -- upvalues: u4 (val), ABController (upval), a1 (val)
        u4(ABController.get(a1))
        return ABController.subscribe(a1, u4)
    end, v2)
    return v1
end