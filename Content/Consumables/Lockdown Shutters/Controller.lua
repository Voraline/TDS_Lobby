-- Script path: ReplicatedStorage.Content.Consumables.Lockdown Shutters.Controller
-- Decompile time: 1.53 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Player = require(ServerStorage.Server.Modules.Player)
local TimerClass = require(ReplicatedStorage.Shared.Modules.TimerClass)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u45 = {}
return {
    CreateContext = function(a1) -- Line: 20
        a1.time = 2
    end,
    OnUse = function(a1) -- Line: 24
        -- upvalues: TypedPromise (val), Players (val), Player (val), GameState (val), u45 (val), Enum (val)
        -- upvalues: TimerClass (val)
        return TypedPromise.new(function(a1_2, a2) -- Line: 25
            -- upvalues: a1 (val), Players (upval), Player (upval), GameState (upval), u45 (upval), Enum (upval)
            -- upvalues: TimerClass (upval)
            local Context = a1.Context
            local playerId = Context.playerId
            local PlayerByUserId = Players:GetPlayerByUserId(playerId)
            local v1 = PlayerByUserId and Player.GetEntityFromPlayer(PlayerByUserId)
            if not v1 then
                a2("Invalid player")
                return
            end
            local Team = v1.Team
            local v2 = GameState.HealthPerTeam[Team]
            if not v2 then
                a2((("%* is an invalid team."):format(Team)))
            end
            if u45[Team] then
                local v3 = u45[Team]
                v3:AddTime(Context.time)
                v3.OnFinish:Connect(function() -- Line: 64 -- upvalues: a1_2 (val)
                    a1_2()
                end)
                return
            end
            local u37 = table.clone(v2)
            GameState.SetTeamHealth(Team, 9000000000)
            local u47 = Enum.Team.ToString(Team)
            local u61 = TimerClass.new(("%*Lockdown"):format(u47), Context.time, nil, nil, true)
            u61.OnFinish:Connect(function() -- Line: 50
                -- upvalues: u45 (upval), Team (val), u61 (val), u47 (val), GameState (upval), u37 (val), a1_2 (val)
                u45[Team] = nil
                u61:Destroy()
                print((("%* Lockdown over!"):format(u47)))
                GameState.SetTeamHealth(Team, u37.Current, u37.Max)
                a1_2()
            end)
            u45[Team] = u61
        end)
    end,
}