-- Script path: ReplicatedStorage.Shared.Modules.GameState
-- Decompile time: 11.50 ms

local HealthPerTeam, HealthPerTeam_2, v1
local v2 = game:GetService("RunService"):IsServer()
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
require(ReplicatedStorage.Shared.Modules.LinearPath)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local v3 = workspace:WaitForChild("Type").Value == "Game"
local u56 = {
    GodMode = nil,
    Paths = {},
    RawPaths = {},
    PathsBlacklist = nil,
    PVPTemplarDefeated = {},
    RawPathsReady = false,
    Health = 100,
    Shield = 0,
    MedicOverHealLimits = {},
    HasDifficultyVote = false,
    HasDifficultyVoteCompleted = false,
    DifficultyVotes = {},
    MaxHealth = 100,
    HealthCap = nil,
    TimeScale = 1,
    TimeScaleLocked = true,
    PlayerCount = 0,
    Revives = 0,
    ServerTime = 0,
    RewardMultiplier = 1,
    PreIntermission = true,
    Invincible = false,
    Unsellable = false,
    CanVoteForModifiers = false,
    GlobalTrial = "",
    BannedTowers = {},
    BanningPlayers = {},
    BansPerPlayer = {},
    Banning = false,
    EquippingPVPTowers = false,
    VotingForMap = false,
    PVPArena = "UNSET",
    CanRestart = true,
    TimeScaleDisabled = false,
    Loadouts = nil,
    DisableCustomLoadout = nil,
    TowerLimits = {
        40,
        30,
        25,
        20,
        Max = 16,
    },
    PlayerCountPerTeam = {},
    InputDisabled = false,
    TowerLimit = 0,
    TowerInteraction = false,
    ConsumablesDisabled = false,
    RevivesDisabled = false,
    GameOver = false,
    GameDuration = 0,
    WinningTeam = nil,
    HealthPerTeam = {},
    GlobalModifiers = {},
    GlobalModifiersEnabled = {},
    ClientModifiers = {},
    ShrineModifiers = {},
    Skills = {},
    SkillStates = {},
    Wave = 0,
    TotalWaves = 0,
    FinalWave = false,
    TotalEnemies = 0,
    GameStarted = false,
    BonusEligble = true,
}
u56.WaveChanged = Signal.new()
u56.NewGameModes = false
u56.GameMode = ""
u56.MapName = ""
u56.ChallengeTimestamp = nil
u56.ConsumableUsed = false
u56.CleanupMaid = Maid.new()
u56.Objective = nil

local function getModifierLimitedHealth(a1) -- Line: 111 -- upvalues: u56 (val) -- types: a1: number
    if u56.Replicator and u56.Replicator.State.GlobalModifiersEnabled.Glass == true and a1 > 1 then
        return 1
    end
    return a1
end

for i, j in Enum.Team do
    HealthPerTeam_2 = u56.HealthPerTeam
    v1 = {Current = u56.Health, Max = u56.Health}
    HealthPerTeam_2[j] = v1
end
for k, n in Enum.Team do
    HealthPerTeam = u56.HealthPerTeam
    v1 = {Current = u56.Health, Max = u56.Health}
    HealthPerTeam[n] = v1
end

function u56.getPath(a1, a2) -- Line: 137 -- upvalues: u56 (val) -- types: a1: number, a2: string
    local v1 = u56.Paths[a1] or u56.Paths[tostring(a1)]
    if not v1 then
        return nil
    end
    return v1[a2] or v1[tonumber(a2)]
end

local function createLocalReplicator() -- Line: 146 -- upvalues: Signal (val), u56 (val)
    local u2 = Signal.new()
    return (setmetatable({
        State = u56,
        Changed = u2,
        Get = function(a1, a2) -- Line: 153 -- upvalues: u56 (upval)
            return u56[a2]
        end,
        Set = function(a1, a2, a3) -- Line: 157 -- upvalues: u56 (upval), u2 (val)
            u56[a2] = a3
            u2:Fire(a2, a3)
        end,
        Remove = function(a1, a2) -- Line: 162 -- upvalues: u56 (upval), u2 (val)
            u56[a2] = nil
            u2:Fire(a2, nil)
        end,
        Hook = function() end,
        GetStateChangedSignal = function(a1, a2) -- Line: 169 -- upvalues: Signal (upval), u2 (val)
            local u4 = Signal.new()
            u2:Connect(function(a1, a2_2) -- Line: 172 -- upvalues: a2 (val), u4 (val)
                if a1 == a2 then
                    u4:Fire(a2_2)
                end
            end)
            return u4
        end,
    }, {
        __index = function(a1, a2) -- Line: 183 -- upvalues: u56 (upval)
            return u56[a2]
        end,
    }))
