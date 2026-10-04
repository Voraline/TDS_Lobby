-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.CutsceneSubtitle
-- Decompile time: 4.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local CutsceneStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.CutsceneStore)
local CutsceneSubtitle = require(ReplicatedStorage.Client.Interfaces.Game.Components.CutsceneSubtitle)
local React = require(ReplicatedStorage.Shared.UI.React)
local SubtitleStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SubtitleStore)
local usePropertyValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePropertyValue)
local useCharmSelector = require(Hooks.useCharmSelector)
local createElement = React.createElement
local u47 = React.memo(function(a1) -- Line: 17
    -- upvalues: useCharmSelector (val), SubtitleStore (val), CutsceneStore (val), usePropertyValue (val), React (val)
    -- upvalues: createElement (val), CutsceneSubtitle (val)
    local v1 = useCharmSelector(SubtitleStore.getState, function(a1) -- Line: 18
        return a1.text
    end)
    local v2 = useCharmSelector(SubtitleStore.getState, function(a1) -- Line: 22
        return a1.speaker
    end)
    local v3 = useCharmSelector(SubtitleStore.getState, function(a1) -- Line: 26
        return a1.speakerColor
    end)
    local v4 = useCharmSelector(SubtitleStore.getState, function(a1) -- Line: 30
        return a1.visible
    end)
    local u25 = useCharmSelector(CutsceneStore.getState, function(a1) -- Line: 34
        return a1.aspectRatio or 2.3333333333333335
    end)
    local u29 = usePropertyValue(a1.screen, "AbsoluteSize")
    local v5, u34 = React.useState(0)
    local v6 = {u25, u29}
    React.useEffect(function() -- Line: 41 -- upvalues: u29 (val), u25 (val), u34 (val)
        local X = u29.X
        local Y = u29.Y
        local v1 = X / u25
        if not (Y <= v1) then
            local v2 = Y - v1
            u34(Y - v2)
        else
            u34(Y - math.abs(Y - v1))
        end
        local u27 = (workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")):Connect(function() -- Line: 42 -- upvalues: u29 (upval), u25 (upval), u34 (upval)
            local X = u29.X
            local Y = u29.Y
            local v1 = X / u25
            if Y <= v1 then
                u34(Y - math.abs(Y - v1))
                return
            end
            local v2 = Y - v1
            u34(Y - v2)
        end)
        return function() -- Line: 62 -- upvalues: u27 (val)
            if u27 and u27.Connected then
                u27:Disconnect()
            end
        end
    end, v6)
    return createElement(CutsceneSubtitle, {
        size = UDim2.fromScale(0.8, 0.5),
        position = UDim2.new(0.5, 0, 0, v5),
        anchorPoint = Vector2.new(0.5, 1),
        text = v1,
        speaker = v2,
        speakerColor = v3,
        visible = v4,
    })
end)
return function(a1) -- Line: 80 -- upvalues: createElement (val), u47 (val)
    return createElement(u47, a1)
end