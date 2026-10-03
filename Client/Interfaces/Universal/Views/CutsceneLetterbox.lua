-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.CutsceneLetterbox
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local CutsceneStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.CutsceneStore)
local Letterbox = require(ReplicatedStorage.Client.Interfaces.Game.Components.Letterbox)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCharmSelector = require(Hooks.useCharmSelector)
local createElement = React.createElement
local u34 = React.memo(function() -- Line: 13 -- upvalues: useCharmSelector (val), CutsceneStore (val), createElement (val), Letterbox (val)
    return createElement(Letterbox, {
        zIndex = 999,
        visible = useCharmSelector(CutsceneStore.getState, function(a1) -- Line: 14
            return a1.enabled and a1.letterboxEnabled
        end),
        barColor = Color3.fromRGB(0, 0, 0),
        aspectRatio = useCharmSelector(CutsceneStore.getState, function(a1) -- Line: 18
            return a1.aspectRatio or 2.3333333333333335
        end),
    })
end)
return function(a1) -- Line: 30 -- upvalues: createElement (val), u34 (val)
    a1.setDisplayOrder(10)
    a1.setIgnoreGuiInset(true)
    a1.setScreenInsets(Enum.ScreenInsets.None)
    return createElement(u34)
end