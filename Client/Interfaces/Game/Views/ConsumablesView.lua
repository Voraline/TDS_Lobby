-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.ConsumablesView
-- Decompile time: 1.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CircularRangeRing = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.CircularRangeRing)
local ConsumableInfo = require(ReplicatedStorage.Client.Interfaces.Game.Components.ConsumableInfo)
local ConsumablesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.ConsumablesStore)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useBinding = React.useBinding
local createElement = React.createElement

local function consumableUI(a1) -- Line: 16
    -- upvalues: createElement (val), useBinding (val), CircularRangeRing (val), ConsumableInfo (val), React (val)
    return createElement(function() -- Line: 17
        -- upvalues: useBinding (upval), a1 (val), createElement (upval), CircularRangeRing (upval)
        -- upvalues: ConsumableInfo (upval), React (upval)
        return createElement(React.Fragment, nil, {
            createElement(CircularRangeRing, {
                alwaysOnTop = true,
                target = a1.target,
                radius = useBinding(a1.radius),
                color = a1.color,
            }),
            a1.owner and a1.replicator and createElement(ConsumableInfo, {
                ownerId = a1.owner.UserId,
                adornee = a1.target,
                offset = a1.infoOffset,
                replicator = a1.replicator,
                color3 = a1.color,
            }),
        })
    end)
end

local function render() -- Line: 44
    -- upvalues: ReactCharm (val), ConsumablesStore (val), createElement (val), consumableUI (val), React (val)
    local color, v1
    local v2 = {}
    local v3 = (ReactCharm.useSignalState(ConsumablesStore.getState))
    local v4 = nil
    local v5 = nil
    for i, j in v3, v4, v5 do
        v1 = {target = j.target, radius = j.range}
        color = j.color or Color3.fromRGB(255, 255, 255)
        v1.color = color
        v1.owner = j.owner
        v1.replicator = j.replicator
        v1.infoOffset = j.infoOffset
        v2[i] = (createElement(consumableUI, v1))
    end
    return createElement(React.Fragment, nil, v2)
end

return function() -- Line: 62 -- upvalues: Create (val), ReactRoblox (val), createElement (val), render (val)
    return ReactRoblox.createPortal(
        {rings = createElement(render)},
        (Create("Folder", {Name = "ConsumablesUI", Parent = workspace.CurrentCamera}))
    )
end