-- Script path: ReplicatedStorage.Client.Controllers.Game.LegacyGameInterfaceController.Health
-- Decompile time: 1.57 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local EnemiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.EnemiesStore)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local u23 = {}

function u23.Add(a1, a2) -- Line: 10
    -- upvalues: u23 (val), Maid (val), math (val), EnemiesStore (val)
    if u23[a1] then
        return
    end
    local v1 = Maid.new()
    local Replicator = a1.Replicator
    assert(Replicator, "Boss must have a replicator")
    local u13 = Replicator.Folder or a1

    local function dispatchUpdate(a1_2, a2_2, a3) -- Line: 21
        -- upvalues: Replicator (val), a1 (val), math (upval), u13 (val), a2 (val), EnemiesStore (upval)
        local Name = Replicator:Get("DisplayName") or a1.Name
        local v1 = math.max(a1.Shield or 0, 0)
        local v2 = math.max(a1.MaxHealth or 0, 0)
        local v3 = math.clamp(a1.Health or v2, 0, v2)
        local phase = a1.phase
        local v4 = {
            id = u13,
            health = v3,
            maxHealth = v2,
            shield = v1,
            displayName = Name,
        }
        local Name_2 = Replicator:Get("ModelName") or a1.Name
        v4.name = Name_2
        v4.team = Replicator:Get("Team")
        v4.compact = a2
        v4.phase = phase
        if a3 == "addEnemy" then
            EnemiesStore.addEnemy(v4)
            return
        end
        EnemiesStore.updateEnemy(v4)
    end

    v1:Mark(((Replicator:GetStateChangedSignal("MaxHealth")):Connect(dispatchUpdate)))
    v1:Mark(((Replicator:GetStateChangedSignal("Health")):Connect(dispatchUpdate)))
    v1:Mark(((Replicator:GetStateChangedSignal("Shield")):Connect(dispatchUpdate)))
    v1:Mark(function() -- Line: 51 -- upvalues: EnemiesStore (upval), u13 (val)
        EnemiesStore.setVisibility(u13, false)
        task.delay(0.6, function() -- Line: 54 -- upvalues: EnemiesStore (upval), u13 (upval)
            EnemiesStore.removeEnemy(u13)
        end)
    end)
    dispatchUpdate(nil, nil, "addEnemy")
    u23[a1] = v1
end

function u23.Remove(a1) -- Line: 64 -- upvalues: u23 (val)
    local v1 = u23[a1]
    if not v1 then
        return
    end
    v1:Sweep()
    u23[a1] = nil
end

return {Bosses = u23}