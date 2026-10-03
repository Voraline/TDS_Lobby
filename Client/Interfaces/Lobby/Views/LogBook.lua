-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.LogBook
-- Decompile time: 15.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Hooks = Interfaces.Hooks
local Components = Interfaces.Lobby.Components
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EnemyGameModeLookup = require(Interfaces.Lobby.Utility.EnemyGameModeLookup)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useAchievements = require(ReplicatedStorage.Client.Interfaces.Hooks.useAchievements)
local LogBook = require(Components.LogBook)
local useCache = require(Hooks.useCache)
local useFFlag = require(Hooks.useFFlag)
local useSandboxUnlock = require(Hooks.useSandboxUnlock)
local useSound = require(Hooks.useSound)
local useViewEnabled = require(Hooks.useViewEnabled)
local createElement = React.createElement
local useState = React.useState
local useCallback = React.useCallback
local useEffect = React.useEffect
local useMemo = React.useMemo
local NewEnemies = Content("NewEnemies")
local Maps = Content("Maps")
local Inventory = Network.Channel("Inventory")
local Achievements = NewNetwork.Channel("Achievements")
local u99 = {}
local u100 = {}
local u101 = {"Survival", "Hardcore"}
local u104 = {Warden = true, ["Spooky Tank"] = true}
local u107 = {}
u107.Easy = {Image = 112696659470062, MaxWaves = 25, Color = Color3.fromRGB(29, 177, 95)}
u107.Casual = {Image = 138730920504021, MaxWaves = 30, Color = Color3.fromRGB(18, 95, 7)}
u107.Intermediate = {Image = 128301720523651, MaxWaves = 30, Color = Color3.fromRGB(216, 45, 48)}
u107.Molten = {Image = 102198937125369, MaxWaves = 35, Color = Color3.fromRGB(255, 102, 0)}
u107.Fallen = {Image = 18757025100, MaxWaves = 40, Color = Color3.fromRGB(0, 89, 255)}
u107.Frost = {Image = 89107535866598, MaxWaves = 40, Color = Color3.fromRGB(81, 137, 242)}
u107.Hardcore = {
    Difficulty = "Easy",
    Image = 131350845832048,
    MaxWaves = 45,
    Color = Color3.fromRGB(183, 0, 255),
}
u107.Voidcore = {
    Difficulty = "Hard",
    Image = 132674199021388,
    MaxWaves = 50,
    Color = Color3.fromRGB(183, 0, 255),
}
local u156 = {[Enum.Gamemode.Survival] = {"Easy", "Casual", "Intermediate", "Molten", "Fallen", "Frost"}}
u156[Enum.Gamemode.Hardcore] = {"Hardcore", "Voidcore"}

local function isMapValid(a1) -- Line: 138 -- upvalues: table (val), u101 (val), Enum (val) -- types: a1: table?
    if not a1 then
        return false
    end
    if not a1.Skip and not a1.HideFromLogbook then
        for i in a1.Gamemodes do
            if table.find(u101, Enum.Gamemode.ToString(i)) then
                return true
            end
        end
        return false
    end
    return false
end

local function getMapData(a1) -- Line: 156 -- upvalues: Maps (val) -- types: a1: string
    local v1 = Maps:FindFirstChild(a1)
    if not v1 then
        return nil
    end
    if v1:IsA("Folder") then
        return (require(v1.Data))
    end
    return (require(v1))
end

local function getMaps() -- Line: 172 -- upvalues: Maps (val), isMapValid (val), table (val)
    local v1
    local v2 = {}
    for i, j in Maps:GetChildren() do
        v1 = Maps:FindFirstChild(j.Name)
        if isMapValid(if v1 then if not v1:IsA("Folder") then require(v1) else require(v1.Data) else nil) then
            table.insert(v2, j.Name)
        end
    end
    return v2
end

local function getEnemyStats(a1) -- Line: 185 -- upvalues: u100 (val), u99 (val), NewEnemies (val) -- types: a1: string
    local v1 = u100[a1]
    if v1 ~= nil then
        if v1 == u99 then
            return nil
        end
        return v1
    end
    local v2 = NewEnemies:FindFirstChild(a1)
    local Stats = v2 and v2:FindFirstChild("Stats")
    if Stats and Stats:IsA("ModuleScript") then
        local success, result = pcall(require, Stats)
        if success then
            u100[a1] = result
            return result
        end
        warn((("Failed to read logbook enemy stats for %*: %*"):format(a1, result)))
        u100[a1] = u99
        return nil
    end
    u100[a1] = u99
    return nil
end

local function getEnemyIcon(a1) -- Line: 209 -- upvalues: Icons (val) -- types: a1: string
    return Icons.Enemies[a1] or Icons.LegacyEnemies[a1] or "rbxassetid://15913919212"
