-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Abilities
-- Decompile time: 55.66 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local TowerAbilityIcons = require(ReplicatedStorage.Shared.Modules.TowerAbilityIcons)
local TowerUpgradeUtils = require(ReplicatedStorage.Shared.Modules.TowerUpgradeUtils)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local AbilitiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilitiesStore)
local AbilityAmmoStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilityAmmoStore)
local Charm = require(ReplicatedStorage.Packages.Charm)
local TowerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TowerStore)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local Ability = require(ReplicatedStorage.Client.Interfaces.Game.Components.Ability)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useReplicatedState = require(ReplicatedStorage.Client.Interfaces.Hooks.useReplicatedState)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useState = React.useState
local useMemo = React.useMemo
local useBinding = React.useBinding
local useRef = React.useRef
local useSpring = ReactFlow.useSpring
local UserId = Players.LocalPlayer.UserId
local u158 = UDim2.fromOffset(0, 0)
local u159 = {}
local u163 = UDim.new(0.25, 0)
local u167 = UDim.new(0.7, 0)
local u168 = Vector3.new(0, 0, 0)

local function getCharacterPosition() -- Line: 47 -- upvalues: Players (val), u168 (ref)
    local Character = Players.LocalPlayer.Character
    if Character and Character.PrimaryPart then
        u168 = Character.PrimaryPart.Position
    end
    return u168
end

local function getGroupedAbilities(a1) -- Line: 56
    -- upvalues: UserId (val), Troops (val), u159 (val), table (val), GameState (val), TowerAbilityIcons (val)
    local Abilities, v1, v2, v3, v4, v5, v6, v7
    local v8 = {}
    local v9 = {}
    local v10 = 1
    local v11 = nil
    local v12 = nil
    for i, j in a1, v11, v12 do
        v7 = j:Get("OwnerId")
        if v7 == UserId then
            v7 = j:Get("Name")
            v1 = j:Get("GoldenPerks")
            v2 = Troops(v7)
            if v2 then
                Abilities = v2.Stats[if not v1 then "Default" else "Golden"].Defaults.Abilities
                if Abilities then
                    v7 = v2.Properties.DisplayName or v7
                    v3 = j:Get("DisabledAbilities") or u159
                    v4 = nil
                    v5 = nil
                    for k, n in Abilities, v4, v5 do
                        if not v3[n.Name] then
                            if not n.ExcludeModes or not table.find(n.ExcludeModes, GameState.GameMode) then
                                v6 = v9[n.Name]
                                if not v6 then
                                    v6 = {
                                        Name = n.Name,
                                        FormattedName = n.Name:gsub("[^%w]", ""),
                                        Tower = v7,
                                        Index = v10,
                                        Abilities = {},
                                    }
                                    v8[v10] = v6
                                    v9[n.Name] = v6
                                    v10 = v10 + 1
                                end
                                table.insert(v6.Abilities, {
                                    Available = false,
                                    LevelLocked = true,
                                    Index = #v6.Abilities + 1,
                                    Replicator = j,
                                    Ability = n,
                                    Icon = TowerAbilityIcons.getIcon(v2, i and i.Name, n),
                                    Model = i,
                                    Tower = v7,
                                })
                            end
                        end
                    end
                end
            end
        end
    end
    table.sort(v8, function(a1, a2) -- Line: 119
        return a1.Tower < a2.Tower
    end)
    return v8
end

local function getAbilityAmmoId(a1) -- Line: 126 -- types: a1: table
    return a1.Ability.Name .. a1.Replicator:Get("UID")
end

local function getAbilitySubscriptions(a1) -- Line: 130 -- types: a1: table
    local v1 = {}
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        for k, n in j.Abilities do
            v1[n.Ability.Name .. n.Replicator:Get("UID")] = true
            v2[n.Model] = true
        end
    end
    return {ammoIds = v1, models = v2}
end

local function hasRelevantChange(a1, a2, a3) -- Line: 147 -- types: a1: table, a2: table, a3: table
    for i in a3 do
        if a1[i] ~= a2[i] then
            return true
        end
    end
    return false
end

local function customSort(a1, a2, a3) -- Line: 157 -- types: a1: vector
    if a2.LevelLocked and not a3.LevelLocked then
        return false
    end
    if not a2.LevelLocked and a3.LevelLocked then
        return true
    end
    if a2.Available and not a3.Available then
        return true
    end
    if not a2.Available and a3.Available then
        return false
    end
    if 0 < a2.DeltaTime and 0 < a3.DeltaTime then
        return a2.DeltaTime < a3.DeltaTime
    end
    if a2.currentAmmo and a3.currentAmmo and a2.currentAmmo ~= a3.currentAmmo then
        return a3.currentAmmo < a2.currentAmmo
    end
    local Position = (a2.Model:GetPivot()).Position
    local Position_2 = (a3.Model:GetPivot()).Position
    return (Position - a1).Magnitude < (Position_2 - a1).Magnitude
