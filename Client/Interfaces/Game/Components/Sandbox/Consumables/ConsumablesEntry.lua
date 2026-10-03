-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Consumables.ConsumablesEntry
-- Decompile time: 1.45 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local Shared = ReplicatedStorage.Client.Controllers.Shared
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local ConsumableController = require(Shared.ConsumableController)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local usePlayerReplicatorValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicatorValue)
local useRightClickMenu = require(ReplicatedStorage.Client.Interfaces.Hooks.useRightClickMenu)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
local Sandbox = NewNetwork.Channel("Sandbox")
local LocalPlayer = Players.LocalPlayer
return function(a1) -- Line: 31
    -- upvalues: React (val), usePlayerReplicatorValue (val), LocalPlayer (val), useSound (val), useRightClickMenu (val)
    -- upvalues: Sandbox (val), createElement (val), BattlepassPreview (val), ConsumableController (val), Tooltip (val)
    -- upvalues: ImageLabel (val)
    local v1 = React.useRef(nil)
    local u13 = table.find(usePlayerReplicatorValue(LocalPlayer, "EquippedConsumables", {}), a1.id)
    local Click = useSound("Click")
    local v2 = {}
    local v3 = if not u13 then "Equip" else "Unequip"

    v2[v3] = function() -- Line: 40 -- upvalues: Sandbox (upval), u13 (val), a1 (val)
        Sandbox:fireServer("EquipConsumable", not u13, a1.id)
    end

    useRightClickMenu(v1, v2)
    v2 = {innerSize = UDim2.fromScale(1, 1)}
    v3 = u13 and Color3.fromRGB(219, 200, 113) or Color3.fromRGB(58, 58, 58)
    v2.color = v3
    v2.reference = v1

    function v2.clicked() -- Line: 49 -- upvalues: Click (val), ConsumableController (upval), a1 (val)
        Click()
        ConsumableController.Equip(a1.id)
    end

    return createElement(BattlepassPreview, v2, {
        Tooltip = createElement(Tooltip, {
            Subject = "Consumable",
            Name = a1.name,
            Header = a1.name,
            Disabled = not a1.enabled,
            Content = {{Text = a1.description}},
        }),
        icon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 2,
            Image = ("rbxassetid://%*"):format(a1.icon),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
        }),
    })
end