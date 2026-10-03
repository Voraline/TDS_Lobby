-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.AbilitiesStore
-- Decompile time: 2.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u17, u18 = Charm.signal({})
return {
    UseAbility = Signal.new(),
    getState = u17,
    addAbilities = function(a1, a2) -- Line: 26 -- upvalues: u17 (val), u18 (val) -- types: a1: userdata, a2: table
        local v1 = u17()
        local v2 = v1[a1]
        local v3 = {}
        local v4 = nil
        local v5 = nil
        for i, j in a2, v4, v5 do
            if not v2 or not (v2[j.Name] ~= nil) then
                table.insert(v3, j.Name)
            end
        end
        if #v3 == 0 then
            return
        end
        local v6 = table.clone(v1)
        v4 = if not v2 then {} else table.clone(v2)
        for k, n in v3 do
            v4[n] = {deltaTime = 0, maxDeltaTime = 0}
        end
        v6[v7] = v4
        u18(v6)
    end,
    updateAbility = function(a1, a2, a3, a4) -- Line: 58
        -- upvalues: u17 (val), u18 (val)
        local v1 = a3 or 0
        local v2 = a4 or 0
        local v3 = u17()
        local v4 = v3[a1]
        local v5 = v4 and v4[a2]
        if v5 and v5.deltaTime == v1 and v5.maxDeltaTime == v2 then
            return
        end
        local v6 = table.clone(v3)
        local v7 = if not v4 then {} else table.clone(v4)
        v7[a2] = {deltaTime = v1, maxDeltaTime = v2}
        v6[a1] = v7
        u18(v6)
    end,
    updateAbilities = function(a1) -- Line: 90 -- upvalues: u17 (val), u18 (val) -- types: a1: table
        local v1, v2, v3, v4
        local v5 = u17()
        local v6 = v5
        local v7 = {}
        local v8 = nil
        local v9 = nil
        for i, j in a1, v8, v9 do
            v4 = j.deltaTime or 0
            v1 = j.maxDeltaTime or 0
            v2 = v7[j.model] or v5[j.model]
            v3 = v2 and v2[j.name]
            if not v3 or v3.deltaTime ~= v4 or v3.maxDeltaTime ~= v1 then
                if v6 == v5 then
                    v6 = table.clone(v5)
                end
                if not v7[j.model] then
                    v2 = if not v5[j.model] then {} else table.clone(v5[j.model])
                    v7[j.model] = v2
                    v6[j.model] = v2
                end
                v2[j.name] = {deltaTime = v4, maxDeltaTime = v1}
            end
        end
        if v6 ~= v5 then
            u18(v6)
        end
    end,
    removeAbility = function(a1, a2) -- Line: 130 -- upvalues: u17 (val), u18 (val) -- types: a1: userdata, a2: string
        local v1 = u17()
        if v1[a1] and v1[a1][a2] then
            local v2 = table.clone(v1)
            local v3 = table.clone(v1[a1])
            v3[a2] = nil
            if next(v3) then
                v2[a1] = v3
            else
                v2[a1] = nil
            end
            u18(v2)
            return
        end
    end,
    removeTower = function(a1) -- Line: 149 -- upvalues: u17 (val), u18 (val) -- types: a1: userdata
        local v1 = u17()
        if not v1[a1] then
            return
        end
        local v2 = table.clone(v1)
        v2[a1] = nil
        u18(v2)
    end,
}