-- Script path: ReplicatedStorage.Client.Interfaces.Components.SegmentedButton.story
-- Decompile time: 1.53 ms

game:GetService("PolicyService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SegmentedButton = require(script.Parent.SegmentedButton)
local createElement = React.createElement
local useState = React.useState

local function Component() -- Line: 10 -- upvalues: useState (val), createElement (val), SegmentedButton (val)
    local v1 = {"Test1", "Test2", "Test3"}
    local v2, u7 = useState(v1[1])
    return createElement(SegmentedButton, {
        Size = UDim2.fromOffset(88, 48),
        Position = UDim2.fromOffset(50, 50),
        AnchorPoint = Vector2.new(0, 0),
        Selected = v2,
        Values = v1,
        Clicked = function(a1) -- Line: 22 -- upvalues: u7 (val)
            u7(a1)
        end,
    })
end

return function(a1) -- Line: 28 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 32 -- upvalues: u4 (val)
        u4:unmount()
    end
end