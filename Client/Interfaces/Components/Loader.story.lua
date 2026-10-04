-- Script path: ReplicatedStorage.Client.Interfaces.Components.Loader.story
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Loader = require(script.Parent.Loader)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function Component() -- Line: 8 -- upvalues: createElement (val), Loader (val)
    return createElement(Loader, {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(50, 50),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    })
end

return function(a1) -- Line: 17 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 21 -- upvalues: u4 (val)
        u4:unmount()
    end
end