-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Music.MusicEntry
-- Decompile time: 8.00 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local usePropertyValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePropertyValue)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local Sandbox = NewNetwork.Channel("Sandbox")

local function map(a1, a2, a3, a4, a5) -- Line: 18
    return (a1 - a2) / (a3 - a2) * (a5 - a4) + a4
end

return function(a1) -- Line: 29
    -- upvalues: usePropertyValue (val), Workspace (val), useSound (val), createElement (val), BattlepassPreview (val)
    -- upvalues: Sandbox (val)
    local v1 = (usePropertyValue(Workspace.Music, "Value")) == a1.id
    local Click = useSound("Click")
    local v2 = {innerSize = UDim2.fromScale(0.95, 0.95)}
    local v3 = v1 and Color3.fromRGB(219, 200, 113) or Color3.fromRGB(58, 58, 58)
    v2.color = v3

    function v2.clicked() -- Line: 38 -- upvalues: Click (val), Sandbox (upval), a1 (val)
        Click()
        Sandbox:fireServer("SetMusic", a1.id)
    end

    return createElement(BattlepassPreview, v2, {
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://94498634385542",
            ImageTransparency = 0,
            ZIndex = 2,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            ScaleType = Enum.ScaleType.Fit,
        }),
        name = createElement("TextLabel", {
            TextWrapped = true,
            BackgroundTransparency = 1,
            TextSize = 24,
            ZIndex = 3,
            Text = a1.id,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromScale(1, 1),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Bottom,
        }, {
            padding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 5),
                PaddingLeft = UDim.new(0, 5),
                PaddingRight = UDim.new(0, 5),
            }),
            stroke = createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.5,
                Color = Color3.fromRGB(0, 0, 0),
                LineJoinMode = Enum.LineJoinMode.Bevel,
            }),
        }),
    })
end