-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.DataSources
-- Decompile time: 0.46 ms

local v1 = {
    array = function(a1) -- Line: 40 -- types: a1: table
        return {type = "array", array = a1}
    end,
    mutableSource = function(a1) -- Line: 47 -- types: a1: table
        return {type = "mutableSource", methods = a1}
    end,
    utilities = {},
}

function v1.utilities.createGetSimpleCursor(a1, a2) -- Line: 58 -- types: a1: function, a2: function
    return function(a1_2) -- Line: 63 -- upvalues: a2 (val), a1 (val) -- types: a1_2: number
        local getWithCursor
        local u2 = a2()

        function getWithCursor(a1_2) -- Line: 66
            -- upvalues: u2 (val), getWithCursor (val), a1 (upval)
            if not (a1_2 < 1) and not (u2 < a1_2) then
                return {
                    before = function() -- Line: 72 -- upvalues: getWithCursor (upval), a1_2 (val)
                        return getWithCursor(a1_2 - 1)
                    end,
                    value = a1(a1_2),
                    after = function() -- Line: 78 -- upvalues: getWithCursor (upval), a1_2 (val)
                        return getWithCursor(a1_2 + 1)
                    end,
                }
            end
            return nil
        end

        return (getWithCursor(a1_2))
    end
end

return v1