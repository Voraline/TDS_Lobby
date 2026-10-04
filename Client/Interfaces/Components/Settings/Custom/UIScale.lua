-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Custom.UIScale
-- Decompile time: 1.62 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local SegmentedButton = require(ReplicatedStorage.Client.Interfaces.Components.SegmentedButton)
local createElement = React.createElement
local u22 = {"Small", "Default", "Large", "Huge"}
local u27 = {
    Small = Enum.UIScale.Small,
    Default = Enum.UIScale.Default,
    Large = Enum.UIScale.Large,
    Huge = Enum.UIScale.Huge,
}
local u36 = {}
local v1 = {
    __index = function(a1, a2) -- Line: 19 -- upvalues: u22 (val), u27 (val)
        for i, j in u22 do
            if u27[j] == a2 then
                a1[a2] = j
                return j
            end
        end
    end,
}
setmetatable(u36, v1)
return function(a1) -- Line: 29 -- upvalues: createElement (val), SegmentedButton (val), u36 (val), u22 (val), u27 (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked(a1) end
    end
    return createElement(SegmentedButton, {
        Selected = u36[a1.Current or 1],
        Values = u22,
        Clicked = function(a1) -- Line: 36 -- upvalues: Clicked (val), u27 (upval)
            Clicked(u27[a1])
        end,
    })
end