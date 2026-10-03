-- Script path: ReplicatedStorage.Client.Interfaces.Components.TooltipWindow.story
-- Decompile time: 0.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local useReactBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBinding)
local TooltipWindow = require(script.Parent.TooltipWindow).TooltipWindow
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement

local function Container() -- Line: 11 -- upvalues: useReactBinding (val), createElement (val), TooltipWindow (val)
    return createElement(TooltipWindow, {
        Header = "Engineer",
        Subject = "Hardcore Tower",
        Visible = useReactBinding(true),
        Position = UDim2.fromOffset(50, 50),
        Content = {
            {Text = "Loren ipsum asdasdasd asdasd   "},
            {Text = "Hello!"},
            {Text = "Hello!"},
            {Text = "Hello!"},
            {Text = "Hello!"},
            {Text = "1,000 Coins!", Icon = 6794338720},
        },
    })
end

return function(a1) -- Line: 49 -- upvalues: createElement (val), Container (val), ReactRoblox (val)
    local v1 = createElement(Container)
    local u7 = ReactRoblox.createRoot(a1)
    u7:render(v1)
    return function() -- Line: 54 -- upvalues: u7 (val)
        u7:unmount()
    end
end