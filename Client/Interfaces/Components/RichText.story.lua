-- Script path: ReplicatedStorage.Client.Interfaces.Components.RichText.story
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local RichText = require(script.Parent.RichText)
local createElement = React.createElement

local function Component() -- Line: 8 -- upvalues: createElement (val), RichText (val)
    return createElement(RichText, {
        Animated = true,
        Text = "<rainbow>bears</rainbow>. <fallen>of polar variety</fallen>",
        Size = UDim2.new(1, 0, 0, 40),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
end

return function(a1) -- Line: 19 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 23 -- upvalues: u4 (val)
        u4:unmount()
    end
end