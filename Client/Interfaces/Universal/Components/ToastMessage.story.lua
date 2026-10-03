-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.ToastMessage.story
-- Decompile time: 0.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local ToastMessage = require(script.Parent.ToastMessage)
local createElement = React.createElement
return function(a1) -- Line: 10 -- upvalues: createElement (val), ToastMessage (val), ReactRoblox (val)
    local v1 = createElement(ToastMessage, {
        text = "This is a toast notification!",
        native = {
            Size = UDim2.fromScale(0.8, 0.15),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
        },
    })
    local u21 = ReactRoblox.createRoot(a1)
    u21:render(v1)
    return function() -- Line: 23 -- upvalues: u21 (val)
        u21:unmount()
    end
end