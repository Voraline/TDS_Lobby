-- Script path: ReplicatedStorage.Shared.Modules.Upgrades.UnitUpgradeMiddleware
-- Decompile time: 0.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware).new()
local Boundedness = v1.Boundedness
return v1