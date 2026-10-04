-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.DifficultyStore
-- Decompile time: 3.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u19, u20 = Charm.signal({
    visible = false,
    voted = false,
    readyCount = 0,
    readyVisible = true,
    gamemodeData = {},
})
local v1 = {
    getState = u19,
    resetVote = function() -- Line: 23 -- upvalues: u19 (val), table (val), u20 (val)
        local v1 = table.clone((u19()))
        v1.voted = false
        v1.readyCount = 0
        v1.readyVisible = true
        v1.selected = nil
        u20(v1)
    end,
}

local function setField(a1, a2) -- Line: 33 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: string
    local v1 = u19()
    if v1[a1] == a2 then
        return
    end
    local v2 = table.clone(v1)
    v2[a1] = a2
    u20(v2)
end

function v1.setGamemodeData(a1) -- Line: 44 -- upvalues: u19 (val), table (val), u20 (val)
    local v1 = u19()
    if v1.gamemodeData == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.gamemodeData = a1
    u20(v2)
end

function v1.setDifficultyVisible(a1) -- Line: 48 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: boolean
    local v1 = u19()
    if v1.visible == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.visible = a1
    u20(v2)
end

function v1.setReadyCount(a1) -- Line: 52 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: number
    local v1 = u19()
    if v1.readyCount == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.readyCount = a1
    u20(v2)
end

function v1.setReadyVisible(a1) -- Line: 56 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: boolean
    local v1 = u19()
    if v1.readyVisible == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.readyVisible = a1
    u20(v2)
end

function v1.setSelected(a1) -- Line: 60 -- upvalues: u19 (val), table (val), u20 (val)
    local v1 = u19()
    if v1.selected == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.selected = a1
    u20(v2)
end

function v1.setVoted(a1) -- Line: 64 -- upvalues: u19 (val), table (val), u20 (val) -- types: a1: boolean
    local v1 = u19()
    if v1.voted == a1 then
        return
    end
    local v2 = table.clone(v1)
    v2.voted = a1
    u20(v2)
end

return v1