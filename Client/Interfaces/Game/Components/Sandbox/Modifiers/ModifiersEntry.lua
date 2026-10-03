-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Modifiers.ModifiersEntry
-- Decompile time: 1.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local Sandbox = NewNetwork.Channel("Sandbox")

local function map(a1, a2, a3, a4, a5) -- Line: 19
    return (a1 - a2) / (a3 - a2) * (a5 - a4) + a4
end

return function(a1) -- Line: 32
    -- upvalues: useSpring (val), useGameStateValue (val), useSound (val), React (val), createElement (val)
    -- upvalues: BattlepassPreview (val), Sandbox (val), Tooltip (val), ImageLabel (val)
    local v1, u14 = useSpring(if not a1.enabled then 0 else 1, 1, 30 - a1.idx * 1.5, true)
    local v2 = (useGameStateValue("GlobalModifiersEnabled", {}))[a1.id]
    local Click = useSound("Click")
    local useEffect = React.useEffect
    local v3 = {a1.enabled}
    useEffect(function() -- Line: 41 -- upvalues: u14 (val), a1 (val)
        u14(if not a1.enabled then 0 else 1)
    end, v3)
    local v4 = v1:map(function(a1) -- Line: 45
        return 1 - a1
    end)
    local v5 = {innerSize = UDim2.fromScale(0.95, 0.95)}
    local v6 = v2 and Color3.fromRGB(219, 200, 113) or Color3.fromRGB(58, 58, 58)
    v5.color = v6

    function v5.clicked() -- Line: 52 -- upvalues: Click (val), Sandbox (upval), a1 (val)
        Click()
        Sandbox:fireServer("ToggleModifier", a1.id)
    end

    return createElement(BattlepassPreview, v5, {
        Tooltip = createElement(Tooltip, {
            Subject = "Modifier",
            Name = a1.name,
            Header = a1.name,
            Disabled = not a1.enabled,
            Content = {{Text = a1.description}},
        }),
        icon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 2,
            ScaleType = Enum.ScaleType.Fit,
            Image = ("rbxassetid://%*"):format(a1.icon),
            ImageTransparency = v4,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
        }),
    })
end