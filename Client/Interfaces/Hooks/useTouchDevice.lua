-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTouchDevice
-- Decompile time: 0.34 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local React = require(ReplicatedStorage.Shared.UI.React)
local useContext = React.useContext
local u19 = React.createContext(UserInputService.KeyboardEnabled)
;(UserInputService:GetPropertyChangedSignal("KeyboardEnabled")):Connect(function() end)
return function() -- Line: 12 -- upvalues: useContext (val), u19 (val)
    useContext(u19)
    return state
end