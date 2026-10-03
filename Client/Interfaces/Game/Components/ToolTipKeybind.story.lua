-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.ToolTipKeybind.story
-- Decompile time: 1.09 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Keybind = require(script.Parent.Keybind)
local createElement = React.createElement

local function render() -- Line: 18 -- upvalues: createElement (val), Keybind (val)
    local v1 = {
        Rotate = {ActionText = "Rotate", Layout = 1, ScaleMultiplier = 0.6, Key = Enum.KeyCode.R},
        Place = {
            ActionText = "Place",
            Layout = 2,
            ScaleMultiplier = 0.6,
            ForceConsole = true,
            Key = Enum.KeyCode.ButtonL1,
        },
        e = {
            ActionText = "Back",
            Layout = 2,
            ScaleMultiplier = 0.6,
            ForceConsole = true,
            Icon = "http://www.roblox.com/asset/?id=6429468711",
            IconSize = 1.25,
            Key = Enum.KeyCode.ButtonB,
        },
        ojk = {
            ActionText = "Hi :D",
            Layout = 3,
            ScaleMultiplier = 0.6,
            ForceConsole = true,
            Icon = "http://www.roblox.com/asset/?id=6429468581",
            IconSize = 1.25,
            Key = Enum.KeyCode.F,
        },
    }
    local v2 = {}
    for i, j in v1 do
        v2[i] = (createElement(Keybind, j))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(10, 10),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        uIListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
        }),
    }, v2)
end

return function(a1) -- Line: 80 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render, {})))
    return function() -- Line: 85 -- upvalues: u4 (val)
        u4:unmount()
    end
end