end

local function sortAbilities(a1, a2, a3) -- Line: 191
    -- upvalues: Players (val), u168 (ref), u159 (val), TowerUpgradeUtils (val), table (val), customSort (val)
    local Available, DeltaTime, LevelLocked, MaxDeltaTime, Upgrade, ammo, currentAmmo, deltaTime, interval, interval_2, maxAmmo, maxAmmo_2, maxDeltaTime, startTick, startTick_2, syncPoint, syncPoint_2, v1, v2, v3, v4, v5, v6, v7, v8, v9
    local Character = Players.LocalPlayer.Character
    if Character and Character.PrimaryPart then
        u168 = Character.PrimaryPart.Position
    end
    local u316 = u168
    local v10 = false
    local v11 = nil
    local v12 = nil
    local v13, v14 = a2, a3
    for i, j in a1, v11, v12 do
        v2 = nil
        v3 = nil
        for k, n in j.Abilities, v2, v3 do
            v4 = v14[n.Model] or u159
            Upgrade = n.Replicator.State.Upgrade
            v5 = n.Replicator:Get("Path") or 0
            Available = n.Available
            LevelLocked = n.LevelLocked
            DeltaTime = n.DeltaTime
            MaxDeltaTime = n.MaxDeltaTime
            currentAmmo = n.currentAmmo
            maxAmmo = n.maxAmmo
            interval = n.interval
            startTick = n.startTick
            syncPoint = n.syncPoint
            v6 = true
            v7 = v4[j.FormattedName]
            if v7 and v7.deltaTime and 0 < v7.deltaTime then
                v6 = false
            end
            v8 = true
            if not (Upgrade < n.Ability.Level) then
                v8 = not TowerUpgradeUtils.matchesPath(n.Ability, v5)
            end
            if v8 then
                v6 = false
            end
            ammo = nil
            maxAmmo_2 = nil
            interval_2 = nil
            startTick_2 = nil
            syncPoint_2 = nil
            v9 = v13[n.Ability.Name .. n.Replicator:Get("UID")]
            if v9 then
                if v9.ammo ~= nil and v9.ammo <= 0 then
                    v6 = false
                end
                ammo = v9.ammo
                maxAmmo_2 = v9.maxAmmo
                interval_2 = v9.interval
                startTick_2 = v9.startTick
                syncPoint_2 = v9.syncPoint
            end
            deltaTime = v7 and v7.deltaTime or 0
            maxDeltaTime = v7 and v7.maxDeltaTime or 0
            n.Available = v6
            n.LevelLocked = v8
            n.currentAmmo = ammo
            n.maxAmmo = maxAmmo_2
            n.interval = interval_2
            n.startTick = startTick_2
            n.syncPoint = syncPoint_2
            n.DeltaTime = deltaTime
            n.MaxDeltaTime = maxDeltaTime
            if Available ~= v6
                or LevelLocked ~= v8
                or DeltaTime ~= deltaTime
                or MaxDeltaTime ~= maxDeltaTime
                or currentAmmo ~= ammo
                or maxAmmo ~= maxAmmo_2
                or interval ~= interval_2
                or startTick ~= startTick_2
                or syncPoint ~= syncPoint_2 then
                v10 = true
            end
        end
        v1 = table.clone(j.Abilities)
        table.sort(j.Abilities, function(a1, a2) -- Line: 273 -- upvalues: customSort (upval), u316 (val)
            return (customSort(u316, a1, a2))
        end)
        if not v10 then
            v10 = not table.shallowCompare(v1, j.Abilities)
        end
        table.clear(v1)
    end
    return v10
end

local function canRenderAbilityGroup(a1) -- Line: 287 -- upvalues: TowerUpgradeUtils (val) -- types: a1: table
    local v1
    for i, j in a1 do
        v1 = j.Replicator:Get("Path") or 0
        if j.Ability.Level <= j.Replicator:Get("Upgrade") and TowerUpgradeUtils.matchesPath(j.Ability, v1) then
            return true
        end
    end
    return false
end

