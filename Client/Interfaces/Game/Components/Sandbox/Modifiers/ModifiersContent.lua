-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Modifiers.ModifiersContent
-- Decompile time: 1.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModifiersEntry = require(script.Parent.ModifiersEntry)
local Paywall = require(ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Paywall)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useGlobalModifiers = require(ReplicatedStorage.Client.Interfaces.Hooks.useGlobalModifiers)
local useHasSandboxGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useHasSandboxGamepass)
local useSandboxWhitelist = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxWhitelist)
local createElement = React.createElement
return function() -- Line: 16
    -- upvalues: useCharmBinding (val), SandboxStore (val), useHasSandboxGamepass (val), useSandboxWhitelist (val)
    -- upvalues: useGlobalModifiers (val), React (val), createElement (val), ModifiersEntry (val), Paywall (val)
    local v1 = useCharmBinding(SandboxStore.getState):map(function(a1) -- Line: 19
        return a1.SelectedTab == "Modifiers"
    end)
    local v2 = useHasSandboxGamepass()
    local Modifiers = useSandboxWhitelist("Modifiers")
    local u14 = useGlobalModifiers()
    local v3 = {u14, Modifiers}
    local v4 = React.useMemo(function() -- Line: 27 -- upvalues: u14 (val), Modifiers (val), createElement (upval), ModifiersEntry (upval)
        local v1, v2, v3
        local v4 = {}
        for i, j in u14 do
            if j.icon and j.displayName and Modifiers[i] then
                v1 = createElement
                v2 = ModifiersEntry
                v3 = {
                    enabled = true,
                    idx = 1,
                    name = j.displayName,
                    icon = j.icon,
                    description = j.description,
                    id = i,
                }
                v4[i] = (v1(v2, v3))
            end
        end
        return v4
    end, v3)
    if not v2 then
        return createElement(Paywall)
    end
    return createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        TopImage = "",
        BottomImage = "",
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = v1,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
    }, {
        content = React.createElement(React.Fragment, {}, v4),
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 5),
            PaddingBottom = UDim.new(0, 5),
            PaddingLeft = UDim.new(0, 5),
            PaddingRight = UDim.new(0, 5),
        }),
        grid = createElement("UIGridLayout", {
            CellSize = UDim2.fromOffset(148, 148),
            CellPadding = UDim2.fromOffset(5, 5),
            SortOrder = Enum.SortOrder.Name,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }, {ratio = createElement("UIAspectRatioConstraint")}),
    })
end