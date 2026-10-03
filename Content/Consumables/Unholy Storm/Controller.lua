-- Script path: ReplicatedStorage.Content.Consumables.Unholy Storm.Controller
-- Decompile time: 1.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 21
        if not a1.Duration then
            a1.Duration = 25
        end
    end,
    OnUse = function(a1) -- Line: 27
        -- upvalues: TypedPromise (val), TimescaleUtilities (val), RunService (val), GameState (val), TeamOctrees (val)
        -- upvalues: Enum (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 28
            -- upvalues: a1 (val), TimescaleUtilities (upval), RunService (upval), GameState (upval)
            -- upvalues: TeamOctrees (upval), Enum (upval)
            local Duration = a1.Context.Duration
            local u6 = nil
            local u8 = tick()
            TimescaleUtilities.Delay(Duration, function() -- Line: 35 -- upvalues: u6 (ref), a1_2 (val)
                u6:Disconnect()
                a1_2()
            end)
            local v1 = RunService.Heartbeat:Connect(function() -- Line: 40 -- upvalues: u8 (ref), GameState (upval), TeamOctrees (upval), Enum (upval)
                local v1 = tick() - u8
                if 1 / GameState.TimeScale <= v1 then
                    local Object
                    u8 = tick()
                    for i, j in (TeamOctrees.getTeamOctree(Enum.Team.Enemy):GetAllNodes()) do
                        Object = j:GetObject()
                        if Object.Type ~= "Towers" then
                            Object:ApplyDebuff(Enum.DebuffType.Burn, 6 / GameState.TimeScale, {
                                DefenseMelt = 20,
                                BurnDamage = 10,
                                BurnTickRate = 0.25 / GameState.TimeScale,
                            })
                            Object:ApplyDebuff(Enum.DebuffType.Poison, 6 / GameState.TimeScale, {
                                PoisonDamage = 10,
                                Slowness = 25,
                                PoisonTickRate = 0.25 / GameState.TimeScale,
                            })
                        end
                    end
                end
            end)
        end)
    end,
}