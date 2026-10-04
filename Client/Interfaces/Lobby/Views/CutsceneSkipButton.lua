-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.CutsceneSkipButton
-- Decompile time: 1.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local CutSceneController = require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController)
local CutsceneStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.CutsceneStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local SkipButton = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.SkipButton)
local useCharmSelector = require(Hooks.useCharmSelector)
local createElement = React.createElement
local u40 = React.memo(function() -- Line: 14
    -- upvalues: useCharmSelector (val), CutsceneStore (val), createElement (val), SkipButton (val)
    -- upvalues: CutSceneController (val)
    return createElement(SkipButton, {
        visible = useCharmSelector(CutsceneStore.getState, function(a1) -- Line: 15
            return a1.enabled and a1.skipEnabled
        end),
        onActivated = function() -- Line: 21 -- upvalues: CutSceneController (upval)
            CutSceneController.SkipPlayingCutScenes()
        end,
    })
end)
return function(a1) -- Line: 27 -- upvalues: createElement (val), u40 (val)
    a1.setDisplayOrder(999999999)
    a1.setIgnoreGuiInset(true)
    a1.setScreenInsets(Enum.ScreenInsets.None)
    return createElement(u40)
end