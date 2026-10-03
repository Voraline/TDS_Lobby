-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_symbol-luau@1.0.1.symbol-luau
-- Decompile time: 0.24 ms

local Symbol = require(script:WaitForChild("Symbol"))
local v1 = require(script:WaitForChild("Registry.global"))
local v2 = {
    __call = function(a1, a2) -- Line: 15 -- upvalues: Symbol (val) -- types: a2: string?
        return Symbol.new(a2)
    end,
}
local v3 = setmetatable({}, v2)
v3.for_ = v1.getOrInit
return v3