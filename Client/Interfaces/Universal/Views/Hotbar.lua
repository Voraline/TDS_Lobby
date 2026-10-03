-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Hotbar
-- Decompile time: 39.03 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local CommunicationAvailability = require(ReplicatedStorage.Client.Modules.CommunicationAvailability)
local CommunicationController = require(ReplicatedStorage.Client.Controllers.Game.CommunicationController)
local ConsumableController = require(ReplicatedStorage.Client.Controllers.Shared.ConsumableController)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EnemySpawnMenu = require(ReplicatedStorage.Client.Interfaces.Game.Components.PVP.EnemySpawnMenu)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local HotbarButton = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.HotbarButton)
local HotbarDisplay = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.HotbarDisplay)
local HotbarStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.HotbarStore)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local SandboxStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.SandboxStore)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local TimescaleButton = require(ReplicatedStorage.Client.Interfaces.Game.Components.TimescaleButton)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useCharmBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmBinding)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useConsumableCooldown = require(ReplicatedStorage.Client.Interfaces.Hooks.useConsumableCooldown)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useGameRule = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useIsTutorialMatch = require(ReplicatedStorage.Client.Interfaces.Hooks.useIsTutorialMatch)
local useKeyBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useKeyBinding)
local useMediaQuery = require(ReplicatedStorage.Client.Interfaces.Hooks.useMediaQuery)
local usePlayerReplicatorValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicatorValue)
local usePooledEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.usePooledEvent)
local usePropertyValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePropertyValue)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local useReplicatorBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatorBinding)
local useSkill = require(ReplicatedStorage.Client.Interfaces.Hooks.useSkill)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useTagReplicators = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicators)
local useTrigger = require(ReplicatedStorage.Client.Interfaces.Hooks.useTrigger)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local useView = require(ReplicatedStorage.Client.Interfaces.Hooks.useView)
local withTimescaleButtonLogic = require(ReplicatedStorage.Client.Interfaces.Game.ViewHelpers.withTimescaleButtonLogic)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.UI.ReactTypes)
require(ReplicatedStorage.Shared.Modules.SkillsUtil)
local TowerSignals = require(ReplicatedStorage.Shared.Modules.TowerSignals)
local createElement = React.createElement
local Event = React.Event
local useRef = React.useRef
local useEffect = React.useEffect
local useState = React.useState
local useBinding = React.useBinding
local memo = React.memo
local useMemo = React.useMemo
local LocalPlayer = Players.LocalPlayer
local u350 = withTimescaleButtonLogic(TimescaleButton)
local u351 = {
    Cooldown = true,
    Damage = true,
    Income = true,
    Limit = true,
    Range = true,
    SpawnTime = true,
}
local Hotbar = Network.Channel("Hotbar")
local u355 = {}
u355[Enum.SkinRarity.Common] = (Color3.fromRGB(162, 162, 162))
u355[Enum.SkinRarity.Uncommon] = (Color3.fromRGB(85, 255, 127))
u355[Enum.SkinRarity.Rare] = (Color3.fromRGB(0, 170, 255))
u355[Enum.SkinRarity.Legendary] = (Color3.fromRGB(170, 85, 255))
u355[Enum.SkinRarity.Golden] = (Color3.fromRGB(255, 223, 0))
u355[Enum.SkinRarity.Exclusive] = (Color3.fromRGB(255, 0, 0))
u355[Enum.SkinRarity.Event] = (Color3.fromRGB(255, 0, 0))
u355[Enum.SkinRarity.Ultimate] = (Color3.fromRGB(255, 67, 174))

