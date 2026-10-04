-- Script path: ReplicatedStorage.Shared.Modules.GlobalBus
-- Decompile time: 0.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
local u12 = (require(ReplicatedStorage.Shared.Modules.Signal)).new()

function v1.Connect(a1, a2) -- Line: 9 -- upvalues: u12 (val) -- types: a1: string, a2: function
    local u6 = u12:Connect(function(a1_2, ...) -- Line: 10 -- upvalues: a1 (val), a2 (val) -- types: a1_2: string
        if a1_2 == a1 then
            a2(...)
        end
    end)
    return function() -- Line: 16 -- upvalues: u6 (val)
        u6:Disconnect()
    end
end

function v1.Fire(a1, ...) -- Line: 21 -- upvalues: u12 (val) -- types: a1: string
    u12:Fire(a1, ...)
end

function v1.Wait(a1) -- Line: 25 -- upvalues: u12 (val) -- types: a1: string
    local v1
    repeat
        v1 = {u12:Wait()}
    until v1[1] == a1
    return table.unpack(v1, 2)
end

return v1