local function useGroupedAbilities() -- Line: 301
    -- upvalues: useState (val), ReactCharm (val), TowerStore (val), useRef (val), AbilityAmmoStore (val)
    -- upvalues: AbilitiesStore (val), useMemo (val), Maid (val), Signal (val), getGroupedAbilities (val)
    -- upvalues: getAbilitySubscriptions (val), useEffect (val), RunService (val), sortAbilities (val), Charm (val)
    -- upvalues: UserInputService (val), useCallback (val)
    local u3
    _, u3 = useState({})
    local u8 = ReactCharm.useSignalState(TowerStore.getState)
    local u13 = useRef(AbilityAmmoStore.getState())
    local u18 = useRef(AbilitiesStore.getState())
    local v1, u22 = useState({})
    local u26 = useMemo(function() -- Line: 309 -- upvalues: Maid (upval)
        return Maid.new()
    end, {})
    local u30 = useMemo(function() -- Line: 313 -- upvalues: Signal (upval)
        return Signal.new()
    end, {})
    local v2 = {u8, v1}
    local u36 = useMemo(function() -- Line: 317 -- upvalues: getGroupedAbilities (upval), u8 (val)
        return (getGroupedAbilities(u8))
    end, v2)
    local v3 = {u36}
    local u41 = useMemo(function() -- Line: 321 -- upvalues: getAbilitySubscriptions (upval), u36 (val)
        return (getAbilitySubscriptions(u36))
    end, v3)
    useEffect(function() -- Line: 325 -- upvalues: u26 (val), u30 (val)
        return function() -- Line: 326 -- upvalues: u26 (upval), u30 (upval)
            u26:Destroy()
            u30:Destroy()
        end
    end, {})
    local v4 = {u36, u26, u30, u41, u8}
    useEffect(function() -- Line: 332
        -- upvalues: RunService (upval), sortAbilities (upval), u36 (val), u13 (val), u18 (val), u3 (val), u8 (val)
        -- upvalues: u26 (val), u22 (val), u30 (val), Charm (upval), AbilitiesStore (upval), u41 (val)
        -- upvalues: AbilityAmmoStore (upval), UserInputService (upval)
        local u86 = false
        local u72 = nil

        local function update() -- Line: 336
            -- upvalues: u86 (ref), u72 (ref), RunService (upval), sortAbilities (upval), u36 (upval), u13 (upval)
            -- upvalues: u18 (upval), u3 (upval)
            if u86 then
                return
            end
            u86 = true
            u72 = RunService.Heartbeat:Connect(function() -- Line: 342
                -- upvalues: u72 (upval), u86 (upval), sortAbilities (upval), u36 (upval), u13 (upval), u18 (upval)
                -- upvalues: u3 (upval)
                u72:Disconnect()
                u72 = nil
                u86 = false
                debug.profilebegin("AbilityState_UIResort")
                debug.profilebegin("UIFanout_AbilitiesResort")
                local v1 = sortAbilities(u36, u13.current, u18.current)
                debug.profileend()
                debug.profileend()
                if v1 then
                    u3({})
                end
            end)
        end

        for i, j in u8 do
            u26:Mark(((j:GetStateChangedSignal("Upgrade")):Connect(update)))
            u26:Mark(((j:GetStateChangedSignal("DisabledAbilities")):Connect(function() -- Line: 367
                -- upvalues: u22 (upval), u86 (ref), u72 (ref), RunService (upval), sortAbilities (upval), u36 (upval)
                -- upvalues: u13 (upval), u18 (upval), u3 (upval)
                u22({})
                if u86 then
                    return
                end
                u86 = true
                u72 = RunService.Heartbeat:Connect(function() -- Line: 342
                    -- upvalues: u72 (upval), u86 (upval), sortAbilities (upval), u36 (upval), u13 (upval), u18 (upval)
                    -- upvalues: u3 (upval)
                    u72:Disconnect()
                    u72 = nil
                    u86 = false
                    debug.profilebegin("AbilityState_UIResort")
                    debug.profilebegin("UIFanout_AbilitiesResort")
                    local v1 = sortAbilities(u36, u13.current, u18.current)
                    debug.profileend()
                    debug.profileend()
                    if v1 then
                        u3({})
                    end
                end)
            end)))
        end
        local v1 = nil
        local v2 = nil
        for k, n in u36, v1, v2 do
            for m, i5 in n.Abilities do
                u26:Mark(((i5.Replicator:GetStateChangedSignal("Upgrade")):Connect(update)))
                u26:Mark(((i5.Replicator:GetStateChangedSignal("Path")):Connect(update)))
                u26:Mark(((i5.Replicator:GetStateChangedSignal("DisabledAbilities")):Connect(function() -- Line: 379
                    -- upvalues: u22 (upval), u86 (ref), u72 (ref), RunService (upval), sortAbilities (upval)
                    -- upvalues: u36 (upval), u13 (upval), u18 (upval), u3 (upval)
                    u22({})
                    if u86 then
                        return
                    end
                    u86 = true
                    u72 = RunService.Heartbeat:Connect(function() -- Line: 342
                        -- upvalues: u72 (upval), u86 (upval), sortAbilities (upval), u36 (upval), u13 (upval)
                        -- upvalues: u18 (upval), u3 (upval)
                        u72:Disconnect()
                        u72 = nil
                        u86 = false
                        debug.profilebegin("AbilityState_UIResort")
                        debug.profilebegin("UIFanout_AbilitiesResort")
                        local v1 = sortAbilities(u36, u13.current, u18.current)
                        debug.profileend()
                        debug.profileend()
                        if v1 then
                            u3({})
                        end
                    end)
                end)))
            end
        end
        u26:Mark((u30:Connect(update)))
        u26:Mark((Charm.listen(AbilitiesStore.getState, function(a1) -- Line: 388
            -- upvalues: u18 (upval), u41 (upval), u86 (ref), u72 (ref), RunService (upval), sortAbilities (upval)
            -- upvalues: u36 (upval), u13 (upval), u3 (upval)
            local current = u18.current
            u18.current = a1
            for i in u41.models do
                if current[i] ~= a1[i] then
                    if true then
                        if u86 then
                            return
                        end
                        u86 = true
                        u72 = RunService.Heartbeat:Connect(function() -- Line: 342
                            -- upvalues: u72 (upval), u86 (upval), sortAbilities (upval), u36 (upval), u13 (upval)
                            -- upvalues: u18 (upval), u3 (upval)
                            u72:Disconnect()
                            u72 = nil
                            u86 = false
                            debug.profilebegin("AbilityState_UIResort")
                            debug.profilebegin("UIFanout_AbilitiesResort")
                            local v1 = sortAbilities(u36, u13.current, u18.current)
                            debug.profileend()
                            debug.profileend()
                            if v1 then
                                u3({})
                            end
                        end)
                    end
                    return
                end
            end
            if false then
                if u86 then
                    return
                end
                u86 = true
                u72 = RunService.Heartbeat:Connect(function() -- Line: 342
                    -- upvalues: u72 (upval), u86 (upval), sortAbilities (upval), u36 (upval), u13 (upval), u18 (upval)
                    -- upvalues: u3 (upval)
                    u72:Disconnect()
                    u72 = nil
                    u86 = false
                    debug.profilebegin("AbilityState_UIResort")
                    debug.profilebegin("UIFanout_AbilitiesResort")
                    local v1 = sortAbilities(u36, u13.current, u18.current)
                    debug.profileend()
                    debug.profileend()
                    if v1 then
                        u3({})
                    end
                end)
            end
        end)))
        u26:Mark((Charm.listen(AbilityAmmoStore.getState, function(a1) -- Line: 396
            -- upvalues: u13 (upval), u41 (upval), u86 (ref), u72 (ref), RunService (upval), sortAbilities (upval)
            -- upvalues: u36 (upval), u18 (upval), u3 (upval)
            local current = u13.current
            u13.current = a1
            for i in u41.ammoIds do
                if current[i] ~= a1[i] then
                    if true then
                        if u86 then
                            return
                        end
                        u86 = true
                        u72 = RunService.Heartbeat:Connect(function() -- Line: 342
                            -- upvalues: u72 (upval), u86 (upval), sortAbilities (upval), u36 (upval), u13 (upval)
                            -- upvalues: u18 (upval), u3 (upval)
                            u72:Disconnect()
                            u72 = nil
                            u86 = false
                            debug.profilebegin("AbilityState_UIResort")
                            debug.profilebegin("UIFanout_AbilitiesResort")
                            local v1 = sortAbilities(u36, u13.current, u18.current)
                            debug.profileend()
                            debug.profileend()
                            if v1 then
                                u3({})
                            end
                        end)
                    end
                    return
                end
            end
            if false then
                if u86 then
                    return
                end
                u86 = true
                u72 = RunService.Heartbeat:Connect(function() -- Line: 342
                    -- upvalues: u72 (upval), u86 (upval), sortAbilities (upval), u36 (upval), u13 (upval), u18 (upval)
                    -- upvalues: u3 (upval)
                    u72:Disconnect()
                    u72 = nil
                    u86 = false
                    debug.profilebegin("AbilityState_UIResort")
                    debug.profilebegin("UIFanout_AbilitiesResort")
                    local v1 = sortAbilities(u36, u13.current, u18.current)
                    debug.profileend()
                    debug.profileend()
                    if v1 then
                        u3({})
                    end
                end)
            end
        end)))
        u26:Mark((UserInputService.InputChanged:Connect(function(a1, a2) -- Line: 404
            -- upvalues: u86 (ref), u72 (ref), RunService (upval), sortAbilities (upval), u36 (upval), u13 (upval)
            -- upvalues: u18 (upval), u3 (upval)
            if a2 or a1.UserInputType ~= Enum.UserInputType.TextInput or u86 then
                return
            end
            u86 = true
            u72 = RunService.Heartbeat:Connect(function() -- Line: 342
                -- upvalues: u72 (upval), u86 (upval), sortAbilities (upval), u36 (upval), u13 (upval), u18 (upval)
                -- upvalues: u3 (upval)
                u72:Disconnect()
                u72 = nil
                u86 = false
                debug.profilebegin("AbilityState_UIResort")
                debug.profilebegin("UIFanout_AbilitiesResort")
                local v1 = sortAbilities(u36, u13.current, u18.current)
                debug.profileend()
                debug.profileend()
                if v1 then
                    u3({})
                end
            end)
        end)))
        if not u86 then
            u86 = true
            u72 = RunService.Heartbeat:Connect(function() -- Line: 342
                -- upvalues: u72 (ref), u86 (ref), sortAbilities (upval), u36 (upval), u13 (upval), u18 (upval)
                -- upvalues: u3 (upval)
                u72:Disconnect()
                u72 = nil
                u86 = false
                debug.profilebegin("AbilityState_UIResort")
                debug.profilebegin("UIFanout_AbilitiesResort")
                local v1 = sortAbilities(u36, u13.current, u18.current)
                debug.profileend()
                debug.profileend()
                if v1 then
                    u3({})
                end
            end)
        end
        return function() -- Line: 418 -- upvalues: u72 (ref), u26 (upval)
            if u72 then
                u72:Disconnect()
                u72 = nil
            end
            u26:Sweep()
        end
    end, v4)
    return u36, (useCallback(function() -- Line: 429 -- upvalues: u30 (val)
        u30:Fire()
    end, {})), u13.current
