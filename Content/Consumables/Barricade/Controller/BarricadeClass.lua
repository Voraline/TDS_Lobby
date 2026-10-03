-- Script path: ReplicatedStorage.Content.Consumables.Barricade.Controller.BarricadeClass
-- Decompile time: 2.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Damage = require(ServerStorage.Server.Modules.Damage)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local u45 = {}
u45.__index = u45

function u45.new(a1, a2) -- Line: 24 -- upvalues: u45 (val), Enum (val), Maid (val), Signal (val) -- types: a2: table
    local v1 = setmetatable({}, u45)
    v1.replicator = a1.Replicator
    v1.health = a2.health
    v1.maxHealth = a2.maxHealth
    v1.owner = a2.owner
    v1.radius = a2.radius
    v1.position = a2.position
    v1.team = Enum.Team.Player
    v1.alive = true
    v1._enemiesDamaged = {}
    v1._maid = Maid.new()
    v1.onDeath = Signal.new()
    v1._maid:Mark(v1.onDeath)
    v1.replicator:Set("Health", v1.health)
    v1.replicator:Set("MaxHealth", v1.maxHealth)
    v1.replicator:Set("Position", v1.position)
    return v1
end

function u45:_getNearbyEnemies() -- Line: 48 -- upvalues: TeamOctrees (val)
    return TeamOctrees.getTargets(self.team, self.position, self.radius)
end

function u45:_canDetect(a2) -- Line: 52 -- upvalues: GameState (val), Enum (val)
    if not self.alive then
        return false
    end
    if self._enemiesDamaged[a2] and 1.5 < (tick() - self._enemiesDamaged[a2]) * GameState.TimeScale then
        return false
    end
    if a2.StatusEffects:has(Enum.StatusEffect.Flying) then
        return false
    end
    return true
end

function u45:_damageEnemy(a2) -- Line: 71 -- upvalues: Damage (val), Enum (val)
    if not self:_canDetect(a2) then
        return 0
    end
    local v1 = Damage.dealDamage({Owner = self.owner}, a2, self.health, Enum.DamageType.UnitCollision)
    self._enemiesDamaged[a2] = (tick())
    return v1
end

function u45:_changeHealth(a2) -- Line: 88 -- types: self: table, a2: number
    self.health = math.clamp(a2, 0, self.maxHealth)
    self.replicator:Set("Health", self.health)
    if a2 == 0 and self.alive then
        self:_died()
    end
end

function u45:_died() -- Line: 96
    self.onDeath:Fire()
    self:Destroy()
end

function u45.step(a1) -- Line: 101
    local v1 = a1:_getNearbyEnemies()
    if v1 and #v1 > 0 then
        for i, v in ipairs(v1) do
            if v.Type ~= "Towers" then
                a1:_changeHealth(a1.health - v.Health)
                a1:_damageEnemy(v)
            end
        end
    end
end

function u45:Destroy() -- Line: 113
    self.alive = false
    self._maid:Sweep()
end

return u45