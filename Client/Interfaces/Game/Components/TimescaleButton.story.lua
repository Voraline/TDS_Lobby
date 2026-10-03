-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TimescaleButton.story
-- Decompile time: 1.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TimescaleButton = require(script.Parent.TimescaleButton)
return function(a1) -- Line: 7 -- upvalues: React (val), TimescaleButton (val), ReactRoblox (val)
    local createElement_3, v1, v2
    local v3 = {}
    for i, j in {
        {state = "locked", speed = 1},
        {state = "paused", speed = 0},
        {state = "normal", speed = 1},
        {state = "fast", speed = 2},
    } do
        createElement_3 = React.createElement
        v2 = TimescaleButton
        v1 = {
            state = j.state,
            speed = j.speed,
            onClick = function() -- Line: 20 -- upvalues: j (val)
                print((("clicked %*"):format(j.state)))
            end,
        }
        v3[i] = (createElement_3(v2, v1))
    end
    local u21 = ReactRoblox.createRoot(a1)
    u21:render((React.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
    }, {
        Layout = React.createElement("UIGridLayout", {
            CellPadding = UDim2.new(0, 16, 0, 16),
            CellSize = UDim2.new(0, 52, 0, 52),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        Buttons = React.createElement(React.Fragment, {}, v3),
    })))
    return function() -- Line: 41 -- upvalues: u21 (val)
        u21:unmount()
    end
end