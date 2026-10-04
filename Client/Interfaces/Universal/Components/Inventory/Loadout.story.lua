-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.Loadout.story
-- Decompile time: 1.65 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Loadouts = require(script.Parent.Loadouts)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render(a1) -- Line: 9 -- upvalues: React (val), Loadouts (val)
    local v1, u5 = React.useState({})
    local v2, u16 = React.useState({{Name = "Wow this is cool", Towers = {"Hacker", "Scout", "Sniper", "Shotgunner"}}})
    return React.createElement(Loadouts, {
        level = 10,
        numLoadoutsCanCreate = 3,
        loadouts = v2,
        towerInventory = v1,
        towersToDisplay = {"Hacker", "Engineer", "Shotgunner", "Sniper", "Medic"},
        onEquipLoadout = function(a1) -- Line: 40 -- upvalues: u5 (val)
            u5(a1.Towers)
        end,
        onRenameLoadout = function(a1, a2) -- Line: 43 -- upvalues: u16 (val)
            u16(function(a1_2) -- Line: 44 -- upvalues: a1 (val), a2 (val)
                local v1 = table.clone(a1_2)
                local v2 = v1[a1]
                v2.Name = a2
                return v1
            end)
        end,
    })
end

return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {},
    story = function(a1) -- Line: 59 -- upvalues: React (val), render (val)
        return React.createElement(render, a1)
    end,
}