end

local u181 = React.memo(function(a1) -- Line: 435
    -- upvalues: useReplicatedState (val), u159 (val), useGameStateValue (val), useTween (val), u158 (val)
    -- upvalues: useBinding (val), useSpring (val), useState (val), useRef (val), useEffect (val), ServerTicks (val)
    -- upvalues: RunService (val), createElement (val), Ability (val), AbilitiesStore (val)
    local u62
    local Ability_2 = a1.Ability
    local Model = a1.Model
    local Disabled = a1.Disabled or a1.Current ~= true
    local Visible = if a1.Visible ~= nil then a1.Visible else true
    local v1 = useReplicatedState(a1.Replicator, "DisabledAbilities", u159)
    local TimeScale = useGameStateValue("TimeScale")
    local v2, v3 = useTween(a1.Scale, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), nil, true)
    local v4, v5 = useTween(a1.Position or u158, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), nil, true)
    v3(a1.Scale or 1)
    v5(a1.Position or u158)
    _, u62 = useBinding(a1.SyncPoint or 0)
    local v6, u66 = useSpring({start = 0, speed = 15, damper = 0.7})
    local u69, u70 = useBinding(-1)
    local v7, u74 = useSpring({start = 0, speed = 20, damping = 0.6})
    local v8, u78 = useSpring({start = 0, speed = 25, damping = 0.7})
    local Interval = a1.Interval
    local StartTick = a1.StartTick
    local u85 = false
    if Interval ~= nil then
        u85 = false
        if StartTick ~= nil then
            u85 = Interval > 0
        end
    end
    local v9, u89 = useState(0)
    local u92 = useRef(nil)
    local v10 = useEffect
    local v11 = {Ability_2.Name, a1.Ammo}
    v10(function() -- Line: 477 -- upvalues: u92 (val), Ability_2 (val), a1 (val), u89 (val)
        local current = u92.current
        u92.current = {abilityName = Ability_2.Name, ammo = a1.Ammo}
        if current and current.abilityName == Ability_2.Name then
            if typeof(current.ammo) == "number" and typeof(a1.Ammo) == "number" and a1.Ammo < current.ammo then
                u89(function(a1) -- Line: 493
                    return a1 + 1
                end)
            end
            return
        end
    end, v11)
    local v12 = useEffect
    local v13 = {a1.GroupName, a1.SetHoveredTowerGroup}
    v12(function() -- Line: 515 -- upvalues: a1 (val)
        return function() -- Line: 516 -- upvalues: a1 (upval)
            if a1.SetHoveredTowerGroup then
                a1.SetHoveredTowerGroup(function(a1_2) -- Line: 518 -- upvalues: a1 (upval)
                    if a1_2 == a1.GroupName then
                        return nil
                    end
                    return a1_2
                end)
            end
        end
    end, v13)
    v12 = useEffect
    v13 = {a1.SyncPoint}
    v12(function() -- Line: 525 -- upvalues: a1 (val), u62 (val)
        if not a1.SyncPoint then
            return
        end
        u62(a1.SyncPoint)
    end, v13)

    local function isFull() -- Line: 533 -- upvalues: a1 (val)
        local v1 = false
        if typeof(a1.Ammo) == "number" then
            v1 = false
            if typeof(a1.MaxAmmo) == "number" then
                v1 = a1.MaxAmmo <= a1.Ammo
            end
        end
        return v1
    end

    v11 = useEffect
    local v14 = {a1.Ammo, a1.MaxAmmo, u85, StartTick, TimeScale, Interval}
    v11(function() -- Line: 539
        -- upvalues: u85 (val), a1 (val), u62 (val), u70 (val), u66 (val), ServerTicks (upval), StartTick (val)
        -- upvalues: Interval (val), u69 (val), u78 (val), u74 (val), RunService (upval)
        if u85 then
            local v1 = false
            if typeof(a1.Ammo) == "number" then
                v1 = false
                if typeof(a1.MaxAmmo) == "number" then
                    local Ammo_2 = a1.Ammo
                    v1 = a1.MaxAmmo <= Ammo_2
                end
            end
            if not v1 then
                local u18 = 0

                local function updateProgress() -- Line: 549
                    -- upvalues: ServerTicks (upval), StartTick (upval), Interval (upval), u69 (upval), u78 (upval)
                    -- upvalues: u66 (upval), u18 (ref), u74 (upval), u62 (upval), u70 (upval)
                    local v1 = math.clamp(ServerTicks.getTime() - StartTick, 0, Interval)
                    local v2 = math.clamp(v1 / Interval, 0, 1)
                    local v3 = math.ceil((math.max(0, Interval - v1)))
                    if u69:getValue() ~= v3 then
                        u78({force = 8})
                        u66({target = v2})
                        u18 = v2
                    end
                    if v3 < 1 and u18 ~= 0 then
                        u74({force = 15})
                        u66({target = 0})
                        u18 = 0
                    end
                    u62(v1)
                    u70(v3)
                end

                updateProgress()
                local u22 = nil
                u22 = RunService.RenderStepped:Connect(function() -- Line: 574 -- upvalues: a1 (upval), u22 (ref), updateProgress (val)
                    local v1 = false
                    if typeof(a1.Ammo) == "number" then
                        v1 = false
                        if typeof(a1.MaxAmmo) == "number" then
                            local Ammo_2 = a1.Ammo
                            v1 = a1.MaxAmmo <= Ammo_2
                        end
                    end
                    if v1 then
                        u22:Disconnect()
                        return
                    end
                    updateProgress()
                end)
                return function() -- Line: 583 -- upvalues: u74 (upval), u66 (upval), u70 (upval), u22 (ref)
                    u74({force = 15})
                    u66({target = 0})
                    u70(-1)
                    u66({target = 0})
                    if u22.Connected then
                        u22:Disconnect()
                    end
                end
            end
        end
        u62(0)
        u70(-1)
        u66({target = 0})
    end, v14)
    v14 = {
        UseBorder = true,
        Ammo = a1.Ammo,
        MaxAmmo = a1.MaxAmmo,
        TimeLeft = if not u85 then nil else u69,
        OnSelected = a1.OnSelected,
        Size = a1.Size,
        Position = v4,
        ZIndex = a1.ZIndex,
        Visible = Visible and not Disabled,
        OnReady = a1.OnUpdate,
        OnHover = function(a1_2) -- Line: 499 -- upvalues: a1 (val) -- types: a1_2: boolean
            if a1.SetHoveredTowerGroup then
                a1.SetHoveredTowerGroup(function(a1_3) -- Line: 501 -- upvalues: a1_2 (val), a1 (upval)
                    if a1_2 then
                        return a1.GroupName
                    end
                    if a1_3 == a1.GroupName then
                        return nil
                    end
                    return a1_3
                end)
            end
            if a1.OnUpdate then
                a1.OnUpdate()
            end
        end,
        Price = Ability_2.Price,
        ForcedLocked = v1[Ability_2.Name] or false,
        LayoutOrder = a1.Index,
        Disabled = Disabled,
        Scale = v2,
        Name = Ability_2.Name,
        DisplayName = Ability_2.DisplayName,
        Description = Ability_2.Description,
        TowerName = a1.TowerName,
    }
    local Icon = a1.Icon or Ability_2.Icon
    v14.Icon = Icon
    v14.CoolDown = Ability_2.Debounce or 0
    v14.Model = Model
    v14.ShowTimeLeftAtZero = a1.ShowTimeLeftAtZero
    v14.HideTimeLeftAboveAmmo = a1.HideTimeLeftAboveAmmo
    v14.HideSingleAmmoCount = a1.HideSingleAmmoCount
    v14.HotkeyDark = a1.HotkeyDark
    v14.ActivationSignal = v9

    function v14.Callback() -- Line: 630
        -- upvalues: a1 (val), u74 (val), AbilitiesStore (upval), Model (val), Ability_2 (val)
        if a1.Ammo and a1.Ammo <= 0 then
            u74({force = 15})
            return false
        end
        AbilitiesStore.UseAbility:Fire(Model, Ability_2.Name)
        return true
    end

    v14.percentageProgress = v6
    v14.bounceSpring = v7
    v14.durationBounceSpring = v8
    return createElement(Ability, v14)
