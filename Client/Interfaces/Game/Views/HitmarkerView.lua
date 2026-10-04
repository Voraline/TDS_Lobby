-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.HitmarkerView
-- Decompile time: 1.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hitmarker = require(ReplicatedStorage.Client.Interfaces.Game.Components.Hitmarker)
local HitmarkerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.HitmarkerStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local createElement = React.createElement

local function render() -- Line: 10
    -- upvalues: ReactCharm (val), HitmarkerStore (val), createElement (val), Hitmarker (val), React (val)
    local v1 = {}
    for i, j in (ReactCharm.useSignalState(HitmarkerStore.getState)) do
        v1[i] = (createElement(Hitmarker))
    end
    return createElement(React.Fragment, nil, v1)
end

return function(a1) -- Line: 22 -- upvalues: createElement (val), render (val)
    a1.setDisplayOrder(9)
    a1.setIgnoreGuiInset(true)
    return createElement(render)
end