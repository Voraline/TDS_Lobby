-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePreferredInput
-- Decompile time: 1.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
return function() -- Line: 9 -- upvalues: React (val), UserInputService (val), useEffect (val), Maid (val)
    local v1, u5 = React.useState(UserInputService.PreferredInput)
    useEffect(function() -- Line: 12 -- upvalues: Maid (upval), u5 (val), UserInputService (upval)
        local u2 = Maid.new()
        u5(UserInputService.PreferredInput)
        u2:Mark(((UserInputService:GetPropertyChangedSignal("PreferredInput")):Connect(function() -- Line: 17 -- upvalues: u5 (upval), UserInputService (upval)
            u5(UserInputService.PreferredInput)
        end)))
        return function() -- Line: 21 -- upvalues: u2 (val)
            u2:Sweep()
        end
    end, {})
    return v1
end