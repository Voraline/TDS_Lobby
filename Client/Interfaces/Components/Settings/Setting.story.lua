-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Setting.story
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Setting = require(script.Parent.Setting)
local createElement = React.createElement

local function Component() -- Line: 8 -- upvalues: createElement (val), Setting (val)
    return createElement(Setting, {
        Icon = 11857757188,
        Title = "Music Volume",
        Description = "Adjust how loud in-game music plays",
        Size = UDim2.fromOffset(400, 80),
        Position = UDim2.fromOffset(50, 50),
        AnchorPoint = Vector2.new(0, 0),
    })
end

return function(a1) -- Line: 20 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 24 -- upvalues: u4 (val)
        u4:unmount()
    end
end