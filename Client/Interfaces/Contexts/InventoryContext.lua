-- Script path: ReplicatedStorage.Client.Interfaces.Contexts.InventoryContext
-- Decompile time: 7.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local Charm = require(ReplicatedStorage.Packages.Charm)
local CharmUtil = require(ReplicatedStorage.Shared.Modules.CharmUtil)
local React = require(ReplicatedStorage.Packages.React)
local Sift = require(ReplicatedStorage.Packages.Sift)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useEffect = React.useEffect
local u46 = Charm.atom({
    towers = {},
    crates = {},
    skins = {},
    modifiers = {},
    consumables = {},
    stickers = {},
    emotes = {},
    totems = {},
    flairs = {},
    nametags = {},
})
local u50 = React.createContext(u46())
local u51 = {}
local u52 = nil

local function subscribeToInventory() -- Line: 43
    -- upvalues: u51 (val), u52 (ref), Cache (val), Charm (val), Sift (val), CharmUtil (val), u46 (val)
    local u6
    local v1 = next(u51) ~= nil

    function u6() -- Line: 47 -- upvalues: u51 (upval), u6 (ref), u52 (upval)
        u51[u6] = nil
        if u52 and next(u51) == nil then
            u52()
            u52 = nil
        end
    end

    if not v1 then
        local u10 = Cache("Inventory.Troops")
        local u13 = Cache("Inventory.Crates")
        local u16 = Cache("Inventory.Skins")
        local u19 = Cache("Inventory.Modifiers")
        local u22 = Cache("Inventory.Consumables")
        local u25 = Cache("Inventory.Stickers")
        local u28 = Cache("Inventory.Emotes")
        local u31 = Cache("Inventory.Totems")
        local u34 = Cache("Inventory.Flairs")
        local u37 = Cache("Inventory.Nametags")
        for i, j in {u10, u13, u16, u19, u22, u25, u28, u31, u34, u37} do
            if not j:GetValue() then
                j:Download()
            end
        end
        u52 = CharmUtil.watch(Charm.computed(function() -- Line: 87
            -- upvalues: u10 (val), u13 (val), u16 (val), u19 (val), u22 (val), u25 (val), u28 (val), u31 (val)
            -- upvalues: u34 (val), u37 (val), Sift (upval)
            local Value = u10:GetValue() or {}
            local Value_2 = u13:GetValue() or {}
            local Value_4 = u19:GetValue() or {}
            local Value_5 = u22:GetValue() or {}
            local Value_6 = u25:GetValue() or {}
            local Value_7 = u28:GetValue() or {}
            local Value_8 = u31:GetValue() or {}
            local Value_9 = u34:GetValue() or {}
            local Value_10 = u37:GetValue() or {}
            return {
                towers = Value,
                skins = Sift.Dictionary.map(u16:GetValue() or {}, function(a1, a2) -- Line: 101 -- upvalues: Sift (upval)
                    return Sift.Array.map(a1, function(a1) -- Line: 102
                        return a1.Name
                    end)
                end),
                crates = Value_2,
                modifiers = Value_4,
                consumables = Value_5,
                stickers = Sift.Dictionary.keys(Value_6),
                emotes = Sift.Dictionary.keys(Value_7),
                totems = Value_8,
                flairs = Value_9,
                nametags = Value_10,
            }
        end), function(a1) -- Line: 117 -- upvalues: u46 (upval)
            u46(a1)
        end)
    end
    return u6
end

return {
    getInventory = function() -- Line: 138 -- upvalues: u46 (val)
        return u46()
    end,
    inventoryContext = u50,
    inventoryProvider = function(a1) -- Line: 125
        -- upvalues: useAtom (val), u46 (val), useEffect (val), subscribeToInventory (val), React (val), u50 (val)
        local v1 = useAtom(u46)
        useEffect(function() -- Line: 128 -- upvalues: subscribeToInventory (upval)
            return (subscribeToInventory())
        end, {})
        return React.createElement(u50.Provider, {value = v1}, a1.children)
    end,
    useInventory = function() -- Line: 143 -- upvalues: React (val), u50 (val)
        return (React.useContext(u50))
    end,
}