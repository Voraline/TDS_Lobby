-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useViewportSize
-- Decompile time: 0.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local u15, u16 = Charm.signal(Vector2.zero)

local function getScreenSize() -- Line: 8
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera then
        return CurrentCamera.ViewportSize
    end
    return Vector2.new(0, 0)
end

local function updateScale() -- Line: 17 -- upvalues: u16 (val), getScreenSize (val)
    u16(getScreenSize())
end

local CurrentCamera = workspace.CurrentCamera
if CurrentCamera then
    (CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateScale)
    u16(getScreenSize())
end
;(workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function() -- Line: 21 -- upvalues: updateScale (val), u16 (val), getScreenSize (val)
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return
    end
    ;(CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(updateScale)
    u16(getScreenSize())
end)
return function(a1) -- Line: 34 -- upvalues: ReactCharm (val), u15 (val) -- types: a1: boolean?
    if a1 then
        return ReactCharm.useSignalBinding(u15)
    end
    return ReactCharm.useSignalState(u15)
end