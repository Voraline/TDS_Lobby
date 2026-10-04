-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Custom.HealthColor
-- Decompile time: 1.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SegmentedButton = require(ReplicatedStorage.Client.Interfaces.Components.SegmentedButton)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local u17 = {"Green", "Red"}
local u20 = {Green = "Green", Red = "Red"}
local u21 = {}
local v1 = {
    __index = function(a1, a2) -- Line: 16 -- upvalues: u17 (val), u20 (val)
        for i, j in u17 do
            if u20[j] == a2 then
                a1[a2] = j
                return j
            end
        end
    end,
}
setmetatable(u21, v1)
return function(a1) -- Line: 26 -- upvalues: createElement (val), SegmentedButton (val), u21 (val), u17 (val), u20 (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked(a1) end
    end
    return createElement(SegmentedButton, {
        Selected = u21[a1.Current or 1],
        Values = u17,
        Clicked = function(a1) -- Line: 33 -- upvalues: Clicked (val), u20 (upval)
            Clicked(u20[a1])
        end,
    })
end