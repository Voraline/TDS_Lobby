-- Script path: ReplicatedStorage.Content.Consumables.Sandcastle.Controller.BarricadeClass
-- Decompile time: 4.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Damage = require(ServerStorage.Server.Modules.Damage)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local UnitService = require(ServerStorage.Server.Services.Game.UnitService)
local u56 = {}
u56.__index = u56

function u56.new(a1, a2) -- Line: 29 -- upvalues: u56 (val), Enum (val), Maid (val), Signal (val) -- types: a2: table
    local u5 = setmetatable({}, u56)
    u5.replicator = a1.Replicator
    u5.health = a2.health
    u5.maxHealth = a2.maxHealth
    u5.owner = a2.owner
    u5.radius = a2.radius
    u5.position = a2.position
    u5.team = Enum.Team.Player
    u5.spawnrate = a2.spawnrate
    u5.alive = true
    u5.lastCrabSpawn = tick()
    u5._enemiesDamaged = {}
    u5._maid = Maid.new()
    u5.onDeath = Signal.new()
    u5._maid:Mark(u5.onDeath)
    u5.replicator:Set("Health", u5.health)
    u5.replicator:Set("MaxHealth", u5.maxHealth)
    u5.replicator:Set("Position", u5.position)
    ;(u5.replicator:GetStateChangedSignal("Health")):Connect(function(a1) -- Line: 52 -- upvalues: u5 (val)
        if a1 <= 0 and u5.alive then
            u5:_died()
        end
    end)
    u5:_getClosestPathPoint()
    return u5
end

function u56:_getClosestPathPoint() -- Line: 63 -- upvalues: GameState (val)
    local ClosestPoint, ClosestPoint_2, Magnitude, position
    local v1 = GameState.Paths[self.team]
    if not v1 then
        warn("No paths found for team", self.team)
        return nil
    end
    local v2 = nil
    local v3 = nil
    local v4 = (1 / 0)
    local v5 = 0
    for k, v in pairs(v1) do
        if tonumber(k) then
            position = self.position
            ClosestPoint, ClosestPoint_2 = v:GetClosestPoint(position)
            Magnitude = (ClosestPoint - self.position).Magnitude
            if Magnitude < v4 then
                v2 = v
                v3 = k
                v5 = ClosestPoint_2
            end
        end
    end
    if not v2 then
        return nil
    end
    self.path = v2
    self.closestPathName = v3
    self.closestPathPoint = v5
    return true
end

function u56:_makeUnit(a2, a3) -- Line: 102 -- upvalues: UnitService (val)
    return (UnitService.CreateNewUnit({
        upgrade = 0,
        name = a2,
        owner = self.owner,
        spawner = self,
        pathName = self.closestPathName,
        spawnPathPosition = a3,
    }))
end

function u56:_getNearbyEnemies() -- Line: 115 -- upvalues: TeamOctrees (val)
    return TeamOctrees.getTargets(self.team, self.position, self.radius)
end

function u56:_canDetect(a2) -- Line: 119 -- upvalues: GameState (val), Enum (val)
    if not self.alive then
        return false
    end
    if self._enemiesDamaged[a2] and 1 < (tick() - self._enemiesDamaged[a2]) * GameState.TimeScale then
        return false
    end
    if a2.StatusEffects:has(Enum.StatusEffect.Flying) then
        return false
    end
    return true
end

function u56:_damageEnemy(a2) -- Line: 138 -- upvalues: Damage (val), Enum (val)
    if not self:_canDetect(a2) then
        return 0
    end
    local v1 = Damage.dealDamage({Owner = self.owner}, a2, self.health, Enum.DamageType.UnitCollision)
    self._enemiesDamaged[a2] = (tick())
    return v1
end

function u56:_changeHealth(a2) -- Line: 155 -- types: self: table, a2: number
    self.health = math.clamp(a2, 0, self.maxHealth)
    self.replicator:Set("Health", self.health)
end

function u56:_died() -- Line: 160
    self.onDeath:Fire()
    self:Destroy()
end

function u56.step(a1) -- Line: 165 -- upvalues: TimescaleUtilities (val)
    local v1 = tick()
    if not a1.alive then
        return
    end
    local v2 = a1:_getNearbyEnemies()
    if v2 and #v2 > 0 then
        for i, v in ipairs(v2) do
            if v.Type ~= "Towers" then
                a1:_changeHealth(a1.health - v.Health)
                a1:_damageEnemy(v)
            end
        end
    end
    if a1.alive then
        local v3 = v1 - a1.lastCrabSpawn
        if TimescaleUtilities.GetScaledTime(a1.spawnrate) < v3 then
            a1.lastCrabSpawn = v1
            a1:_makeUnit("Crab", a1.path.PathDistance - a1.closestPathPoint)
            a1:_changeHealth(a1.health - 25)
        end
    end
end

function u56:Destroy() -- Line: 195
    self.alive = false
    self._maid:Sweep()
end

return u56