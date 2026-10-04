-- Script path: ReplicatedStorage.Client.Controllers.Game.DamageController
-- Decompile time: 4.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CrosshairStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CrosshairStore)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EffectsController = require(script.Parent.EffectsController)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local TowerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local Damage = NewNetwork.Channel("Damage")
local u49 = {}
u49[Enum.DamageDisplayType.Normal] = (Color3.fromRGB(255, 0, 0))
u49[Enum.DamageDisplayType.Explosion] = (Color3.fromRGB(255, 128, 0))
u49[Enum.DamageDisplayType.Poison] = (Color3.fromRGB(3, 192, 88))
u49[Enum.DamageDisplayType.Energy] = (Color3.fromRGB(172, 7, 255))
u49[Enum.DamageDisplayType.Melee] = (Color3.fromRGB(253, 253, 124))
u49[Enum.DamageDisplayType.Heal] = (Color3.fromRGB(81, 255, 0))
u49[Enum.DamageDisplayType.Frost] = (Color3.fromRGB(0, 255, 255))

local function getDamageIndicatorEnemy(a1, a2, a3) -- Line: 23
    -- upvalues: TowerReplicator (val), NPCReplicator (val)
    local v1 = a2 and TowerReplicator.getTowerByModel(a2)
    local v2 = NPCReplicator.GetNPCFromFolder(a3)
    if not v2 then
        return nil
    end
    if v1 and a1 and v1.Model == a1 then
        return v2
    end
    return nil
end

local function showDamageIndicator(a1, a2, a3) -- Line: 42
    -- upvalues: u49 (val), EffectsController (val)
    local v1 = u49[a3 or 1] or u49[1]
    EffectsController.NewDamageIndicator(a1.Hitbox or a1.PrimaryPart or a1.Model, a2, v1)
end

Damage:onUnreliableEvent("DisplayDamage", function(a1) -- Line: 48
    -- upvalues: UpgradesStore (val), CrosshairStore (val), TowerReplicator (val), NPCReplicator (val), u49 (val)
    -- upvalues: EffectsController (val)
    local damage, enemy, v1, v2, v3, v4, v5, v6, v7, v8
    local model = UpgradesStore.getState().model
    local forcedModel = CrosshairStore.getState().forcedModel
    if forcedModel then
        model = forcedModel
    end
    local v9 = {}
    local v10 = {}
    local v11 = nil
    local v12 = nil
    for i, j in a1, v11, v12 do
        v1, v2, v3, v4 = unpack(j)
        v7 = v1 and TowerReplicator.getTowerByModel(v1)
        v8 = NPCReplicator.GetNPCFromFolder(v2)
        v5 = if v8 then if not v7 then nil else if not model then nil else if v7.Model == model then v8 else nil else nil
        if v5 then
            v4 = v4 or 1
            v6 = v9[v5]
            if not v6 then
                v9[v5] = {}
            end
            v7 = v6[v4]
            if not v7 then
                v7 = {enemy = v5, damage = v3, damageType = v4}
                v6[v4] = v7
                table.insert(v10, v7)
            else
                v7.damage = v7.damage + v3
            end
        end
    end
    v11 = nil
    v12 = nil
    for k, n in v10, v11, v12 do
        enemy = n.enemy
        damage = n.damage
        v4 = u49[n.damageType or 1] or u49[1]
        EffectsController.NewDamageIndicator(enemy.Hitbox or enemy.PrimaryPart or enemy.Model, damage, v4)
    end
end)
return nil