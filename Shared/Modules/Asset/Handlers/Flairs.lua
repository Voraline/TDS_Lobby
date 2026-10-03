-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Flairs
-- Decompile time: 0.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Flair = require(ReplicatedStorage.Shared.Modules.Content)("Flair")
local u13 = {}
return function(a1) -- Line: 22 -- upvalues: u13 (val), Flair (val) -- types: a1: string
    if u13[a1] then
        return u13[a1]
    end
    local v1 = Flair:FindFirstChild(a1, true)
    if v1 and v1:IsA("ModuleScript") then
        local v2 = require(v1)
        u13[a1] = v2
        return v2
    end
    return nil
end