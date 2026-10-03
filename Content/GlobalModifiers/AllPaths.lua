-- Script path: ReplicatedStorage.Content.GlobalModifiers.AllPaths
-- Decompile time: 0.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u15 = {
    Gunslinger = true,
    ["Fallen King"] = true,
    ["Nuclear Monster"] = true,
    ["Void Reaver"] = true,
    ["Molten Boss"] = true,
    ["Grave Digger"] = true,
    Cavalry = true,
    Warden = true,
    Krampus = true,
    Gatekeeper = true,
    ["Ripped Elf"] = true,
    Imposter = true,
    ["Patient Zero"] = true,
    Drakobloxxer = true,
    Conserver = true,
    Titus = true,
    ["Hazem Boss"] = true,
    Brute = true,
    ["Fallen Swordmaster"] = true,
    ["Molten Warlord"] = true,
    ["Frost Spirit"] = true,
    ["Ducky D00M 3"] = true,
}
return {
    displayName = "All Paths",
    description = "Enemies spawn on all paths.",
    rewardMultiplier = 0.1,
    icon = 10983083186,
    onEnableServer = function(a1, a2, a3) -- Line: 37 -- upvalues: LegacyMiddleware (val), u15 (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.EnemyRequestSpawn, LegacyMiddleware.Boundedness.Inbound, function(a1, a2) -- Line: 42 -- upvalues: u15 (upval)
            local v1 = table.clone(a2)
            if not v1.PathName and not u15[v1.Name] then
                v1.SpawnAll = true
            end
            return v1
        end))
    end,
}