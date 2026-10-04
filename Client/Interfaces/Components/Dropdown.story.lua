-- Script path: ReplicatedStorage.Client.Interfaces.Components.Dropdown.story
-- Decompile time: 2.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Dropdown = require(script.Parent.Dropdown)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement
local useState = React.useState

local function Component() -- Line: 10 -- upvalues: useState (val), createElement (val), Dropdown (val)
    local v1, u3 = useState({Sledger = true})
    return createElement(Dropdown, {
        MaxHeight = 180,
        ShowCheckboxes = true,
        Visible = true,
        Items = {
            {Id = "Sledger", Label = "Sledger", Selected = v1.Sledger == true},
            {Id = "Commander", Label = "Commander", Selected = v1.Commander == true},
            {Id = "Hacker", Label = "Hacker", Selected = v1.Hacker == true},
            {Id = "Ranger", Label = "Ranger", Selected = v1.Ranger == true},
            {Id = "Accelerator", Label = "Accelerator", Selected = v1.Accelerator == true},
            {Id = "Engineer", Label = "Engineer", Selected = v1.Engineer == true},
            {Id = "Trapper", Label = "Trapper", Selected = v1.Trapper == true},
            {Id = "Pyromancer", Label = "Pyromancer", Selected = v1.Pyromancer == true},
        },
        Position = UDim2.fromOffset(32, 32),
        Size = UDim2.fromOffset(240, 0),
        OnItemActivated = function(a1) -- Line: 15 -- upvalues: u3 (val)
            u3(function(a1_2) -- Line: 16 -- upvalues: a1 (val)
                local v1 = table.clone(a1_2)
                local Id = a1.Id or a1.Label
                local Id_2 = a1.Id or a1.Label
                v1[Id] = not v1[Id_2]
                return v1
            end)
        end,
    })
end

return function(a1) -- Line: 75 -- upvalues: ReactRoblox (val), createElement (val), Component (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(Component)))
    return function() -- Line: 79 -- upvalues: u4 (val)
        u4:unmount()
    end
end