local function ConsumableSlot(a1) -- Line: 111
    -- upvalues: GameState (val), useRef (val), useConsumableCooldown (val), Notification (val), ReplicatedStorage (val)
    -- upvalues: ConsumableController (val), Asset (val), createElement (val), HotbarButton (val)
    local ConsumableName = a1.ConsumableName
    local Stock = a1.Stock
    local u3 = true
    local u7 = GameState.GameMode ~= "PVP"
    local v1 = useRef(nil)
    local v2 = useConsumableCooldown(ConsumableName)
    local v3 = {
        Icon = "",
        Description = "Consumable",
        LayoutOrder = a1.LayoutOrder,
        Ref = v1,
        IconSize = UDim2.fromScale(0.9, 0.9),
        Name = ConsumableName,
    }
    v3.Stats = {}
    v3.MaxCooldown = v2.maxCooldown
    v3.Cooldown = v2.cooldown
    v3.Queued = v2.queued
    v3.Enabled = a1.Enabled
    v3.Selected = a1.SelectedOtherHotbar:map(function(a1) -- Line: 135 -- upvalues: ConsumableName (val)
        return a1 == ConsumableName
    end)
    v3.Level = a1.Level
    v3.Stock = if not u7 then nil else Stock
    v3.Binding = ("Tower %*"):format(a1.LayoutOrder)

    function v3.OnActivate() -- Line: 142
        -- upvalues: GameState (upval), Notification (upval), a1 (val), ReplicatedStorage (upval), u7 (val), Stock (ref)
        -- upvalues: u3 (ref), ConsumableController (upval), ConsumableName (val)
        local Replicator = GameState.Replicator
        if Replicator:Get("GameStarted") and not Replicator:Get("GameOver") then
            if not Replicator:Get("TowerInteraction") then
                Notification.Create({
                    Text = "You can't use consumables right now!",
                    Color = Color3.fromRGB(255, 0, 0),
                })
                return
            end
            if not a1.IsConsumablesHotbar then
                return
            end
            require(ReplicatedStorage.Client.Controllers.Game.NewPlacementController):Stop()
            if u7 and Stock < 1 then
                ConsumableController.Unequip()
                return
            end
            if not u3 then
                ConsumableController.Unequip()
                return
            end
            if not ConsumableName then
                return a1.SetSelectedOtherHotbar(0)
            end
            a1.SetSelectedOtherHotbar(ConsumableName)
            ConsumableController.Equip(ConsumableName)
            a1.SetSelectedOtherHotbar(nil)
            return
        end
        Notification.Create({
            Text = "You can only use consumables during a game!",
            Color = Color3.fromRGB(255, 0, 0),
        })
    end

    if ConsumableName then
        local v4 = Asset("Consumables", ConsumableName)
        if v4 then
            local Cost = v4.Cost
            local CostCalculation = v4.CostCalculation
            local MaxUses = v4.MaxUses
            local v5 = a1.ConsumableUses[ConsumableName] or 0
            v3.Stats = nil
            v3.TooltipContent = {(("Description: %*"):format(v4.Description))}
            if Cost and CostCalculation then
                Cost = CostCalculation(v5, Cost)
            end
            if Cost and a1.Inflation then
                Cost = math.floor(Cost * 1.5)
            end
            v3.Icon = ("rbxassetid://%*"):format(v4.Icon)
            v3.Price = Cost
            if v4.MaxUses then
                v3.Stock = math.clamp(MaxUses - v5, 0, (math.min(MaxUses, Stock)))
                v3.Amount = MaxUses
                if a1.InfiniteConsumables then
                    v3.Cooldown = a1.Empty
                    v3.Queued = a1.Empty:map(function() -- Line: 219
                        return false
                    end)
                    v3.Stock = nil
                    v3.Amount = nil
                elseif 0 < v3.Stock then
                end
            end
        end
    end
    return (createElement(HotbarButton, v3))
end

