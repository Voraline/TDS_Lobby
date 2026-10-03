-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.TooltipStore
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local v1 = UDim2.fromOffset(0, 0)
local u23, u24 = Charm.signal({tooltipType = "None", tooltipValue = {}})
local u27, u28 = Charm.signal(v1)
return {
    getState = u23,
    getPosition = u27,
    update = function(a1) -- Line: 29 -- upvalues: u27 (val), u28 (val), u23 (val), table (val), u24 (val)
        if a1.tooltipPosition and u27() ~= a1.tooltipPosition then
            u28(a1.tooltipPosition)
        end
        local v1 = u23()
        local v2 = {tooltipType = a1.tooltipType}
        local tooltipValue = a1.tooltipValue or {}
        v2.tooltipValue = tooltipValue
        if v1.tooltipType == v2.tooltipType and table.deepCompare(v1.tooltipValue, v2.tooltipValue) then
            return
        end
        u24(v2)
    end,
}