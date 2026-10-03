-- Script path: ReplicatedStorage.Shared.UI.Components.Timer
-- Decompile time: 0.62 ms

local Shared = game:GetService("ReplicatedStorage"):WaitForChild("Shared")
local Fusion = require(Shared.UI.Fusion)
local Computed = Fusion.Computed
local Value = Fusion.Value

local function getCurrentTime() -- Line: 8
    return workspace:GetServerTimeNow()
end

local u19 = Value(getCurrentTime())
task.spawn(function() -- Line: 14 -- upvalues: u19 (val), getCurrentTime (val)
    while task.wait(1) do
        u19:set((getCurrentTime()))
    end
end)
return function(a1) -- Line: 20 -- upvalues: Value (val), Computed (val), u19 (val)
    local v1 = a1
    if typeof(v1) == "DateTime" then
        a1 = Value(a1)
    end
    return (Computed(function() -- Line: 25 -- upvalues: a1 (ref), u19 (upval)
        return (math.max(0, a1:get().UnixTimestamp - u19:get()))
    end))
end