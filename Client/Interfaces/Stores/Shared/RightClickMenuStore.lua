-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Shared.RightClickMenuStore
-- Decompile time: 1.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local u17, u18 = (require(ReplicatedStorage.Packages.Charm)).signal({Enabled = false, Values = {}, Position = UDim2.fromOffset(0, 0)})
return {
    getState = u17,
    update = function(a1) -- Line: 23 -- upvalues: u17 (val), u18 (val) -- types: a1: table
        local v1 = u17()
        local v2 = {Enabled = a1.Enabled}
        local Values = a1.Values or v1.Values
        v2.Values = Values
        local Position = a1.Position or v1.Position
        v2.Position = Position
        if v1.Enabled == v2.Enabled and v1.Values == v2.Values and v1.Position == v2.Position then
            return
        end
        u18(v2)
    end,
}