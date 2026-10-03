-- Script path: ReplicatedStorage.Content.GlobalModifiers.Cowboy
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u15 = {Gunslinger = true, Cavalry = true, ["Undead Miner"] = true, Husk = true}
return {
    displayName = "Cowboy",
    description = "Yeehaw!",
    icon = 10045192886,
    onEnableClient = function(a1, a2, a3) -- Line: 18 -- upvalues: LegacyMiddleware (val), u15 (val), ReplicatedStorage (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 23 -- upvalues: u15 (upval), ReplicatedStorage (upval)
            if a2 and not u15[a2.Name] then
                a2:EquipHat(ReplicatedStorage.Assets.Effects.Misc.CowboyHat, true)
            end
            return a2
        end))
    end,
}