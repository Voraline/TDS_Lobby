-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.AbilityIndicator
-- Decompile time: 0.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AbilityIndicator = require(ReplicatedStorage.Client.Interfaces.Game.Components.AbilityIndicator)
local AbilityIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilityIndicatorStore)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
local u34 = {}

function u34.Render() -- Line: 15
    -- upvalues: ReactCharm (val), AbilityIndicatorStore (val), createElement (val), AbilityIndicator (val)
    local v1 = ReactCharm.useSignalState(AbilityIndicatorStore.getState)
    local target = v1.target
    return createElement(AbilityIndicator, {Visible = target ~= nil, Target = target, Icon = v1.icon})
end

return function() -- Line: 28 -- upvalues: ReactRoblox (val), createElement (val), u34 (val)
    return ReactRoblox.createPortal({indicator = createElement(u34.Render)}, workspace.CurrentCamera, "indicator")
end