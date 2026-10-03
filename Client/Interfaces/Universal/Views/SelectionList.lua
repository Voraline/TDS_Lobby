-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.SelectionList
-- Decompile time: 0.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SelectionListStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SelectionListStore)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local SelectionList = require(ReplicatedStorage.Client.Interfaces.Components.SelectionList)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local createElement = React.createElement
local Event = React.Event
return function(a1) -- Line: 14
    -- upvalues: ReactCharm (val), SelectionListStore (val), useSound (val), createElement (val), Event (val)
    -- upvalues: SelectionList (val)
    local u5 = ReactCharm.useSignalState(SelectionListStore.getState)
    local Click = useSound("Click")
    local v1 = createElement
    local v2 = {
        Text = "",
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        Visible = u5.enabled,
        Active = u5.enabled,
        ZIndex = 999,
    }

    v2[Event.Activated] = function() -- Line: 30 -- upvalues: SelectionListStore (upval), u5 (val)
        SelectionListStore.update({})
        SelectionListStore.selected:Fire(u5, nil)
    end

    return v1("TextButton", v2, {
        menu = createElement(SelectionList, {
            AnchorPoint = Vector2.new(0.5, 0),
            Position = u5.position,
            Values = u5.values,
            Disabled = u5.disabled,
            Highlight = u5.highlight,
            Selected = u5.selected,
            Title = u5.title,
            Clicked = function(a1) -- Line: 46 -- upvalues: SelectionListStore (upval), Click (val), u5 (val)
                SelectionListStore.update({})
                Click()
                SelectionListStore.selected:Fire(u5, a1)
            end,
        }),
    })
end