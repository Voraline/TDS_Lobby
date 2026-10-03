-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Challenges
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Challenges = Content("Challenges")
local u24 = {}
return function(a1) -- Line: 52 -- upvalues: u24 (val), Challenges (val), table (val), RunService (val) -- types: a1: string
    local v1 = u24[a1]
    if v1 then
        return v1
    end
    local v2 = Challenges:WaitForChild(a1)
    v1 = table.merge({name = a1}, require(v2))
    if not RunService:IsServer() then
        v1.onServerLoad = nil
    end
    u24[a1] = v1
    return v1
end