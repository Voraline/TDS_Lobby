-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Consumables.ConsumablesContent
-- Decompile time: 1.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ConsumablesEntry = require(script.Parent.ConsumablesEntry)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useConsumables = require(ReplicatedStorage.Client.Interfaces.Hooks.useConsumables)
local useSandboxWhitelist = require(ReplicatedStorage.Client.Interfaces.Hooks.useSandboxWhitelist)
local createElement = React.createElement
return function() -- Line: 13
    -- upvalues: useCharmBinding (val), SandboxStore (val), useSandboxWhitelist (val), useConsumables (val), React (val)
    -- upvalues: createElement (val), ConsumablesEntry (val)
    local v1 = useCharmBinding(SandboxStore.getState):map(function(a1) -- Line: 16
        return a1.SelectedTab == "Consumables"
    end)
    local Consumables = useSandboxWhitelist("Consumables")
    local u12 = useConsumables()
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
        content = React.createElement(React.Fragment, {}, (React.useMemo(function() -- Line: 23 -- upvalues: u12 (val), Consumables (val), createElement (upval), ConsumablesEntry (upval)
            local v1, v2, v3
            local v4 = {}
            for i, j in u12 do
                if Consumables[i] then
                    v1 = createElement
                    v2 = ConsumablesEntry
                    v3 = {
                        enabled = true,
                        idx = 1,
                        id = i,
                        name = j.Name,
                        icon = j.Icon,
                        description = j.Description,
                    }
                    v4[i] = (v1(v2, v3))
                end
            end
            return v4
        end, {u12, Consumables}))),
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15),
            PaddingBottom = UDim.new(0, 10),
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 0),
        }),
        grid = createElement("UIGridLayout", {
            CellSize = UDim2.fromOffset(138, 138),
            CellPadding = UDim2.fromOffset(15, 15),
            SortOrder = Enum.SortOrder.Name,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }, {ratio = createElement("UIAspectRatioConstraint")}),
    })
end