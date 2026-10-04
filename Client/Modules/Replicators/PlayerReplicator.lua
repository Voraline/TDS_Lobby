-- Script path: ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator
-- Decompile time: 9.94 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u10 = {}
u10.__index = u10

function u10.__tostring(a1) -- Line: 6
    return string.format("PlayerReplicator_%s", a1.Player.Name)
end

local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local PlayerCharacterReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local LocalPlayer = Players.LocalPlayer
local u39 = {}
local BindableEvent = Instance.new("BindableEvent")
local u44 = Signal.new()
local u46 = Signal.new()
u10.PlayerAdded = u44
u10.PlayerRemoving = u46

local function getEntityFromPlayer(a1) -- Line: 26 -- upvalues: u39 (val) -- types: a1: userdata
    for i in u39 do
        if i.Player == a1 then
            return i
        end
    end
end

local function mapReplicatorValueToModifier(a1, a2) -- Line: 34
    -- upvalues: ReplicatedStorage (val)
    if workspace.Type.Value ~= "Game" then
        return
    end
    local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
    ;(a2:GetStateChangedSignal(a1)):Connect(function(a1_2) -- Line: 41 -- upvalues: GameState (val), a1 (val) -- types: a1_2: boolean
        local ClientModifiers = GameState.State.ClientModifiers
        if a1_2 then
            if ClientModifiers[a1] then
                return
            end
            GameState.State.ClientModifiers[a1] = true
            GameState.Replicator:Set("ClientModifiers", GameState.State.ClientModifiers)
            return
        end
        if not ClientModifiers[a1] then
            return
        end
        GameState.State.ClientModifiers[a1] = nil
        GameState.Replicator:Set("ClientModifiers", GameState.State.ClientModifiers)
    end)
    local v1 = a2:Get(a1)
    local ClientModifiers = GameState.State.ClientModifiers
    if v1 then
        if ClientModifiers[a1] then
            return
        end
        GameState.State.ClientModifiers[a1] = true
        GameState.Replicator:Set("ClientModifiers", GameState.State.ClientModifiers)
        return
    end
    if not ClientModifiers[a1] then
        return
    end
    GameState.State.ClientModifiers[a1] = nil
    GameState.Replicator:Set("ClientModifiers", GameState.State.ClientModifiers)
end

function u10.new(a1, a2) -- Line: 65
    -- upvalues: u10 (val), Maid (val), Players (val), mapReplicatorValueToModifier (val), u39 (val), u44 (val)
    -- upvalues: u46 (val), BindableEvent (val)
    local u5 = setmetatable({}, u10)
    u5.Maid = Maid.new()
    if (a2:WaitForState("UserId")) then
        u5.Player = Players:GetPlayerByUserId((a2:Get("UserId")))
    end
    u5.Character = nil
    u5.Replicator = a2
    u5.EquippedTowers = {}
    u5.Cash = a2:Get("Cash")
    a2:Hook(u5)
    if u5.Player == Players.LocalPlayer then
        mapReplicatorValueToModifier("LegacyVIP", a2)
        mapReplicatorValueToModifier("VIPPlus", a2)
    end
    u39[u5] = true
    u44:Fire(u5)
    u5.Maid:Mark(function() -- Line: 95 -- upvalues: u46 (upval), u5 (val), u39 (upval)
        u46:Fire(u5)
        u39[u5] = nil
    end)
    if u5.Player then
        BindableEvent:Fire(u5.Player)
        u5:RefreshCharacterConnections()
    end
    return u5
end

function u10:RefreshCharacterConnections() -- Line: 108 -- upvalues: PlayerCharacterReplicator (val)
    local Player = self.Player
    if not Player then
        return
    end

    local function onCharacterAdded(a1) -- Line: 114
        -- upvalues: PlayerCharacterReplicator (upval), self (val)
        if not a1 then
            return
        end
        local u5 = PlayerCharacterReplicator.new(self, a1)
        self.Character = u5
        ;(a1:GetPropertyChangedSignal("Parent")):Connect(function() -- Line: 122 -- upvalues: a1 (val)
            if not a1:IsDescendantOf(workspace) then
                a1:Destroy()
            end
        end)
        a1.Destroying:Connect(function() -- Line: 128 -- upvalues: self (upval), u5 (val)
            if self.Chracter == u5 then
                self.Character = nil
            end
            u5:Destroy()
        end)
    end

    if self.characterAddedConnection then
        self.characterAddedConnection:Disconnect()
    end
    self.characterAddedConnection = Player.CharacterAdded:Connect(onCharacterAdded)
    if Player.Character then
        task.spawn(onCharacterAdded, Player.Character)
    end
end

function u10.GetEntityFromPlayer(a1) -- Line: 147 -- upvalues: getEntityFromPlayer (val) -- types: a1: userdata
    return getEntityFromPlayer(a1)
end

function u10.GetPlayers() -- Line: 151 -- upvalues: u39 (val)
    return u39
end

function u10.WaitForPlayer(a1) -- Line: 155
    -- upvalues: Promise (val), u39 (val), BindableEvent (val)
    return Promise.new(function(a1_2, a2, a3) -- Line: 156 -- upvalues: a1 (val), u39 (upval), BindableEvent (upval)
        local u13, u23
        for i in u39 do
            if i.Player == a1 then
                u13 = i
                if u13 then
                    a1_2(u13)
                    return
                end
                u23 = nil
                u23 = BindableEvent.Event:Connect(function(a1_3) -- Line: 164
                    -- upvalues: a1 (upval), u23 (ref), u13 (ref), u39 (upval), a1_2 (val)
                    if a1_3 ~= a1 then
                        return
                    end
                    u23:Disconnect()
                    for i in u39 do
                        if i.Player == a1 then
                            a1_2(i)
                            return
                        end
                    end
                    u13 = nil
                    a1_2(u13)
                end)
                a3(function() -- Line: 175 -- upvalues: u23 (ref)
                    if u23.Connected then
                        u23:Disconnect()
                    end
                end)
                return
            end
        end
        u13 = nil
        if u13 then
            a1_2(u13)
            return
        end
        u23 = nil
        u23 = BindableEvent.Event:Connect(function(a1_3) -- Line: 164
            -- upvalues: a1 (upval), u23 (ref), u13 (ref), u39 (upval), a1_2 (val)
            if a1_3 ~= a1 then
                return
            end
            u23:Disconnect()
            for i in u39 do
                if i.Player == a1 then
                    a1_2(i)
                    return
                end
            end
            u13 = nil
            a1_2(u13)
        end)
        a3(function() -- Line: 175 -- upvalues: u23 (ref)
            if u23.Connected then
                u23:Disconnect()
            end
        end)
    end)
end

function u10.GetLocalPlayer() -- Line: 183 -- upvalues: u10 (val), LocalPlayer (val)
    return u10.WaitForPlayer(LocalPlayer)
end

function u10.GetLocalPlayerRaw() -- Line: 187 -- upvalues: u10 (val), LocalPlayer (val)
    return u10.GetEntityFromPlayer(LocalPlayer)
end

function u10:Destroy() -- Line: 191
    if self.Maid then
        self.Maid:Sweep()
        self.Maid = nil
    end
end

TagReplicator.hook("Player", function(a1, a2) -- Line: 198 -- upvalues: u10 (val)
    return u10.new(a1, a2)
end)
return u10