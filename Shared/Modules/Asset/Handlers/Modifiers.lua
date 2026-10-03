-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Modifiers
-- Decompile time: 0.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GlobalModifiers = require(ReplicatedStorage.Shared.Modules.Content)("GlobalModifiers")
local u13 = {}
return function(a1) -- Line: 20 -- upvalues: u13 (val), GlobalModifiers (val) -- types: a1: string
    if u13[a1] then
        return u13[a1]
    end
    local v1 = GlobalModifiers:FindFirstChild(a1, true)
    local v2 = ("Modifier %* not found!"):format(a1)
    assert(v1 and v1:IsA("ModuleScript"), v2)
    local v3 = require(v1)
    u13[a1] = v3
    return v3
end