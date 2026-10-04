-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Zombies.ZombieEntry
-- Decompile time: 6.91 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Icons_2 = require(ReplicatedStorage.Shared.Data.Icons)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local useEnemyStats = require(ReplicatedStorage.Client.Interfaces.Hooks.useEnemyStats)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local createElement = React.createElement
local useMemo = React.useMemo
local Sandbox = NewNetwork.Channel("Sandbox")
return function(a1) -- Line: 34
    -- upvalues: useEnemyStats (val), useSpring (val), useSound (val), React (val), useMemo (val), Icons_2 (val)
    -- upvalues: createElement (val), BattlepassPreview (val), MarketplaceService (val), Players (val), Sandbox (val)
    -- upvalues: Tooltip (val), Icons (val), Comma (val), ImageLabel (val)
    local enemyName = a1.enemyName
    local u4 = a1.legacy == true
    local u13 = if not u4 then enemyName else string.sub(enemyName, 1, #enemyName - 7)
    local v1 = useEnemyStats(enemyName)
    local DisplayName = v1 and v1.DisplayName
    local v2 = if typeof(DisplayName) ~= "string" then a1.displayName or u13 else if DisplayName == "" then a1.displayName or u13 else DisplayName
    local MaxHealth = if not v1 then 0 else v1.MaxHealth
    local Speed = if not v1 then 0 else v1.Speed
    local v3, u58 = useSpring(if not a1.enabled then 0 else 1, 1, 30 - a1.idx * 1.5, true)
    local Click = useSound("Click")
    local useEffect = React.useEffect
    local v4 = {a1.enabled}
    useEffect(function() -- Line: 53 -- upvalues: u58 (val), a1 (val)
        u58(if not a1.enabled then 0 else 1)
    end, v4)
    return createElement(BattlepassPreview, {
        Size = UDim2.fromScale(1, 1),
        color = Color3.fromRGB(58, 58, 58),
        clicked = function() -- Line: 73 -- upvalues: a1 (val), MarketplaceService (upval), Players (upval), Click (val), Sandbox (upval)
            if a1.locked then
                if a1.legacy then
                    MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, 1002808617)
                end
                return
            end
            Click()
            Sandbox:fireServer("SpawnEnemy", a1.enemyName)
        end,
    }, {
        Tooltip = createElement(Tooltip, {
            Subject = "Enemy Stats",
            Name = a1.enemyName,
            Header = v2,
            Disabled = not a1.enabled,
            Content = if not a1.locked then {
                {Icon = Icons.EnemyHealth, Text = Comma(MaxHealth)},
                {Icon = Icons.EnemySpeed, Text = Comma(Speed)},
            } else if not a1.legacy then {
                {
                    Icon = "rbxassetid://91688211474848",
                    Text = "Collect this enemy's logbook entry to unlock!",
                },
            } else {
                {
                    Icon = "rbxassetid://91688211474848",
                    Text = "You need the Admin mode gamepass to unlock this enemy!",
                },
            },
        }),
        icon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 2,
            Image = useMemo(function() -- Line: 61 -- upvalues: u13 (val), u4 (val), Icons_2 (upval)
                if u13 and u13 ~= "" then
                    local LegacyEnemies = u4 and Icons_2.LegacyEnemies or Icons_2.Enemies
                    return LegacyEnemies[u13] or "rbxassetid://15913919212"
                end
                return ""
            end, {u4, u13}),
            ImageTransparency = v3:map(function(a1) -- Line: 57
                return 1 - a1
            end),
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.95, 0.95),
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