-- Script path: ReplicatedStorage.Shared.UI.Components.DelayedState
-- Decompile time: 0.87 ms

local Packages = game:GetService("ReplicatedStorage"):WaitForChild("Packages")
local Fusion = require(Packages.Fusion)
require(Packages.Fusion.PubTypes)
local Value = Fusion.Value
local Computed = Fusion.Computed

local function isSimilar(a1, a2) -- Line: 14
    if type(a1) ~= "table" and type(a2) ~= "table" then
        return a1 == a2
    end
    return false
end

local function nonce() -- Line: 22
    return math.random(1, 999999999)
end

return function(a1, a2, a3) -- Line: 26 -- upvalues: Value (val), Computed (val) -- types: a1: number
    local u6 = math.random(1, 999999999)
    local u12 = Value(a2:get(false))
    local u16 = a3
    if not u16 then
        u16 = Value(true)
    end
    return (Computed(function() -- Line: 35 -- upvalues: u12 (val), a2 (val), u16 (val), u6 (ref), a1 (val)
        local v1 = u12:get()
        local u7 = a2:get()
        if not (if type(v1) == "table" then false else if type(u7) ~= "table" then v1 == u7 else false) then
            if u16:get(false) then
                local u26 = math.random(1, 999999999)
                u6 = u26
                task.delay(a1, function() -- Line: 44 -- upvalues: u6 (upval), u26 (val), u12 (upval), u7 (val)
                    if u6 == u26 then
                        u12:set(u7)
                    end
                end)
                return v1
            end
            u12:set(u7)
            u6 = math.random(1, 999999999)
            v1 = u7
        end
        return v1
    end))
end