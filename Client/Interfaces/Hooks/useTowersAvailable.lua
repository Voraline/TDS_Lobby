-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTowersAvailable
-- Decompile time: 1.24 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useCache = require(Hooks.useCache)
local useFFlag = require(Hooks.useFFlag)
local useTowers = require(Hooks.useTowers)
local useMemo = React.useMemo
local u32 = {[Enum.TowerCategory.Exclusive] = true, [Enum.TowerCategory.Event] = true}
return function(a1, a2, a3) -- Line: 25
    -- upvalues: useCache (val), useTowers (val), useFFlag (val), useMemo (val), Sift (val), Enum (val), u32 (val)
    local u7 = useCache("Inventory.Troops", a2, a3)
    local u9 = useTowers()
    local v1 = if a3 ~= nil then {enabled = a3} else nil
    local u23 = useFFlag("towers.hidden", {}, v1)
    if u23 then
        local v2 = u23
        if typeof(v2) ~= "table" then
            u23 = {u23}
        end
    end
    local u29 = useFFlag("towers.whitelist", {}, v1)
    return (useMemo(function() -- Line: 41
        -- upvalues: Sift (upval), u9 (val), a1 (val), Enum (upval), u7 (val), u23 (ref), u32 (upval), u29 (val)
        return Sift.Dictionary.filter(u9, function(a1_2, a2) -- Line: 42 -- upvalues: a1 (upval), Enum (upval), u7 (upval), u23 (upval), u32 (upval), u29 (upval)
            if a1 == true and a1_2.Properties.Category == Enum.TowerCategory.Exclusive then
                return false
            end
            if u7[a2] then
                return true
            end
            if table.find(u23, a2) or u32[a1_2.Properties.Category] then
                return false
            end
            if not a1_2.Properties.Price and not a1_2.Properties.Gamepass then
                if u29 and table.find(u29, a2) then
                    return true
                end
                return false
            end
            return true
        end)
    end, {u9, u7, u23, u29}))
end