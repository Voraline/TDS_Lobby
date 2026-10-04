-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.MissionFilterPanel
-- Decompile time: 1.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Dropdown = require(ReplicatedStorage.Client.Interfaces.Components.Dropdown)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 16 -- upvalues: createElement (val), Dropdown (val) -- types: a1: table
    local v1 = {}
    local v2 = nil
    local v3 = nil
    for i, j in a1.Options, v2, v3 do
        table.insert(v1, {Id = j, Label = j, LayoutOrder = i, Selected = a1.ActiveFilters[j] == true})
    end
    return createElement(Dropdown, {
        EmptyText = "No filters",
        MaxHeight = 220,
        ShowCheckboxes = true,
        ZIndex = 20,
        Items = v1,
        Position = UDim2.new(0.7, 0, 0.095, 0),
        Size = UDim2.new(0.23, 0, 0, 0),
        Visible = a1.Visible,
        OnItemActivated = function(a1_2) -- Line: 38 -- upvalues: a1 (val)
            a1.OnToggleFilter(a1_2.Id or a1_2.Label)
        end,
    })
end