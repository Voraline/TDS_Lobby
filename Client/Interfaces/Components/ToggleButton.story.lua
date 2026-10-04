-- Script path: ReplicatedStorage.Client.Interfaces.Components.ToggleButton.story
-- Decompile time: 1.25 ms

game:GetService("PolicyService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local ToggleButton = require(script.Parent.ToggleButton)
local createElement = React.createElement
local useState = React.useState

local function Component() -- Line: 10 -- upvalues: useState (val), createElement (val), ToggleButton (val)
    local u2, u3 = useState(false)
    return createElement(ToggleButton, {
        Size = UDim2.fromOffset(100, 80),
        Position = UDim2.fromOffset(50, 50),
        AnchorPoint = Vector2.new(0, 0),
        Enabled = u2,
        Clicked = function() -- Line: 19 -- upvalues: u3 (val), u2 (val)
            u3(not u2)
        end,
    })
end

return function(a1) -- Line: 25 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 29 -- upvalues: u4 (val)
        u4:unmount()
    end
end