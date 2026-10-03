-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.ToolTipKeybind
-- Decompile time: 1.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Keybind = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Keybind)
local React = require(ReplicatedStorage.Shared.UI.React)
local ToolTipKeybindStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ToolTipKeybindStore)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local createElement = React.createElement
local useBinding = React.useBinding
local useEffect = React.useEffect

local function render(a1) -- Line: 16
    -- upvalues: useBinding (val), useEffect (val), RunService (val), UserInputService (val), createElement (val)
    -- upvalues: Keybind (val)
    local v1, u5 = useBinding(UDim2.new())
    useEffect(function() -- Line: 19 -- upvalues: RunService (upval), UserInputService (upval), u5 (val)
        local u5_2 = RunService.RenderStepped:Connect(function() -- Line: 20 -- upvalues: UserInputService (upval), u5 (upval)
            local MouseLocation = UserInputService:GetMouseLocation()
            u5(UDim2.fromOffset(MouseLocation.X + 20, MouseLocation.Y - 26))
        end)
        return function() -- Line: 24 -- upvalues: u5_2 (ref)
            u5_2:Disconnect()
            u5_2 = nil
        end
    end, {})
    local v2 = {}
    for i, j in a1.binds do
        v2[i] = (createElement(Keybind, j))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(10, 10),
        Position = v1,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
    }, v2)
end

return function(a1) -- Line: 50
    -- upvalues: useCharmSelector (val), ToolTipKeybindStore (val), table (val), createElement (val), render (val)
    local v1 = useCharmSelector(ToolTipKeybindStore.getState, function(a1) -- Line: 51
        return a1.binds
    end)
    if not v1 or table.count(v1) == 0 then
        return nil
    end
    return createElement(render, {binds = v1})
end