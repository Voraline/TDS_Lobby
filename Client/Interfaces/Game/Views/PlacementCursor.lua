-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.PlacementCursor
-- Decompile time: 2.43 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local PathCursorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.PathCursorStore)
local PlacementCursor = require(ReplicatedStorage.Client.Interfaces.Game.Components.PlacementCursor)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local LocalPlayer = Players.LocalPlayer
local createElement = React.createElement
local useRef = React.useRef
return function() -- Line: 17
    -- upvalues: useCharmSelector (val), PathCursorStore (val), useCharmBinding (val), createElement (val)
    -- upvalues: PlacementCursor (val), ReactRoblox (val)
    local v1 = useCharmSelector(PathCursorStore.getState, function(a1) -- Line: 18
        return a1.visible
    end)
    local v2 = useCharmSelector(PathCursorStore.getState, function(a1) -- Line: 21
        return a1.size
    end)
    local v3 = useCharmBinding(PathCursorStore.getState, function(a1) -- Line: 24
        return CFrame.new(a1.position)
    end)
    if not v1 then
        return nil
    end
    return ReactRoblox.createPortal({
        placementCursor = createElement("Folder", {Name = "PlacementCursor"}, {cursor = createElement(PlacementCursor, {cframe = v3, size = v2})}),
    }, workspace.CurrentCamera, "placementCursor")
end