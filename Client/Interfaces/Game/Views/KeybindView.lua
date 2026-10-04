-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.KeybindView
-- Decompile time: 4.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Keybind = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Keybind)
local KeybindsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.KeybindsStore)
local MobileButton = require(ReplicatedStorage.Client.Interfaces.Game.Components.MobileButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local createElement = React.createElement

local function renderKeybinds() -- Line: 11
    -- upvalues: ReactCharm (val), KeybindsStore (val), createElement (val), Keybind (val), React (val)
    local v1 = {}
    for i, j in ReactCharm.useSignalState(KeybindsStore.getState).keybinds do
        v1[j.ActionText] = (createElement(Keybind, j))
    end
    return createElement(React.Fragment, nil, v1)
end

local function mobile() -- Line: 23
    -- upvalues: ReactCharm (val), KeybindsStore (val), createElement (val), MobileButton (val), React (val)
    local v1 = {}
    for i, j in ReactCharm.useSignalState(KeybindsStore.getState).keybinds do
        v1[j.ActionText] = (createElement(MobileButton, j))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, createElement(React.Fragment, nil, v1))
end

local function render() -- Line: 40
    -- upvalues: useCharmSelector (val), KeybindsStore (val), React (val), mobile (val), createElement (val)
    -- upvalues: renderKeybinds (val)
    local v1 = useCharmSelector(KeybindsStore.getState, function(a1) -- Line: 41
        return a1.enabled
    end)
    local v2 = useCharmSelector(KeybindsStore.getState, function(a1) -- Line: 45
        return a1.inputType
    end)
    if not v1 then
        return nil
    end
    if v2 == "Mobile" then
        return React.createElement(mobile)
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(1, -50, 1, -50),
        Size = UDim2.fromOffset(466, 278),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 10),
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
        }),
        uIScale = createElement("UIScale", {Scale = 0.8}),
        binds = createElement(renderKeybinds),
    })
end

return function(a1) -- Line: 81 -- upvalues: createElement (val), render (val)
    a1.setDisplayOrder(3)
    return createElement(render)
end