return memo(function(a1) -- Line: 237
    -- upvalues: useCharmBinding (val), UpgradesStore (val), useCharmSelector (val), useSound (val), useTrigger (val)
    -- upvalues: useBinding (val), useTween (val), useView (val), useSkill (val), Enum (val), useGameRule (val)
    -- upvalues: useCache (val), ReplicatedStorage (val), usePropertyValue (val), React (val), useGameStateValue (val)
    -- upvalues: useRef (val), useState (val), PlayerReplicator (val), LocalPlayer (val), useReplicatedState (val)
    -- upvalues: useReplicatorBinding (val), Players (val), useFFlag (val), useEffect (val), SandboxStore (val)
    -- upvalues: useIsTutorialMatch (val), UserInputService (val), CommunicationAvailability (val)
    -- upvalues: usePlayerReplicatorValue (val), useSpring (val), Comma (val), useReactBindings (val)
    -- upvalues: usePooledEvent (val), RunService (val), HotbarStore (val), CommunicationController (val)
    -- upvalues: useKeyBinding (val), createElement (val), ConsumableSlot (val), useMediaQuery (val), useMemo (val)
    -- upvalues: PVPConstants (val), Asset (val), u355 (val), ViewController (val), GameState (val), ClientAtoms (val)
    -- upvalues: Hotbar (val), u351 (val), HotbarButton (val), useEvent (val), TowerSignals (val)
    -- upvalues: useTagReplicators (val), Event (val), Icons (val), ImageLabel (val), TextLabel (val), u350 (val)
    -- upvalues: HotbarDisplay (val), EnemySpawnMenu (val)
    local u519, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11
    local u1519 = useCharmBinding(UpgradesStore.getState, function(a1) -- Line: 238
        if a1.showBoundaries then
            return a1.tower
        end
        return nil
    end)
    local u11 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 241
        return a1.enabled
    end, {})
    local Click = useSound("Click")
    local u18 = useSound("CashBlip", true)
    local u21 = a1.Visible ~= false
    local v12, u1598 = useTrigger()
    local v13, u3427 = useBinding(384)
    local v14, u3552 = useBinding(384)
    local v15, u44 = useTween(v13:getValue(), TweenInfo.new(0.2, Enum.EasingStyle.Sine), true, true)
    local u1487 = useView(true):map(function(a1) -- Line: 256 -- types: a1: string
        local v1 = true
        if a1 ~= "Hotbar" then
            v1 = true
            if a1 ~= "Upgrades" then
                v1 = true
                if a1 ~= "Music" then
                    v1 = true
                    if a1 ~= "" then
                        v1 = a1 == nil
                    end
                end
            end
        end
        return v1
    end)
    _, v5 = useSkill(Enum.SkillTreeNode.Reenforcements)
    local v16 = useGameRule("Skills", true)
    local v17 = useGameRule("Skills", {}).Reenforcements == true
    local v18 = useCache("Inventory.Consumables", {})
    local u1398 = useCache("Inventory.Troops", {Scout = {Skin = "Default", Equipped = true, GoldenPerks = false}})
    local State = ReplicatedStorage:FindFirstChild("State")
    local u1453 = usePropertyValue(State and State:FindFirstChild("PriceScale"), "Value")
    local u96 = useCache("Values.Level", 0)
    local troops, troops_2 = React.useState("troops")
    local v19, v20 = React.useBinding(0)
    local v21 = useGameStateValue("GlobalModifiersEnabled", {}).Limitation == true
    local u120 = useGameStateValue("GlobalModifiersEnabled", {}).Inflation == true
    local v22 = useGameStateValue("GlobalModifiersEnabled", {})["The Star"] == true
    local TowerLimit = useGameStateValue("TowerLimit")
    local u3094 = useGameStateValue("EcoStart") or (1 / 0)
    local u3139 = useGameStateValue("EcoTime") or 30
    local v23, u145 = useBinding(workspace:GetServerTimeNow())
    local u148 = useRef(0)
    local u1244 = not useGameStateValue("ConsumablesDisabled")
    local u1872, u156 = useState(false)
    local v24 = PlayerReplicator.GetEntityFromPlayer(LocalPlayer)
    local v25 = useReplicatedState(v24 and v24.Replicator, "Consumables") or {}
    local v26 = useReplicatedState(v24 and v24.Replicator, "TowerCount")
    local v27 = useReplicatorBinding(v24 and v24.Replicator, "Cash", 0)
    local u195 = useReplicatedState(v24 and v24.Replicator, "Econ") or 0
    useReplicatedState(v24 and v24.Replicator, "CanPlaceTowers")
    local GameMode = useGameStateValue("GameMode")
    local v28 = useGameStateValue("PlayerCount", #Players:GetPlayers())
    local v29 = useGameStateValue("PlayerCountPerTeam", {})
    local v30 = useGameStateValue("Intermission", false)
    local v31 = useFFlag("communication.enabled", false)
    local Ranked = useGameStateValue("Ranked")
    local Difficulty = useGameStateValue("Difficulty")
    local TutorialReadyPrompt = useGameStateValue("TutorialReadyPrompt")
    local AllowedSlot = useGameStateValue("AllowedSlot")
    local u2658 = not (useGameStateValue("SandboxBlacklist", {}))[tostring(LocalPlayer.UserId)]
    if v21 then
        TowerLimit = math.floor(TowerLimit * 0.5)
    end
    if v22 then
        TowerLimit = TowerLimit + 5
    end
    local v32 = {u2658}
    useEffect(function() -- Line: 323 -- upvalues: SandboxStore (upval), u2658 (val)
        SandboxStore.setDisabledModifier("SandboxAdmins", not u2658)
    end, v32)
    if Ranked == true then end
    local u3594 = GameMode == "PVP"
    local u2108 = useIsTutorialMatch()
    local u1342 = typeof(AllowedSlot) == "number"
    local u3464 = workspace.Type.Value == "Lobby"
    local u2574 = GameMode == "Sandbox"
    local TouchEnabled = UserInputService.TouchEnabled
    local u375 = CommunicationAvailability.canUseFromState(GameMode, v28, v29, v24 and v24.Team, v30, v31, u2108)
    local v33 = u375 and not TouchEnabled
    local v34 = -24 - (if not u1244 then 0 else 68)
    local v35 = v34 - (if not v33 then 0 else 68)
    v34 = usePlayerReplicatorValue(LocalPlayer, if not u3594 then "EquippedConsumables" else "EquippedPVPConsumables", {"Nuke"})
    local u1282 = usePlayerReplicatorValue(LocalPlayer, if not u3594 then "EquippedTowers" else "EquippedPVPTowers", {"Scout"})
    local u1368 = usePlayerReplicatorValue(LocalPlayer, "Overriden", nil)
    local v36, u445 = useSpring(1, 1, 40, true)
    local v37 = {u3594, troops}
    useEffect(function() -- Line: 362 -- upvalues: u445 (val), u3594 (val), troops (val)
        u445(if not u3594 then 1 else if troops ~= "zombies" then 1 else 9)
    end, v37)
    local v38, u498 = useSpring(v27:getValue(), 1, 40, true)
    v37, u519 = useSpring(u195, 1, 40, true)
    local u522, u523 = useBinding(0)
    local v39 = v38:map(function(a1) -- Line: 369 -- upvalues: u522 (val), u18 (val), u523 (val), Comma (upval)
        local v1 = math.round(a1)
        local v2 = u522:getValue()
        if v1 ~= v2 then
            local v3 = math.clamp(math.abs(v1 - v2) / 100, 1, 3)
            u18({v3 - 0.1, v3 + 0.1})
            u523(v1)
        end
        return Comma(v1)
    end)
    local v40 = useGameRule("InfiniteCash", false)
    local v41 = useGameRule("InfiniteTowers", false)
    local v42 = useGameRule("InfiniteConsumables", false)
    local u1418 = useGameRule("GoldenPerks", true)
    local v43 = React.useBinding(0)
    local v44 = {v13, v14}
    local v45 = {troops}
    useReactBindings(function(a1, a2) -- Line: 388 -- upvalues: troops (val), u44 (val)
        if troops == "troops" then
            u44(a1)
            return
        end
        if troops == "consumables" then
            u44(a2)
        end
    end, v44, v45)
    v44 = {v27}
    useReactBindings(function(a1) -- Line: 396 -- upvalues: u498 (val)
        u498(a1)
    end, v44, {})
    v44 = {u195}
    useEffect(function() -- Line: 400 -- upvalues: u519 (val), u195 (val)
        u519(u195)
    end, v44)
    usePooledEvent(RunService.Heartbeat, function() -- Line: 404 -- upvalues: u148 (val), u145 (val)
        local v1 = os.clock()
        if v1 - u148.current < 0.1 then
            return
        end
        u148.current = v1
        u145(workspace:GetServerTimeNow())
    end)
    local v46 = React.useCallback(function() -- Line: 414
        -- upvalues: u2108 (val), u3464 (val), u1244 (val), Click (val), troops_2 (val), troops (val)
        -- upvalues: HotbarStore (upval)
        if not u2108 and not u3464 then
            if not u1244 then
                return
            end
            Click()
            troops_2(if troops ~= "troops" then "troops" else "consumables")
            HotbarStore.setConsumablesEnabled(troops == "troops")
            return
        end
    end)
    local v47 = React.useCallback(function() -- Line: 428 -- upvalues: u2574 (val), u2658 (val), Click (val), SandboxStore (upval)
        if u2574 and u2658 then
            Click()
            SandboxStore.toggle()
        end
    end)
    v44 = React.useCallback(function() -- Line: 435 -- upvalues: u3594 (val), Click (val), troops_2 (val), troops (val), HotbarStore (upval)
        if not u3594 then
            return
        end
        Click()
        troops_2(if troops ~= "zombies" then "zombies" else "troops")
        HotbarStore.setConsumablesEnabled(troops == "troops")
    end)
    v45 = React.useCallback(function() -- Line: 445 -- upvalues: u375 (val), Click (val), CommunicationController (upval)
        if not u375 then
            return
        end
        Click()
        CommunicationController.toggle(true)
    end)
    local v48 = React.useCallback(function() -- Line: 454 -- upvalues: u375 (val), Click (val), CommunicationController (upval)
        if not u375 then
            return
        end
        Click()
        CommunicationController.toggle()
    end)
    local v49 = {u375}
    useEffect(function() -- Line: 463 -- upvalues: u375 (val), CommunicationController (upval)
        if u375 then
            return
        end
        CommunicationController.close()
    end, v49)
    _, v6, v49 = useKeyBinding("Switch Hotbar", v46, nil, true, nil, Enum.KeyCode.ButtonL2)
    _, v7, v8 = useKeyBinding("Communication Wheel", v45, nil, true, nil, Enum.KeyCode.DPadLeft)
    _, v9, v10 = useKeyBinding("Toggle Admin Panel", v47, nil, true, nil, Enum.KeyCode.ButtonR2)
    _, v11, v1 = useKeyBinding("Toggle Enemy Spawner", v44, nil, true)
    local v50 = {u11}
    useEffect(function() -- Line: 486 -- upvalues: u11 (val), troops_2 (val), HotbarStore (upval)
        if u11 then
            troops_2("troops")
            HotbarStore.setConsumablesEnabled(true)
        end
    end, v50)
    useEffect(function() -- Line: 493 -- upvalues: UserInputService (upval), u1872 (val), u156 (val)
        local u5 = UserInputService.LastInputTypeChanged:Connect(function(a1) -- Line: 494 -- upvalues: UserInputService (upval), u1872 (upval), u156 (upval)
            local GamepadEnabled = UserInputService.GamepadEnabled and a1 == Enum.UserInputType.Gamepad1
            if a1 ~= Enum.UserInputType.Gamepad1 then
                if a1 ~= Enum.UserInputType.Gamepad1 and u1872 then
                    u156(GamepadEnabled)
                end
            elseif u1872 ~= true or a1 ~= Enum.UserInputType.Gamepad1 and u1872 then
                u156(GamepadEnabled)
            end
        end)
        return function() -- Line: 505 -- upvalues: u5 (ref)
            u5:Disconnect()
            u5 = nil
        end
    end, {})
    v50 = {u1244}
    useEffect(function() -- Line: 511 -- upvalues: u1244 (val), troops (val), troops_2 (val), HotbarStore (upval)
        if not u1244 and troops == "consumables" then
            troops_2("troops")
            HotbarStore.setConsumablesEnabled(false)
        end
    end, v50)
    v50 = {u21}
    useEffect(function() -- Line: 518 -- upvalues: u3464 (val), HotbarStore (upval), u21 (val), troops_2 (val)
        if not u3464 then
            return
        end
        HotbarStore.setConsumablesEnabled(false)
        if u21 then
            troops_2("troops")
            return
        end
        troops_2("")
    end, v50)
    if v16 and v17 then
        TowerLimit = TowerLimit + v5
    end
    local v51 = {}
    if not u3464 and not u2108 then
        local v52, v53
        for i = 1, 4 do
            v2 = v34[i]
            v52 = tostring(i)
            v3 = createElement
            v53 = {LayoutOrder = i}
            v4 = false
            if troops == "consumables" then
                v4 = u1244
            end
            v53.Enabled = v4
            v53.IsConsumablesHotbar = troops == "consumables"
            v53.ConsumableName = v2
            v53.Stock = v18[v2] or 0
            v53.SelectedOtherHotbar = v19
            v53.SetSelectedOtherHotbar = v20
            v53.Level = u96
            v53.ConsumableUses = v25
            v53.Inflation = u120
            v53.InfiniteConsumables = v42
            v53.Empty = v43
            v51[v52] = (v3(ConsumableSlot, v53))
        end
    end
    local u1274 = if useMediaQuery("large") then 1 else 0.7
    v2 = {u1282}
    v50 = useMemo(function() -- Line: 562 -- upvalues: u1282 (val)
        local v1
        local v2 = 0
        for k in pairs(u1282) do
            v1 = tonumber(k)
            if v1 then
                v2 = math.max(v2, v1)
            end
        end
        return v2
    end, v2)
    local u1320 = math.max(if not u3594 then 5 else PVPConstants.getLoadoutSize(Difficulty), v50)
    v3 = {
        u1320,
        u1282,
        u1398,
        v12,
        u96,
        troops,
        u1342,
        AllowedSlot,
        u1453,
        u1418,
        u120,
    }
    v2 = useMemo(function() -- Line: 577
        -- upvalues: u1320 (val), u1282 (val), troops (val), u1342 (val), AllowedSlot (val), u96 (val), u1368 (val)
        -- upvalues: u1398 (val), Asset (upval), GameMode (val), u1418 (val), u3464 (val), u1453 (val), u120 (val)
        -- upvalues: u355 (upval), Enum (upval), ViewController (upval), GameState (upval), u1487 (val)
        -- upvalues: ReplicatedStorage (upval), ClientAtoms (upval), Hotbar (upval), u1519 (val), u351 (upval)
        -- upvalues: createElement (upval), HotbarButton (upval)
        local Defaults, DisplayName, Golden, Icon, SkinData, v1, v2, v3, v4, v5, v6, v7, v8
        local v9 = {}
        for i = 1, u1320 do
            local u8 = u1282[i]
            v4 = false
            v5 = {Icon = "", IsTower = true, Rarity = "common", LayoutOrder = i}
            v5.Enabled = troops == "troops"
            v5.Disabled = u1342 and AllowedSlot ~= i
            v5.Binding = ("Tower %*"):format(i)

            function v5.OnActivate() end

            v5.Level = u96
            if i == 5 and not u8 and u1368 ~= true then
                v5.LevelLock = 10
                v4 = u96 < 10
            end
            if not v4 and u8 then
                local u45 = u1398[u8]
                if not u45 then
                    u45 = {Skin = "Default", GoldenPerks = false}
                end
                v7 = Asset("Troops", u8, nil, GameMode)
                v8 = Asset("Troops", u8, u45.Skin)
                if v7 and v8 then
                    Golden = (if not u1418 then false else u45.GoldenPerks) and v7.Stats.Golden and v7.Stats.Golden or v7.Stats.Default
                    Defaults = Golden.Defaults
                    SkinData = v7.Properties.SkinData or {}
                    v1 = SkinData[u45.Skin]
                    if not Defaults then
                        v5.Enabled = false
                    else
                        v2 = if not u3464 then math.floor(Defaults.Price * (u1453 or 0)) else nil
                        if v2 and u120 then
                            v2 = math.floor(v2 * 1.5)
                        end
                        v5.Rarity = v1.Rarity
                        DisplayName = v1 and v1.DisplayName or v7.Properties.DisplayName or u8
                        v5.Name = DisplayName
                        Icon = if not v1 then v7.Preview.Icon else v1.Icon
                        v5.Icon = Icon
                        v5.Price = v2
                        v3 = v1 and v1.Rarity and u355[v1.Rarity] or u355[Enum.SkinRarity.Common]
                        v5.Color = v3

                        function v5.OnActivate() -- Line: 647
                            -- upvalues: u1342 (upval), AllowedSlot (upval), i (val), u3464 (upval)
                            -- upvalues: ViewController (upval), u8 (val), GameState (upval), u1487 (upval)
                            -- upvalues: ReplicatedStorage (upval), ClientAtoms (upval), u45 (val), Hotbar (upval)
                            if u1342 and AllowedSlot ~= i then
                                return
                            end
                            if u3464 then
                                (ViewController:getEmitter("Inventory")):Emit("Select", "Towers", u8)
                                ViewController:setView("Inventory")
                                return
                            end
                            if GameState.Replicator:Get("TowerInteraction") and u1487 then
                                local Hotbar_2 = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Hotbar)
                                if ClientAtoms.cloneTowerAtom().enabled then
                                    return
                                end
                                Hotbar_2.Clicked:Fire(u8, u45.Skin, u45.GoldenPerks)
                                Hotbar:FireServer("Click", i)
                                return
                            end
                        end

                        v5.Selected = u1519:map(function(a1) -- Line: 677 -- upvalues: u8 (val)
                            return a1 == u8
                        end)
                        v5.Stats = {}
                        v5.TowerInformation = v7.TowerInformation or nil
                        for j, k in Defaults do
                            if u351[j] and k ~= 0 then
                                v5.Stats[j] = k
                            end
                        end
                    end
                end
            end
            v6 = tostring(i)
            v9[v6] = (createElement(HotbarButton, v5))
        end
        return v9
    end, v3)
    useEvent(TowerSignals.StatsChanged, function(a1) -- Line: 713 -- upvalues: u1282 (val), u1598 (val)
        for i, j in u1282 do
            if j == a1 then
                return u1598()
            end
        end
    end)
    v3 = useReplicatedState((useTagReplicators("CurseReplicator"))[1], "VotingActive") or false
    local v54 = createElement
    v4 = {BackgroundTransparency = 1}
    local AnchorPoint = v55.AnchorPoint or Vector2.new(0.5, 1)
    v4.AnchorPoint = AnchorPoint
    v4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    local Position = v55.Position or UDim2.new(0.5, 0, 1, -16 * u1274)
    v4.Position = Position
    v4.Visible = if not v3 then u1487 and not TutorialReadyPrompt else false
    v4.Size = v15:map(function(a1) -- Line: 730 -- upvalues: u1274 (val)
        return UDim2.fromOffset(a1, 64 * u1274)
    end)
    v4.LayoutOrder = v55.LayoutOrder
    local v56 = {}
    local v57 = createElement
    local v58 = {
        Size = UDim2.fromOffset(52, 52),
        Position = v36:map(function(a1) -- Line: 738 -- upvalues: u1274 (val)
            return UDim2.new(0, -24 * u1274 * a1, 0.5, 0)
        end),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(86, 86, 86),
        BackgroundTransparency = 0.25,
        Visible = u3594 and not u3464,
    }

    v58[Event.MouseButton1Click] = function() -- Line: 746 -- upvalues: troops_2 (val), troops (val), HotbarStore (upval)
        troops_2(if troops ~= "zombies" then "zombies" else "troops")
        HotbarStore.setConsumablesEnabled(troops == "troops")
    end

    local v59 = {
        uiScale = createElement("UIScale", {Scale = u1274}),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(57, 57, 57)}),
    }
    local v60 = createElement
    local v61 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(40, 40),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local Towers = if troops ~= "zombies" then Icons.Zombies else Icons.Towers
    v61.Image = Towers
    v59.Icon = v60("ImageLabel", v61)
    v59.Keybind = createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 3,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = if not u1872 then 0 else 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromOffset(4, 4),
        Size = UDim2.fromOffset(18, 18),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        bindImage = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = (if not u3594 then v49 else v1):map(function(a1) -- Line: 786 -- upvalues: u1872 (val)
                return u1872 and a1 or ""
            end),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            ScaleType = Enum.ScaleType.Fit,
        }),
        text = createElement(TextLabel, {
            TextScaled = true,
            FontWeight = "Medium",
            StrokeThickness = 1,
            Text = (if not u3594 then v6 else v11):map(function(a1) -- Line: 795 -- upvalues: u1872 (val)
                return not u1872 and a1 or ""
            end),
            TextColor3 = Color3.fromRGB(156, 156, 156),
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.zero,
            Size = UDim2.fromScale(1, 1),
            Visible = not u1872,
            StrokeColor = Color3.fromRGB(156, 156, 156),
        }),
    })
    v56.zombiesSwitcher = v57("ImageButton", v58, v59)
    v57 = createElement
    v58 = {
        Size = UDim2.fromOffset(52, 52),
        Position = v36:map(function(a1) -- Line: 813 -- upvalues: u1274 (val), u3594 (val), u3464 (val)
            return UDim2.new(0, -24 * u1274 * a1 - (if not u3594 then 0 else if u3464 then 0 else 68), 0.5, 0)
        end),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(86, 86, 86),
        BackgroundTransparency = 0.25,
        Visible = not u2108 and u1244 and not u3464,
    }

    v58[Event.MouseButton1Click] = function() -- Line: 821 -- upvalues: troops_2 (val), troops (val), HotbarStore (upval)
        troops_2(if troops ~= "consumables" then "consumables" else "troops")
        HotbarStore.setConsumablesEnabled(troops == "troops")
    end

    v59 = {
        uiScale = createElement("UIScale", {Scale = u1274}),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(57, 57, 57)}),
    }
    v60 = createElement
    v61 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(40, 40),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local Towers_2 = if troops ~= "consumables" then Icons.Consumables else Icons.Towers
    v61.Image = Towers_2
    v59.Icon = v60("ImageLabel", v61)
    v59.Keybind = createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 3,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = if not u1872 then 0 else 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromOffset(4, 4),
        Size = UDim2.fromOffset(18, 18),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        bindImage = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = v49:map(function(a1) -- Line: 861 -- upvalues: u1872 (val)
                return u1872 and a1 or ""
            end),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            ScaleType = Enum.ScaleType.Fit,
        }),
        text = createElement(TextLabel, {
            TextScaled = true,
            FontWeight = "Medium",
            StrokeThickness = 1,
            Text = v6:map(function(a1) -- Line: 870 -- upvalues: u1872 (val)
                return not u1872 and a1 or ""
            end),
            TextColor3 = Color3.fromRGB(156, 156, 156),
            Position = UDim2.fromScale(0, 0),
            AnchorPoint = Vector2.zero,
            Size = UDim2.fromScale(1, 1),
            Visible = not u1872,
            StrokeColor = Color3.fromRGB(156, 156, 156),
        }),
    })
    v56.consumableSwitcher = v57("ImageButton", v58, v59)
    v57 = createElement
    v58 = {
        Size = UDim2.fromOffset(52, 52),
        Position = v36:map(function(a1) -- Line: 888 -- upvalues: u3594 (val), u3464 (val), u1244 (val), u1274 (val)
            return UDim2.new(0, -24 * u1274 * a1 - ((if not u3594 then 0 else if u3464 then 0 else 68) + (if not u1244 then 0 else 68)), 0.5, 0)
        end),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(86, 86, 86),
        BackgroundTransparency = 0.25,
        Visible = v33,
        [Event.MouseButton1Click] = v48,
    }
    v59 = {
        uiScale = createElement("UIScale", {Scale = u1274}),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(57, 57, 57)}),
        Icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://89327088116089",
            Size = UDim2.fromOffset(36, 36),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }),
        Keybind = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 3,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = if not u1872 then 0 else 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromOffset(4, 4),
            Size = UDim2.fromOffset(18, 18),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }, {
            corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            bindImage = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = v8:map(function(a1) -- Line: 936 -- upvalues: u1872 (val)
                    return u1872 and a1 or ""
                end),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Fit,
            }),
            text = createElement(TextLabel, {
                TextScaled = true,
                FontWeight = "Medium",
                StrokeThickness = 1,
                Text = v7:map(function(a1) -- Line: 945 -- upvalues: u1872 (val)
                    return not u1872 and a1 or ""
                end),
                TextColor3 = Color3.fromRGB(156, 156, 156),
                Position = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.zero,
                Size = UDim2.fromScale(1, 1),
                Visible = not u1872,
                StrokeColor = Color3.fromRGB(156, 156, 156),
            }),
        }),
    }
    v56.communicationSwitcher = v57("ImageButton", v58, v59)
    v56.timescale = if u3594 or u2108 or u3464 then nil else if not u2574 then createElement(u350, {
        Position = UDim2.new(0, v35 * u1274, 0.5, 0),
        onClick = function() -- Line: 968 -- upvalues: Click (val)
            Click()
        end,
    }, {uiScale = createElement("UIScale", {Scale = u1274})}) else nil
    v56.adminPanel = if not u2574 or not u2658 then nil else createElement("ImageButton", {
        Size = UDim2.fromOffset(52, 52),
        Position = v36:map(function(a1) -- Line: 980 -- upvalues: u1274 (val)
            return UDim2.new(0, -96 * u1274 * a1, 0.5, 0)
        end),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(86, 86, 86),
        BackgroundTransparency = 0.25,
        [Event.MouseButton1Click] = v47,
    }, {
        uiScale = createElement("UIScale", {Scale = u1274}),
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
        Stroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(57, 57, 57)}),
        Icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(40, 40),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = Icons.Towers,
        }),
        Keybind = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 3,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = if not u1872 then 0 else 1,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromOffset(4, 4),
            Size = UDim2.fromOffset(18, 18),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }, {
            corner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            bindImage = createElement(ImageLabel, {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = v10:map(function(a1) -- Line: 1024 -- upvalues: u1872 (val)
                    return u1872 and a1 or ""
                end),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Fit,
            }),
            text = createElement(TextLabel, {
                TextScaled = true,
                FontWeight = "Medium",
                StrokeThickness = 1,
                Text = v9:map(function(a1) -- Line: 1033 -- upvalues: u1872 (val)
                    return not u1872 and a1 or ""
                end),
                TextColor3 = Color3.fromRGB(156, 156, 156),
                Position = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.zero,
                Size = UDim2.fromScale(1, 1),
                Visible = not u1872,
                StrokeColor = Color3.fromRGB(156, 156, 156),
            }),
        }),
    })
    if u3464 then
        v57 = nil
    else
        v57 = createElement
        v58 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(96, 96),
            Position = v36:map(function(a1) -- Line: 1054 -- upvalues: u1274 (val), u3594 (val)
                return UDim2.new(1, 24 * u1274 * a1, if not u3594 then 0.5 else 0.4, 0)
            end),
            AnchorPoint = Vector2.new(0, 0.5),
        }
        v59 = {uiScale = createElement("UIScale", {Scale = u1274})}
        v59.list = createElement("UIListLayout", {
            Padding = UDim.new(0, 12),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        })
        v59.cash = if u3464 then nil else HotbarDisplay({
            LayoutOrder = (1 / 0),
            Icon = "rbxassetid://5547581690",
            Value = if not v40 then v39:map(function(a1) -- Line: 1077 -- upvalues: Comma (upval)
                return (("$%*"):format((Comma(a1))))
            end) else "∞",
            Color = Color3.fromRGB(74, 170, 88),
        })
        v59.eco = if not u3594 then nil else HotbarDisplay({
            LayoutOrder = 1,
            Icon = "rbxassetid://16913572623",
            UseIconColor = true,
            Value = v37:map(function(a1) -- Line: 1088 -- upvalues: Comma (upval)
                return (("$%*"):format((Comma((math.round(a1))))))
            end),
            Color = Color3.fromRGB(202, 135, 0),
            Alpha = v23:map(function(a1) -- Line: 1093 -- upvalues: u3094 (val), u3139 (val)
                return (math.clamp((a1 - u3094) / u3139, 0, 1))
            end),
        })
        v59.placement = HotbarDisplay({
            LayoutOrder = 0,
            Icon = "rbxassetid://5577929792",
            Value = ("%* / %*"):format(Comma(v26), if not v41 then Comma(TowerLimit) else "∞"),
            Color = Color3.fromRGB(230, 101, 101),
        })
        v57 = v57("Frame", v58, v59)
    end
    v56.values = v57
    v57 = createElement
    v58 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
    }
    v59 = {uiScale = createElement("UIScale", {Scale = u1274})}
    v60 = createElement
    v61 = {
        Padding = UDim.new(0, 16),
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    }

    v61[React.Change.AbsoluteContentSize] = function(a1) -- Line: 1127 -- upvalues: u3427 (val) -- types: a1: userdata
        u3427(a1.AbsoluteContentSize.X)
    end

    v59.uIListLayout = v60("UIListLayout", v61)
    v59.content = React.createElement(React.Fragment, {}, v2)
    v56.troops = v57("Frame", v58, v59)
    if u3464 then
        v57 = nil
    else
        v57 = createElement
        v58 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
        }
        v59 = {uiScale = createElement("UIScale", {Scale = u1274})}
        v60 = createElement
        v61 = {
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }

        v61[React.Change.AbsoluteContentSize] = function(a1) -- Line: 1153 -- upvalues: u3552 (val) -- types: a1: userdata
            u3552(a1.AbsoluteContentSize.X)
        end

        v59.uIListLayout = v60("UIListLayout", v61)
        v59.content = React.createElement(React.Fragment, {}, v51)
        v57 = v57("Frame", v58, v59)
    end
    v56.consumables = v57
    v56.zombies = if not u3594 then nil else createElement(EnemySpawnMenu, {enabled = troops == "zombies"})
    return v54("Frame", v4, v56)
end)