end, function(a1, a2) -- Line: 643
    local v1 = false
    if a1.Disabled == a2.Disabled then
        v1 = false
        if a1.Ammo == a2.Ammo then
            v1 = false
            if a1.MaxAmmo == a2.MaxAmmo then
                v1 = false
                if a1.Interval == a2.Interval then
                    v1 = false
                    if a1.StartTick == a2.StartTick then
                        v1 = false
                        if a1.Index == a2.Index then
                            v1 = false
                            if a1.ZIndex == a2.ZIndex then
                                v1 = false
                                if a1.Ability == a2.Ability then
                                    v1 = false
                                    if a1.Icon == a2.Icon then
                                        v1 = false
                                        if a1.TowerName == a2.TowerName then
                                            v1 = false
                                            if a1.CoolDown == a2.CoolDown then
                                                v1 = false
                                                if a1.HideTimeLeftAboveAmmo == a2.HideTimeLeftAboveAmmo then
                                                    v1 = false
                                                    if a1.HideSingleAmmoCount == a2.HideSingleAmmoCount then
                                                        v1 = false
                                                        if a1.HotkeyDark == a2.HotkeyDark then
                                                            v1 = false
                                                            if a1.GroupName == a2.GroupName then
                                                                v1 = false
                                                                if a1.SetHoveredTowerGroup == a2.SetHoveredTowerGroup then
                                                                    v1 = a1.Model == a2.Model
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return v1
end)

