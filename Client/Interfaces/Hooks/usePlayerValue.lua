-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.usePlayerValue
-- Decompile time: 0.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local useBinding = React.useBinding
local useEffect = React.useEffect
local useState = React.useState
return function(a1, a2, a3, a4) -- Line: 10
    -- upvalues: useBinding (val), useState (val), useEffect (val), RunService (val)
    local v1, v2
    if not a4 then
        v1, v2 = useState(a3)
    else
        v1, v2 = useBinding(a3)
    end
    local u17 = v2
    local v3 = {a2}
    useEffect(function() -- Line: 19 -- upvalues: a2 (val), RunService (upval), u17 (ref), a3 (val), a1 (val)
        if not a2 then
            return
        end
        local u1 = nil
        local u4 = task.spawn(function() -- Line: 25 -- upvalues: RunService (upval), u17 (upval), a3 (upval), a2 (upval), a1 (upval), u1 (ref)
            if not RunService:IsRunning() then
                u17(a3)
                return
            end
            local v1 = a2:WaitForChild(a1)
            u17(v1.Value)
            u1 = v1.Changed:Connect(function(a1) -- Line: 35 -- upvalues: u17 (upval)
                u17(a1)
            end)
        end)
        return function() -- Line: 40 -- upvalues: u1 (ref), u4 (val)
            if u1 then
                u1:Disconnect()
            end
            task.cancel(u4)
        end
    end, v3)
    return v1
end