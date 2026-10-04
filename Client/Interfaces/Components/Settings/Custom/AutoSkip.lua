-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Custom.AutoSkip
-- Decompile time: 1.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useGamepass)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local ToggleButton = require(ReplicatedStorage.Client.Interfaces.Components.ToggleButton)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
return function(a1) -- Line: 11 -- upvalues: useSound (val), useGamepass (val), createElement (val), ToggleButton (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked(a1) end
    end
    local Click = useSound("Click")
    local u8, u9 = useGamepass(10518590)
    return createElement("Frame", {
        ZIndex = 2,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = if not u8 then 0.6 else 1,
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        toggle = createElement(ToggleButton, {
            Enabled = a1.Current,
            Clicked = function() -- Line: 29 -- upvalues: Click (val), u8 (val), u9 (val), Clicked (val), a1 (val)
                Click()
                if not u8 then
                    u9()
                    return
                end
                Clicked(not a1.Current)
            end,
        }),
    })
end