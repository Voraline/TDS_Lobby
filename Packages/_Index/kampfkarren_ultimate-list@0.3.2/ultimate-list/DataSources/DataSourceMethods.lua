-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.DataSources.DataSourceMethods
-- Decompile time: 1.68 ms

local v1 = script:FindFirstAncestor("ultimate-list")
require(script.Parent)
local exhaustiveMatch = require(v1.Util.exhaustiveMatch)
return {
    get = function(a1, a2) -- Line: 8 -- upvalues: exhaustiveMatch (val) -- types: a2: number
        assert(a2 >= 1, "index < 1")
        if a1.type == "array" then
            local get

            function get(a1_2) -- Line: 15 -- upvalues: a1 (val), get (val) -- types: a1_2: number
                if not (a1_2 < 1) and not (#a1.array < a1_2) then
                    return {
                        before = function() -- Line: 21 -- upvalues: get (upval), a1_2 (val)
                            return get(a1_2 - 1)
                        end,
                        value = a1.array[a1_2],
                        after = function() -- Line: 27 -- upvalues: get (upval), a1_2 (val)
                            return get(a1_2 + 1)
                        end,
                    }
                end
                return nil
            end

            return (get(a2))
        end
        if a1.type == "mutableSource" then
            return a1.methods.get(a2)
        end
        return exhaustiveMatch(a1.type)
    end,
    getByRange = function(a1, a2) -- Line: 41 -- upvalues: exhaustiveMatch (val) -- types: a2: vector
        if a1.type == "array" then
            return table.move(a1.array, a2.X, a2.Y, 1, {})
        end
        if a1.type ~= "mutableSource" then
            return exhaustiveMatch(a1.type)
        end
        if a1.methods.getByRange ~= nil then
            return a1.methods.getByRange(a2.X, a2.Y)
        end
        local v1 = {}
        local v2 = a1.methods.get(a2.X)
        local v3 = a2.Y - a2.X
        for i = 0, v3 do
            if v2 == nil then
                break
            end
            table.insert(v1, v2.value)
            v2 = v2.after()
        end
        return v1
    end,
    back = function(a1) -- Line: 67 -- upvalues: exhaustiveMatch (val)
        if a1.type == "array" then
            return a1.array[#a1.array]
        end
        if a1.type ~= "mutableSource" then
            return exhaustiveMatch(a1.type)
        end
        if a1.methods.back ~= nil then
            return a1.methods.back()
        end
        local v1 = a1.methods.get(a1.methods.length())
        return v1 and v1.value
    end,
    length = function(a1) -- Line: 82 -- upvalues: exhaustiveMatch (val)
        if a1.type == "array" then
            return #a1.array
        end
        if a1.type == "mutableSource" then
            return a1.methods.length()
        end
        return exhaustiveMatch(a1.type)
    end,
    equals = function(a1, a2) -- Line: 93 -- upvalues: exhaustiveMatch (val)
        if a1.type ~= a2.type then
            return false
        end
        if a1.type == "array" then
            assert(a2.type == "array", "Luau")
            return a1.array == a2.array
        end
        if a1.type ~= "mutableSource" then
            return exhaustiveMatch(a1.type)
        end
        assert(a2.type == "mutableSource", "Luau")
        return a1.methods == a2.methods
    end,
}