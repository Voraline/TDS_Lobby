-- Script path: ReplicatedStorage.Client.Interfaces.Components.Toast.story
-- Decompile time: 1.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Toast = require(script.Parent.Toast)
return function(a1) -- Line: 8 -- upvalues: React (val), Toast (val), ReactRoblox (val)
    local v1 = React.createElement(function() -- Line: 9 -- upvalues: React (upval), Toast (upval)
        return React.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(500, 400),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }, {
            toast = React.createElement(Toast, {
                title = "Achievement Completed!",
                description = "You have completed the \"Test Quest\" achievement!",
                duration = -1,
            }),
        })
    end)
    local u8 = ReactRoblox.createRoot(a1)
    u8:render(v1)
    return function() -- Line: 28 -- upvalues: u8 (val)
        u8:unmount()
    end
end