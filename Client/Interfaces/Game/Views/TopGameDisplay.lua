-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.TopGameDisplay
-- Decompile time: 6.26 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local CutSceneController = require(ReplicatedStorage.Client.Controllers.Shared.CutSceneController)
local DangerAlert = require(ReplicatedStorage.Client.Interfaces.Universal.Components.DangerAlert)
local HealthBar = require(ReplicatedStorage.Client.Interfaces.Game.Components.Survival.HealthBar)
local IntermissionStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.IntermissionStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local Wave = require(ReplicatedStorage.Client.Interfaces.Game.Components.Survival.Wave)
local WaveTimer = require(ReplicatedStorage.Client.Interfaces.Game.Components.Survival.WaveTimer)
local useGameRule = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameRule)
local useIsTutorialMatch = require(ReplicatedStorage.Client.Interfaces.Hooks.useIsTutorialMatch)
local useNewNetworkEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useNewNetworkEvent)
local useTagReplicators = require(ReplicatedStorage.Client.Interfaces.Hooks.useTagReplicators)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local useCharmSelector = require(Hooks.useCharmSelector)
local useGameStateValue = require(Hooks.useGameStateValue)
local useMediaQuery = require(Hooks.useMediaQuery)
local usePlayerReplicatorValue = require(Hooks.usePlayerReplicatorValue)
local useReplicatedState = require(Hooks.useReplicatedState)
local useSound = require(Hooks.useSound)
local useUserSetting = require(Hooks.useUserSetting)
local u125 = Color3.fromHex("2DE266")
local u128 = Color3.fromHex("2D9FE2")
local u131 = Color3.fromHex("#ffb310")
local u132 = {}
u132.Green = Color3.fromHex("2DE266")
u132.Red = Color3.fromRGB(255, 21, 21)
local u141 = {}
u141.Green = Color3.fromHex("2D9FE2")
u141.Red = u131
local u145 = {}
u145.Survival = {
    Fallen = Color3.fromRGB(9, 192, 224),
    Frost = Color3.fromRGB(9, 192, 224),
    Molten = Color3.fromRGB(240, 117, 16),
    Easy = Color3.fromRGB(26, 155, 9),
    Casual = Color3.fromRGB(247, 243, 7),
    Intermediate = Color3.fromRGB(255, 78, 131),
}
u145.Hardcore = {Hardcore = Color3.fromRGB(153, 64, 255)}
local u187 = Color3.fromRGB(255, 64, 64)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local memo = React.memo

local function getFinalWaveColor(a1, a2) -- Line: 61
    -- upvalues: u145 (val), u187 (val)
    return u145[a1] and u145[a1][a2] or u187
end

local function v1(a1) -- Line: 66
    -- upvalues: memo (val), useGameStateValue (val), useViewEnabled (val), createElement (val)
    return memo(function(a1_2) -- Line: 67
        -- upvalues: useGameStateValue (upval), useViewEnabled (upval), createElement (upval), a1 (val)
        local v1 = useGameStateValue("GameMode") == "PVP"
        local Inventory = useViewEnabled("Inventory")
        if not v1 and not Inventory then
            return createElement(a1, a1_2)
        end
        return nil
    end)
end

