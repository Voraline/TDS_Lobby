-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Spotlight
-- Decompile time: 0.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Spotlight = require(ReplicatedStorage.Client.Interfaces.Game.Components.Spotlight)
local SpotlightStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local createElement = React.createElement
local useRef = React.useRef
return function(a1) -- Line: 11
    -- upvalues: ReactCharm (val), SpotlightStore (val), useRef (val), createElement (val), Spotlight (val)
    local v1 = ReactCharm.useSignalState(SpotlightStore.getState)
    local v2 = useRef()
    v2.current = if not v1.selected then nil else v1.objects[v1.selected]
    return createElement(Spotlight, {rootRef = v2, visible = v2.current ~= nil})
end