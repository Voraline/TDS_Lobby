-- Script path: ReplicatedStorage.Shared.Data.Nights.Templates.Adidas2026
-- Decompile time: 1.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent_2 = script.Parent.Parent
local Types = require(Parent_2.Types)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local Timezone = require(ReplicatedStorage.Shared.Data.Events.Timezone)

local function getTime(a1) -- Line: 11 -- upvalues: SharedGameConstants (val), Timezone (val) -- types: a1: userdata
    if not SharedGameConstants.IS_PROD then
        a1 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
    end
    return Timezone("EST")(a1)
end

local v1 = {name = "Adidas2026"}
local v2 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
if not SharedGameConstants.IS_PROD then
    v2 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
end
v1.startsAt = Timezone("EST")(v2)
v1.endsAt = Timezone("EST")(DateTime.fromUniversalTime(2026, 6, 12, 12, 0))
local v3 = {}
v2 = {map = "Map1Adidas"}
local v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
if not SharedGameConstants.IS_PROD then
    v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
end
v2.startsAt = Timezone("EST")(v4)
v3[1] = v2
v2 = {map = "Map2Adidas"}
v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
if not SharedGameConstants.IS_PROD then
    v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
end
v2.startsAt = Timezone("EST")(v4)
v3[2] = v2
v2 = {map = "Map3Adidas"}
v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
if not SharedGameConstants.IS_PROD then
    v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
end
v2.startsAt = Timezone("EST")(v4)
v3[3] = v2
v1.nights = v3

function v1.init(a1) -- Line: 43
    warn("Adidas 2026 Statue initialized")
end

function v1.intro(a1) -- Line: 47
    warn("Adidas 2026 Statue intro")
end

function v1.unlock(a1) -- Line: 51
    warn("Adidas 2026 Statue unlocked")
end

function v1.countDown(a1, a2) end

return Types(v1)