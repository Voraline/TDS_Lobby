-- Script path: ReplicatedStorage.Shared.Data.SharedData.FFlagAtoms
-- Decompile time: 0.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local FFlagService = if not RunService:IsServer() then require(ReplicatedStorage.Client.Controllers.Shared.FFlagController) else require(ServerStorage.Server.Services.Shared.FFlagService)
local Updated = FFlagService.Updated
local u32 = {}
local u33 = {}
local u34 = {}
Updated:Connect(function() -- Line: 16 -- upvalues: u34 (val), u33 (val)
    for i, j in u34 do
        u33[i] = (j())
    end
end)
return function(a1, a2) -- Line: 22 -- upvalues: u32 (val), u33 (val), u34 (val), FFlagService (val) -- types: a1: string
    if u32[a1] then
        return u32[a1]
    end
    u33[a1] = a2
    u34[a1] = (FFlagService.get(a1, a2))
    u33[a1] = (u34[a1]())

    local function getValue() -- Line: 31 -- upvalues: u33 (upval), a1 (val)
        return u33[a1]
    end

    u32[a1] = getValue
    return getValue
end