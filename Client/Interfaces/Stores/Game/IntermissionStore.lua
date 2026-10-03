-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.IntermissionStore
-- Decompile time: 1.53 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u29, u30 = Charm.signal({
    visible = false,
    mapOverrideVisible = false,
    readyPlayers = 0,
    totalPlayers = 0,
    vetoPlayers = 0,
    totalVetoPlayers = 0,
    voteTimeLeft = 0,
    isReady = false,
    gameGuiHotbarPosition = UDim2.new(0.5, 0, 1, -16),
})
local v1 = {
    OverrideMap = Signal.new(),
    LoadInventory = Signal.new(),
    Ready = Signal.new(),
    Veto = Signal.new(),
    getState = u29,
}

local function setField(a1, a2) -- Line: 32 -- upvalues: u29 (val), table (val), u30 (val) -- types: a1: string
    local v1 = u29()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u30(v2)
end

function v1.setIntermissionVisible(a1) -- Line: 43 -- upvalues: u29 (val), table (val), u30 (val) -- types: a1: boolean
    local v1 = u29()
    if v1.visible == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.visible = a1
    u30(v2)
end

function v1.setMapOverrideVisible(a1) -- Line: 47 -- upvalues: u29 (val), table (val), u30 (val) -- types: a1: boolean
    local v1 = u29()
    if v1.mapOverrideVisible == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.mapOverrideVisible = a1
    u30(v2)
end

function v1.setReadyPlayers(a1) -- Line: 51 -- upvalues: u29 (val), table (val), u30 (val) -- types: a1: number
    local v1 = u29()
    if v1.readyPlayers == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.readyPlayers = a1
    u30(v2)
end

function v1.setTotalPlayers(a1) -- Line: 55 -- upvalues: u29 (val), table (val), u30 (val) -- types: a1: number
    local v1 = u29()
    if v1.totalPlayers == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.totalPlayers = a1
    u30(v2)
end

function v1.setVetoPlayers(a1) -- Line: 59 -- upvalues: u29 (val), table (val), u30 (val) -- types: a1: number
    local v1 = u29()
    if v1.vetoPlayers == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.vetoPlayers = a1
    u30(v2)
end

function v1.setTotalVetoPlayers(a1) -- Line: 63 -- upvalues: u29 (val), table (val), u30 (val) -- types: a1: number
    local v1 = u29()
    if v1.totalVetoPlayers == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.totalVetoPlayers = a1
    u30(v2)
end

function v1.setVoteTimeLeft(a1) -- Line: 67 -- upvalues: u29 (val), table (val), u30 (val) -- types: a1: number
    local v1 = u29()
    if v1.voteTimeLeft == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.voteTimeLeft = a1
    u30(v2)
end

function v1.setGameGuiHotbarPosition(a1) -- Line: 71
    -- upvalues: u29 (val), table (val), u30 (val)
    local v1 = u29()
    if v1.gameGuiHotbarPosition == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.gameGuiHotbarPosition = a1
    u30(v2)
end

function v1.setIsReady(a1) -- Line: 75 -- upvalues: u29 (val), table (val), u30 (val) -- types: a1: boolean
    local v1 = u29()
    if v1.isReady == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.isReady = a1
    u30(v2)
end

return v1