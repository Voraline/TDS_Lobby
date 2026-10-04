-- Script path: ReplicatedStorage.Client.Controllers.Game.BackfillController
-- Decompile time: 0.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
local Backfill = (require(ReplicatedStorage.Shared.Modules.NewNetwork)).Channel("Backfill")

function v1.backfill(a1) -- Line: 9 -- upvalues: Backfill (val)
    Backfill:invokeServer("backfill")
end

Backfill:onEvent("status", function(a1) end)
return v1