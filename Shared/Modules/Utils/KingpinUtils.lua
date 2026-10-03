-- Script path: ReplicatedStorage.Shared.Modules.Utils.KingpinUtils
-- Decompile time: 2.29 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local u15 = {}

function u15.hasOwner(a1) -- Line: 45 -- types: a1: table
    if a1.Owner ~= nil then
        return true
    end
    if a1.OwnerId == nil and a1.OwnerName == nil then
        local Replicator = a1.Replicator
        local v1 = false
        if Replicator ~= nil then
            v1 = true
            if Replicator:Get("OwnerId") == nil then
                v1 = Replicator:Get("OwnerName") ~= nil
            end
        end
        return v1
    end
    return true
end

function u15.getReplicatorFolder(a1) -- Line: 59 -- upvalues: RunService (val) -- types: a1: table
    local Replicator = a1.Replicator
    if RunService:IsServer() then
        if Replicator then
            return Replicator.ReplicationFolder
        end
        return nil
    end
    if Replicator and Replicator.Folder then
        return Replicator.Folder
    end
    local FolderPointer = a1.FolderPointer
    if FolderPointer and FolderPointer.Value and FolderPointer.Value:IsA("Folder") then
        return FolderPointer.Value
    end
    return nil
end

function u15.getTargetCashReward(a1) -- Line: 78 -- upvalues: GameState (val) -- types: a1: table
    if typeof(a1.Reward) == "number" then
        return a1.Reward
    end
    local Stats = a1.Stats
    if not Stats then
        return 0
    end
    local Reward_2 = Stats.Reward
    local Difficulty = Stats.Difficulty and Stats.Difficulty[GameState.Difficulty]
    if Difficulty and Difficulty.Reward ~= nil then
        Reward_2 = Difficulty.Reward
    end
    local v1 = 5
    if typeof(Reward_2) == "number" then
        v1 = Reward_2
    elseif typeof(Reward_2) == "table" then
        v1 = Reward_2[GameState.Difficulty] or v1
    end
    local RewardPerGamemode = Stats.RewardPerGamemode and Stats.RewardPerGamemode[GameState.GameMode]
    if RewardPerGamemode and not Stats.IgnoreRewardPerGamemode then
        if typeof(RewardPerGamemode) == "number" then
            return RewardPerGamemode
        end
        if typeof(RewardPerGamemode) == "table" then
            v1 = RewardPerGamemode[GameState.Difficulty] or v1
        end
    end
    return v1
end

function u15.getBountyRewardFromTarget(a1, a2) -- Line: 113
    -- upvalues: GameState (val), u15 (val)
    local BountyCashRewardMult = a2.BountyCashRewardMult
    if not BountyCashRewardMult then
        return 0
    end
    local v1 = math.max(GameState.PlayerCount or 1, 1)
    local v2 = math.ceil((u15.getTargetCashReward(a1)) / v1 * BountyCashRewardMult)
    local BountyRewardCap = a2.BountyRewardCap
    if BountyRewardCap and BountyRewardCap > 0 then
        v2 = math.min(v2, BountyRewardCap)
    end
    return v2
end

function u15.isTargetInRange(a1, a2, a3) -- Line: 133
    -- upvalues: RunService (val)
    local Position_3, Position_4
    if not RunService:IsServer() then
        Position_3 = if not a1.Model then a1.Position else a1.Model:GetPivot().Position
        Position_4 = if not a2.Model then a2.Position else a2.Model:GetPivot().Position
    else
        Position_3 = a1.Position or a1.Model and a1.Model:GetPivot().Position
        Position_4 = a2.Position or a2.Model and a2.Model:GetPivot().Position
    end
    if Position_3 and Position_4 then
        return ((Position_3 - Position_4) * Vector3.new(1, 0, 1)).Magnitude <= a3
    end
    return false
end

return u15