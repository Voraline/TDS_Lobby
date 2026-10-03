-- Script path: ReplicatedStorage.Content.Consumables.Lockdown Shutters.Animator
-- Decompile time: 1.82 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local LockdownShutter = ReplicatedStorage.Assets.Effects.Client.LockdownShutter

local function createLockdownShutter(a1, a2) -- Line: 14 -- upvalues: GameState (val), LockdownShutter (val)
    local pathName = a2.State.Context.pathName
    local pathToEnd = a2.State.Context.pathToEnd
    local v1 = GameState.getPath(a1, pathName)
    local v2 = v1.PathDistance - pathToEnd
    local v3 = CFrame.lookAt(v1:GetScalar(v2), (v1:GetScalar(v2 - 0.1)))
    local v4 = LockdownShutter:Clone()
    v4.Parent = workspace.Consumables
    v4:PivotTo(v3)
    return v4
end

return {
    OnUse = function(a1) -- Line: 32
        -- upvalues: TypedPromise (val), Players (val), PlayerReplicator (val), createLockdownShutter (val)
        -- upvalues: EmitterManager (val), spr (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 33
            -- upvalues: a1 (val), Players (upval), PlayerReplicator (upval), createLockdownShutter (upval)
            -- upvalues: EmitterManager (upval), spr (upval), TimescaleUtilities (upval)
            local Replicator = a1.Replicator
            local PlayerByUserId = Players:GetPlayerByUserId(a1.PlayerId)
            if not PlayerByUserId.Character then
                return
            end
            local Team = (PlayerReplicator.GetEntityFromPlayer(PlayerByUserId)).Team
            local v1 = createLockdownShutter(Team, Replicator)
            local v2 = v1.Root.CFrame + Vector3.new(0, 1, 0)
            v1.Root.CFrame = v2 * CFrame.new(0, -4, 0)
            EmitterManager.toggle(v1.PrimaryPart, true)
            spr.target(v1.Root, 0.7, 0.5, {CFrame = v2})
            EmitterManager.toggle(v1.PrimaryPart, false)
            TimescaleUtilities.Wait(2.5)
            spr.target(v1.Root, 0.7, 0.5, {CFrame = v2 * CFrame.new(0, -4, 0)})
            TimescaleUtilities.Wait(0.7)
            v1:Destroy()
            a1_2()
        end)
    end,
}