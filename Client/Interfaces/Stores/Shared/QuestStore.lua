-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.QuestStore
-- Decompile time: 1.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
require(ReplicatedStorage.Shared.Types.QuestTypes)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u20 = {Loaded = false}
local u23, u24 = Charm.signal(u20)
return {
    getState = u23,
    setQuestState = function(a1) -- Line: 23 -- upvalues: table (val), u23 (val), u24 (val)
        local v1 = table.deepClone(u23())
        v1.State = a1
        v1.Loaded = true
        v1.Error = nil
        u24(v1)
    end,
    setQuestError = function(a1) -- Line: 31 -- upvalues: table (val), u23 (val), u24 (val) -- types: a1: string?
        local v1 = table.deepClone(u23())
        v1.Error = a1
        u24(v1)
    end,
    clearQuestState = function() -- Line: 37 -- upvalues: u24 (val), table (val), u20 (val)
        u24((table.deepClone(u20)))
    end,
}