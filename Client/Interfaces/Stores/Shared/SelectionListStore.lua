-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.SelectionListStore
-- Decompile time: 0.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u20 = {
    enabled = false,
    selected = "",
    title = "",
    values = {},
    disabled = {},
    highlight = {},
}
u20.position = UDim2.fromOffset(0, 0)
local v1, u31 = Charm.signal(u20)
return {
    selected = Signal.new(),
    getState = v1,
    update = function(a1) -- Line: 26 -- upvalues: u31 (val), table (val), u20 (val) -- types: a1: table
        u31(table.merge({}, u20, a1))
    end,
}