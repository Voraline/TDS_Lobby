-- Script path: ReplicatedStorage.Client.Interfaces.Components.SpriteSheet.story
-- Decompile time: 1.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local SpriteSheet = require(script.Parent.SpriteSheet)
local createElement = React.createElement

local function Component() -- Line: 7 -- upvalues: createElement (val), SpriteSheet (val)
    return createElement(SpriteSheet, {
        BackgroundTransparency = 1,
        playing = true,
        Size = UDim2.fromOffset(200, 200),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        sheets = {
            {
                id = 2632484460,
                max = 50,
                grid = Vector2.new(6, 9),
                size = Vector2.new(113.67, 113.67),
            },
        },
    })
end

return function(a1) -- Line: 29 -- upvalues: createElement (val), Component (val)
    local u3 = ReactRoblox.createRoot(a1)
    u3:render((createElement(Component)))
    return function() -- Line: 33 -- upvalues: u3 (val)
        u3:unmount()
    end
end