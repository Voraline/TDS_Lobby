-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Dialog
-- Decompile time: 0.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Dialog = require(ReplicatedStorage.Shared.Modules.Content)("Dialog")
local u13 = {}
return function(a1, a2) -- Line: 8 -- upvalues: u13 (val), Dialog (val) -- types: a1: string, a2: boolean?
    local v1 = u13[a1]
    if v1 then
        return v1
    end
    local v2 = if not a2 then Dialog:WaitForChild(a1) else Dialog:FindFirstChild(a1)
    if not v2 then
        return
    end
    local v3 = require(v2)
    u13[a1] = v3
    return v3
end