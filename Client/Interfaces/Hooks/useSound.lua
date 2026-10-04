-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useSound
-- Decompile time: 3.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u26 = nil
local React = require(ReplicatedStorage.Shared.UI.React)
if RunService:IsRunning() then
    u26 = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
end
return function(a1, a2) -- Line: 11 -- upvalues: React (val), u26 (ref) -- types: a1: string, a2: boolean?
    local v1 = {a1}
    local u7 = React.useMemo(function() -- Line: 12 -- upvalues: u26 (upval), a1 (val)
        if not u26 then
            return nil
        end
        local v1 = u26(a1)
        if not v1 then
            warn((("Sound not found: %*"):format(a1)))
        end
        return v1
    end, v1)
    local v2 = {u7}
    local v3 = React.useCallback(function() -- Line: 25 -- upvalues: u7 (val)
        if u7 then
            warn(u7)
            u7:Stop()
        end
    end, v2)
    local v4 = {u7, a2}
    return React.useCallback(function(a1) -- Line: 32 -- upvalues: u7 (val), a2 (val)
        if u7 then
            u7:Play(a2, a1)
        end
    end, v4), v3
end