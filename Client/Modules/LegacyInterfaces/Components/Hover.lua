-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Hover
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local u10 = {}
return {
    new = function(a1) -- Line: 10 -- upvalues: u10 (val), Maid (val)
        if u10[a1] then
            return u10[a1].EnteredEvent.Event, u10[a1].LeaveEvent.Event
        end
        local v1 = {
            UIObj = a1,
            Maid = Maid.new(),
            EnteredEvent = a1.MouseEnter,
            LeaveEvent = a1.MouseLeave,
        }
        v1.Maid:Mark((a1.AncestryChanged:Connect(function() -- Line: 22 -- upvalues: a1 (val), u10 (upval)
            if not a1.Parent then
                u10[a1] = nil
            end
        end)))
        return v1.EnteredEvent, v1.LeaveEvent
    end,
    Remove = function(a1, a2) -- Line: 34 -- upvalues: u10 (val)
        if u10[a2] then
            u10[a2].Maid:Sweep()
            u10[a2] = nil
        end
    end,
}