local u196 = memo(function(a1) -- Line: 79
    -- upvalues: useMediaQuery (val), useGameStateValue (val), usePlayerReplicatorValue (val), Players (val), Enum (val)
    -- upvalues: useState (val), ReplicatedStorage (val), useUserSetting (val), useSound (val), useGameRule (val)
    -- upvalues: u132 (val), u125 (val), u141 (val), u128 (val), useIsTutorialMatch (val), u145 (val), u187 (val)
    -- upvalues: useCharmSelector (val), IntermissionStore (val), useReplicatedState (val), GameState (val), u131 (val)
    -- upvalues: useEffect (val), CutSceneController (val), useNewNetworkEvent (val), createElement (val)
    -- upvalues: HealthBar (val), Wave (val), WaveTimer (val), DangerAlert (val)
    local v1 = useMediaQuery("large", true)
    local Wave_2 = useGameStateValue("Wave")
    local TotalWaves = useGameStateValue("TotalWaves")
    local FinalWave = useGameStateValue("FinalWave")
    local Difficulty = useGameStateValue("Difficulty")
    local GameMode = useGameStateValue("GameMode")
    local HealthPerTeam = useGameStateValue("HealthPerTeam")
    local Shield = useGameStateValue("Shield")
    local v2 = usePlayerReplicatorValue(Players.LocalPlayer, "Team", Enum.Team.Player)
    local v3, u41 = useState(ReplicatedStorage.State.Timer.Time.Value)
    local v4 = useUserSetting("Health Bar Color", "Green")
    local Timer = useSound("Timer")
    local v5, u52 = useState(nil)
    local v6, u56 = useState(false)
    local DangerAlert_2 = useSound("DangerAlert")
    local Invincible = useGameRule("Invincible")
    local Max = HealthPerTeam[v2].Max
    local Current = HealthPerTeam[v2].Current
    local v7 = false
    local v8 = false
    local v9 = "Base Health"
    local v10 = u132[v4] or u125
    local v11 = u141[v4] or u128
    local v12 = useIsTutorialMatch()
    local v13 = useGameStateValue("MaxProgress", 0)
    local v14 = useGameStateValue("CurrentProgress", 0)
    local v15, u102 = useState(u145[GameMode] and u145[GameMode][Difficulty] or u187)
    local v16 = useCharmSelector(IntermissionStore.getState, function(a1) -- Line: 111
        return not a1.visible
    end)
    local v17 = useReplicatedState(GameState.Replicator, "WaveGlitch")
    if v12 and 0 < (v13 or 0) then
        v9 = "Tutorial Progress"
        Max = v13
        Current = v14
        v10 = u131
        Invincible = false
        v7 = true
        v8 = true
    end
    useEffect(function() -- Line: 127 -- upvalues: ReplicatedStorage (upval), CutSceneController (upval), Timer (val), u41 (val)
        local u8 = ReplicatedStorage.State.Timer.Time.Changed:Connect(function(a1) -- Line: 128 -- upvalues: ReplicatedStorage (upval), CutSceneController (upval), Timer (upval), u41 (upval)
            local v1 = a1
            if v1 > 5940 then
                v1 = -1
            end
            if v1 < 5
                and ReplicatedStorage.State.Timer.Sound.Value
                and v1 > 0
                and not CutSceneController.IsPlaying() then
                Timer()
            end
            u41(v1)
        end)
        return function() -- Line: 145 -- upvalues: u8 (val)
            u8:Disconnect()
        end
    end, {})
    local v18 = {FinalWave, GameMode, Difficulty}
    useEffect(function() -- Line: 150
        -- upvalues: FinalWave (val), u102 (val), GameMode (val), Difficulty (val), u145 (upval), u187 (upval)
        if FinalWave then
            local v1 = GameMode
            u102(u145[v1] and u145[v1][Difficulty] or u187)
        end
    end, v18)
    useNewNetworkEvent("DangerAlert", "PromptDanger", function(a1) -- Line: 156 -- upvalues: u52 (val), u56 (val), DangerAlert_2 (val)
        u52(a1)
        u56(true)
        DangerAlert_2()
    end)
    useNewNetworkEvent("DangerAlert", "HideDanger", function() -- Line: 162 -- upvalues: u56 (val), u52 (val)
        u56(false)
        task.wait(1)
        u52(nil)
    end)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = v1:map(function(a1) -- Line: 178
            return a1 and UDim2.new(0.5, 0, 0, -16) or UDim2.new(0.5, 0, 0, -36)
        end),
        Visible = v16,
    }, {
        sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(600, 600)}),
        healthbar = createElement(HealthBar, {
            size = UDim2.fromScale(0.719, 0.533),
            position = UDim2.fromScale(0.5, 0.5),
            anchorPoint = Vector2.new(0.5, 0.5),
            maxHealth = Max,
            health = Current,
            invincible = Invincible,
            title = v9,
            color = v10,
            shieldColor = v11,
            shield = Shield,
            disableIcon = v7,
            percentage = v8,
            lowHealthSound = useSound("LowDamage"),
            mediumHealthSound = useSound("MediumDamage"),
            fatalHealthSound = useSound("FatalHealth"),
            healHealthSound = useSound("HealthHeal"),
            shieldDamageSound = useSound("ShieldDamage"),
        }),
        wave = createElement(Wave, {
            size = UDim2.fromScale(0.211, 1.052),
            position = UDim2.fromScale(0, 0),
            anchorPoint = Vector2.new(0.35, 0),
            wave = Wave_2,
            totalWaves = TotalWaves,
            hiddenWave = v17,
            finalWaveColor = v15,
            isFinalWave = FinalWave,
        }),
        waveTimer = createElement(WaveTimer, {
            size = UDim2.fromScale(0.211, 1.052),
            position = UDim2.fromScale(1, 0),
            anchorPoint = Vector2.new(0.35, 0),
            timeLeft = v3,
        }),
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 10.66666}),
        dangerAlert = if not v5 then nil else createElement(DangerAlert, {
            text = v5,
            visible = v6,
            size = UDim2.fromScale(0.8, 0.8),
            position = UDim2.fromScale(0.5, 2.5),
        }),
    })
end)
local u199 = memo(function(a1) -- Line: 67 -- upvalues: useGameStateValue (val), useViewEnabled (val), createElement (val), u196 (val)
    local v1 = useGameStateValue("GameMode") == "PVP"
    local Inventory = useViewEnabled("Inventory")
    if not v1 and not Inventory then
        return createElement(u196, a1)
    end
    return nil
end)
return function() -- Line: 239 -- upvalues: useTagReplicators (val), useReplicatedState (val), createElement (val), u199 (val)
    if workspace.Type.Value ~= "Game" then
        return nil
    end
    return not (useReplicatedState((useTagReplicators("CurseReplicator"))[1], "VotingActive") or false) and createElement(u199)
end