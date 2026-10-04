-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.AreaIndicators
-- Decompile time: 1.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AreaIndicator = require(ReplicatedStorage.Client.Interfaces.Game.Components.AreaIndicator)
local AreaIndicatorFull = require(ReplicatedStorage.Client.Interfaces.Game.Components.AreaIndicatorFull)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local u47 = {full = AreaIndicatorFull, normal = AreaIndicator}

local function render() -- Line: 19
    -- upvalues: ReactCharm (val), AreaIndicatorStore (val), createElement (val), u47 (val), React (val)
    local v1, v2
    local v3 = {}
    for i, j in (ReactCharm.useSignalState(AreaIndicatorStore.getState)) do
        v1 = createElement
        v2 = u47[j.type]
        v3[i] = (v1(v2, j))
    end
    return createElement(React.Fragment, nil, v3)
end

return function() -- Line: 31 -- upvalues: Create (val), ReactRoblox (val), createElement (val), render (val)
    return ReactRoblox.createPortal(
        {indicator = createElement(render)},
        (Create("Folder", {Name = "AreaIndicators", Parent = workspace.CurrentCamera}))
    )
end