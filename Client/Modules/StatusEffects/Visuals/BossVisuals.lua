-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.BossVisuals
-- Decompile time: 1.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CharmUtil = require(ReplicatedStorage.Shared.Modules.CharmUtil)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
return {
    onAdded = function(a1, a2) -- Line: 11 -- upvalues: ClientAtoms (val), CharmUtil (val)
        if not a1.Replicator then
            return
        end
        ClientAtoms.bosses(function(a1_2) -- Line: 16 -- upvalues: CharmUtil (upval), a1 (val)
            return CharmUtil.set(a1_2, a1.Replicator, a1)
        end)
        return {}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 23 -- upvalues: ClientAtoms (val), CharmUtil (val)
        if not a1.Replicator then
            return
        end
        ClientAtoms.bosses(function(a1_2) -- Line: 28 -- upvalues: CharmUtil (upval), a1 (val)
            return CharmUtil.deleteKey(a1_2, a1.Replicator)
        end)
    end,
}