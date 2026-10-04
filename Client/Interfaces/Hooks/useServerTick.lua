-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useServerTick
-- Decompile time: 2.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local useEffect = (require(ReplicatedStorage.Shared.UI.React)).useEffect
local u17 = {}

local function now() -- Line: 10
    return workspace:GetServerTimeNow()
end

task.spawn(function() -- Line: 14 -- upvalues: u17 (val)
    local ServerTimeNow
    while task.wait(0.1) do
        ServerTimeNow = workspace:GetServerTimeNow()
        for k in pairs(u17) do
            k(ServerTimeNow)
        end
    end
end)
return function() -- Line: 24 -- upvalues: useReactBinding (val), now (val), useEffect (val), u17 (val)
    local v1, u4 = useReactBinding(now())
    useEffect(function() -- Line: 27 -- upvalues: u17 (upval), u4 (val)
        u17[u4] = true
        return function() -- Line: 30 -- upvalues: u17 (upval), u4 (upval)
            u17[u4] = nil
        end
    end, {})
    return v1
end