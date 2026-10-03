-- Script path: ReplicatedStorage.Content.Consumables.Winter Storm.Controller
-- Decompile time: 1.43 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EnemyService = require(ServerStorage.Server.Services.Game.EnemyService)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)

local function applyDebuff(a1) -- Line: 20
    return function() end
end

return {
    CreateContext = function(a1) -- Line: 25
        a1.effectDuration = 20
    end,
    OnUse = function(a1) -- Line: 29
        -- upvalues: TypedPromise (val), RunService (val), GameState (val), EnemyService (val), Enum (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 30
            -- upvalues: a1 (val), RunService (upval), GameState (upval), EnemyService (upval), Enum (upval)
            local Context = a1.Context
            local u5 = nil
            local u6 = {}
            local u7 = 20
            local u8 = 0
            a3(function() -- Line: 39 -- upvalues: u5 (ref), u6 (val)
                if u5.Connected then
                    u5:Disconnect()
                end
                for i, j in u6 do
                    j()
                end
                table.clear(u6)
            end)
            local v1 = RunService.Stepped:Connect(function(a1, a2) -- Line: 51
                -- upvalues: GameState (upval), u7 (ref), u8 (ref), u5 (ref), u6 (val), a1_2 (val), EnemyService (upval)
                -- upvalues: Enum (upval)
                local v1 = a2 * GameState.TimeScale
                u7 = u7 - v1
                u8 = u8 + v1
                if u7 <= 0 then
                    u5:Disconnect()
                    for i, j in u6 do
                        j()
                    end
                    a1_2()
                end
                for k, n in EnemyService.GetEnemies() do
                    if not u6[n] then
                        u6[n] = function() end
                    end
                end
                if u8 > 0.5 then
                    local Energy
                    for m in u6 do
                        Energy = Enum.DamageType.Energy
                        m:Damage(1, Energy)
                    end
                    u8 = 0
                end
            end)
        end)
    end,
}