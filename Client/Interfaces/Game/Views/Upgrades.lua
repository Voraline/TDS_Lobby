-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Upgrades
-- Decompile time: 14.16 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AbilitiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilitiesStore)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local NewUpgrade = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade)
local UpgradeViewSelector = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradeViewSelector)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local usePlayerReplicator = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicator)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useReplicatorBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorBinding)
local useView = require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useRef = React.useRef
local memo = React.memo
local useState = React.useState
local u133 = memo(function(a1) -- Line: 34
    -- upvalues: useCharmSelector (val), UpgradesStore (val), UpgradeViewSelector (val), useReplicatedState (val)
    -- upvalues: GameState (val), useView (val), useViewEnabled (val), usePlayerReplicator (val)
    -- upvalues: useReplicatorBinding (val), useState (val), useGameStateValue (val), useRef (val), useCallback (val)
    -- upvalues: AbilitiesStore (val), useEffect (val), Maid (val), TagReplicator (val), table (val), SandboxStore (val)
    -- upvalues: createElement (val), NewUpgrade (val)
    local u61
    local u9 = useCharmSelector(UpgradesStore.getState, UpgradeViewSelector.select, nil, UpgradeViewSelector.isEqual)
    local v1 = useReplicatedState(GameState.State, "GameOver")
    local v2 = useReplicatedState(GameState.State, "AllowedUpgradeTower")
    local v3 = useReplicatedState(GameState.State, "Unsellable")
    local Inflation = useReplicatedState(GameState.State, "GlobalModifiersEnabled", {}).Inflation
    local u34, u35 = useView(true)
    local Upgrades = useViewEnabled("Upgrades")
    local v4 = useReplicatorBinding(usePlayerReplicator(), "Cash", 0)
    local v5, u49 = useState(0)
    local v6, u53 = useState(false)
    local v7, u57 = useState({})
    _, u61 = useState({})
    local v8, u65 = useState(false)
    local v9, u69 = useState(0)
    local v10, u73 = useState(0)
    local v11, u77 = useState(false)
    local v12 = useGameStateValue("GameMode", "", false)
    local v13 = if not v2 then true else if not u9.tower then true else v2 == u9.tower
    local u101 = not v1
    if u101 then
        u101 = false
        if u9.enabled == true then
            u101 = false
            if u9.disabled ~= true then
                u101 = v13
            end
        end
    end
    local u105 = useRef(u9.model)
    u105.current = u9.model
    local v14 = useCallback(function(a1) -- Line: 76 -- upvalues: UpgradesStore (upval), u105 (val)
        UpgradesStore.Target:Fire(u105.current, a1)
    end, {})
    local v15 = useCallback(function(a1) -- Line: 80 -- upvalues: AbilitiesStore (upval), u105 (val) -- types: a1: string
        AbilitiesStore.UseAbility:Fire(u105.current, a1)
    end, {})
    local v16 = useCallback(function(a1, a2) -- Line: 84 -- upvalues: UpgradesStore (upval), u105 (val) -- types: a1: number, a2: number?
        UpgradesStore.Upgrade:Fire(u105.current, a1, a2)
    end, {})
    local v17 = useCallback(function(a1, a2, a3) -- Line: 88 -- upvalues: UpgradesStore (upval), u105 (val) -- types: a1: string, a2: string
        UpgradesStore.UpdateOption:Fire(u105.current, a1, a2, a3)
    end, {})
    local v18 = useCallback(function() -- Line: 92 -- upvalues: UpgradesStore (upval), u105 (val)
        UpgradesStore.Sell:Fire(u105.current)
    end, {})
    local v19 = {u9}
    useEffect(function() -- Line: 96
        -- upvalues: Maid (upval), u9 (val), TagReplicator (upval), table (upval), u57 (val), u65 (val), u53 (val)
        -- upvalues: u49 (val), u61 (val), u69 (val), u73 (val), u77 (val)
        local u2 = Maid.new()
        if not u9.model or not u9.model:FindFirstChild("TowerReplicator") then
            u49(0)
            u57({})
            u61({})
            u65(false)
            u53(false)
            u69(0)
            u73(0)
            u77(false)
        else
            local v1 = TagReplicator.getTrackedReplicator(u9.model.TowerReplicator)
            if not v1 then
                u2:Mark((TagReplicator.getReplicatorEntityFromFolder(u9.model.TowerReplicator)))
            end
            local StatusEffects = u9.model.TowerReplicator:FindFirstChild("StatusEffects")
            if StatusEffects then
                local u38 = TagReplicator.getReplicatorEntityFromFolder(StatusEffects)
                if u38 then
                    u2:Mark(u38)

                    local function updateStatusEffects() -- Line: 116
                        -- upvalues: table (upval), u38 (val), u57 (upval), u65 (upval), u53 (upval)
                        local v1 = table.clone(u38:GetAllStates())
                        u57(v1)
                        u65(v1.FullRefund ~= nil)
                        u53(v1.Hologram ~= nil)
                    end

                    local v2 = table.clone(u38:GetAllStates())
                    u57(v2)
                    u65(v2.FullRefund ~= nil)
                    u53(v2.Hologram ~= nil)
                    u2:Mark((u38.Changed:Connect(function() -- Line: 124 -- upvalues: table (upval), u38 (val), u57 (upval), u65 (upval), u53 (upval)
                        local v1 = table.clone(u38:GetAllStates())
                        u57(v1)
                        u65(v1.FullRefund ~= nil)
                        u53(v1.Hologram ~= nil)
                    end)))
                end
            end
            if v1 then
                u49(v1:Get("UID"))
                u61(v1:Get("DisabledAbilities") or {})
                u69(table.count(v1:Get("TowersSelected") or {}))
                u73(v1:Get("TowersCanSelect") or 0)
                u77(v1:Get("TowersSelected") or false)
                u2:Mark(((v1:GetStateChangedSignal("TowersSelected")):Connect(function(a1) -- Line: 140 -- upvalues: u69 (upval), table (upval), u77 (upval)
                    local v1 = a1 or {}
                    u69(table.count(v1))
                    u77(a1 or false)
                end)))
                u2:Mark(((v1:GetStateChangedSignal("TowersCanSelect")):Connect(function(a1) -- Line: 147 -- upvalues: u73 (upval)
                    u73(a1 or 0)
                end)))
                u2:Mark(((v1:GetStateChangedSignal("DisabledAbilities")):Connect(function(a1) -- Line: 153 -- upvalues: u61 (upval)
                    u61(a1 or {})
                end)))
            end
        end
        return function() -- Line: 169 -- upvalues: u2 (val)
            u2:Destroy()
        end
    end, v19)
    v19 = {u101}
    useEffect(function() -- Line: 174 -- upvalues: SandboxStore (upval), u101 (val), u35 (val), u34 (val)
        SandboxStore.setDisabledModifier("Upgrades", u101)
        if not u101 then
            return
        end
        u35("Upgrades")
        return function() -- Line: 183 -- upvalues: u34 (upval), u35 (upval)
            if u34:getValue() == "Upgrades" then
                u35("")
            end
        end
    end, v19)
    v19 = {
        Visible = Upgrades and u101,
        PlayerCash = v4,
        gameMode = v12,
        TowersSelection = v11,
        TowersSelectionAmount = v10,
        TowersSelected = v9,
        Level = u9.level,
        Tower = u9.tower,
        TowerDisplayName = u9.towerDisplayName,
        Golden = u9.golden,
        Damage = u9.damage,
        Spent = u9.spent,
        IsFullRefund = v8,
        Target = u9.target,
        Ammo = u9.ammo,
        MaxAmmo = u9.maxAmmo,
        OwnerName = u9.ownerName,
        Model = u9.model,
        Buffs = u9.buffs,
        Options = u9.options,
        Locked = u9.locked,
    }
    v19.Path = if not u9.path then nil else if not (0 < u9.path) then nil else u9.path
    v19.Valid = u9.valid
    v19.UID = v5
    v19.StatusEffects = v7
    v19.Hologram = v6
    v19.Unsellable = v3
    v19.Inflation = Inflation
    v19.OnTarget = v14
    v19.OnAbility = v15
    v19.OnUpgrade = v16
    v19.OnOption = v17
    v19.OnSell = v18
    return createElement(NewUpgrade, v19)
end, function() -- Line: 228
    return true
end)
return function() -- Line: 232 -- upvalues: Players (val), Create (val), ReactRoblox (val), createElement (val), u133 (val)
    if workspace.Type.Value ~= "Game" then
        return nil
    end
    local PlayerGui = Players.LocalPlayer.PlayerGui
    local ReactUpgrades = PlayerGui:FindFirstChild("ReactUpgrades") or Create("ScreenGui", {
        Name = "ReactUpgrades",
        ResetOnSpawn = false,
        DisplayOrder = 1003,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = PlayerGui,
    })
    ReactUpgrades.DisplayOrder = 1003
    return ReactRoblox.createPortal({upgrades = createElement(u133)}, ReactUpgrades)
end