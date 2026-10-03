-- Script path: ReplicatedStorage.Content.GlobalModifiers.BanFarm
-- Decompile time: 0.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
return {
    displayName = "Farm Banned",
    description = "Farms will not give cash.",
    icon = 135791172420130,
    onEnableServer = function(a1, a2, a3) -- Line: 11 -- upvalues: LegacyMiddleware (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnFarmIncome, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 16
            return 0
        end))
    end,
}