end

if RunService:IsServer() and RunService:IsRunning() and v3 then
    local v4
    local SkillsUtil = require(ReplicatedStorage.Shared.Modules.SkillsUtil)
    local GameRules = require(script.Parent.GameRules)
    local ServerTagReplicator = require(ServerStorage.Server.Modules.ServerTagReplicator)
    ;(Network.Channel("StatePaths")):On("RequestPaths", function() -- Line: 196 -- upvalues: u56 (val)
        while u56.RawPathsReady == false do
            task.wait()
        end
        local v1 = {}
        for i, j in u56.RawPaths do
            v1[tostring(i)] = j
        end
        return v1
    end)
    local v5 = {}
    v1 = {}
    for m, i5 in Enum.Team do
        v4 = {Current = u56.Health, Max = u56.Health}
        v5[i5] = v4
        v1[i5] = 0
    end
    u56.Replicator = ServerTagReplicator.new("GameState", {
        GameStarted = false,
        GameOver = false,
        WaveAdd = 0,
        WaveGlitch = false,
        HealthTaken = false,
        ReviveAllowed = true,
        GlitchEffect = false,
        TimeScaleDisabled = false,
        Health = u56.Health,
        MaxHealth = u56.Health,
        HealthPerTeam = v5,
        PlayerCountPerTeam = v1,
        TimeScale = u56.TimeScale,
        TimeScaleLocked = u56.TimeScaleLocked,
        NewGameModes = u56.NewGameModes,
        Wave = u56.Wave,
        ServerTime = u56.ServerTime,
        CanVoteForModifiers = u56.CanVoteForModifiers,
        GlobalTrial = u56.GlobalTrial,
        ClientModifiers = u56.ClientModifiers,
        ShrineModifiers = u56.ShrineModifiers,
        Skills = u56.Skills,
        SkillStates = u56.SkillStates,
        GlobalModifiersEnabled = u56.GlobalModifiersEnabled,
    })
    if ReplicatedStorage:FindFirstChild("State") then
        ReplicatedStorage.State.Health.Current.Changed:Connect(function() -- Line: 253 -- upvalues: ReplicatedStorage (val), u56 (val), Enum (val)
            local Value = ReplicatedStorage.State.Health.Current.Value
            local v1 = if not u56.Replicator then Value else if u56.Replicator.State.GlobalModifiersEnabled.Glass ~= true then Value else if not (Value > 1) then Value else 1
            if v1 ~= Value then
                ReplicatedStorage.State.Health.Current.Value = v1
            end
            u56.Replicator:Set("Health", v1)
            u56.HealthPerTeam[Enum.Team.Player].Current = v1
            u56.Replicator:Set("HealthPerTeam", u56.HealthPerTeam)
        end)
        ReplicatedStorage.State.Health.Max.Changed:Connect(function() -- Line: 266 -- upvalues: ReplicatedStorage (val), u56 (val), Enum (val)
            local Value = ReplicatedStorage.State.Health.Max.Value
            local v1 = if not u56.Replicator then Value else if u56.Replicator.State.GlobalModifiersEnabled.Glass ~= true then Value else if not (Value > 1) then Value else 1
            if v1 ~= Value then
                ReplicatedStorage.State.Health.Max.Value = v1
            end
            u56.Replicator:Set("MaxHealth", v1)
            u56.HealthPerTeam[Enum.Team.Player].Max = v1
            u56.Replicator:Set("HealthPerTeam", u56.HealthPerTeam)
        end)
    end
    ;(u56.Replicator:GetStateChangedSignal("TowerInteraction")):Connect(function(a1) -- Line: 280 -- upvalues: u56 (val)
        u56.TowerInteraction = a1
    end)
    u56.WaveChanged:Connect(function() -- Line: 284 -- upvalues: u56 (val)
        u56.Replicator:Set("Wave", u56.Wave)
    end)

    function u56.IsModifierEnabled(a1) -- Line: 288 -- upvalues: u56 (val) -- types: a1: string
        return u56.Replicator.State.GlobalModifiersEnabled[a1] == true
    end

    function u56.SetGlobalModifierEnabled(a1, a2) -- Line: 292 -- upvalues: u56 (val)
        u56.GlobalModifiersEnabled[a1] = a2 or false
        u56.Replicator:Set("GlobalModifiersEnabled", u56.GlobalModifiersEnabled)
    end

    function u56.GetTowerCount(a1) -- Line: 297 -- upvalues: u56 (val), GameRules (val)
        local v1 = u56.PlayerCountPerTeam[a1] or 0
        local ManualTowerLimit = GameRules.Get("ManualTowerLimit") or u56.TowerLimits[v1] or u56.TowerLimits.Max
        if u56.IsModifierEnabled("The Star") then
            ManualTowerLimit = ManualTowerLimit + 5
        end
        return ManualTowerLimit
    end

    function u56.IncrementTeamHealth(a1, a2, a3) -- Line: 311
        -- upvalues: GameRules (val), ServerStorage (val), u56 (val), Enum (val), SkillsUtil (val)
        -- upvalues: ReplicatedStorage (val)
        if a2 <= 0 and GameRules.Has("Invincible") then
            return
        end
        local v1 = 0
        local TowerClass = require(ServerStorage.Server.Modules.TowerClass)
        if not u56.IsModifierEnabled("Glass") then
            local v2
            if GameRules.HasSkill(Enum.SkillTreeNode.Overhealing) then
                v1 = SkillsUtil.avgSkillEval(Enum.SkillTreeNode.Overhealing)
            end
            for i, j in u56.MedicOverHealLimits do
                v2 = TowerClass.getTowerByModel(i)
                if v2 and v2.Team == a1 then
                    v1 = v1 + j
                end
            end
        end
        local v3 = u56.HealthPerTeam[a1].Max + v1
        local v4 = 0
        if typeof(a3) == "number" then
            v4 = math.clamp(a3, 0, v3)
        end
        local v5 = u56.HealthPerTeam[a1]
        v5.Current = math.clamp(u56.HealthPerTeam[a1].Current + a2, v4, v3)
        if a1 ~= Enum.Team.Player then
            u56.Replicator:Set("HealthPerTeam", u56.HealthPerTeam)
            return u56.HealthPerTeam[a1].Current
        end
        u56.Health = u56.HealthPerTeam[a1].Current
        u56.Replicator:Set("Health", u56.Health)
        ReplicatedStorage.State.Health.Current.Value = u56.Health
        return u56.Health
    end

    function u56.GetMaxHealth() -- Line: 359 -- upvalues: u56 (val), Enum (val)
        local v1 = 0
        for i, j in u56.MedicOverHealLimits do
            v1 = v1 + j
        end
        return u56.HealthPerTeam[Enum.Team.Player].Max + v1
    end

    function u56.SetTeamHealth(a1, a2, a3) -- Line: 368
        -- upvalues: u56 (val), Enum (val), ReplicatedStorage (val)
        if u56.GodMode then
            a2 = 9000000000
        end
        local v1 = a3 and math.min(a2, a3) or a2
        local v2 = a3 and math.max(a3, v1) or v1
        if a1 ~= Enum.Team.Player then
            u56.HealthPerTeam[a1].Current = v1
            u56.HealthPerTeam[a1].Max = v2
            u56.Replicator:Set("HealthPerTeam", u56.HealthPerTeam)
            return
        end
        u56.Health = v1
        u56.MaxHealth = v2
        u56.Replicator:Set("Health", u56.Health)
        u56.Replicator:Set("MaxHealth", u56.MaxHealth)
        ReplicatedStorage.State.Health.Current.Value = u56.Health
        ReplicatedStorage.State.Health.Max.Value = u56.MaxHealth
    end

    function u56.IncrementHealth(a1) -- Line: 395 -- upvalues: GameRules (val), u56 (val), Enum (val), SkillsUtil (val)
        warn("IncrementHealth is deprecated, use IncrementTeamHealth instead", debug.traceback())
        if a1 <= 0 and GameRules.Has("Invincible") then
            return
        end
        local v1 = 0
        if not u56.IsModifierEnabled("Glass") then
            if GameRules.HasSkill(Enum.SkillTreeNode.Overhealing) then
                v1 = SkillsUtil.avgSkillEval(Enum.SkillTreeNode.Overhealing)
            end
            for i, j in u56.MedicOverHealLimits do
                v1 = v1 + j
            end
        end
        u56.Health = math.clamp(u56.Health + a1, 0, u56.MaxHealth + v1)
        local v2 = u56.HealthPerTeam[Enum.Team.Player]
        v2.Current = u56.Health
        v2 = u56.HealthPerTeam[Enum.Team.Player]
        v2.Max = u56.MaxHealth + v1
        u56.Replicator:Set("Health", u56.Health)
        u56.Replicator:Set("HealthPerTeam", u56.HealthPerTeam)
    end

    function u56.SetHealth(a1) -- Line: 423 -- upvalues: u56 (val), GameRules (val), Enum (val), SkillsUtil (val)
        if u56.GodMode then
            a1 = (1 / 0)
        end
        local v1 = 0
        if not u56.IsModifierEnabled("Glass") and GameRules.HasSkill(Enum.SkillTreeNode.Overhealing) then
            v1 = SkillsUtil.avgSkillEval(Enum.SkillTreeNode.Overhealing)
        end
        warn("SetHealth is deprecated, use SetTeamHealth instead", debug.traceback())
        u56.Health = a1
        u56.MaxHealth = a1 + v1
        u56.HealthPerTeam[Enum.Team.Player] = {Current = a1, Max = a1}
        u56.Replicator:Set("Health", u56.Health)
        u56.Replicator:Set("MaxHealth", u56.MaxHealth)
        u56.Replicator:Set("HealthPerTeam", u56.HealthPerTeam)
    end

    function u56.Get(a1) -- Line: 450 -- upvalues: u56 (val)
        return u56[a1]
    end

    u56.Replicator.ReplicationFolder.Name = "GameStateReplicator"
    u56.Replicator:Hook(u56)
    return u56
