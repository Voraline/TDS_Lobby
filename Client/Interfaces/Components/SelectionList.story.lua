-- Script path: ReplicatedStorage.Client.Interfaces.Components.SelectionList.story
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SelectionList = require(script.Parent.SelectionList)
local createElement = React.createElement
local useState = React.useState

local function Component() -- Line: 9 -- upvalues: useState (val), createElement (val), SelectionList (val)
    local v1, u3 = useState("Call To Arms")
    return createElement(SelectionList, {
        Title = "Something something",
        Position = UDim2.fromOffset(10, 10),
        Highlight = {"Automatic"},
        Disabled = {"Mega Brap"},
        Values = {"Automatic", "Call To Arms", "Medic Heal", "Swarmer's Throw", "Mega Brap"},
        Selected = v1,
        Clicked = function(a1) -- Line: 21 -- upvalues: u3 (val)
            u3(a1)
        end,
    })
end

return function(a1) -- Line: 27 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 31 -- upvalues: u4 (val)
        u4:unmount()
    end
end