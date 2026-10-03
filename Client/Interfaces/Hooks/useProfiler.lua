-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useProfiler
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Profiler = require(ReplicatedStorage.Client.Interfaces.Components.Profiler)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
if not _G.__PROFILE__ then
    return function(a1, a2) -- Line: 9 -- types: a1: string, a2: table
        return a2
    end
end
return function(a1, a2) -- Line: 13 -- upvalues: createElement (val), Profiler (val) -- types: a1: string, a2: table
    return createElement(Profiler, {Id = a1}, {[a1] = a2})
end