end

local function usesLegacyEnemyModel(a1, a2) -- Line: 213 -- upvalues: Icons (val) -- types: a1: string
    local v1 = false
    if Icons.LegacyEnemies[a1] ~= nil then
        v1 = false
        if Icons.Enemies[a1] == nil then
            v1 = false
            if a2 ~= nil then
                v1 = true
                if a2.Archived ~= true then
                    v1 = a2.Removed == true
                end
            end
        end
    end
    return v1
end

local function hasCurrentEnemyWithDisplayName(a1, a2) -- Line: 220
    -- upvalues: NewEnemies (val)
    if a2 == a1 then
        return false
    end
    return NewEnemies:FindFirstChild(a2) ~= nil
end

local function getCanonicalEnemyName(a1) -- Line: 228
    -- upvalues: getEnemyStats (val), NewEnemies (val)
    local v1 = getEnemyStats(a1)
    local DisplayName = v1 and v1.DisplayName
    if typeof(DisplayName) == "string"
        and (if DisplayName ~= a1 then NewEnemies:FindFirstChild(DisplayName) ~= nil else false) then
        return DisplayName
    end
    return a1
end

local function mergeGameModes(a1, a2) -- Line: 241 -- upvalues: table (val) -- types: a1: table?, a2: table?
    local v1 = {}
    local v2 = {}
    for i, v in ipairs((table.mergeList(a1 or {}, a2 or {}))) do
        if typeof(v) == "string" and not v2[v] then
            v2[v] = true
            table.insert(v1, v)
        end
    end
    return v1
end

local function getBestTime(a1) -- Line: 256 -- types: a1: table
    local v1 = (1 / 0)
    for k, v in pairs(a1) do
        v1 = math.min(v1, v)
    end
    if v1 == (1 / 0) then
        return "N/A"
    end
    local v2 = math.floor(v1 / 86400)
    local v3 = math.floor(v1 % 86400 / 3600)
    local v4 = math.floor(v1 % 3600 / 60)
    local v5 = math.floor(v1 % 60)
    if v2 > 0 then
        return string.format("%02d:%02d:%02d:%02d", v2, v3, v4, v5)
    end
    if v3 > 0 then
        return string.format("%02d:%02d:%02d", v3, v4, v5)
    end
    return string.format("%02d:%02d", v4, v5)
end

