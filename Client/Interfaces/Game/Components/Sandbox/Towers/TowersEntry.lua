-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Towers.TowersEntry
-- Decompile time: 3.84 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local Hotbar = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Hotbar)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local usePlayerReplicatorValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicatorValue)
local useRightClickMenu = require(ReplicatedStorage.Client.Interfaces.Hooks.useRightClickMenu)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local Streaming = Network.Channel("Streaming")
local Sandbox = NewNetwork.Channel("Sandbox")
local LocalPlayer = Players.LocalPlayer
local createElement = React.createElement
local u112 = {
    Cooldown = true,
    Damage = true,
    Income = true,
    Range = true,
    SpawnTime = true,
}
return function(a1) -- Line: 50
    -- upvalues: React (val), Asset (val), u112 (val), useSpring (val), useCharmBinding (val), SandboxStore (val)
    -- upvalues: useSound (val), usePlayerReplicatorValue (val), LocalPlayer (val), useRightClickMenu (val)
    -- upvalues: Sandbox (val), createElement (val), BattlepassPreview (val), Streaming (val), Hotbar (val)
    -- upvalues: Tooltip (val), Icons (val), ImageLabel (val)
    local u30, v1
    local useMemo = React.useMemo
    local v2 = {a1.name}
    local v3 = useMemo(function() -- Line: 51 -- upvalues: Asset (upval), a1 (val)
        local v1 = Asset("Troops", a1.name)
        local SkinData = v1.Properties.SkinData or {}
        local Default = SkinData[a1.skin] or SkinData.Default
        if Default then
            return Default.Icon
        end
        return v1.Preview.Icon
    end, v2)
    local useMemo_2 = React.useMemo
    local v4 = {a1.name}
    local v5 = useMemo_2(function() -- Line: 60 -- upvalues: Asset (upval), a1 (val), u112 (upval)
        local v1 = Asset("Troops", a1.name)
        if v1 then
            local Defaults = v1.Stats.Default.Defaults
            if Defaults then
                local v2 = {}
                for i, j in Defaults do
                    if u112[i] then
                        v2[i] = j
                    end
                end
                return v2
            end
        end
        return {}
    end, v4)
    v2 = React.useRef(nil)
    v4, u30 = useSpring(if not a1.enabled then 0 else 1, 1, 30 - a1.idx * 1.5, true)
    local u34 = useCharmBinding(SandboxStore.getState)
    local Click = useSound("Click")
    local u46 = table.find(usePlayerReplicatorValue(LocalPlayer, "EquippedTowers", {}), a1.name)
    local useEffect = React.useEffect
    local v6 = {a1.enabled}
    useEffect(function() -- Line: 94 -- upvalues: u30 (val), a1 (val)
        u30(if not a1.enabled then 0 else 1)
    end, v6)
    local v7 = v4:map(function(a1) -- Line: 98
        return 1 - a1
    end)
    local v8 = {}
    local v9 = if not u46 then "Equip" else "Unequip"

    v8[v9] = function() -- Line: 103 -- upvalues: Sandbox (upval), u46 (val), a1 (val)
        Sandbox:fireServer("EquipTower", not u46, a1.name)
    end

    useRightClickMenu(v2, v8, not a1.ignoreSelected)
    v8 = {Size = a1.Size}
    v9 = u46 and Color3.fromRGB(219, 200, 113) or Color3.fromRGB(58, 58, 58)
    v8.color = v9
    v8.reference = v2

    function v8.clicked() -- Line: 113 -- upvalues: Click (val), a1 (val), Streaming (upval), Hotbar (upval), u34 (val)
        Click()
        if a1.onClick then
            a1.onClick()
            return
        end
        Streaming:FireServer("SelectTower", a1.name, a1.skin)
        Hotbar.Clicked:Fire(a1.name, a1.skin, (u34:getValue()).GoldenPerks)
    end

    v9 = {}
    local v10 = {
        Subject = "Tower Stats",
        Name = a1.name,
        Header = a1.name,
        Disabled = not a1.enabled,
    }
    if not v5 then
        v1 = {}
    else
        local v11 = {}
        for i, j in v5 do
            table.insert(v11, {Bullet = false, Icon = Icons[i], Text = tostring(j)})
        end
        v1 = v11
    end
    v10.Content = v1
    v9.Tooltip = createElement(Tooltip, v10)
    v9.icon = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Image = v3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, -8),
        Size = UDim2.fromScale(1, 1),
        ImageTransparency = v7,
    })
    return createElement(BattlepassPreview, v8, v9)
end