-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useGameRule
-- Decompile time: 4.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameType = require(ReplicatedStorage.Shared.Modules.GameType)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEvent = require(script.Parent.useEvent)
local u27 = RunService:IsRunning()
local u32 = GameType:Get() == "Game"
return function(a1, a2, a3, a4) -- Line: 12
    -- upvalues: u27 (val), u32 (val), ReplicatedStorage (val), React (val), useEvent (val)
    if u27 and u32 then
        local v1, v2
        local GameRules = require(ReplicatedStorage.Shared.Modules.GameRules)
        local v3 = GameRules.Get(a1)
        if v3 == nil then
            v3 = a2
        end
        if not a4 then
            v1, v2 = React.useState(v3)
        else
            v1, v2 = React.useBinding(v3)
        end
        local u33 = v2
        useEvent(GameRules.GetRuleChangedEvent(a1), function(a1) -- Line: 27 -- upvalues: a3 (val), u33 (ref), a2 (val)
            if a3 and a1 == nil then
                u33(a2)
                return
            end
            u33(a1)
        end)
        return v1
    end
    if a4 then
        return (React.useBinding(a2))
    end
    return (React.useState(a2))
end