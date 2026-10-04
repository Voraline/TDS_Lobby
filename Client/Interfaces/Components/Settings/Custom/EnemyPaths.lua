-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Custom.EnemyPaths
-- Decompile time: 2.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SegmentedButton = require(ReplicatedStorage.Client.Interfaces.Components.SegmentedButton)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local u17 = {"Auto", "On", "Off"}
local u21 = {Auto = "Auto", On = "Enabled", Off = "Disabled"}
local u22 = {}
local v1 = {
    __index = function(a1, a2) -- Line: 17 -- upvalues: u17 (val), u21 (val)
        for i, j in u17 do
            if u21[j] == a2 then
                a1[a2] = j
                return j
            end
        end
    end,
}
setmetatable(u22, v1)
return function(a1) -- Line: 27 -- upvalues: createElement (val), SegmentedButton (val), u22 (val), u17 (val), u21 (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked(a1) end
    end
    return createElement(SegmentedButton, {
        Selected = u22[a1.Current or 1],
        Values = u17,
        Clicked = function(a1) -- Line: 34 -- upvalues: Clicked (val), u21 (upval)
            Clicked(u21[a1])
        end,
    })
end