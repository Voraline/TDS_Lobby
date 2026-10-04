-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Custom.Sound
-- Decompile time: 1.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local SegmentedButton = require(ReplicatedStorage.Client.Interfaces.Components.SegmentedButton)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local u22 = {"Muted", "Low", "Medium", "Loud"}
local u27 = {Muted = 0, Low = 0.5, Medium = 1, Loud = 2}
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
local u32 = setmetatable({}, v1)
local v2 = {
    {Text = 0.8, Value = Enum.UIScale.Small},
    {Text = 1, Value = Enum.UIScale.Default},
    {Text = 1.2, Value = Enum.UIScale.Large},
}
return function(a1) -- Line: 35 -- upvalues: createElement (val), SegmentedButton (val), u32 (val), u22 (val), u27 (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked(a1) end
    end
    return createElement(SegmentedButton, {
        Selected = u32[a1.Current or 1],
        Values = u22,
        Clicked = function(a1) -- Line: 42 -- upvalues: Clicked (val), u27 (upval)
            Clicked(u27[a1])
        end,
    })
end