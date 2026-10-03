-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.Util.joinAndMapBindings
-- Decompile time: 0.29 ms

local v1 = script:FindFirstAncestor("ultimate-list")
local React = require(v1.Parent.React)
return function(a1, a2, a3, a4) -- Line: 6 -- upvalues: React (val) -- types: a1: function
    return (React.joinBindings({a2, a3, a4})):map(function(a1_2) -- Line: 12 -- upvalues: a1 (val)
        return a1(unpack(a1_2))
    end)
end