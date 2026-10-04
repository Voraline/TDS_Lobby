-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Communications
-- Decompile time: 61.95 ms

if workspace:WaitForChild("Type").Value ~= "Game" then
    return function() -- Line: 2
        return nil
    end
end
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local ChatColorUtil = require(ReplicatedStorage.Shared.Modules.ChatColorUtil)
local Communication = require(ReplicatedStorage.Shared.Data.Communication)
local CommunicationConfig = require(ReplicatedStorage.Shared.Data.CommunicationConfig)
local CommunicationController = require(ReplicatedStorage.Client.Controllers.Game.CommunicationController)
local CommunicationPlacementController = require(ReplicatedStorage.Client.Controllers.Game.CommunicationPlacementController)
local CommunicationStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CommunicationStore)
local EmoteWheel = require(ReplicatedStorage.Client.Interfaces.Universal.Components.EmoteWheel)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Keybind = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Keybind)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local PlayerListStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerListStore)
local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local SettingsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore)
local SuggestionPopup = require(ReplicatedStorage.Client.Interfaces.Game.Components.SuggestionPopup)
local TowerAbilityIcons = require(ReplicatedStorage.Shared.Modules.TowerAbilityIcons)
local TowerSelectionCursorController = require(ReplicatedStorage.Client.Controllers.Game.TowerSelectionCursorController)
local TowerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TowerStore)
local TowerUpgradeUtils = require(ReplicatedStorage.Shared.Modules.TowerUpgradeUtils)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useLastInputType = require(ReplicatedStorage.Client.Interfaces.Hooks.useLastInputType)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useViewportSize = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewportSize)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local Wheel = CommunicationConfig.Wheel
local ItemsPerPage = Wheel.ItemsPerPage
local LocalPlayer = Players.LocalPlayer
local StudioTestPlayerId = Wheel.StudioTestPlayerId
local u220 = UDim2.fromScale(0.5, 0.5)
local N = Enum.KeyCode.N
local DPadLeft = Enum.KeyCode.DPadLeft

local function getAvatarThumbnailUserId(a1) -- Line: 69 -- upvalues: StudioTestPlayerId (val) -- types: a1: number
    if a1 > 0 then
        return a1
    end
    return StudioTestPlayerId
end

