-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useScreenSize
-- Decompile time: 0.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useState = React.useState
return function() -- Line: 7 -- upvalues: useState (val), useEffect (val)
    local v1, u5 = useState(workspace.CurrentCamera.ViewportSize)
    useEffect(function() -- Line: 10 -- upvalues: u5 (val)
        u5(workspace.CurrentCamera.ViewportSize)
        local u14 = (workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(function() -- Line: 15 -- upvalues: u5 (upval)
            u5(workspace.CurrentCamera.ViewportSize)
        end)
        return function() -- Line: 19 -- upvalues: u14 (val)
            u14:Disconnect()
        end
    end, {})
    return v1
end