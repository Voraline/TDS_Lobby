-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.towerInventoryButton.story
-- Decompile time: 1.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local InventoryItem = require(script.Parent.InventoryItem)
local createElement = React.createElement

local function render() -- Line: 8 -- upvalues: createElement (val), InventoryItem (val)
    return createElement(InventoryItem, {
        towerName = "Scout",
        skin = "Plushie",
        selected = false,
        onClick = function() -- Line: 14
            print("Clicked")
        end,
    })
end

return function(a1) -- Line: 21 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render, {})))
    return function() -- Line: 25 -- upvalues: u4 (val)
        u4:unmount()
    end
end