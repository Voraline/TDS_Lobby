-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.MobileButton.story
-- Decompile time: 1.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MobileButton = require(script.Parent.MobileButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 7 -- upvalues: React (val), MobileButton (val)
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        fireButton = React.createElement(MobileButton, {
            FireStick = true,
            Size = 100,
            Text = "FIRE",
            Icon = "",
            Position = UDim2.fromScale(0.2, 0.7),
            Callback = function() end,
        }),
        reloadButton = React.createElement(MobileButton, {
            FireStick = false,
            Size = 60,
            Text = "RELOAD",
            Icon = "",
            Position = UDim2.fromScale(0.72, 0.6),
            Callback = function() end,
        }),
        exitButton = React.createElement(MobileButton, {
            FireStick = false,
            Size = 60,
            Text = "EXIT",
            Icon = "",
            Position = UDim2.fromScale(0.83, 0.56),
            Callback = function() end,
        }),
    })
end

return function(a1) -- Line: 41 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 46 -- upvalues: u4 (val)
        u4:unmount()
    end
end