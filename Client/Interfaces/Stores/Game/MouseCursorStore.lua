-- Script path: ReplicatedStorage.Client.Interfaces.Stores.Game.MouseCursorStore
-- Decompile time: 2.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local u11, u12 = Charm.signal({})
local u15, u16 = Charm.signal({Resize = "rbxassetid://100435000651666", Move = "rbxassetid://137339183750706"})
return {
    getCursors = u15,
    getCurrent = Charm.computed(function() -- Line: 19 -- upvalues: u11 (val), u15 (val)
        local v1
        local v2 = u11()
        local v3 = u15()
        for i = #v2, 1, -1 do
            v1 = v3[v2[i][2]]
            if v1 then
                return v1
            end
        end
        return ""
    end),
    setCursor = function(a1, a2) -- Line: 34 -- upvalues: u16 (val) -- types: a1: string, a2: string?
        u16(function(a1_2) -- Line: 35 -- upvalues: a1 (val), a2 (val)
            local v1 = table.clone(a1_2)
            v1[a1] = a2
            return v1
        end)
    end,
    push = function(a1, a2) -- Line: 42 -- upvalues: u12 (val) -- types: a1: string, a2: string
        u12(function(a1_2) -- Line: 43 -- upvalues: a1 (val), a2 (val)
            local v1 = table.clone(a1_2)
            table.insert(v1, {a1, a2})
            return v1
        end)
    end,
    remove = function(a1) -- Line: 51 -- upvalues: u12 (val) -- types: a1: string
        u12(function(a1_2) -- Line: 52 -- upvalues: a1 (val)
            local v1 = table.clone(a1_2)
            for i, j in v1 do
                if j[1] == a1 then
                    table.remove(v1, i)
                    return v1
                end
            end
            return v1
        end)
    end,
}