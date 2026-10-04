-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useMouse
-- Decompile time: 1.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RuntimeLib = require(((game:GetService("ReplicatedStorage")):WaitForChild("rbxts")):WaitForChild("RuntimeLib"))
local React = require(ReplicatedStorage.Shared.UI.React)
local usePooledEvent = require(script.Parent.usePooledEvent)
local useBinding = React.useBinding
local useMemo = React.useMemo
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts", "node_modules", "@rbxts", "services").Players
RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Hooks", "useEvent")
return function() -- Line: 25 -- upvalues: useBinding (val), useMemo (val), Players (val), usePooledEvent (val)
    local u2, u3 = useBinding(0)
    local u6, u7 = useBinding(0)
    local v1, u11 = useBinding(0)
    local v2, u15 = useBinding(0)
    local u19 = useMemo(function() -- Line: 31 -- upvalues: Players (upval)
        return Players.LocalPlayer:GetMouse()
    end, {})
    usePooledEvent(u19.Move, function() -- Line: 34 -- upvalues: u11 (val), u19 (val), u2 (val), u15 (val), u6 (val), u3 (val), u7 (val)
        u11(u19.X - u2:getValue())
        u15(u19.Y - u6:getValue())
        u3(u19.X)
        u7(u19.Y)
    end)
    return u2, u6, v1, v2
end