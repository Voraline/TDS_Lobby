-- Script path: ReplicatedStorage.Shared.Modules.SharedModifierData
-- Decompile time: 0.48 ms

local v1 = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local u11 = {Act1 = true, Act2 = true, Act3 = true}

function v1.getPathChance(a1) -- Line: 13 -- upvalues: u11 (val), GameState (val) -- types: a1: number?
    local v1 = a1 or 1
    if u11[GameState.Difficulty or ""] == true then
        return v1
    end
    local v2 = next(GameState.Paths) or {}
    return v1 / #v2
end

return v1