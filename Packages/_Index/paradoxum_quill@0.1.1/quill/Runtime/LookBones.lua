-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Runtime.LookBones
-- Decompile time: 0.18 ms

require(script.Parent.Parent.Types)
local u6 = {}
return {
    register = function(a1, a2) -- Line: 14 -- upvalues: u6 (val) -- types: a1: string
        u6[a1] = a2
    end,
    get = function(a1) -- Line: 18 -- upvalues: u6 (val) -- types: a1: string
        return u6[a1]
    end,
}