-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Custom.EquipTowerPets
-- Decompile time: 1.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local ToggleButton = require(ReplicatedStorage.Client.Interfaces.Components.ToggleButton)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
return function(a1) -- Line: 10 -- upvalues: useSound (val), createElement (val), ToggleButton (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked(a1) end
    end
    local Click = useSound("Click")
    return createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        toggle = createElement(ToggleButton, {
            Enabled = a1.Current,
            Clicked = function() -- Line: 27 -- upvalues: Click (val), Clicked (val), a1 (val)
                Click()
                Clicked(not a1.Current)
            end,
        }),
    })
end