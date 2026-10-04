-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Custom.SkillsEnabled
-- Decompile time: 2.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local ToggleButton = require(ReplicatedStorage.Client.Interfaces.Components.ToggleButton)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
return function(a1) -- Line: 13
    -- upvalues: useSound (val), useGameStateValue (val), createElement (val), ToggleButton (val), Notification (val)
    local Clicked = a1.Clicked
    if not Clicked then
        function Clicked(a1) end
    end
    local Click = useSound("Click")
    local v1 = useGameStateValue("Intermission", false)
    local u14 = true
    if workspace.Type.Value ~= "Lobby" then
        u14 = v1
    end
    return createElement("Frame", {
        ZIndex = 2,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = if not u14 then 0.6 else 1,
    }, {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        toggle = createElement(ToggleButton, {
            Enabled = a1.Current,
            Clicked = function() -- Line: 33 -- upvalues: Click (val), u14 (val), Notification (upval), Clicked (val), a1 (val)
                Click()
                if not u14 then
                    Notification.Create({
                        Text = "You can only change this setting in the Lobby or Intermission Lobby.",
                        Color = Color3.fromRGB(255, 0, 0),
                    })
                    return
                end
                Clicked(not a1.Current)
            end,
        }),
    })
end