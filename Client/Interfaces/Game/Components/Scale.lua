-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Scale
-- Decompile time: 0.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
return function(a1) -- Line: 14 -- upvalues: useState (val), useEffect (val), createElement (val)
    local u3, u4 = useState(1)
    local CurrentCamera = workspace.CurrentCamera
    useEffect(function() -- Line: 18 -- upvalues: u3 (val), CurrentCamera (val), u4 (val), a1 (val)
        local u0 = u3
        ;(workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(function() -- Line: 21 -- upvalues: CurrentCamera (upval), u0 (ref), u4 (upval), a1 (upval)
            local X = CurrentCamera.ViewportSize.X
            local Y = CurrentCamera.ViewportSize.Y
            u0 = if not (Y < X) then 0.001388888888888889 * X else 0.001388888888888889 * Y
            u4((math.clamp(u0, a1.Min or 0, a1.Max or (1 / 0))))
        end)
        local X = CurrentCamera.ViewportSize.X
        local Y = CurrentCamera.ViewportSize.Y
        u0 = if not (Y < X) then 0.001388888888888889 * X else 0.001388888888888889 * Y
        u4((math.clamp(u0, a1.Min or 0, a1.Max or (1 / 0))))
    end, {})
    return createElement("UIScale", {Scale = u3})
end