-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.Dimensions
-- Decompile time: 0.39 ms

local u0 = {}

function u0.getter(a1) -- Line: 27 -- types: a1: function
    return {type = "getter", callback = a1}
end

function u0.consistentSize(a1) -- Line: 34 -- types: a1: number
    return {type = "consistentSize", size = a1}
end

function u0.consistentUDim2(a1) -- Line: 41 -- types: a1: userdata
    return {type = "consistentUDim2", udim2 = a1}
end

function u0.withSpacing(a1, a2) -- Line: 48 -- upvalues: u0 (val) -- types: a1: table, a2: number
    assert(a1.type ~= "getter", "withSpacing does not support getter. Instead, include your padding as part of your returned position.")
    if a1.type == "spaced" then
        return u0.withSpacing(a1.inner, a2)
    end
    return {type = "spaced", spacing = a2, inner = a1}
end

return u0