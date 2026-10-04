-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Gamemodes.GamemodesEntry
-- Decompile time: 6.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local Sandbox = NewNetwork.Channel("Sandbox")
return function(a1) -- Line: 27
    -- upvalues: useGameStateValue (val), useSound (val), createElement (val), BattlepassPreview (val), Sandbox (val)
    -- upvalues: Tooltip (val)
    local SandboxedDifficulty = useGameStateValue("SandboxedDifficulty")
    local SandboxedGamemode = useGameStateValue("SandboxedGamemode")
    local v1 = false
    if SandboxedDifficulty == a1.id then
        v1 = SandboxedGamemode == a1.gamemode
    end
    local Click = useSound("Click")
    local v2 = {innerSize = UDim2.fromScale(0.9, 0.9)}
    local v3 = v1 and Color3.fromRGB(219, 200, 113) or Color3.fromRGB(58, 58, 58)
    v2.color = v3

    function v2.clicked() -- Line: 38 -- upvalues: a1 (val), Click (val), Sandbox (upval)
        if a1.locked then
            return
        end
        Click()
        Sandbox:fireServer("StartGamemode", a1.gamemode, a1.id)
    end

    return createElement(BattlepassPreview, v2, {
        Tooltip = if not a1.locked then nil else createElement(Tooltip, {
            Subject = "Gamemode",
            Name = a1.name,
            Header = a1.name,
            Disabled = not a1.enabled,
            Content = {{Icon = "rbxassetid://91688211474848", Text = "Beat this gamemode to unlock!"}},
        }),
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
            ZIndex = 2,
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
        Locked = createElement("Frame", {
            ZIndex = 999,
            BackgroundTransparency = 0.4,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Visible = a1.locked,
        }, {
            uICorner = createElement("UICorner"),
            image = createElement("ImageLabel", {
                Image = "rbxassetid://1197061307",
                BackgroundTransparency = 1,
                ZIndex = 999,
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(0.55, 0.55),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
            }),
        }),
    })
end