local function getAvatarThumbnailUrl(a1) -- Line: 73 -- upvalues: StudioTestPlayerId (val) -- types: a1: number
    return (("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(if not (a1 > 0) then StudioTestPlayerId else a1))
end

local function isPhoneViewport(a1) -- Line: 77 -- upvalues: UserInputService (val) -- types: a1: userdata
    return UserInputService.TouchEnabled and (math.min(a1.X, a1.Y)) <= 767
end

local function isGamepadInput(a1) -- Line: 82
    return string.find(a1.Name, "Gamepad", 1, true) ~= nil
end

local function shouldPlaceWheelAtMouse(a1) -- Line: 86 -- upvalues: UserInputService (val)
    if UserInputService.MouseEnabled and UserInputService.KeyboardEnabled then
        local v1 = false
        if a1 ~= Enum.UserInputType.Touch then
            v1 = not (string.find(a1.Name, "Gamepad", 1, true) ~= nil)
        end
        return v1
    end
    return false
end

local function getCommunicationWheelPosition(a1) -- Line: 94
    -- upvalues: UserInputService (val), u220 (val), GuiService (val)
    local v1
    if not UserInputService.MouseEnabled then
        v1 = false
    elseif UserInputService.KeyboardEnabled then
        v1 = false
        if a1 ~= Enum.UserInputType.Touch then
            v1 = not (string.find(a1.Name, "Gamepad", 1, true) ~= nil)
        end
    else
        v1 = false
    end
    if not v1 then
        return u220
    end
    v1 = (UserInputService:GetMouseLocation()) - GuiService:GetGuiInset()
    return UDim2.fromOffset(v1.X, v1.Y)
end

local function getCommunicationWheelNativeProps(a1, a2) -- Line: 103
    -- upvalues: UserInputService (val)
    local v1
    local v2 = {AnchorPoint = Vector2.new(0.5, 0.5), Position = a2}
    if UserInputService.TouchEnabled then
        return v2
    end
    if not UserInputService.MouseEnabled then
        v1 = false
    elseif UserInputService.KeyboardEnabled then
        v1 = false
        if a1 ~= Enum.UserInputType.Touch then
            v1 = not (string.find(a1.Name, "Gamepad", 1, true) ~= nil)
        end
    else
        v1 = false
    end
    if v1 then
        v2.Size = UDim2.fromScale(0.6, 0.6)
    end
    return v2
end

local function getCommunicationWheelKeyCode(a1) -- Line: 123 -- upvalues: N (val)
    local Name = a1.Game and a1.Game["Communication Wheel"] or N.Name
    return Enum.KeyCode[Name] or N
end

local function isSameTeam(a1) -- Line: 129 -- upvalues: PlayerReplicator (val), LocalPlayer (val) -- types: a1: userdata
    local v1 = PlayerReplicator.GetEntityFromPlayer(LocalPlayer)
    local v2 = PlayerReplicator.GetEntityFromPlayer(a1)
    return v1 and v2 and v1.Team == v2.Team
end

local function getTargetPlayers() -- Line: 136 -- upvalues: Players (val), LocalPlayer (val), PlayerReplicator (val)
    local v1, v2
    local v3 = {}
    for i, j in Players:GetPlayers() do
        if j ~= LocalPlayer then
            v1 = PlayerReplicator.GetEntityFromPlayer(LocalPlayer)
            v2 = PlayerReplicator.GetEntityFromPlayer(j)
            if v1 and v2 and v1.Team == v2.Team then
                table.insert(v3, j)
            end
        end
    end
    table.sort(v3, function(a1, a2) -- Line: 145
        return a1.DisplayName < a2.DisplayName
    end)
    return v3
end

local function getTargetEntity(a1) -- Line: 152 -- upvalues: PlayerReplicator (val) -- types: a1: userdata?
    return a1 and PlayerReplicator.GetEntityFromPlayer(a1)
end

local function getTargetLoadout(a1, a2) -- Line: 156
    -- upvalues: PlayerReplicator (val), Communication (val), GameState (val)
    local v1 = a1 and PlayerReplicator.GetEntityFromPlayer(a1)
    if not v1 then
        return {}
    end
    local v2 = Communication.getLoadoutField(GameState.GameMode == "PVP", a2)
    local Replicator = v1.Replicator
    return Replicator and Replicator:Get(v2) or v1[v2] or {}
end

local function getTowerPresentation(a1) -- Line: 167 -- upvalues: Asset (val), GameState (val) -- types: a1: string
    local v1 = Asset("Troops", a1, nil, GameState.GameMode)
    if not v1 then
        return a1, nil
    end
    local Properties = v1.Properties
    local DisplayName = Properties and Properties.DisplayName
    local Default = (Properties and Properties.SkinData or {}).Default
    local Preview = v1.Preview or Properties and Properties.Preview
    local Icon = Default and Default.Icon or Preview and Preview.Icon
    return if typeof(DisplayName) ~= "string" then a1 else if DisplayName == "" then a1 else DisplayName, Icon
end

local function getConsumablePresentation(a1) -- Line: 186 -- upvalues: Asset (val) -- types: a1: string
    local v1 = Asset("Consumables", a1)
    if not v1 then
        return a1, nil
    end
    return v1.Name, v1.Icon
end

local function getTowerReplicator(a1) -- Line: 195 -- upvalues: TowerStore (val)
    return TowerStore.getState()[a1]
end

local function getOwnerPlayerFromModel(a1) -- Line: 199 -- upvalues: Players (val) -- types: a1: userdata
    local Owner = a1 and a1:FindFirstChild("Owner")
    if Owner and Owner:IsA("NumberValue") then
        return Players:GetPlayerByUserId(Owner.Value)
    end
    return nil
end

local function getTowerUpgradeCount(a1, a2) -- Line: 208 -- upvalues: Troops (val) -- types: a1: string?, a2: boolean?
    local v1 = a1 and Troops(a1)
    local Golden = v1 and (a2 and v1.Stats.Golden or v1.Stats.Default)
    local Upgrades = Golden and Golden.Upgrades
    if Upgrades then
        return #Upgrades
    end
    return 0
end

local function isMaxUpgradeTower(a1) -- Line: 216 -- upvalues: Troops (val)
    local v1 = a1 and a1:Get("Name")
    local v2 = a1 and a1:Get("Upgrade") or 0
    local v3 = a1 and a1:Get("GoldenPerks")
    local v4 = v1 and Troops(v1)
    local Golden = v4 and (v3 and v4.Stats.Golden or v4.Stats.Default)
    local Upgrades = Golden and Golden.Upgrades
    return (if not Upgrades then 0 else #Upgrades) <= v2
end

local function showMaxUpgradeNotification() -- Line: 222 -- upvalues: Notification (val)
    Notification.Create({Text = "This tower is already max level!", Color = Color3.fromRGB(255, 0, 0)})
end

local function showCommunicationErrorNotification(a1) -- Line: 229 -- upvalues: Notification (val) -- types: a1: string
    Notification.Create({Sound = "Error", Text = a1, Color = Color3.fromRGB(255, 0, 0)})
end

local function showConsumablesDisabledNotification() -- Line: 237 -- upvalues: Notification (val)
    Notification.Create({Text = "Consumables are disabled.", Sound = "Error", Color = Color3.fromRGB(255, 0, 0)})
end

local function startTowerSelection(a1) -- Line: 241
    -- upvalues: CommunicationController (val), TowerSelectionCursorController (val), Players (val), LocalPlayer (val)
    -- upvalues: PlayerReplicator (val), TowerStore (val), Communication (val), Troops (val), Notification (val)
    CommunicationController.close()
    ;((TowerSelectionCursorController.start({
        ownedTowersOnly = false,
        selectActionText = "Select",
        filter = function(a1) -- Line: 247 -- upvalues: Players (upval), LocalPlayer (upval), PlayerReplicator (upval)
            local Owner = a1 and a1:FindFirstChild("Owner")
            local v1 = if not Owner or not Owner:IsA("NumberValue") then nil else Players:GetPlayerByUserId(Owner.Value)
            local v2 = false
            if v1 ~= nil then
                v2 = false
                if v1 ~= LocalPlayer then
                    local v3 = PlayerReplicator.GetEntityFromPlayer(LocalPlayer)
                    local v4 = PlayerReplicator.GetEntityFromPlayer(v1)
                    v2 = v3 and v4 and v3.Team == v4.Team
                end
            end
            return v2
        end,
    })):andThen(function(a1_2) -- Line: 252
        -- upvalues: TowerStore (upval), Players (upval), a1 (val), Communication (upval), Troops (upval)
        -- upvalues: Notification (upval), CommunicationController (upval)
        local v1 = TowerStore.getState()[a1_2]
        local Owner = a1_2 and a1_2:FindFirstChild("Owner")
        local v2 = if not Owner or not Owner:IsA("NumberValue") then nil else Players:GetPlayerByUserId(Owner.Value)
        if v1 and v2 then
            if a1 == Communication.Type.UpgradeTower then
                local v3 = v1 and v1:Get("Name")
                local v4 = v1 and v1:Get("Upgrade") or 0
                local v5 = v1 and v1:Get("GoldenPerks")
                local v6 = v3 and Troops(v3)
                local Golden = v6 and (v5 and v6.Stats.Golden or v6.Stats.Default)
                local Upgrades = Golden and Golden.Upgrades
                if (if not Upgrades then 0 else #Upgrades) <= v4 then
                    Notification.Create({
                        Text = "This tower is already max level!",
                        Color = Color3.fromRGB(255, 0, 0),
                    })
                    return
                end
            end
            CommunicationController.requestSuggestion({type = a1, targetUserId = v2.UserId, towerUID = v1:Get("UID")})
            return
        end
    end)):catch(function() end)
end

local function getAbilityItems(a1, a2) -- Line: 277
    -- upvalues: Troops (val), GameState (val), TowerUpgradeUtils (val), TowerAbilityIcons (val)
    local Defaults, DisplayName, v1, v2, v3, v4, v5, v6, v7, v8
    if not a1 then
        return {}
    end
    local v9 = {}
    local v10 = {}
    local v11 = nil
    local v12 = nil
    for i, j in a2, v11, v12 do
        if j:Get("OwnerId") == a1.UserId then
            v1 = Troops((j:Get("Name")))
            if v1 then
                v2 = v1.Stats[if not (j:Get("GoldenPerks")) then "Default" else "Golden"]
                Defaults = v2 and v2.Defaults and v2.Defaults.Abilities
                if Defaults then
                    v3 = j:Get("DisabledAbilities") or {}
                    v4 = j:Get("Upgrade") or 0
                    v5 = j:Get("Path") or 0
                    v6 = nil
                    v7 = nil
                    for k, n in Defaults, v6, v7 do
                        if not v9[n.Name] and not v3[n.Name] and not (v4 < (n.Level or 0)) then
                            if not n.ExcludeModes then
                                if TowerUpgradeUtils.matchesPath(n, v5) then
                                    v9[n.Name] = true
                                    v8 = {kind = "ability", name = n.Name}
                                    DisplayName = n.DisplayName or n.Name
                                    v8.displayName = DisplayName
                                    v8.icon = TowerAbilityIcons.getIcon(v1, i and i.Name, n)
                                    v8.abilityName = n.Name
                                    v8.towerUID = j:Get("UID")
                                    table.insert(v10, v8)
                                end
                            elseif not table.find(n.ExcludeModes, GameState.GameMode)
                                and TowerUpgradeUtils.matchesPath(n, v5) then
                                v9[n.Name] = true
                                v8 = {kind = "ability", name = n.Name}
                                DisplayName = n.DisplayName or n.Name
                                v8.displayName = DisplayName
                                v8.icon = TowerAbilityIcons.getIcon(v1, i and i.Name, n)
                                v8.abilityName = n.Name
                                v8.towerUID = j:Get("UID")
                                table.insert(v10, v8)
                            end
                        end
                    end
                end
            end
        end
    end
    table.sort(v10, function(a1, a2) -- Line: 337
        return a1.name < a2.name
    end)
    return v10
end

local function areAbilityItemsEqual(a1, a2) -- Line: 344
    local v1
    if a1 == a2 then
        return true
    end
    if #a1 ~= #a2 then
        return false
    end
    for i, j in a1 do
        v1 = a2[i]
        if v1
            and j.name == v1.name
            and j.displayName == v1.displayName
            and j.icon == v1.icon
            and j.abilityName == v1.abilityName
            and j.towerUID == v1.towerUID
            and j.kind == v1.kind then
            continue
        end
        return false
    end
    return true
end

local function getEnabledAbilityItems(a1, a2, a3) -- Line: 371
    -- upvalues: getAbilityItems (val), TowerStore (val)
    if not a2 then
        return {}
    end
    return (getAbilityItems(a1, a3 or TowerStore.getState()))
end

local function useAbilityItems(a1, a2, a3) -- Line: 379
    -- upvalues: useRef (val), useState (val), getAbilityItems (val), TowerStore (val), useEffect (val)
    -- upvalues: areAbilityItemsEqual (val)
    local UserId = a1
    if UserId then
        UserId = a1.UserId
    end
    local u7 = useRef(nil)
    local v1, u14 = useState(function() -- Line: 382 -- upvalues: a1 (val), a2 (val), a3 (val), getAbilityItems (upval), TowerStore (upval), u7 (val)
        local v1
        u7.current = if a2 then getAbilityItems(a1, a3 or TowerStore.getState()) else {}
        return v1
    end)
    local v2 = {UserId, a2, a3}
    useEffect(function() -- Line: 388
        -- upvalues: a1 (val), a2 (val), TowerStore (upval), getAbilityItems (upval), areAbilityItemsEqual (upval)
        -- upvalues: u7 (val), u14 (val), UserId (val), a3 (val)
        local function update() -- Line: 389
            -- upvalues: a1 (upval), a2 (upval), TowerStore (upval), getAbilityItems (upval)
            -- upvalues: areAbilityItemsEqual (upval), u7 (upval), u14 (upval)
            local v1 = a2
            local v2 = TowerStore.getState()
            local v3 = if v1 then getAbilityItems(a1, v2 or TowerStore.getState()) else {}
            local v4 = areAbilityItemsEqual
            local current = u7.current or {}
            if v4(current, v3) then
                return
            end
            u7.current = v3
            u14(v3)
        end

        update()
        if a2 and UserId ~= nil then
            local u5 = {}
            u5[1] = (TowerStore.TowerAdded:Connect(update))
            u5[2] = TowerStore.TowerRemoved:Connect(update)
            for i, j in a3 do
                if (j:Get("OwnerId")) == UserId then
                    table.insert(u5, ((j:GetStateChangedSignal("Upgrade")):Connect(update)))
                    table.insert(u5, ((j:GetStateChangedSignal("Path")):Connect(update)))
                    table.insert(u5, ((j:GetStateChangedSignal("DisabledAbilities")):Connect(update)))
                    table.insert(u5, ((j:GetStateChangedSignal("OwnerId")):Connect(update)))
                end
            end
            return function() -- Line: 424 -- upvalues: u5 (val)
                for i, j in u5 do
                    j:Disconnect()
                end
            end
        end
        return nil
    end, v2)
    return v1
end

local function getPaged(a1, a2) -- Line: 434 -- upvalues: ItemsPerPage (val)
    local v1 = {}
    local v2 = {}
    for i, j in a1 do
        table.insert(v2, j)
        if ItemsPerPage <= #v2 then
            table.insert(v1, v2)
            v2 = {}
        end
    end
    if #v2 > 0 then
        table.insert(v1, v2)
    end
    local v3 = v1[a2] or {}
    return v3, (math.max(#v1, 1))
end

local function getCooldownLabel(a1, a2, a3) -- Line: 453 -- types: a2: string, a3: number
    local v1 = a1[a2]
    if v1 and not (v1 <= a3) then
        return (("%*s"):format((math.ceil(v1 - a3))))
    end
    return nil
end

local function getSuggestionNameColor(a1) -- Line: 462 -- upvalues: Players (val), ChatColorUtil (val)
    local PlayerByUserId = Players:GetPlayerByUserId(a1.sourceUserId)
    return ChatColorUtil.getNameColor(PlayerByUserId and PlayerByUserId.Name or a1.sourceName)
end

local function getOrderedSuggestionPopups(a1) -- Line: 468 -- types: a1: table
    table.sort(a1, function(a1, a2) -- Line: 469
        if a1.createdAt == a2.createdAt then
            return a1.id < a2.id
        end
        return a1.createdAt < a2.createdAt
    end)
    local v1 = {}
    for i, j in a1 do
        v1[i] = {suggestion = j, layoutOrder = i, zIndex = i}
    end
    return v1
end

local function SuggestionNotification(a1) -- Line: 489
    -- upvalues: Communication (val), getTowerPresentation (val), createElement (val), SuggestionPopup (val)
    -- upvalues: Players (val), ChatColorUtil (val), CommunicationController (val)
    local suggestion = a1.suggestion
    local data = suggestion.data or {}
    local v1 = Communication.getTypeLabel(suggestion.type)
    local v2 = nil
    if data.towerName then
        v2 = getTowerPresentation(data.towerName)
    end
    local v3 = {
        createdAt = suggestion.createdAt,
        currentTime = a1.currentTime,
        detail = if suggestion.type == Communication.Type.PlaceTower then ("Place %*"):format(v2 or data.towerName or "a tower") else if suggestion.type == Communication.Type.SellTower then ("Sell %*"):format(v2 or data.towerName or "this tower") else if suggestion.type == Communication.Type.UpgradeTower then ("Upgrade %*"):format(v2 or data.towerName or "this tower") else if suggestion.type == Communication.Type.UseAbility then ("Use %*"):format(data.abilityName or "an ability") else if suggestion.type ~= Communication.Type.UseConsumable then v1 else ("Use %*"):format(data.consumableName or "a consumable"),
        exiting = a1.exiting,
        icon = Communication.getTypeIcon(suggestion.type),
        layoutOrder = a1.layoutOrder,
    }
    v3.lifetime = math.max(suggestion.expiresAt - suggestion.createdAt, 0)
    local PlayerByUserId = Players:GetPlayerByUserId(suggestion.sourceUserId)
    v3.nameColor = ChatColorUtil.getNameColor(PlayerByUserId and PlayerByUserId.Name or suggestion.sourceName)
    v3.showView = Communication.isMarkerType(suggestion.type)
    v3.slideDirection = a1.slideDirection
    v3.sourceName = suggestion.sourceName
    v3.zIndex = a1.zIndex

    function v3.onView() -- Line: 528
        -- upvalues: Communication (upval), suggestion (val), CommunicationController (upval)
        if Communication.isMarkerType(suggestion.type) then
            CommunicationController.focusSuggestion(suggestion)
        end
    end

    function v3.onDismiss() -- Line: 533 -- upvalues: CommunicationController (upval), suggestion (val)
        CommunicationController.dismiss(suggestion.id)
    end

    v3.onExited = a1.onExited
    return createElement(SuggestionPopup, v3)
end

return function() -- Line: 540
    -- upvalues: ReactCharm (val), CommunicationStore (val), useCharmSelector (val), PlayerListStore (val)
    -- upvalues: TowerStore (val), SettingsStore (val), N (val), useLastInputType (val), useViewportSize (val)
    -- upvalues: React (val), useGameStateValue (val), useFFlag (val), useState (val), u220 (val), useAbilityItems (val)
    -- upvalues: useEffect (val), ViewController (val), TowerSelectionCursorController (val)
    -- upvalues: CommunicationController (val), RunService (val), getCommunicationWheelPosition (val), useMemo (val)
    -- upvalues: getTargetPlayers (val), StudioTestPlayerId (val), Communication (val), getTargetLoadout (val)
    -- upvalues: getTowerPresentation (val), Asset (val), getPaged (val), DPadLeft (val), UserInputService (val)
    -- upvalues: useScale (val), LocalPlayer (val), getOrderedSuggestionPopups (val), createElement (val)
    -- upvalues: SuggestionNotification (val), EmoteWheel (val), getCommunicationWheelNativeProps (val)
    -- upvalues: useCallback (val), Notification (val), startTowerSelection (val)
    -- upvalues: CommunicationPlacementController (val), Keybind (val)
    if workspace.Type.Value ~= "Game" then
        return nil
    end
    local u8 = ReactCharm.useSignalState(CommunicationStore.getState)
    local u13 = useCharmSelector(PlayerListStore.getState, function(a1) -- Line: 546
        return a1.players
    end)
    local v1 = ReactCharm.useSignalState(TowerStore.getState)
    local v2 = useCharmSelector(SettingsStore.getState, function(a1) -- Line: 550 -- upvalues: N (upval)
        local Name = a1.Game and a1.Game["Communication Wheel"] or N.Name
        return Enum.KeyCode[Name] or N
    end, {})
    local u26 = useLastInputType()
    local v3 = useViewportSize()
    local v4, u33 = React.useBinding(false)
    local v5 = useGameStateValue("ConsumablesDisabled", false)
    local v6 = useFFlag("consumables.disabled", false, {enabled = v4})
    local u45 = true
    if v5 ~= true then
        u45 = v6 == true
    end
    local u49 = useGameStateValue("Intermission", false)
    local root, root_2 = useState("root")
    local u56, u57 = useState(nil)
    local u60, u61 = useState(nil)
    local v7, u65 = useState(1)
    local u71, u72 = useState(workspace:GetServerTimeNow())
    local v8, u76 = useState({})
    local v9, u80 = useState(u220)
    local u91 = useAbilityItems(u60, root == "abilities", v1)
    useEffect(function() -- Line: 572
        -- upvalues: ViewController (upval), TowerSelectionCursorController (upval), root_2 (val), u57 (val), u61 (val)
        -- upvalues: u65 (val), CommunicationController (upval)
        local u9 = (ViewController:getEmitter("ShowCommunicationWheel")):On("Show", function() -- Line: 574
            -- upvalues: TowerSelectionCursorController (upval), root_2 (upval), u57 (upval), u61 (upval), u65 (upval)
            -- upvalues: CommunicationController (upval)
            TowerSelectionCursorController.stop()
            root_2("root")
            u57(nil)
            u61(nil)
            u65(1)
            CommunicationController.open()
        end)
        return function() -- Line: 583 -- upvalues: u9 (val)
            u9:Disconnect()
        end
    end, {})
    useEffect(function() -- Line: 588 -- upvalues: RunService (upval), u72 (val)
        local u5 = RunService.Heartbeat:Connect(function() -- Line: 589 -- upvalues: u72 (upval)
            u72(workspace:GetServerTimeNow())
        end)
        return function() -- Line: 593 -- upvalues: u5 (val)
            u5:Disconnect()
        end
    end, {})
    local v10 = useEffect
    local v11 = {u8.open, u8.openAtMouse}
    v10(function() -- Line: 598
        -- upvalues: u8 (val), TowerSelectionCursorController (upval), root_2 (val), u57 (val), u61 (val), u65 (val)
        -- upvalues: u80 (val), getCommunicationWheelPosition (upval), u26 (val), u220 (upval), u33 (val)
        if u8.open then
            TowerSelectionCursorController.stop()
            root_2("root")
            u57(nil)
            u61(nil)
            u65(1)
            if not u8.openAtMouse then
                u80(u220)
            else
                u80(getCommunicationWheelPosition(u26))
            end
        end
        u33(u8.open)
    end, v11)
    v10 = useEffect
    v11 = {u8.open, u49}
    v10(function() -- Line: 616 -- upvalues: u8 (val), u49 (val), CommunicationController (upval)
        if u8.open and u49 == true then
            CommunicationController.close()
        end
    end, v11)
    v10 = useMemo
    v11 = {u8.open, u13}
    local u132 = v10(function() -- Line: 622 -- upvalues: getTargetPlayers (upval)
        return (getTargetPlayers())
    end, v11)
    local v12 = {u132}
    local u137 = useMemo(function() -- Line: 626 -- upvalues: u132 (val), StudioTestPlayerId (upval)
        local UserId, UserId_2
        local v1 = {}
        local v2 = nil
        local v3 = nil
        for i, j in u132, v2, v3 do
            UserId = j.UserId
            UserId_2 = j.UserId
            v1[UserId] = (("rbxthumb://type=AvatarHeadShot&id=%*&w=420&h=420"):format(if not (UserId_2 > 0) then StudioTestPlayerId else UserId_2))
        end
        return v1
    end, v12)
    v11 = useMemo
    local v13 = {root, u56, u60, u132, u137, u91, u8.cooldowns, u45, u71}
    v11 = v11(function() -- Line: 636
        -- upvalues: root (val), Communication (upval), u8 (val), u71 (val), u45 (val), u132 (val), u137 (val)
        -- upvalues: getTargetLoadout (upval), u60 (val), getTowerPresentation (upval), u91 (val), Asset (upval)
        local v1, v2, v3, v4
        if root == "root" then
            local v5, v6, v7, v8
            v1 = {}
            for i2, v in ipairs(Communication.TypeOrder) do
                v2 = Communication.getTypeLabel(v)
                v8 = u71
                v5 = u8.cooldowns[v]
                v3 = if not v5 then nil else if not (v5 <= v8) then ("%*s"):format((math.ceil(v5 - v8))) else nil
                v4 = if not v3 then if v ~= Communication.Type.UseConsumable then nil else if not u45 then nil else "Consumables are disabled." else ("%* is on cooldown. Try again in %*."):format(v2, v3)
                v6 = {kind = "root", name = v2}
                v6.displayName = v3 and ("%*\n%*"):format(v2, v3) or v2
                v6.icon = Communication.getTypeIcon(v)
                v6.type = v
                v7 = true
                if v3 == nil then
                    v7 = v4 ~= nil
                end
                v6.disabled = v7
                v6.disabledReason = v4
                table.insert(v1, v6)
            end
            return v1
        end
        v1 = {{name = "Back", displayName = "Back", icon = "8437655886", kind = "back"}}
        if root == "players" then
            for i6, i7 in u132 do
                table.insert(v1, {
                    kind = "player",
                    name = i7.DisplayName,
                    displayName = i7.DisplayName,
                    icon = u137[i7.UserId],
                    player = i7,
                })
            end
        elseif root == "towers" then
            for m, i5 in getTargetLoadout(u60, "Towers") do
                v2, v3 = getTowerPresentation(i5)
                table.insert(v1, {
                    kind = "tower",
                    name = i5,
                    displayName = v2,
                    icon = v3,
                    towerName = i5,
                })
            end
        elseif root == "abilities" then
            for k, n in u91 do
                table.insert(v1, n)
            end
        elseif root == "consumables" then
            local Icon, Name
            for i, j in getTargetLoadout(u60, "Consumables") do
                v4 = Asset("Consumables", j)
                if v4 then
                    Name = v4.Name
                    Icon = v4.Icon
                else
                    Name = j
                    Icon = nil
                end
                table.insert(v1, {
                    kind = "consumable",
                    name = j,
                    displayName = Name,
                    icon = Icon,
                    consumableName = j,
                })
            end
        end
        if #v1 == 1 then
            table.insert(v1, {name = "None", displayName = "None", disabled = true, kind = "empty"})
        end
        return v1
    end, v13)
    v12, v13 = getPaged(v11, v7)
    local v14 = if not (string.find(u26.Name, "Gamepad", 1, true) ~= nil) then v2 else DPadLeft
    local v15 = if not UserInputService.TouchEnabled then 0.56 else 0.4
    local v16 = useScale(1.5)
    local TouchEnabled = UserInputService.TouchEnabled and (math.min(v3.X, v3.Y)) <= 767
    local v17 = if not TouchEnabled then 1 else -1
    local v18 = useMemo
    local v19 = {u8.suggestions, u8.dismissed, u13}
    local u217 = v18(function() -- Line: 746 -- upvalues: u13 (val), u8 (val), LocalPlayer (upval), getOrderedSuggestionPopups (upval)
        local v1 = {}
        for i, j in u13 do
            if j.Blocked then
                v1[j.UserId] = true
            end
        end
        local v2 = {}
        for k, n in u8.suggestions do
            if n.targetUserId == LocalPlayer.UserId
                and n.sourceUserId ~= LocalPlayer.UserId
                and not u8.dismissed[k]
                and not v1[n.sourceUserId] then
                table.insert(v2, n)
            end
        end
        return (getOrderedSuggestionPopups(v2))
    end, v19)
    local v20 = {u217}
    useEffect(function() -- Line: 774 -- upvalues: u76 (val), u217 (val), Communication (upval)
        u76(function(a1) -- Line: 775 -- upvalues: u217 (upval), Communication (upval)
            local suggestion, suggestion_2, v1
            local v2 = {}
            local v3 = {}
            local v4 = {}
            local v5 = nil
            local v6 = nil
            for i, j in u217, v5, v6 do
                suggestion_2 = j.suggestion
                v3[suggestion_2.id] = true
                v1 = Communication.getSuggestionTowerPingKey(suggestion_2)
                if v1 then
                    v4[v1] = true
                end
                table.insert(v2, {
                    exiting = false,
                    suggestion = suggestion_2,
                    layoutOrder = j.layoutOrder,
                    zIndex = j.zIndex,
                })
            end
            v5 = nil
            v6 = nil
            for k, n in a1, v5, v6 do
                suggestion = n.suggestion
                if not v3[suggestion.id] then
                    v1 = Communication.getSuggestionTowerPingKey(suggestion)
                    if not v1 or not v4[v1] then
                        table.insert(v2, {
                            exiting = true,
                            suggestion = suggestion,
                            layoutOrder = n.layoutOrder,
                            zIndex = n.zIndex,
                        })
                    end
                end
            end
            table.sort(v2, function(a1, a2) -- Line: 816
                if a1.layoutOrder == a2.layoutOrder then
                    return a1.suggestion.id < a2.suggestion.id
                end
                return a1.layoutOrder < a2.layoutOrder
            end)
            return v2
        end)
    end, v20)
    local v21 = {}
    for i, j in v8 do
        local suggestion = j.suggestion
        v21[suggestion.id] = (createElement(SuggestionNotification, {
            currentTime = u71,
            exiting = j.exiting,
            layoutOrder = j.layoutOrder,
            slideDirection = v17,
            suggestion = suggestion,
            zIndex = j.zIndex,
            onExited = function() -- Line: 838 -- upvalues: u76 (val), suggestion (val)
                u76(function(a1) -- Line: 839 -- upvalues: suggestion (upval)
                    local v1 = {}
                    local v2 = nil
                    local v3 = nil
                    for i, j in a1, v2, v3 do
                        if j.suggestion.id ~= suggestion.id or not j.exiting then
                            table.insert(v1, j)
                        end
                    end
                    return v1
                end)
            end,
        }))
    end
    local Fragment = React.Fragment
    local v22 = {}
    local v23 = createElement
    local v24 = EmoteWheel
    local v25 = {
        showEmptySlots = false,
        Visible = v4,
        native = getCommunicationWheelNativeProps(u26, v9),
        page = v7,
        maxPages = v13,
        items = v12,
    }
    local v26 = {root}
    v25.onClose = useCallback(function() -- Line: 865
        -- upvalues: root (val), root_2 (val), u57 (val), u61 (val), u65 (val), CommunicationController (upval)
        if root == "root" then
            CommunicationController.close()
            return
        end
        root_2("root")
        u57(nil)
        u61(nil)
        u65(1)
    end, v26)
    v25.updatePage = useCallback(function(a1) -- Line: 877 -- upvalues: u65 (val)
        u65(a1)
    end, {})
    v26 = {u56, u60, u45}
    v25.useItem = useCallback(function(a1, a2) -- Line: 881
        -- upvalues: Notification (upval), root_2 (val), u57 (val), u61 (val), u65 (val), Communication (upval)
        -- upvalues: startTowerSelection (upval), u56 (val), u45 (val), u60 (val), CommunicationController (upval)
        -- upvalues: CommunicationPlacementController (upval)
        if not a2 then
            return
        end
        if a2.disabled then
            if a2.disabledReason then
                local disabledReason = a2.disabledReason
                Notification.Create({Sound = "Error", Text = disabledReason, Color = Color3.fromRGB(255, 0, 0)})
            end
            return
        end
        if a2.kind == "back" then
            root_2("root")
            u57(nil)
            u61(nil)
            u65(1)
            return
        end
        if a2.kind == "root" then
            u57(a2.type)
            u65(1)
            if a2.type ~= Communication.Type.SellTower and a2.type ~= Communication.Type.UpgradeTower then
                root_2("players")
                return
            end
            startTowerSelection(a2.type)
            return
        end
        if a2.kind == "player" then
            if u56 == Communication.Type.UseConsumable and u45 then
                Notification.Create({
                    Text = "Consumables are disabled.",
                    Sound = "Error",
                    Color = Color3.fromRGB(255, 0, 0),
                })
                return
            end
            u61(a2.player)
            u65(1)
            if u56 == Communication.Type.PlaceTower then
                root_2("towers")
                return
            end
            if u56 == Communication.Type.UseAbility then
                root_2("abilities")
                return
            end
            if u56 == Communication.Type.UseConsumable then
                root_2("consumables")
            end
            return
        end
        if a2.kind == "tower" and u60 then
            CommunicationController.close()
            CommunicationPlacementController.start(u60.UserId, a2.towerName)
            return
        end
        if a2.kind == "ability" and u60 then
            CommunicationController.requestSuggestion({
                type = Communication.Type.UseAbility,
                targetUserId = u60.UserId,
                abilityName = a2.abilityName,
                towerUID = a2.towerUID,
            })
            return
        end
        if a2.kind == "consumable" and u60 then
            if u45 then
                Notification.Create({
                    Text = "Consumables are disabled.",
                    Sound = "Error",
                    Color = Color3.fromRGB(255, 0, 0),
                })
                return
            end
            CommunicationController.requestSuggestion({
                type = Communication.Type.UseConsumable,
                targetUserId = u60.UserId,
                consumableName = a2.consumableName,
            })
        end
    end, v26)
    v22.wheel = v23(v24, v25)
    v22.closeHint = if not u8.open or u26 == Enum.UserInputType.Touch then nil else createElement(Keybind, {
        ActionText = "to close",
        ScaleMultiplier = 0.42,
        AnchorPoint = Vector2.new(0.5, 0.5),
        ForceConsole = string.find(u26.Name, "Gamepad", 1, true) ~= nil,
        Key = v14,
        Position = v9,
    })
    v25 = {BackgroundTransparency = 1}
    local v27 = if not TouchEnabled then Vector2.new(1, 0.5) else Vector2.new(0, 0.5)
    v25.AnchorPoint = v27
    v27 = if not TouchEnabled then UDim2.new(1, -24, v15, 0) else UDim2.new(0, 24, v15, 0)
    v25.Position = v27
    v25.Size = UDim2.fromOffset(370, 360)
    v22.notifications = createElement("Frame", v25, {
        scale = createElement("UIScale", {Scale = v16}),
        list = createElement("UIListLayout", {
            Padding = UDim.new(0, 24),
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = if not TouchEnabled then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
        }),
        items = createElement(React.Fragment, {}, v21),
    })
    return createElement(Fragment, {}, v22)
end