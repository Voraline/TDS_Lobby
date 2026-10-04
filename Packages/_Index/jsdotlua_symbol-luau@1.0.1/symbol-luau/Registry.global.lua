-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_symbol-luau@1.0.1.symbol-luau.Registry.global
-- Decompile time: 0.23 ms

local Symbol = require(script.Parent:WaitForChild("Symbol"))
local u8 = {}
return {
    getOrInit = function(a1) -- Line: 6 -- upvalues: u8 (ref), Symbol (val) -- types: a1: string
        if u8[a1] == nil then
            u8[a1] = (Symbol.new(a1))
        end
        return u8[a1]
    end,
    __clear = function() -- Line: 14 -- upvalues: u8 (ref)
        u8 = {}
    end,
}