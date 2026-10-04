-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useVote
-- Decompile time: 3.65 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useTagReplicators = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicators)
local useMemo = React.useMemo
local useCallback = React.useCallback
local UserId = Players.LocalPlayer.UserId
local Voting = Network.Channel("Voting")
return function(a1) -- Line: 15
    -- upvalues: useTagReplicators (val), useReplicatedState (val), useMemo (val), UserId (val), useCallback (val)
    -- upvalues: Voting (val)
    local VoteManager = useTagReplicators("VoteManager")
    local v1 = VoteManager and VoteManager[1]
    local v2 = useReplicatedState(v1, "Enabled", false)
    local v3 = useReplicatedState(v1, "Title", "")
    local v4 = useReplicatedState(v1, "MaxVotes", 0)
    local v5 = useReplicatedState(v1, "VoteCount", 0)
    local v6 = useReplicatedState(v1, "VoteCount", 0)
    local u36 = useReplicatedState(v1, "YesVoted", {})
    local u39 = v3 == a1
    local v7 = {u39, u36}
    local v8 = useMemo(function() -- Line: 29 -- upvalues: u39 (val), u36 (val), UserId (upval)
        if not u39 then
            return false
        end
        return table.find(u36, UserId)
    end, v7)
    local v9 = {u39}
    local v10 = useCallback(function() -- Line: 37 -- upvalues: u39 (val), Voting (upval)
        if not u39 then
            return false
        end
        return Voting:InvokeServer("Skip")
    end, v9)
    local v11 = {u39}
    v7 = useCallback(function() -- Line: 44 -- upvalues: u39 (val), Voting (upval)
        if not u39 then
            return false
        end
        return Voting:InvokeServer("Skip")
    end, v11)
    v9 = {enabled = u39 and v2}
    v9.maxVotes = u39 and v4 or 0
    v9.votes = u39 and v5 or 0
    v9.vetos = u39 and v6 or 0
    v9.title = u39 and v3 or ""
    v9.voted = v8
    return v9, v10, v7
end