local function getAbilityAmmo(a1, a2) -- Line: 663 -- types: a1: table, a2: table
    local v1 = a1[a2.Ability.Name .. a2.Replicator:Get("UID")]
    local ammo = v1 and v1.ammo
    local maxAmmo = v1 and v1.maxAmmo
    if ammo == nil then
        ammo = a2.currentAmmo
    end
    if maxAmmo == nil then
        maxAmmo = a2.maxAmmo
    end
    return v1, ammo, maxAmmo
end

local function GroupedAbility(a1) -- Line: 679
    -- upvalues: TowerUpgradeUtils (val), ServerTicks (val), createElement (val), u181 (val)
    local Level, ammo, maxAmmo, v1, v2, v3, v4, v5, v6
    local Index = a1.Index
    local Abilities = a1.Abilities
    local Disabled = a1.Disabled
    local v7 = 0
    local v8 = nil
    local v9 = nil
    local v10 = nil
    local v11 = nil
    local v12 = false
    local v13 = 0
    local v14 = 0
    local v15 = nil
    local v16 = nil
    for i, j in Abilities, v15, v16 do
        Level = j.Ability.Level
        v2 = j.Replicator:Get("Upgrade") < Level
        v3 = j.Replicator:Get("Path") or 0
        if not v2 and TowerUpgradeUtils.matchesPath(j.Ability, v3) then
            v6 = a1.AbilityAmmoStore[j.Ability.Name .. j.Replicator:Get("UID")]
            ammo = v6 and v6.ammo
            maxAmmo = v6 and v6.maxAmmo
            if ammo == nil then
                ammo = j.currentAmmo
            end
            if maxAmmo == nil then
                maxAmmo = j.maxAmmo
            end
            v4 = v6
            v5 = ammo
            if v5 ~= nil then
                v12 = true
                v13 = v13 + v5
                v14 = v14 + (maxAmmo or v5)
            end
            if not v10 then
                v10 = j
                v11 = v4
            end
            if j.Available then
                v7 = v7 + 1
            end
            if j.Available and not v8 then
                v8 = j
                v9 = v4
            end
        end
    end
    if not v8 then
        v8 = v10
        v9 = v11
    end
    if not v8 then
        return nil
    end
    local v17 = v7
    v15 = v7
    local syncPoint = v9 and v9.syncPoint or v8.syncPoint
    local interval = v9 and v9.interval or v8.interval
    local startTick = v9 and v9.startTick or v8.startTick
    if v12 then
        v15 = if not (v14 > 0) then v13 else v14
    elseif v17 == 0 and v8.DeltaTime and v8.MaxDeltaTime then
        local MaxDeltaTime = v8.MaxDeltaTime
        if MaxDeltaTime > 0 then
            local DeltaTime = v8.DeltaTime
            if ServerTicks.getTime() < DeltaTime then
                interval = MaxDeltaTime
                startTick = v8.DeltaTime - MaxDeltaTime
                v15 = 1
            end
        end
    end
    return createElement(u181, {
        Current = true,
        Scale = 1,
        ZIndex = 1,
        HideTimeLeftAboveAmmo = 1,
        Position = UDim2.fromOffset(0, 0),
        Disabled = Disabled,
        OnUpdate = v1.Updated,
        Replicator = v8.Replicator,
        Ability = v8.Ability,
        Icon = v8.Icon,
        Model = v8.Model,
        TowerName = v8.Tower,
        GroupName = v1.GroupName,
        SetHoveredTowerGroup = v1.SetHoveredTowerGroup,
        Index = Index,
        Ammo = v17,
        MaxAmmo = v15,
        SyncPoint = syncPoint,
        Interval = interval,
        StartTick = startTick,
        ShowTimeLeftAtZero = v7 == 0,
        HideSingleAmmoCount = not v12,
    })
