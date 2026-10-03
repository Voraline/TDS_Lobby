-- Script path: ReplicatedStorage.Content.Consumables.Heatwave.Controller
-- Decompile time: 1.70 ms

game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
require(ReplicatedStorage.Shared.Modules.NewTween)
require(ReplicatedStorage.Shared.Modules.Projectile)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u71 = 6
return {
    CreateContext = function(a1) end,
    OnUse = function(a1) -- Line: 27
        -- upvalues: TypedPromise (val), u71 (ref), Players (val), TimescaleUtilities (val), RunService (val)
        -- upvalues: GameState (val), TeamOctrees (val), Enum (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 28
            -- upvalues: a1 (val), u71 (upval), Players (upval), TimescaleUtilities (upval), RunService (upval)
            -- upvalues: GameState (upval), TeamOctrees (upval), Enum (upval)
            local Context = a1.Context
            u71 = Context.LifeTime or u71
            if not Players:GetPlayerByUserId(Context.playerId) then
                a2("Invalid player")
                return
            end
            local u18 = nil
            local u20 = tick()
            local v1 = u71
            TimescaleUtilities.Delay(v1, function() -- Line: 42 -- upvalues: u18 (ref)
                u18:Disconnect()
            end)
            local v2 = RunService.Heartbeat:Connect(function() -- Line: 46 -- upvalues: u20 (ref), GameState (upval), TeamOctrees (upval), Enum (upval)
                local v1 = tick() - u20
                if 1 / GameState.TimeScale <= v1 then
                    local Object
                    u20 = tick()
                    for i, j in (TeamOctrees.getTeamOctree(Enum.Team.Enemy):GetAllNodes()) do
                        Object = j:GetObject()
                        if Object.Type ~= "Towers" then
                            Object:ApplyDebuff(Enum.DebuffType.Burn, 6 / GameState.TimeScale, {
                                DefenseMelt = 15,
                                BurnDamage = 25,
                                BurnTickRate = 0.25 / GameState.TimeScale,
                            })
                        end
                    end
                end
            end)
        end)
    end,
}