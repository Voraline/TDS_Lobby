-- Script path: ReplicatedStorage.Shared.UI.FFlag
-- Decompile time: 0.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local Value = (require(ReplicatedStorage.Packages.Fusion)).Value
local u16 = {}
return function(a1, a2) -- Line: 10 -- upvalues: u16 (val), Value (val), FFlagController (val) -- types: a1: string
    if u16[a1] then
        return u16[a1]
    end
    local u8 = Value(a2)
    local v1 = FFlagController.resolve(a1)
    if v1 ~= nil then
        u8:set(v1)
    end
    FFlagController.Updated:Connect(function() -- Line: 22 -- upvalues: FFlagController (upval), a1 (val), a2 (val), u8 (val)
        local v1 = FFlagController.resolve(a1)
        if v1 == nil then
            v1 = a2
        end
        if v1 ~= u8:get(false) then
            u8:set(v1)
        end
    end)
    return u8
end