-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Achievements
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Achievement = require(ReplicatedStorage.Shared.Modules.Content)("Achievement")
local u13 = {}
return function(a1) -- Line: 64 -- upvalues: u13 (val), Achievement (val) -- types: a1: string
    if u13[a1] then
        return u13[a1]
    end
    local v1 = Achievement:FindFirstChild(a1, true)
    local v2 = ("Achievement %* not found!"):format(a1)
    assert(v1 and v1:IsA("ModuleScript"), v2)
    local v3 = require(v1)
    u13[a1] = v3
    return v3
end