-- Script path: ReplicatedStorage.Content.Consumables.Blizzard Bomb.Controller
-- Decompile time: 1.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Cooldown = require(ReplicatedStorage.Client.Modules.Cooldown)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    CreateContext = function(a1) -- Line: 15
        a1.dropInfo = {
            gravity = -1,
            velocity = 1,
            deltaMultiplier = 6,
            startPosition = a1.position + Vector3.new(0, 20, 0) + Vector3.new(math.random(-10, 10), 0, (math.random(-10, 10))),
            endPosition = a1.position,
        }
        a1.lifeTime = 30
    end,
    OnUse = function(a1) -- Line: 28
        -- upvalues: Cooldown (val), TypedPromise (val), ItemDrop (val), TimescaleUtilities (val), RunService (val)
        -- upvalues: TeamOctrees (val), Enum (val), GameState (val)
        local u3 = Cooldown.new()
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 32
            -- upvalues: a1 (val), ItemDrop (upval), TimescaleUtilities (upval), RunService (upval), u3 (val)
            -- upvalues: TeamOctrees (upval), Enum (upval), GameState (upval)
            local dropInfo = a1.Context.dropInfo
            local u6 = nil
            local v1 = (ItemDrop.GetTimeToDestinationWithGV(dropInfo.startPosition, dropInfo.endPosition, dropInfo.gravity, dropInfo.velocity)) / dropInfo.deltaMultiplier
            TimescaleUtilities.Delay(v1, function() -- Line: 43
                -- upvalues: u6 (ref), RunService (upval), u3 (upval), TeamOctrees (upval), Enum (upval), a1 (upval)
                -- upvalues: GameState (upval)
                u6 = RunService.Heartbeat:Connect(function() -- Line: 44 -- upvalues: u3 (upval), TeamOctrees (upval), Enum (upval), a1 (upval), GameState (upval)
                    if not u3:isActive() then
                        local Freeze, v1
                        u3:setTime(0.25)
                        for i, j in (TeamOctrees.getTargets(Enum.Team.Player, a1.Context.position, 12)) do
                            if j.Type ~= "Towers" then
                                Freeze = Enum.DebuffType.Freeze
                                v1 = 0.35 / GameState.TimeScale
                                j:ApplyDebuff(Freeze, v1, {DefenseMelt = -0.5})
                            end
                        end
                    end
                end)
            end)
            TimescaleUtilities.Delay(v1 + a1.Context.lifeTime, function() -- Line: 69 -- upvalues: u6 (ref), TimescaleUtilities (upval), a1_2 (val)
                u6:Disconnect()
                TimescaleUtilities.Wait(15)
                a1_2()
            end)
            a3(function() -- Line: 75 -- upvalues: u6 (ref)
                if u6 then
                    u6:Disconnect()
                end
            end)
        end)
    end,
}