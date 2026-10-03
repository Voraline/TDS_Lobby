-- Script path: ReplicatedStorage.Content.Consumables.Nuke.Controller
-- Decompile time: 2.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Damage = require(ServerStorage.Server.Modules.Damage)
local EnemyService = require(ServerStorage.Server.Services.Game.EnemyService)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)

local function linearDropOff(a1, a2, a3, a4, a5) -- Line: 21
    -- upvalues: 
    return (math.clamp((a5 - a4) / (a3 - a2) * (a1 - a2) + a4, a5, a4))
end

return {
    CreateContext = function(a1) -- Line: 35
        a1.explosionTime = 2
        a1.explosionRadius = 100
        a1.explosionStarts = a1.started + 2
    end,
    OnUse = function(a1) -- Line: 41
        -- upvalues: TypedPromise (val), TimescaleUtilities (val), TeamOctrees (val), Enum (val), PlayerService (val)
        -- upvalues: Damage (val), RunService (val), GameState (val), EnemyService (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 42
            -- upvalues: a1 (val), TimescaleUtilities (upval), TeamOctrees (upval), Enum (upval), PlayerService (upval)
            -- upvalues: Damage (upval), RunService (upval), GameState (upval), EnemyService (upval)
            local v1, v2
            local Context = a1.Context
            local u5 = false
            local u6 = nil
            local u7 = 25
            local u8 = 0
            local u9 = {}
            a3(function() -- Line: 51 -- upvalues: u6 (ref), u5 (ref), u9 (val)
                if u6 then
                    u6:Disconnect()
                end
                u5 = true
                table.clear(u9)
            end)
            TimescaleUtilities.Wait(Context.explosionStarts - workspace:GetServerTimeNow())
            if u5 then
                return
            end
            for k, v in pairs((TeamOctrees.getTargets(Enum.Team.Player, Context.position, 100))) do
                if v.Type ~= "Towers" then
                    v1 = math.clamp(((Context.position - v.Position).Magnitude - 0) * -750 + 75000, 0, 75000)
                    v2 = PlayerService.GetEntityFromPlayer(a1.Executor)
                    if v2 then
                        Damage.dealDamage({Owner = v2}, v, v1, Enum.DamageType.Energy)
                    end
                end
            end
            local v3 = RunService.Stepped:Connect(function(a1_3, a2) -- Line: 92
                -- upvalues: GameState (upval), u7 (ref), u8 (ref), u6 (ref), a1_2 (val), EnemyService (upval), u9 (val)
                -- upvalues: Enum (upval), PlayerService (upval), a1 (upval), Damage (upval)
                local v1 = a2 * GameState.TimeScale
                u7 = u7 - v1
                u8 = u8 + v1
                if u7 <= 0 then
                    u6:Disconnect()
                    a1_2()
                end
                for i, j in EnemyService.GetEnemies() do
                    if not u9[j] then
                        u9[j] = j
                    end
                end
                if u8 > 1 then
                    local v2, v3
                    for k in u9 do
                        if not k.StatusEffects:has(Enum.StatusEffect.Boss) then
                            v2 = k.MaxHealth * 0.05
                            v3 = PlayerService.GetEntityFromPlayer(a1.Executor)
                            if v3 then
                                Damage.dealDamage({Owner = v3}, k, v2, Enum.DamageType.Energy)
                            end
                        end
                    end
                    u8 = 0
                end
            end)
        end)
    end,
}