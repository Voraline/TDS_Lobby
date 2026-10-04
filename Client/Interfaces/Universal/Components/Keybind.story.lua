-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Keybind.story
-- Decompile time: 3.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Keybind = require(script.Parent.Keybind)
local createElement = React.createElement
local u21 = {}
local v1 = {
    ActionText = "RELOAD",
    Layout = 2,
    ScaleMultiplier = 0.6,
    Key = Enum.KeyCode.ButtonY,
    CallBack = function(a1) -- Line: 12
        warn((("Reload: %*"):format(a1)))
    end,
}
local v2 = {
    ActionText = "EXIT",
    Layout = 3,
    ScaleMultiplier = 0.6,
    Key = Enum.KeyCode.ButtonB,
    CallBack = function(a1) -- Line: 21
        warn((("Exit: %*"):format(a1)))
    end,
}
local v3 = {
    ActionText = "FIRE",
    Layout = 1,
    ScaleMultiplier = 0.6,
    Key = Enum.KeyCode.ButtonR2,
    CallBack = function(a1) -- Line: 30
        warn((("Fire: %*"):format(a1)))
    end,
}
u21[1] = v1
u21[2] = v2
u21[3] = v3

local function keybind() -- Line: 38 -- upvalues: u21 (val), createElement (val), Keybind (val), React (val)
    local v1 = {}
    for i, j in u21 do
        v1[j.ActionText] = (createElement(Keybind, j))
    end
    return React.createElement(React.Fragment, nil, v1)
end

local function render() -- Line: 48 -- upvalues: createElement (val), keybind (val)
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
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        uIScale = createElement("UIScale", {Scale = 0.8}),
        fBind = createElement(keybind),
    })
end

return function(a1) -- Line: 73 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render)))
    return function() -- Line: 77 -- upvalues: u4 (val)
        u4:unmount()
    end
end