end
if RunService:IsRunning() and v3 then
    local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
    local GameRules_2 = require(ReplicatedStorage.Shared.Modules.GameRules)
    local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
    local Promise = if not v2 then require(ReplicatedStorage.Shared.Modules.Promise) else require(ServerStorage.Server.Modules.Session.DataStore2.Promise)
    local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
    local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
    local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
    local GameStateReplicator = (ReplicatedStorage:WaitForChild("StateReplicators")):WaitForChild("GameStateReplicator")
    local u356 = {}
    u356.Updated = Signal.new()
    u356.Paths = {}
    u356.PlayerCountPerTeam = {}
    u356.GlobalModifiers = {}
    local u367 = TagReplicator.getReplicatorEntityFromFolder(GameStateReplicator)
    u356.Replicator = u367
    u356.State = u367
    u367:Hook(u367)
    u367:Hook(u356)
    ;(u367:GetStateChangedSignal("Wave")):Connect(function(a1) -- Line: 514 -- upvalues: LegacyMiddleware (val), Enum_2 (val)
        LegacyMiddleware:RunFunction(Enum_2.HookType.OnNextWave, nil, function() -- Line: 515 -- upvalues: a1 (val)
            return a1
        end)
    end)
    task.defer(function() -- Line: 520 -- upvalues: u356 (val), u367 (val)
        u356.Updated:Fire(u367)
    end)

    function u356.GetState() -- Line: 524 -- upvalues: Promise (val), u367 (val)
        return Promise.resolve(u367)
    end

    function u56.Get(a1) -- Line: 528 -- upvalues: u56 (val)
        return u56.Replicator:Get(a1)
    end

    function u356.GetTowerCount(a1) -- Line: 532 -- upvalues: u356 (val), GameRules_2 (val), u56 (val)
        local v1 = u356.PlayerCountPerTeam[a1] or 0
        return GameRules_2.Get("ManualTowerLimit") or u56.TowerLimits[v1] or u56.TowerLimits.Max
    end

    u356.Replicator:Set("TowerLimit", 0)

    local function refreshTowerLimit(a1) -- Line: 542 -- upvalues: u356 (val)
        u356.Replicator:Set("TowerLimit", (u356.GetTowerCount(a1)))
    end

    ;(PlayerReplicator.GetLocalPlayer()):andThen(function(a1) -- Line: 546 -- upvalues: refreshTowerLimit (val), GameRules_2 (val), u356 (val), u56 (val)
        (a1.Replicator:GetStateChangedSignal("Team")):Connect(refreshTowerLimit)
        ;(GameRules_2.GetRuleChangedEvent("ManualTowerLimit")):Connect(function() -- Line: 548 -- upvalues: a1 (val), u356 (upval)
            local Team = a1.Team
            u356.Replicator:Set("TowerLimit", (u356.GetTowerCount(Team)))
        end)
        ;(u356.Replicator:GetStateChangedSignal("TowerLimits")):Connect(function(a1_2) -- Line: 554 -- upvalues: u56 (upval), a1 (val), u356 (upval)
            u56.TowerLimits = a1_2
            local Team = a1.Team
            u356.Replicator:Set("TowerLimit", (u356.GetTowerCount(Team)))
        end)
        ;(u356.Replicator:GetStateChangedSignal("PlayerCountPerTeam")):Connect(function() -- Line: 559 -- upvalues: a1 (val), u356 (upval)
            local Team = a1.Team
            u356.Replicator:Set("TowerLimit", (u356.GetTowerCount(Team)))
        end)
        local Team = a1.Team
        u356.Replicator:Set("TowerLimit", (u356.GetTowerCount(Team)))
    end)

    function u356.IsModifierEnabled(a1) -- Line: 566 -- upvalues: u356 (val) -- types: a1: string
        return u356.Replicator.State.GlobalModifiersEnabled[a1] == true
    end

    function u356.GetAsync(a1) -- Line: 570 -- upvalues: TypedPromise (val), u356 (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 571 -- upvalues: u356 (upval), a1 (val)
            local u3 = false
            a3(function() -- Line: 574 -- upvalues: u3 (ref)
                u3 = true
            end)
            if u356.Replicator:Get(a1) ~= nil then
                a1_2(u356.Replicator:Get(a1))
            else
                local v1
                repeat
                    if not (u356.Replicator:Get(a1)) then
                        task.wait()
                    end
                until v1 or u3
                v2(v1)
            end
        end)
    end

    function u356.getPath(a1, a2) -- Line: 593 -- upvalues: u356 (val) -- types: a1: number, a2: number
        local v1 = 0
        local v2 = u356.Paths[a1][a2]
        while v2 == nil do
            if not (v1 < 5) then
                break
            end
            task.wait(0.1)
            v2 = u356.Paths[a1][a2]
            v1 = v1 + 1
        end
        return v2
    end

    return u356
end
local Promise_2 = require(ReplicatedStorage.Shared.Modules.Promise)
u56.Replicator = createLocalReplicator()
u56.State = u56

function u56.GetState() -- Line: 462 -- upvalues: Promise_2 (val), u56 (val)
    return Promise_2.resolve(u56.Replicator)
end

function u56.GetAsync(a1) -- Line: 466 -- upvalues: Promise_2 (val), u56 (val)
    return Promise_2.resolve(u56[a1])
end

function u56.Get(a1) -- Line: 470 -- upvalues: u56 (val)
    return u56[a1]
end

function u56.IsModifierEnabled(a1) -- Line: 474 -- upvalues: u56 (val) -- types: a1: string
    return u56.GlobalModifiersEnabled[a1] == true
end

function u56.SetGlobalModifierEnabled(a1, a2) -- Line: 478 -- upvalues: u56 (val)
    u56.GlobalModifiersEnabled[a1] = a2 or false
    u56.Replicator:Set("GlobalModifiersEnabled", u56.GlobalModifiersEnabled)
end

function u56.GetTowerCount(a1) -- Line: 483 -- upvalues: u56 (val)
    return u56.TowerLimits[u56.PlayerCountPerTeam[a1] or 0] or u56.TowerLimits.Max
end

return u56