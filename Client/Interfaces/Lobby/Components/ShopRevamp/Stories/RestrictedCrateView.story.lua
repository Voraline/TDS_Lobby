-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Stories.RestrictedCrateView.story
-- Decompile time: 5.21 ms

local v1, v2
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local CrateData = require(ReplicatedStorage.Shared.Modules.CrateData)
local RestrictedCrateView = require(script.Parent.Parent.Components.RestrictedCrateView)
local createElement = React.createElement

local function createCrateItems(a1) -- Line: 19 -- upvalues: Asset (val)
    local v1, v2, v3
    local v4 = {}
    if not a1.Consumables then
        local v5, v6, v7
        local Contents = a1.Contents or {}
        v1 = nil
        v2 = nil
        for i, j in Contents, v1, v2 do
            v7 = nil
            v3 = nil
            for k, n in j, v7, v3 do
                v5 = Asset("Troops", n)
                v6 = v5 and v5.Properties.SkinData[i]
                if v6 then
                    table.insert(v4, {
                        type = "skin",
                        name = i,
                        tower = n,
                        skin = i,
                        rarity = v6.Rarity,
                    })
                end
            end
        end
    else
        local Rarity, v8
        local Items = a1.Consumables.Items or {}
        v1 = nil
        v2 = nil
        for m, i5 in Items, v1, v2 do
            v8 = Asset("Consumables", i5)
            Rarity = v8 and v8.Rarity
            v3 = Rarity and v9.Consumables.Rarities[Rarity]
            if v8 and v3 and v3 > 0 then
                table.insert(v4, {type = "consumable", name = i5, rarity = Rarity})
            end
        end
    end
    table.sort(v4, function(a1, a2) -- Line: 57
        if a1.name == a2.name then
            return (a1.tower or "") < (a2.tower or "")
        end
        return a1.name < a2.name
    end)
    return v4
end

local function createPreviewItems(a1, a2) -- Line: 68
    local v1, v2
    local Amount = if not (a1.Consumables ~= nil) then #a2 else a1.Consumables.Amount
    local v3 = {}
    local v4 = a2
    for i = 1, Amount do
        v2 = if not v1 then v4[i] else v4[(i - 1) % #v4 + 1]
        v3[i] = v2
    end
    return v3
end

local v3 = {}
local u40 = {}
for i, j in CrateData do
    v1 = createCrateItems(j)
    if #v1 ~= 0 then
        table.insert(v3, i)
        v2 = {name = i, items = createPreviewItems(j, v1)}
        u40[i] = v2
    end
end
table.sort(v3)
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {Crate = UILabs.Choose(v3)},
    story = function(a1) -- Line: 105 -- upvalues: createElement (val), RestrictedCrateView (val), u40 (val) -- types: a1: table
        return createElement(RestrictedCrateView, {crate = u40[a1.controls.Crate]})
    end,
}