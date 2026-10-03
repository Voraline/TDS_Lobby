-- Script path: ReplicatedStorage.Shared.Data.SharedData.SandboxWhitelistHandler
-- Decompile time: 0.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FFlagAtoms = require(script.Parent.FFlagAtoms)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u20 = {}
for i, j in ReplicatedStorage.Shared.Data.SharedData.SandboxWhitelists:GetChildren() do
    u20[j.Name] = (require(j))
end
return function(a1) -- Line: 14 -- upvalues: FFlagAtoms (val), u20 (val), table (val) -- types: a1: string
    local u10 = FFlagAtoms(("sandbox.whitelist_%*"):format((string.lower(a1))), {})
    local u16 = nil
    local v1 = u20[a1]
    if v1 then
        u16 = v1()
    end
    return function() -- Line: 23 -- upvalues: table (upval), u10 (val), u16 (ref)
        return table.mergeList(u10(), if not u16 then nil else u16())
    end
end