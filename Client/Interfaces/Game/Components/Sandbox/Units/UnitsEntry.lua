-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.Units.UnitsEntry
-- Decompile time: 7.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Battlepass = ReplicatedStorage.Client.Interfaces.Lobby.Components.Battlepass
local BattlepassPreview = require(Battlepass.BattlepassPreview)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local NewUnits = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewUnits)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useUnitStats = require(ReplicatedStorage.Client.Interfaces.Hooks.useUnitStats)
local createElement = React.createElement
local useMemo = React.useMemo
local Sandbox = NewNetwork.Channel("Sandbox")
return function(a1) -- Line: 29
    -- upvalues: useUnitStats (val), useSpring (val), useSound (val), React (val), useMemo (val), NewUnits (val)
    -- upvalues: createElement (val), BattlepassPreview (val), Sandbox (val), Tooltip (val), Icons (val), Comma (val)
    -- upvalues: ImageLabel (val)
    local v1 = useUnitStats(a1.name)
    local Health = if not v1 then 0 else if not v1.Default.Defaults then v1.Default.Health else v1.Default.Defaults.Health
    local v2, u26 = useSpring(if not a1.enabled then 0 else 1, 1, 30 - a1.idx * 1.5, true)
    local Click = useSound("Click")
    local useEffect = React.useEffect
    local v3 = {a1.enabled}
    useEffect(function() -- Line: 45 -- upvalues: u26 (val), a1 (val)
        u26(if not a1.enabled then 0 else 1)
    end, v3)
    local v4 = v2:map(function(a1) -- Line: 49
        return 1 - a1
    end)
    local v5 = useMemo
    local v6 = {a1.name}
    v5 = v5(function() -- Line: 52 -- upvalues: a1 (val), NewUnits (upval)
        local name = a1.name
        if not name and name ~= "" then
            return ""
        end
        local v1 = NewUnits(name)
        return v1 and v1.Icon or ""
    end, v6)
    return createElement(BattlepassPreview, {
        Size = UDim2.fromScale(1, 1),
        color = Color3.fromRGB(58, 58, 58),
        clicked = function() -- Line: 65 -- upvalues: Click (val), Sandbox (upval), a1 (val)
            Click()
            Sandbox:fireServer("SpawnUnit", a1.name)
        end,
    }, {
        Tooltip = createElement(Tooltip, {
            Subject = "Unit Stats",
            Name = a1.name,
            Header = a1.name,
            Disabled = not a1.enabled,
            Content = {{Icon = Icons.EnemyHealth, Text = Comma(Health)}},
        }),
        icon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            ZIndex = 2,
            Image = v5,
            ImageTransparency = v4,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.95, 0.95),
        }),
    })
end