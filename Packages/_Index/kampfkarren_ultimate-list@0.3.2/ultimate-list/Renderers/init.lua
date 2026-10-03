-- Script path: ReplicatedStorage.Packages._Index.kampfkarren_ultimate-list@0.3.2.ultimate-list.Renderers
-- Decompile time: 0.27 ms

local v1 = script:FindFirstAncestor("ultimate-list")
require(v1.Parent.React)
return {
    byState = function(a1, a2) -- Line: 20 -- types: a1: function, a2: table?
        return {type = "byState", callback = a1, config = a2 or {}}
    end,
    byBinding = function(a1) -- Line: 28 -- types: a1: function
        return {type = "byBinding", callback = a1}
    end,
}