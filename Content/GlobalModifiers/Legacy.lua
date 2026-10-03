-- Script path: ReplicatedStorage.Content.GlobalModifiers.Legacy
-- Decompile time: 0.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local u15 = {}
local u16 = false
return {
    displayName = "Legacy",
    description = "Replaces enemies with legacy variants.",
    icon = 17113206952,
    onEnableServer = function(a1, a2, a3) -- Line: 14 -- upvalues: LegacyMiddleware (val), u16 (ref), ReplicatedStorage (val), u15 (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.ManagerCreatedEnemy, LegacyMiddleware.Boundedness.Inbound, function(a1, a2, a3, a4, a5, a6, a7, a8, a9) -- Line: 19
            -- upvalues: u16 (upval), ReplicatedStorage (upval), u15 (upval)
            if not u16 then
                for i, j in ReplicatedStorage.Assets.Enemies:GetChildren() do
                    u15[j.Name] = true
                end
                u16 = true
            end
            local v1 = ("%* Legacy"):format(a2)
            if u15[v1] then
                return v1, a3, a4, a5, a6, a7, a8, a9
            end
            return a2, a3, a4, a5, a6, a7, a8, a9
        end))
    end,
}