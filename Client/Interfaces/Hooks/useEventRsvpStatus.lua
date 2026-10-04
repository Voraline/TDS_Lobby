-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useEventRsvpStatus
-- Decompile time: 0.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SocialService = game:GetService("SocialService")
local React = require(ReplicatedStorage.Shared.UI.React)
return function(a1) -- Line: 6 -- upvalues: React (val), SocialService (val) -- types: a1: string
    local v1, u5 = React.useState(Enum.RsvpStatus.None)
    local v2 = {a1}
    React.useEffect(function() -- Line: 9 -- upvalues: SocialService (upval), a1 (val), u5 (val)
        local success, result = pcall(function() -- Line: 10 -- upvalues: SocialService (upval), a1 (upval)
            return SocialService:GetEventRsvpStatusAsync(a1)
        end)
        if not success then
            return
        end
        u5(result)
    end, v2)
    return v1
end