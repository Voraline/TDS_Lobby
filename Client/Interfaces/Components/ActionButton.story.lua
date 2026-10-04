-- Script path: ReplicatedStorage.Client.Interfaces.Components.ActionButton.story
-- Decompile time: 1.58 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ActionButton = require(script.Parent.ActionButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
return function(a1) -- Line: 9 -- upvalues: ReactRoblox (val), createElement (val), ActionButton (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        Claim = createElement(ActionButton, {
            Label = "Claim",
            Variant = "primary",
            Position = UDim2.fromOffset(120, 60),
            Size = UDim2.fromOffset(160, 44),
            OnActivated = function() end,
        }),
        Purchase = createElement(ActionButton, {
            Label = "1,200",
            Variant = "purchase",
            Position = UDim2.fromOffset(120, 124),
            Size = UDim2.fromOffset(160, 44),
            OnActivated = function() end,
        }),
        Abandon = createElement(ActionButton, {
            Label = "Abandon Mission",
            Variant = "danger",
            Position = UDim2.fromOffset(120, 188),
            Size = UDim2.fromOffset(220, 44),
            OnActivated = function() end,
        }),
    })))
    return function() -- Line: 38 -- upvalues: u4 (val)
        u4:unmount()
    end
end