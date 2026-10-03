-- Script path: ReplicatedStorage.Shared.Modules.Render
-- Decompile time: 0.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local RenderStepped = if not RunService:IsClient() then RunService.Stepped else RunService.RenderStepped
local u20 = {}
local u21 = 0

local function getId() -- Line: 16 -- upvalues: u21 (ref)
    u21 = u21 + 1
    return string.format("%02x", u21)
end

return {
    Add = function(a1, a2, a3, a4) -- Line: 31 -- upvalues: u21 (ref), u20 (val), Scheduler (val), RenderStepped (val)
        local v1 = a2
        if not v1 then
            u21 = u21 + 1
            v1 = string.format("%02x", u21)
        end
        local v2 = v1
        if u20[v2] then
            u20[v2]()
            u20[v2] = nil
        end
        u20[v2] = (Scheduler.add(("Render_%*"):format(v2), RenderStepped, a4))
        return v2
    end,
    Remove = function(a1, a2) -- Line: 21 -- upvalues: u20 (val)
        if not u20[a2] then
            return
        end
        u20[a2]()
        u20[a2] = nil
        return true
    end,
}