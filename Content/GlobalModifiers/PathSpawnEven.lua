-- Script path: ReplicatedStorage.Content.GlobalModifiers.PathSpawnEven
-- Decompile time: 0.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
return {
    displayName = "Path Spawn Even",
    description = "Enemies spawn on 1 of each path.",
    rewardMultiplier = 0,
    icon = 10983083186,
    onEnableServer = function(a1, a2, a3) -- Line: 14 -- upvalues: LegacyMiddleware (val), table (val), Enum (val)
        local u3 = 1
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.ManagerCreatedEnemy, LegacyMiddleware.Boundedness.Inbound, function(a1_2, a2, a3, a4, a5, a6, a7, a8, a9) -- Line: 21 -- upvalues: u3 (ref), a1 (val), table (upval), Enum (upval)
            if not a9 then
                a9 = {}
            end
            a9.PathName = u3
            u3 = u3 + 1
            local v1 = a1.getPathNames()
            if (table.count(v1[Enum.Team.Player])) < u3 then
                u3 = 1
            end
            return a2, a3, a4, a5, a6, a7, a8, a9
        end))
    end,
}