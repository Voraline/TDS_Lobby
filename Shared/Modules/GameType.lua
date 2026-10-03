-- Script path: ReplicatedStorage.Shared.Modules.GameType
-- Decompile time: 0.42 ms

local v1 = {}
local Type = workspace:WaitForChild("Type")
local Value = Type.Value
Type.Changed:Connect(function() -- Line: 13 -- upvalues: Value (ref), Type (val)
    Value = Type.Value
end)

function v1.Get(a1) -- Line: 24 -- upvalues: Value (ref), Type (val)
    return Value or Type.Changed:Wait()
end

function v1.IsA(a1, a2) -- Line: 36
    return a1:Get() == a2
end

return v1