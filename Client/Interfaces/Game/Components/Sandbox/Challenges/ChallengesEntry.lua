-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Challenges.ChallengesEntry
-- Decompile time: 3.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local Sandbox = NewNetwork.Channel("Sandbox")
return function(a1) -- Line: 24
    -- upvalues: useGameStateValue (val), useSound (val), createElement (val), BattlepassPreview (val), Sandbox (val)
    local v1 = useGameStateValue("SandboxedChallenge") == a1.id
    local Click = useSound("Click")
    local v2 = {innerSize = UDim2.fromScale(1, 1)}
    local v3 = v1 and Color3.fromRGB(219, 200, 113) or Color3.fromRGB(58, 58, 58)
    v2.color = v3

    function v2.clicked() -- Line: 33 -- upvalues: Click (val), Sandbox (upval), a1 (val)
        Click()
        Sandbox:fireServer("StartChallenge", a1.id, a1.id)
    end

    return createElement(BattlepassPreview, v2, {
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://6053790733",
            ImageTransparency = 0,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
        }),
        name = createElement("TextLabel", {
            TextWrapped = true,
            BackgroundTransparency = 1,
            ZIndex = 3,
            TextSize = 18,
            Text = a1.name,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(1, 1),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Bottom,
        }, {
            padding = createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, 10),
            }),
            stroke = createElement("UIStroke", {Thickness = 3, Color = Color3.new()}),
        }),
    })
end