end

return function(a1) -- Line: 782
    -- upvalues: useCharmSelector (val), UpgradesStore (val), useGroupedAbilities (val), useState (val)
    -- upvalues: canRenderAbilityGroup (val), createElement (val), u163 (val), GroupedAbility (val), useScale (val)
    -- upvalues: u167 (val), React (val)
    local Tower, v1, v2
    local v3 = useCharmSelector(UpgradesStore.getState, function(a1) -- Line: 783
        return a1.enabled ~= true
    end, {})
    local v4 = {}
    local v5 = {}
    local v6 = {}
    local v7 = 1
    local v8, v9, v10 = useGroupedAbilities()
    local v11, v12 = useState(nil)
    local v13 = nil
    local v14 = nil
    for i, j in v8, v13, v14 do
        if canRenderAbilityGroup(j.Abilities) then
            Tower = j.Tower
            if v4[Tower] == nil then
                v1 = {}
                v4[Tower] = v1
                v5[Tower] = 1
                v6[v7] = (createElement("Frame", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromOffset(80, 80),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    LayoutOrder = v7,
                    ZIndex = if v11 ~= Tower then 1 else 1000,
                }, {
                    listLayout = createElement("UIListLayout", {
                        Padding = u163,
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    }),
                }, v1))
                v7 = v7 + 1
            end
            v1 = v5[Tower]
            v2 = createElement(GroupedAbility, {
                Index = v1,
                Name = j.Name,
                Abilities = j.Abilities,
                Updated = v9,
                Disabled = not v3,
                AbilityAmmoStore = v10,
                GroupName = Tower,
                SetHoveredTowerGroup = v12,
            })
            v5[Tower] = v5[Tower] + 1
            v4[Tower][tostring(v1)] = v2
        end
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0, 16, 0.5, -36),
        Size = UDim2.fromOffset(64, 64),
        Visible = v3,
    }, {
        uiScale = createElement("UIScale", {Scale = useScale(1.5)}),
        uIListLayout = createElement("UIListLayout", {
            Padding = u167,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        content = React.createElement(React.Fragment, {}, v6),
    })
end