return function() -- Line: 280
    -- upvalues: useViewEnabled (val), useFFlag (val), useCache (val), useState (val), useAchievements (val)
    -- upvalues: EnemyGameModeLookup (val), useSandboxUnlock (val), useMemo (val), getMaps (val), useSound (val)
    -- upvalues: useCallback (val), useEffect (val), ViewController (val), Achievements (val), Inventory (val)
    -- upvalues: Maps (val), getBestTime (val), Enum (val), u156 (val), u107 (val), table (val), createElement (val)
    -- upvalues: LogBook (val), getEnemyStats (val), NewEnemies (val), u104 (val), mergeGameModes (val), Icons (val)
    local LogBook_2, LogBook_3 = useViewEnabled("LogBook")
    local v1 = useFFlag("logbook.enabled", true, {enabled = LogBook_2})
    local u12 = useCache("ProgressionStats.Maps", {})
    local v2 = useCache("Achievements", {})
    local u20 = useCache("Equipped.Flair", nil)
    local Selection_2, Selection = useState("Selection")
    local Enemies, Enemies_2 = useState("Enemies")
    local u31, v3 = useAchievements(v2)
    local v4, u36 = useState(nil)
    local v5, u40 = useState(nil)
    local v6, u46 = useState(EnemyGameModeLookup.getVersion())
    local Maps_2 = useSandboxUnlock("Maps")
    local Enemies_3 = useSandboxUnlock("Enemies")
    local u56 = useMemo(function() -- Line: 300 -- upvalues: getMaps (upval)
        return (getMaps())
    end, {})
    local u59 = useSound("Logbook Open")
    local u62 = useSound("Logbook Select")
    local u65 = useSound("Page Left")
    local u68 = useSound("Page Right")
    local v7 = useCallback(function() -- Line: 309 -- upvalues: LogBook_3 (val)
        LogBook_3("Hotbar")
    end, {})
    if not v1 and LogBook_2 then
        task.defer(v7)
    end
    local v8 = {LogBook_2}
    useEffect(function() -- Line: 317 -- upvalues: LogBook_2 (val), u59 (val)
        if LogBook_2 then
            u59()
        end
    end, v8)
    useEffect(function() -- Line: 323 -- upvalues: EnemyGameModeLookup (upval), u46 (val)
        return EnemyGameModeLookup.subscribe(function(a1) -- Line: 324 -- upvalues: u46 (upval)
            u46(a1)
        end)
    end, {})
    local v9 = useCallback(function() -- Line: 329 -- upvalues: u65 (val), u36 (val), u40 (val), Selection (val)
        u65()
        u36(nil)
        u40(nil)
        Selection("Selection")
    end, {})
    local v10 = useCallback(function(a1) -- Line: 338 -- upvalues: u62 (val), u36 (val), Selection (val) -- types: a1: table
        u62()
        u36(a1)
        Selection("Information")
    end, {})
    v8 = useCallback(function() -- Line: 344 -- upvalues: ViewController (upval)
        ViewController:notifyError("You have not unlocked this enemy.")
    end, {})
    local v11 = useCallback(function(a1) -- Line: 348 -- upvalues: u62 (val), u40 (val), Selection (val) -- types: a1: string
        u62()
        u40(a1)
        Selection("Selection")
    end, {})
    local v12 = {Enemies}
    local v13 = useCallback(function(a1) -- Line: 354
        -- upvalues: Enemies (val), u68 (val), u65 (val), u36 (val), u40 (val), Selection (val), Enemies_2 (val)
        if a1 == Enemies then
            return
        end
        if a1 ~= "Maps" then
            u65()
        else
            u68()
        end
        u36(nil)
        u40(nil)
        Selection("Selection")
        Enemies_2(a1)
    end, v12)
    local v14 = useCallback(function(a1) -- Line: 372 -- upvalues: Achievements (upval), ViewController (upval) -- types: a1: string
        local v1, v2 = Achievements:invokeServer("Claim", a1)
        if not v1 then
            ViewController:notifyError(v2)
            return
        end
        ViewController:notify((("You have claimed the achievement \"%*\"!"):format(a1)))
    end, {})
    local v15 = {u31, u20}
    v12 = useCallback(function(a1) -- Line: 381
        -- upvalues: u31 (val), u20 (val), Inventory (upval), ViewController (upval)
        local v1, v2, v3
        local v4 = u31[a1]
        if not v4 then
            return
        end
        local v5 = v4.flair or a1
        if not (a1 == u20) then
            v2, v3 = Inventory:InvokeServer("Equip", "Flair", v5)
        else
            v2, v3 = Inventory:InvokeServer("Unequip", "Flair", v5)
        end
        if not v2 then
            ViewController:notifyError(v3)
            return
        end
        ViewController:notify((("You have %* the title \"%*\"!"):format(if not v1 then "equipped" else "unequipped", v5)))
    end, v15)
    local v16 = {u12, Maps_2}
    local u136 = useCallback(function(a1) -- Line: 407
        -- upvalues: Maps (upval), u12 (val), getBestTime (upval), Enum (upval), u156 (upval), u107 (upval)
        -- upvalues: table (upval), Maps_2 (val)
        local MaxWaves, v1, v2, v3, v4, v5, v6
        local v7 = Maps:FindFirstChild(a1)
        if not (if v7 then if not v7:IsA("Folder") then require(v7) else require(v7.Data) else nil) then
            return nil
        end
        v7 = u12[a1] or {wins = 0, losses = 0, progress = {}, bestTime = {}}
        local v8 = "N/A"
        local wins = v7.wins
        local losses = v7.losses
        if losses > 0 then
            v8 = string.format("%.1f", wins / losses)
        end
        local v9 = {}
        local v10 = {
            {name = "Wins", value = wins},
            {name = "Losses", value = losses},
            {name = "W/L Ratio", value = v8},
            {name = "Best Time", value = getBestTime(v7.bestTime)},
        }
        if v1.Gamemodes[1] then
            warn(("Map %* has invalid gamemode data"):format(a1), v1)
        end
        local v11 = nil
        local v12 = nil
        for i in v1.Gamemodes, v11, v12 do
            v2 = Enum.Gamemode.ToString(i)
            v3 = u156[i]
            if v2 and v3 then
                for j, k in v3 do
                    v4 = u107[k]
                    if v4 then
                        v5 = v7.progress[("%*/%*"):format(v2, v4.Difficulty or k)] or 0
                        MaxWaves = v4.MaxWaves
                        v6 = MaxWaves * v5
                        table.insert(v9, {
                            name = k,
                            color = v4.Color,
                            icon = v4.Image,
                            wave = v6,
                            maxWave = MaxWaves,
                        })
                    end
                end
            end
        end
        if not next(v9) then
            return nil
        end
        return {
            name = a1,
            locked = Maps_2[a1] ~= true,
            icon = v1.ImageID or "rbxassetid://15913919212",
            difficulty = v1.Difficulty,
            scores = v10,
            modes = v9,
        }
    end, v16)
    v15 = createElement
    v16 = LogBook
    local v17 = {
        Visible = LogBook_2,
        tab = Enemies,
        page = Selection_2,
        flair = u20,
        selectedEnemy = v4,
        selectedMap = v5,
        onEnemySelected = v10,
        onLockedEnemySelected = v8,
        onMapSelected = v11,
        onAchievementClaim = v14,
        onFlairEquip = v12,
        onTabSelected = v13,
        onBack = v9,
        onClose = v7,
    }
    local v18 = {Maps_2, u12}
    v17.maps = useMemo(function() -- Line: 520 -- upvalues: u56 (val), u136 (val), table (upval)
        local v1
        local v2 = {}
        for i, v in ipairs(u56) do
            v1 = u136(v)
            if v1 then
                table.insert(v2, v1)
            end
        end
        table.sort(v2, function(a1, a2) -- Line: 542
            if a1.locked == a2.locked then
                return a1.name < a2.name
            end
            if a1.locked then
                return false
            end
            if a2.locked then
                return true
            end
            return a1.name < a2.name
        end)
        return v2
    end, v18)
    v18 = {Enemies_3, v6}
    v17.enemies = useMemo(function() -- Line: 557
        -- upvalues: Enemies_3 (val), getEnemyStats (upval), NewEnemies (upval), u104 (upval), mergeGameModes (upval)
        -- upvalues: EnemyGameModeLookup (upval), table (upval), Icons (upval)
        local DisplayName, DisplayName_2, v1, v2
        local u135 = {}
        local u139 = {}
        local u130 = {}
        local v3 = nil
        local v4 = nil
        for i, j in Enemies_3, v3, v4 do
            if j then
                v2 = getEnemyStats(i)
                DisplayName_2 = v2 and v2.DisplayName
                u130[if typeof(DisplayName_2) ~= "string" then i else if not (if DisplayName_2 ~= i then NewEnemies:FindFirstChild(DisplayName_2) ~= nil else false) then i else DisplayName_2] = true
            end
        end

        local function addEnemy(a1, a2) -- Line: 568
            -- upvalues: u104 (upval), getEnemyStats (upval), NewEnemies (upval), u139 (val), mergeGameModes (upval)
            -- upvalues: EnemyGameModeLookup (upval), table (upval), u135 (val), u130 (val), Icons (upval)
            if u104[a1] and not a2 then
                return
            end
            local v1 = getEnemyStats(a1)
            local DisplayName = v1 and v1.DisplayName
            if (if typeof(DisplayName) ~= "string" then a1 else if not (if DisplayName ~= a1 then NewEnemies:FindFirstChild(DisplayName) ~= nil else false) then a1 else DisplayName) ~= a1
                or u139[a1] then
                return
            end
            if NewEnemies:FindFirstChild(a1) then
                local v2 = getEnemyStats(a1)
                local DisplayName_3 = if not v2 then a1 else if typeof(v2.DisplayName) ~= "string" then a1 else v2.DisplayName
                u139[a1] = true
                local v3 = mergeGameModes(EnemyGameModeLookup.getModes(a1), v2 and v2.GameModesDisplayOverride)
                local insert = table.insert
                local v4 = {name = a1, displayName = DisplayName_3, locked = not u130[a1]}
                local v5 = Icons.Enemies[a1] or Icons.LegacyEnemies[a1] or "rbxassetid://15913919212"
                v4.icon = v5
                v4.gameModes = v3
                v5 = false
                if Icons.LegacyEnemies[a1] ~= nil then
                    v5 = false
                    if Icons.Enemies[a1] == nil then
                        v5 = false
                        if v2 ~= nil then
                            v5 = true
                            if v2.Archived ~= true then
                                v5 = v2.Removed == true
                            end
                        end
                    end
                end
                v4.legacy = v5
                insert(u135, v4)
            end
        end

        for k, n in EnemyGameModeLookup.getAlwaysVisibleLockedEnemyNames() do
            addEnemy(n)
        end
        v4 = nil
        local v5 = nil
        for m, i5 in Enemies_3, v4, v5 do
            if i5 then
                v1 = getEnemyStats(m)
                DisplayName = v1 and v1.DisplayName
                addEnemy(
                    if typeof(DisplayName) ~= "string" then m else if not (if DisplayName ~= m then NewEnemies:FindFirstChild(DisplayName) ~= nil else false) then m else DisplayName,
                    true
                )
            end
        end
        table.sort(u135, function(a1, a2) -- Line: 614
            if a1.locked == a2.locked then
                return a1.displayName < a2.displayName
            end
            if a1.locked then
                return false
            end
            if a2.locked then
                return true
            end
            return a1.displayName < a2.displayName
        end)
        return u135
    end, v18)
    v17.achievements = v2
    v17.sortedAchievements = v3
    return v15(v16, v17)
end