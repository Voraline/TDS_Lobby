-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useUsernameFromId
-- Decompile time: 0.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local UsernameFromId = require(ReplicatedStorage.Shared.Modules.UsernameFromId)
local useState = React.useState
local useEffect = React.useEffect
return function(a1) -- Line: 9 -- upvalues: useState (val), useEffect (val), UsernameFromId (val) -- types: a1: number?
    local v1, u4 = useState(nil)
    local v2 = {a1}
    useEffect(function() -- Line: 12 -- upvalues: a1 (val), u4 (val), UsernameFromId (upval)
        if not a1 then
            u4(nil)
            return
        end
        u4(nil)
        local u7 = nil
        u7 = task.spawn(function() -- Line: 21 -- upvalues: UsernameFromId (upval), a1 (upval), u7 (ref), u4 (upval)
            local v1 = UsernameFromId(a1)
            u7 = nil
            if v1 and v1 ~= "" then
                u4(v1)
            end
        end)
        return function() -- Line: 30 -- upvalues: u7 (ref)
            if u7 then
                task.cancel(u7)
            end
        end
    end, v2)
    return v1
end