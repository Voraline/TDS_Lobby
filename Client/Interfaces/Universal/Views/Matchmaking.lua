-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.Matchmaking
-- Decompile time: 52.73 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Matchmaking = ReplicatedStorage.Client.Interfaces.Universal.Components.Matchmaking
local Challenges = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Challenges)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local DisconnectionPenaltyController = require(ReplicatedStorage.Client.Controllers.Lobby.DisconnectionPenaltyController)
local GameModeCard = require(Matchmaking.GameModeCard)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local MatchmakingMap = require(Matchmaking.MatchmakingMap)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
local MatchmakingController = require(Interfaces.LegacyInterface.Controllers.MatchmakingController)
local MatchmakingFound = require(Matchmaking.MatchmakingFound)
local MatchmakingInterface = require(Interfaces.Lobby.Components.NewMatchmaking.MatchmakingInterface)
local MatchmakingModel = require(Interfaces.Lobby.Components.NewMatchmaking.MatchmakingModel)
local MatchmakingPairing = require(Interfaces.Universal.Components.MatchmakingPairing)
local MatchmakingStore = require(Interfaces.Stores.Lobby.MatchmakingStore)
local MatchmakingTrialData = require(Interfaces.Lobby.Components.NewMatchmaking.MatchmakingTrialData)
local MatchmakingMenu = require(Matchmaking.MatchmakingMenu)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local PartyStore = require(Interfaces.Stores.Lobby.PartyStore)
local MatchmakingPlayerCount = require(Matchmaking.MatchmakingPlayerCount)
local Prompt = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Prompt)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ServerCountStore = require(Interfaces.Stores.Lobby.ServerCountStore)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local MatchmakingStates = require(Interfaces.Stores.Lobby.MatchmakingStates)
local StoryBook = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook)
local StoryModeClient = require(ReplicatedStorage.Client.Modules.StoryModeClient)
local StoryModeData = require(Interfaces.Lobby.Components.NewMatchmaking.StoryModeData)
local StoryModeRewards = require(Interfaces.Lobby.Components.NewMatchmaking.StoryModeRewards)
local ViewController = require(Interfaces.LegacyInterface.Controllers.ViewController)
local GameModeData = require(ReplicatedStorage.Shared.Data.GameModeData)
require(ReplicatedStorage.Client.Controllers.Shared.ABController)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useAttribute = require(ReplicatedStorage.Client.Interfaces.Hooks.useAttribute)
local useBadges = require(ReplicatedStorage.Client.Interfaces.Hooks.useBadges)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useGlobalTrial = require(ReplicatedStorage.Client.Interfaces.Hooks.useGlobalTrial)
local useHasSandboxGamepass = require(ReplicatedStorage.Client.Interfaces.Hooks.useHasSandboxGamepass)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local useTowerPurchaseData = require(ReplicatedStorage.Client.Interfaces.Hooks.useTowerPurchaseData)
local useTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useTowers)
local useViewEnabled = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewEnabled)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useBinding = React.useBinding
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local u279 = {"Badlands", "PollutedWasteland", "PizzaParty"}
local u283 = {PollutedWasteland = 50}
local u284 = {Badlands = "badlands", PizzaParty = "halloween", PollutedWasteland = "polluted"}
local u285 = {halloween_live_event2025 = 6}
local u290 = Color3.fromRGB(80, 255, 86)
local u295 = Color3.fromRGB(255, 190, 68)
local u300 = Color3.fromRGB(108, 108, 108)
local u301 = {3068686954467604}
local Inventory = Network.Channel("Inventory")
local Shop = Network.Channel("Shop")
local Monetization = NewNetwork.Channel("Monetization")

local function getUserIdKey(a1) -- Line: 95 -- types: a1: table
    local v1 = table.create(#a1)
    for i, j in a1 do
        v1[i] = (tostring(j))
    end
    return table.concat(v1, ",")
end

local function getPartyMemberKey(a1) -- Line: 105 -- upvalues: Players (val), getUserIdKey (val) -- types: a1: table
    if #a1 == 0 then
        return (tostring(Players.LocalPlayer.UserId))
    end
    local v1 = table.create(#a1)
    for i, j in a1 do
        v1[i] = j.UserId
    end
    return getUserIdKey(v1)
end

local function getMaxTowerSlots(a1) -- Line: 118 -- upvalues: SharedGameConstants (val) -- types: a1: number
    local MAX_TOWER_SLOTS = SharedGameConstants.MAX_TOWER_SLOTS
    for i, j in SharedGameConstants.TOWER_SLOT_LEVELS do
        if a1 < j then
            MAX_TOWER_SLOTS = math.min(MAX_TOWER_SLOTS, i - 1)
        end
    end
    return MAX_TOWER_SLOTS
end

local function getEquippedWithTower(a1, a2, a3) -- Line: 130
    -- upvalues: SharedGameConstants (val)
    local MAX_TOWER_SLOTS
    local clone = table.clone
    local v1 = a1 or {}
    local v2 = clone(v1)
    if table.find(v2, a2) then
        return v2
    end
    while true do
        v1 = #v2
        MAX_TOWER_SLOTS = SharedGameConstants.MAX_TOWER_SLOTS
        for i, j in SharedGameConstants.TOWER_SLOT_LEVELS do
            if v3 < j then
                MAX_TOWER_SLOTS = math.min(MAX_TOWER_SLOTS, i - 1)
            end
        end
        if not (MAX_TOWER_SLOTS <= v1) then
            break
        end
        table.remove(v2, 1)
    end
    table.insert(v2, v4)
    return v2
end

local function getTowerDisplayName(a1, a2) -- Line: 145 -- types: a2: string
    local v1 = a1[a2]
    if v1 and v1.Properties.DisplayName then
        return v1.Properties.DisplayName
    end
    return a2
end

local function canAffordPrice(a1, a2, a3) -- Line: 152 -- upvalues: Enum (val) -- types: a2: number, a3: number
    if a1.Type == Enum.CurrencyType.Free then
        return true
    end
    if a1.Type == Enum.CurrencyType.Coins then
        return (a1.Value or 0) <= a2
    end
    if a1.Type == Enum.CurrencyType.Gems then
        return (a1.Value or 0) <= a3
    end
    return false
end

local function getSuggestedTowerPriceData(a1, a2, a3) -- Line: 168
    -- upvalues: Enum (val)
    local v1 = nil
    local v2 = nil
    local v3 = nil
    local v4, v5, v6 = a1, a2, a3
    for i, j in a1, v2, v3 do
        if j.Eligible then
            v1 = v1 or j
            if if j.Type ~= Enum.CurrencyType.Free then if j.Type ~= Enum.CurrencyType.Coins then if j.Type ~= Enum.CurrencyType.Gems then false else (j.Value or 0) <= v6 else (j.Value or 0) <= v5 else true then
                return j
            end
        end
    end
    return v1 or v4[1]
end

local function getPricePromptItem(a1) -- Line: 185 -- upvalues: Enum (val), Comma (val), Icons (val)
    local v1 = Enum.CurrencyType.ToString(a1.Type)
    local v2 = if a1.Type ~= Enum.CurrencyType.Free then Comma(a1.Value or 0) else "Free"
    local v3 = {}
    local Shop = Icons[v1] or Icons.Shop
    v3.icon = Shop
    v3.value = v2
    return v3
end

local function isCurrencyProcessingError(a1) -- Line: 197
    local v1 = false
    if type(a1) == "string" then
        v1 = string.find(string.lower(a1), "afford") ~= nil
    end
    return v1
end

local u321 = {}
local v1 = {
    name = "Hardcore",
    subTitle = "Only for the very best",
    levelLock = 50,
    maxPlayers = 3,
    character = 110966868247852,
    background = 87615658146599,
    characterAnchorPoint = Vector2.new(0.49, 0.9),
}
local v2 = {
    name = "PVP",
    subTitle = "Compete against other players",
    levelLock = 25,
    maxPlayers = 2,
    character = 114746595991789,
    background = 107821580166104,
    playerCounts = {"1v1", "2v2"},
    characterAnchorPoint = Vector2.new(0.5, 0.85),
}
local v3 = {
    name = "Survival",
    subTitle = "Classic Tower Defense",
    maxPlayers = 4,
    character = 91199565809185,
    background = 103220017924770,
    characterAnchorPoint = Vector2.new(0.5, 0.85),
}
local v4 = {
    name = "Story",
    subTitle = "Play story missions",
    maxPlayers = 4,
    character = 120163024982265,
    background = 103220017924770,
    characterAnchorPoint = Vector2.new(0.5, 0.85),
}
local v5 = {
    name = "Special Modes",
    subTitle = "Maps with unique enemies",
    levelLock = 25,
    maxPlayers = 4,
    character = 120163024982265,
    background = 139612094656564,
    characterAnchorPoint = Vector2.new(0.475, 0.8),
}
local v6 = {
    name = "Sandbox",
    subTitle = "Experiment with the whole game!",
    maxPlayers = 4,
    maxGamepassPlayers = 6,
    levelLock = 250,
    levelLockText = "Lvl. 250\nOR\nOwn the Admin Gamepass",
    gamepass = 1002808617,
    attribute = "SandboxAccess",
    character = 119044360471234,
    background = 100431663051698,
    characterAnchorPoint = Vector2.new(0.5, 0.7),
}
local v7 = {
    name = "HalloweenNight1",
    gameModeOverride = "halloween2025",
    subTitle = "",
    maxPlayers = 4,
    character = 0,
    background = 0,
    hidden = true,
    characterAnchorPoint = Vector2.new(0.49, 0.9),
}
local v8 = {
    name = "HalloweenNight2",
    gameModeOverride = "halloween2025",
    subTitle = "",
    maxPlayers = 4,
    character = 0,
    background = 0,
    hidden = true,
    characterAnchorPoint = Vector2.new(0.49, 0.9),
}
local v9 = {
    name = "HalloweenNight3",
    gameModeOverride = "halloween2025",
    subTitle = "",
    maxPlayers = 4,
    character = 0,
    background = 0,
    hidden = true,
    characterAnchorPoint = Vector2.new(0.49, 0.9),
}
local v10 = {
    name = "Christmas 2025",
    gameModeOverride = "christmas2025",
    subTitle = "",
    maxPlayers = 4,
    character = 100588086983022,
    background = 105185302759729,
    hidden = true,
    characterAnchorPoint = Vector2.new(0.1, 0.4),
}
local v11 = {
    name = "Map1Adidas",
    gameModeOverride = "adidas2026",
    subTitle = "",
    maxPlayers = 4,
    character = 137751906860121,
    background = 0,
    hidden = true,
    characterAnchorPoint = Vector2.new(0.5, 0.5),
}
local v12 = {
    name = "Map2Adidas",
    gameModeOverride = "adidas2026",
    subTitle = "",
    maxPlayers = 4,
    character = 115044893000449,
    background = 0,
    hidden = true,
    characterAnchorPoint = Vector2.new(0.5, 0.5),
}
local v13 = {
    name = "Map3Adidas",
    gameModeOverride = "adidas2026",
    subTitle = "",
    maxPlayers = 4,
    character = 137297466997413,
    background = 0,
    hidden = true,
    characterAnchorPoint = Vector2.new(0.5, 0.5),
}
u321[1] = v1
u321[2] = v2
u321[3] = v3
u321[4] = v4
u321[5] = v5
u321[6] = v6
u321[7] = v7
u321[8] = v8
u321[9] = v9
u321[10] = v10
u321[11] = v11
u321[12] = v12
u321[13] = v13
local u390 = {}
u390.Hardcore = {
    {
        name = "Hardcore",
        difficultyName = "Easy",
        rawName = "Hardcore",
        subTitle = "Hardcore Mode",
        levelLock = 0,
        character = 126383122109632,
        background = 85027028790887,
        subTitleColor = Color3.fromRGB(225, 0, 255),
        characterAnchorPoint = Vector2.new(0.55, 0.82),
        characterSize = UDim2.fromScale(1.35, 1.35),
    },
    {
        name = "Voidcore",
        difficultyName = "Hard",
        rawName = "Hardcore",
        subTitle = "Only for the very best",
        levelLock = 0,
        character = 128952127679051,
        background = 79945569294019,
        subTitleColor = Color3.fromRGB(225, 0, 255),
        characterAnchorPoint = Vector2.new(0.4, 0.82),
        characterSize = UDim2.fromScale(1.35, 1.35),
    },
}
u390.Map1Adidas = {
    {
        name = "Easy",
        difficultyName = "Map1AdidasEasy",
        subTitle = "Easy Mode",
        character = 122190340284903,
        background = 137751906860121,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Hard",
        difficultyName = "Map1AdidasHard",
        subTitle = "Hard Mode",
        character = 123929461857137,
        background = 137751906860121,
        subTitleColor = Color3.fromRGB(255, 124, 107),
    },
}
u390.Map2Adidas = {
    {
        name = "Easy",
        difficultyName = "Map2AdidasEasy",
        subTitle = "Easy Mode",
        character = 122599902513878,
        background = 115044893000449,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Hard",
        difficultyName = "Map2AdidasHard",
        subTitle = "Hard Mode",
        character = 70854967191590,
        background = 115044893000449,
        subTitleColor = Color3.fromRGB(255, 124, 107),
    },
}
u390.Map3Adidas = {
    {
        name = "Easy",
        difficultyName = "Map3AdidasEasy",
        subTitle = "Easy Mode",
        character = 139773034099034,
        background = 137297466997413,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Hard",
        difficultyName = "Map3AdidasHard",
        subTitle = "Hard Mode",
        character = 111334282915796,
        background = 137297466997413,
        subTitleColor = Color3.fromRGB(255, 124, 107),
    },
}
u390["Christmas 2025"] = {
    {
        name = "Easy",
        difficultyName = "Easy",
        subTitle = "For new users",
        character = 100588086983022,
        background = 95474643015104,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Hard",
        difficultyName = "Hard",
        subTitle = "Face the holiday horrors",
        character = 100588086983022,
        background = 105185302759729,
        subTitleColor = Color3.fromRGB(255, 124, 107),
    },
}
u390.DuckEvent2026 = {
    {
        name = "Easy",
        difficultyName = "Easy",
        subTitle = "Nerd Duck",
        character = 100588086983022,
        background = 95474643015104,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Hard",
        difficultyName = "Hard",
        subTitle = "Chad Duck",
        character = 100588086983022,
        background = 105185302759729,
        subTitleColor = Color3.fromRGB(255, 124, 107),
    },
}
u390["Special Modes"] = {}
u390.Survival = {
    {
        name = "Easy",
        subTitle = "For new users",
        character = 104915620311594,
        background = 136716198056572,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Casual",
        subTitle = "For the casual user",
        character = 122042129212968,
        background = 97936689317602,
        subTitleColor = Color3.fromRGB(107, 159, 255),
    },
    {
        name = "Intermediate",
        subTitle = "A balanced experience",
        character = 132442049481070,
        background = 97936689317602,
        levelLock = 5,
        subTitleColor = Color3.fromRGB(255, 124, 107),
    },
    {
        name = "Molten",
        subTitle = "For a molten experience",
        levelLock = 15,
        character = 135746218199566,
        background = 126414217130201,
        hideOnPrevious = true,
        subTitleColor = Color3.fromRGB(255, 216, 44),
        characterAnchorPoint = Vector2.new(0.55, 0.85),
    },
    {
        name = "Fallen",
        subTitle = "For the experienced user",
        levelLock = 30,
        character = 76374497500215,
        background = 136297780799266,
        hideOnPrevious = true,
        subTitleColor = Color3.fromRGB(160, 82, 255),
    },
    {
        name = "Frost",
        subTitle = "For a frosty experience",
        levelLock = 60,
        character = 130702393235259,
        background = 98624846550189,
        hideOnPrevious = true,
        subTitleColor = Color3.fromRGB(103, 155, 240),
    },
}
u390.PVP = {
    {
        name = "Casual",
        subTitle = "Just for fun!",
        character = 114654634527900,
        background = 84280144145272,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Ranked",
        subTitle = "Fight for spoils and glory!",
        character = 79041807106153,
        background = 84280144145272,
        subTitleColor = Color3.fromRGB(107, 159, 255),
    },
}
u390.HalloweenNight1 = {
    {
        name = "Easy",
        difficultyName = "Act1Easy",
        subTitle = "Just for fun!",
        character = 117524849778383,
        background = 133188475350837,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Hard",
        difficultyName = "Act1",
        subTitle = "Commander.. is that you?!?",
        character = 118924275342012,
        background = 133188475350837,
        subTitleColor = Color3.fromRGB(255, 124, 107),
    },
}
u390.HalloweenNight2 = {
    {
        name = "Easy",
        difficultyName = "Act2Easy",
        subTitle = "Just for fun!",
        character = 93927804701277,
        background = 133188475350837,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Hard",
        difficultyName = "Act2",
        subTitle = "Escape your eternal demise..",
        character = 81194475306693,
        background = 133188475350837,
        subTitleColor = Color3.fromRGB(255, 124, 107),
    },
}
u390.HalloweenNight3 = {
    {
        name = "Easy",
        difficultyName = "Act3Easy",
        subTitle = "Just for fun!",
        character = 136319918059353,
        background = 133188475350837,
        subTitleColor = Color3.fromRGB(41, 255, 102),
    },
    {
        name = "Hard",
        difficultyName = "Act3",
        subTitle = "Will you save THE META?..",
        character = 127622132825134,
        background = 133188475350837,
        subTitleColor = Color3.fromRGB(255, 124, 107),
    },
}
local u579 = {Badlands = "Special Modes", PizzaParty = "Special Modes", PollutedWasteland = "Special Modes"}

local function onPropCalled(a1, ...) -- Line: 591
    local u3 = table.pack(...)
    return function() -- Line: 594 -- upvalues: a1 (val), u3 (val)
        if a1 then
            return a1(table.unpack(u3))
        end
        return nil
    end
end

local function hasDifficulties(a1) -- Line: 603 -- upvalues: u390 (val)
    return u390[a1] ~= nil
end

local function getGameMode(a1) -- Line: 607 -- upvalues: u321 (val)
    for i, j in u321 do
        if j.name == a1 then
            return j
        end
    end
    return nil
end

local function PlayerSelector(a1) -- Line: 617
    -- upvalues: createElement (val), MatchmakingPlayerCount (val), onPropCalled (val), React (val)
    local v1, v2
    local selectPlayers = a1.selectPlayers
    local v3 = {}
    local playerCounts = a1.playerCounts
    local v4 = a1.maxPlayers or 4
    local maxGamepassPlayers = a1.maxGamepassPlayers
    local v5 = v4
    local level = a1.level
    local currentLevel = a1.currentLevel
    local gamepass = a1.gamepass
    local attribute = a1.attribute
    if not gamepass then
        maxGamepassPlayers = nil
    end
    if maxGamepassPlayers then
        assert(v4 <= maxGamepassPlayers, "Max gamepass players must be greater than max players")
        v5 = math.max(v4, maxGamepassPlayers)
    end
    for i = 1, v5 do
        v2 = {
            count = i,
            max = v5,
            level = level,
            currentLevel = currentLevel,
            isGamepass = gamepass and maxGamepassPlayers and v4 < i,
            playerCounts = playerCounts,
            gamepass = gamepass,
            attribute = attribute,
            clicked = onPropCalled(selectPlayers, i),
        }
        v3[i] = (createElement(MatchmakingPlayerCount, v2))
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.6, 0.6),
        Visible = v1.Visible,
    }, {
        uIListLayout = createElement("UIListLayout", {
            Wraps = true,
            HorizontalFlex = Enum.UIFlexAlignment.Fill,
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.Name,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        players = createElement(React.Fragment, {}, v3),
    })
end

local function DifficultySelector(a1) -- Line: 684
    -- upvalues: u390 (val), u279 (val), Challenges (val), NewMaps (val), u284 (val), u283 (val), onPropCalled (val)
    -- upvalues: GameModeData (val), createElement (val), MatchmakingMap (val), GameModeCard (val), Notification (val)
    -- upvalues: React (val)
    local levelLockText, name, v1, v2, v3, v4
    local v5 = a1.level or 0
    local v6 = a1.gameMode or "Survival"
    local selectDifficulty = a1.selectDifficulty
    local v7 = {}
    local v8 = u390[v6] or {}
    local v9 = false
    if v6 ~= "Special Modes" then
        v1 = a1
    else
        local title, v10, v11, v12
        v9 = true
        v8 = {}
        local v13 = nil
        local v14 = nil
        v1 = a1
        for i, j in u279, v13, v14 do
            v10 = Challenges(j)
            v11 = v10.maps[1] and NewMaps(v10.maps[1])
            if v10 and v11 then
                v12 = {}
                title = v10.title or v10.name
                v12.name = title
                v2 = u284[j] or j:lower()
                v12.difficultyName = v2
                v12.icon = v11.ImageID
                v12.subTitle = v10.description
                v12.levelLock = u283[j]
                v12.rawName = j
                table.insert(v8, v12)
            end
        end
    end
    local v15 = false
    for i2, v in ipairs(v8) do
        local u165 = onPropCalled(selectDifficulty, v.difficultyName or v.name)
        local levelLock = v.levelLock
        if levelLock then
            levelLock = v5 < v.levelLock
        end
        if not v.hideOnPrevious or not v15 or not levelLock then
            name = v.name or v.rawName
            v2 = if v6 == "PVP" then nil else if not v1.hideRewardInfo then GameModeData[name] else nil
            v3 = tostring(i2)
            v4 = {
                Size = v9 and UDim2.fromScale(0.3, 0.3) or nil,
                title = v.name,
                subTitle = v.subTitle,
                subTitleColor = v.subTitleColor,
                icon = v.icon,
                character = v.character,
                characterAnchorPoint = v.characterAnchorPoint,
                background = v.background,
                gamepass = v.gamepass,
                attribute = v.attribute,
                disabled = levelLock,
                rewardInfo = v2,
            }
            levelLockText = v.levelLock and v.levelLockText or ("Lvl. %*"):format(v.levelLock)
            v4.disabledText = levelLockText

            function v4.clicked() -- Line: 751 -- upvalues: levelLock (val), Notification (upval), v (val), u165 (val)
                if levelLock then
                    Notification.Create({
                        Text = ("You need to be level %* to play this!"):format(v.levelLock),
                        Color = Color3.fromRGB(255, 0, 0),
                    })
                    return
                end
                u165()
            end

            v4.LayoutOrder = i2
            v7[v3] = (createElement(v9 and MatchmakingMap or GameModeCard, v4))
        end
    end
    local v16 = {BackgroundTransparency = 1}
    local v17 = v9 and UDim2.fromScale(1, 1) or UDim2.fromScale(0.25, 0.6)
    v16.Size = v17
    v16.Position = UDim2.fromScale(0.5, 0.5)
    v16.AnchorPoint = Vector2.new(0.5, 0.5)
    v16.Visible = v1.Visible
    return createElement("Frame", v16, {
        aspectRatio = not v9 and createElement("UIAspectRatioConstraint", {AspectRatio = 0.55}),
        layout = createElement("UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.None,
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        components = createElement(React.Fragment, {}, v7),
    })
end

local function GameModeSelector(a1) -- Line: 789
    -- upvalues: u321 (val), onPropCalled (val), useBinding (val), useState (val), useEffect (val), GameModeData (val)
    -- upvalues: createElement (val), GameModeCard (val), React (val)
    local levelLockText, name, v1, v2, v3
    local level = a1.level
    local serverCount = a1.serverCount
    local v4 = {}
    for i, v in ipairs(u321) do
        local u65 = onPropCalled(a1.selectGameMode, v.name)
        u68, u69 = useBinding(0)
        u72, u73 = useState(false)
        v1 = useEffect
        v2 = {serverCount.count[v.name]}
        v1(function() -- Line: 801 -- upvalues: u68 (val), serverCount (val), v (val), u69 (val), u72 (val), u73 (val)
            if (u68:getValue()) ~= serverCount.count[v.name] then
                u69(serverCount.count[v.name] or 0)
            end
            if u72 ~= (serverCount.mostPopular == v.name) then
                u73(serverCount.mostPopular == v.name)
            end
        end, v2)
        v1 = if v.name ~= "Hardcore" then GameModeData[v.name] else nil
        if not v.hidden then
            name = v.name
            v3 = {
                title = v.name,
                subTitle = v.subTitle,
                characterAnchorPoint = v.characterAnchorPoint,
                character = v.character,
                background = v.background,
                gamepass = v.gamepass,
                attribute = v.attribute,
                count = u68,
                popular = u72,
                levelLock = v.levelLock,
                playerLevel = level,
            }
            levelLockText = v.levelLock and v.levelLockText or ("Lvl. %*"):format(v.levelLock)
            v3.disabledText = levelLockText

            function v3.clicked() -- Line: 831 -- upvalues: u65 (val)
                u65()
            end

            v3.LayoutOrder = i
            v3.rewardInfo = v1
            v4[name] = (createElement(GameModeCard, v3))
        end
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.25, 0.6),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = a1.Visible,
    }, {
        aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 0.55}),
        layout = createElement("UIListLayout", {
            Wraps = false,
            HorizontalFlex = Enum.UIFlexAlignment.None,
            VerticalFlex = Enum.UIFlexAlignment.None,
            Padding = UDim.new(0, 16),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        components = createElement(React.Fragment, {}, v4),
    })
end

local function MatchmakingQueueContainer() -- Line: 864
    -- upvalues: useEffect (val), MatchmakingController (val), ReactCharm (val), MatchmakingStore (val), useState (val)
    -- upvalues: MatchmakingStates (val), createElement (val), MatchmakingPairing (val)
    local v1
    useEffect(function() -- Line: 865 -- upvalues: MatchmakingController (upval)
        MatchmakingController:init(function() end)
    end, {})
    local v2 = ReactCharm.useSignalState(MatchmakingStore.getMatchState)
    local v3 = ReactCharm.useSignalState(MatchmakingStore.getSearch)
    local v4 = ReactCharm.useSignalState(MatchmakingStore.getParty)
    local v5 = ReactCharm.useSignalState(MatchmakingStore.getCount)
    local v6 = ReactCharm.useSignalState(MatchmakingStore.getCanCancel)
    local v7, u32 = useState(os.time)
    useEffect(function() -- Line: 876 -- upvalues: u32 (val)
        local u0 = true
        local u3 = task.spawn(function() -- Line: 879 -- upvalues: u0 (ref), u32 (upval)
            while u0 do
                u32(os.time())
                task.wait(1)
            end
        end)
        return function() -- Line: 886 -- upvalues: u0 (ref), u3 (val)
            u0 = false
            task.cancel(u3)
        end
    end, {})
    local players = v4.players or {}
    local result = v3 and v3.result or {}
    local v8 = v2 == MatchmakingStates.MATCHED
    local v9 = v2 == MatchmakingStates.SEARCHING
    local v10 = math.max(v5 or 0, if not v8 then #players else if not (#result > 0) then #players else #result)
    if v10 <= 0 then
        v10 = 1
    end
    local v11 = {
        visible = v9 or v8,
        elapsedSeconds = math.max(0, v7 - (v3.started or v7)),
        showElapsedTime = v9,
        animateStatusDots = v9,
        playerCountText = ("%*/%* Players"):format(v1, v10),
        statusText = if not v8 then "Searching for players" else "Game found!",
    }
    local v12 = false
    if v6 == true then
        v12 = v9
    end
    v11.canCancel = v12

    function v11.onCancel() -- Line: 911 -- upvalues: MatchmakingController (upval)
        MatchmakingController:cancelMatchmaking()
    end

    return createElement(MatchmakingPairing, v11)
end

local function useTrialRotation(a1) -- Line: 917
    -- upvalues: useState (val), MatchmakingTrialData (val), useMemo (val), useEffect (val)
    local u3, u4 = useState(function() -- Line: 918 -- upvalues: MatchmakingTrialData (upval)
        return MatchmakingTrialData.getRotationEndsAt(os.time())
    end)
    local v1 = {u3, a1}
    local v2 = useMemo(function() -- Line: 921 -- upvalues: u3 (val), a1 (val)
        return {expiresAt = u3, trialName = a1}
    end, v1)
    local v3 = {u3}
    useEffect(function() -- Line: 928 -- upvalues: u3 (val), u4 (val), MatchmakingTrialData (upval)
        local u11 = task.delay(math.max(u3 - os.time() + 1, 1), function() -- Line: 930 -- upvalues: u4 (upval), MatchmakingTrialData (upval)
            u4(MatchmakingTrialData.getRotationEndsAt(os.time()))
        end)
        return function() -- Line: 934 -- upvalues: u11 (val)
            if coroutine.status(u11) ~= "dead" then
                task.cancel(u11)
            end
        end
    end, v3)
    return v2
end

local function NewMatchmakingMenu(a1) -- Line: 944
    -- upvalues: useViewEnabled (val), useGlobalTrial (val), useAtom (val), MatchmakingStore (val), useState (val)
    -- upvalues: useRef (val), useCharmSelector (val), PartyStore (val), ServerCountStore (val), useCache (val)
    -- upvalues: useTowers (val), useTowerPurchaseData (val), useHasSandboxGamepass (val), useAttribute (val)
    -- upvalues: Players (val), useFFlag (val), useBadges (val), u301 (val), useTrialRotation (val)
    -- upvalues: ViewController (val), MatchmakingModel (val), useMemo (val), useCallback (val), Notification (val)
    -- upvalues: u290 (val), getEquippedWithTower (val), Inventory (val), u300 (val), Shop (val), Enum (val)
    -- upvalues: useEffect (val), getSuggestedTowerPriceData (val), MarketplaceService (val), getPricePromptItem (val)
    -- upvalues: u295 (val), Icons (val), Monetization (val), StoryModeClient (val), StoryModeData (val)
    -- upvalues: DisconnectionPenaltyController (val), MatchmakingController (val), createElement (val), React (val)
    -- upvalues: MatchmakingInterface (val), StoryModeRewards (val), MatchmakingStates (val), Prompt (val)
    local u213, v1, v2
    local PromptMatchmaking = useViewEnabled("PromptMatchmaking")
    local v3 = useGlobalTrial()
    local v4 = useAtom(MatchmakingStore.getCanStartMatchmaking)
    local v5 = useAtom(MatchmakingStore.getMatchState)
    local u16, u17 = useState({})
    local u20 = useRef(nil)
    local u23 = useRef(nil)
    local v6 = useCharmSelector(PartyStore.getState, function(a1) -- Line: 952
        return a1.party
    end)
    local u33 = useCharmSelector(ServerCountStore.getState, function(a1) -- Line: 955
        return a1.serverCount
    end)
    local u37 = useCache("Values.Level", 0)
    local u42 = useCache("Values.Coins", 0, PromptMatchmaking)
    local u47 = useCache("Values.Gems", 0, PromptMatchmaking)
    local u49 = useTowers()
    local u54, u55 = useCache("Inventory.Troops", {}, PromptMatchmaking)
    local u60, u61 = useCache("Equipped.Troops", {}, PromptMatchmaking)
    local u64, u65 = useState(nil)
    local v7, u69 = useState(nil)
    local u72, u73 = useState(nil)
    local u76 = useRef(false)
    local u80, u81 = useTowerPurchaseData(u64, PromptMatchmaking)
    local v8 = useHasSandboxGamepass()
    local v9 = useAttribute(Players.LocalPlayer, "SandboxAccess", false) == true
    local v10 = useFFlag("pvp.enabled", true, {enabled = PromptMatchmaking})
    local v11 = useFFlag("sandbox.enabled", true, {enabled = PromptMatchmaking})
    local v12 = useBadges(u301)
    local v13 = useTrialRotation(v3)
    local u115 = useRef(false)
    local u121 = useRef(ViewController:getCurrentView())
    local v14 = useAtom(MatchmakingStore.getDirectStatue)
    if not v14 then
        v1 = nil
    else
        v1 = {subtitle = "", id = v14.Name}
        local Attribute = v14:GetAttribute("MatchmakingTitle") or v14.Name
        v1.title = Attribute
        v1.image = v14:GetAttribute("MatchmakingImage") or 0
        v1.maxPlayers = v14:GetAttribute("MatchmakingMaxPlayers") or 4
        v1.queue = {
            mode = v14:GetAttribute("Mode"),
            difficulty = v14:GetAttribute("MatchmakingDifficulty"),
        }
    end
    local Attribute_2 = v14 and v14:GetAttribute("MatchmakingTab")
    if not MatchmakingModel.MODE_GROUPS[Attribute_2] then
        Attribute_2 = "Arcade"
    end
    local players = if not v6 then {} else v6.players
    if #players ~= 0 then
        local v15 = table.create(#players)
        for i, j in players do
            v15[i] = j.UserId
        end
        v2 = table.create(#v15)
        for k, n in v15 do
            v2[k] = (tostring(n))
        end
        u213 = table.concat(v2, ",")
    else
        u213 = tostring(Players.LocalPlayer.UserId)
    end
    local LocalPlayer_2 = players[1] or Players.LocalPlayer
    v2 = math.max(#players, 1)
    local v16 = true
    if players[1] ~= nil then
        v16 = players[1] == Players.LocalPlayer
    end
    local maxPlayers = if not v6 then 4 else v6.partyParams.maxPlayers
    local v17 = v12[3068686954467604] == true
    local v18 = {u33}
    local v19 = useMemo(function() -- Line: 1006 -- upvalues: MatchmakingModel (upval), u33 (val)
        return MatchmakingModel.getPopularCategoryCounts(u33)
    end, v18)
    local v20 = {u33}
    local v21 = useMemo(function() -- Line: 1009 -- upvalues: MatchmakingModel (upval), u33 (val)
        return MatchmakingModel.getMostPopularCategory(u33)
    end, v20)
    local v22 = {u49, u60, u37, u61, u54}
    local u343 = useCallback(function(a1, a2) -- Line: 1013
        -- upvalues: u54 (val), u49 (val), u60 (val), Notification (upval), u290 (upval), u61 (val)
        -- upvalues: getEquippedWithTower (upval), u37 (val), Inventory (upval)
        if not u54[a1] then
            return false
        end
        local v1 = u49[a1]
        local DisplayName = if not v1 then a1 else if not v1.Properties.DisplayName then a1 else v1.Properties.DisplayName
        if table.find(u60, a1) then
            Notification.Create({Sound = "Equip", Text = ("%* is already equipped."):format(DisplayName), Color = u290})
            return true
        end
        u61((getEquippedWithTower(u60, a1, u37)))
        Inventory:FireServer("Equip", "Tower", a1)
        Notification.Create({Sound = "Equip", Text = a2 or ("Equipped %*!"):format(DisplayName), Color = u290})
        return true
    end, v22)
    local v23 = {u60, u54}
    v20 = useCallback(function(a1) -- Line: 1039 -- upvalues: u60 (val), u54 (val) -- types: a1: string
        if table.find(u60, a1) then
            return "Equipped"
        end
        if u54[a1] then
            return "Equip"
        end
        return "Purchase"
    end, v23)
    local v24 = {u60}
    v22 = useCallback(function(a1) -- Line: 1047 -- upvalues: u60 (val), u300 (upval), u290 (upval) -- types: a1: string
        if table.find(u60, a1) then
            return u300
        end
        return u290
    end, v24)
    local v25 = {u60}
    v23 = useCallback(function(a1) -- Line: 1051 -- upvalues: u60 (val) -- types: a1: string
        return table.find(u60, a1) ~= nil
    end, v25)
    local v26 = {u49, u60, u37, u61, u55, u54}
    local u381 = useCallback(function(a1, a2) -- Line: 1055
        -- upvalues: u49 (val), Shop (upval), u54 (val), u55 (val), u61 (val), getEquippedWithTower (upval), u60 (val)
        -- upvalues: u37 (val), Inventory (upval), Notification (upval), u290 (upval), Enum (upval)
        local v1
        local v2 = u49[a1]
        local DisplayName = if not v2 then a1 else if not v2.Properties.DisplayName then a1 else v2.Properties.DisplayName
        v1, v2 = Shop:InvokeServer("Purchase", "Tower", a1)
        if not v1 then
            return false, v2 or ("Failed to purchase %*."):format(DisplayName)
        end
        local v3 = table.clone(u54)
        local v4 = v3[a1] or {Skin = "Default", Equipped = false, GoldenPerks = false}
        v3[a1] = v4
        u55(v3)
        u61((getEquippedWithTower(u60, a1, u37)))
        Inventory:FireServer("Equip", "Tower", a1)
        Notification.Create({
            Text = ("Purchased and equipped %*!"):format(DisplayName),
            Color = u290,
            Sound = if a2.Type ~= Enum.CurrencyType.Coins then if a2.Type ~= Enum.CurrencyType.Gems then "Purchase" else "PurchaseGems" else "PurchaseCoins",
        })
        return true
    end, v26)
    local v27 = {u64}
    useEffect(function() -- Line: 1091 -- upvalues: u76 (val), u69 (val)
        u76.current = false
        u69(nil)
    end, v27)
    v27 = {u64, u81}
    useEffect(function() -- Line: 1096 -- upvalues: u64 (val), u81 (val), u76 (val)
        if u64 and u81 then
            u76.current = true
        end
    end, v27)
    v27 = {u49, u42, u343, u60, u47, u37, u81, u381, u61, u73, u80, u64, u54}
    useEffect(function() -- Line: 1102
        -- upvalues: u64 (val), u54 (val), u65 (val), u343 (val), u81 (val), u76 (val), u49 (val)
        -- upvalues: getSuggestedTowerPriceData (upval), u80 (val), u42 (val), u47 (val), Notification (upval)
        -- upvalues: Enum (upval), MarketplaceService (upval), Players (upval), getPricePromptItem (upval), u290 (upval)
        -- upvalues: u295 (upval), u69 (val), Icons (upval), Monetization (upval), u73 (val), u381 (val)
        local u0 = u64
        if not u0 then
            return
        end
        if u54[u0] then
            u65(nil)
            u343(u0)
            return
        end
        if not u81 and u76.current then
            local v1 = u49[u0]
            local DisplayName = if not v1 then u0 else if not v1.Properties.DisplayName then u0 else v1.Properties.DisplayName
            local u24 = getSuggestedTowerPriceData(u80, u42, u47)
            if not u24 then
                u65(nil)
                Notification.Error((("%* is not available for purchase."):format(DisplayName)))
                return
            end
            if not u24.Eligible then
                u65(nil)
                Notification.Error((("%* is locked."):format(DisplayName)))
                return
            end
            if u24.Type ~= Enum.CurrencyType.Robux then
                local u94 = if u24.Type ~= Enum.CurrencyType.Free then if u24.Type ~= Enum.CurrencyType.Coins then if u24.Type ~= Enum.CurrencyType.Gems then false else (u24.Value or 0) <= u47 else (u24.Value or 0) <= u42 else true
                local v2 = getPricePromptItem(u24)
                local v3 = if not u94 then ("You need more currency to purchase \"%*\"."):format(DisplayName) else ("Are you sure you want to purchase \"%*\"?"):format(DisplayName)
                u69({
                    icon = Icons.Shop,
                    title = if not u94 then "Need More Currency?" else "Confirm Purchase?",
                    description = v3,
                    items = {v2},
                    actions = {
                        SuggestedTowerAction = {
                            layoutOrder = 1,
                            color = if not u94 then u295 else u290,
                            text = if not u94 then "Buy Currency" else "Purchase",
                            onClick = function() -- Line: 1162
                                -- upvalues: u69 (upval), u65 (upval), u94 (val), Monetization (upval), u24 (val)
                                -- upvalues: u73 (upval), u0 (val), MarketplaceService (upval), Players (upval)
                                -- upvalues: Notification (upval), u381 (upval)
                                local v1
                                u69(nil)
                                u65(nil)
                                if u94 then
                                    local v2
                                    v1, v2 = u381(u0, u24)
                                    if not v1 then
                                        Notification.Error(v2)
                                        return
                                    end
                                    return
                                end
                                v1 = Monetization:invokeServer("GetClosestProductCurrency", u24.Type, u24.Value)
                                if v1 and v1.Id then
                                    u73({priceData = u24, productId = v1.Id, tower = u0})
                                    MarketplaceService:PromptProductPurchase(Players.LocalPlayer, v1.Id)
                                    return
                                end
                                Notification.Error("No currency product is available for this purchase.")
                            end,
                        },
                        Cancel = {
                            text = "Cancel",
                            layoutOrder = 2,
                            color = Color3.fromRGB(32, 32, 32),
                            onClick = function() -- Line: 1202 -- upvalues: u69 (upval), u65 (upval)
                                u69(nil)
                                u65(nil)
                            end,
                        },
                    },
                })
                return
            end
            u65(nil)
            if u24.Id then
                MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, u24.Id)
                return
            end
            Notification.Error((("%* is not available for purchase."):format(DisplayName)))
            return
        end
    end, v27)
    v27 = {u49, u72, u381}
    useEffect(function() -- Line: 1226
        -- upvalues: u72 (val), MarketplaceService (upval), u73 (val), u49 (val), u381 (val), Notification (upval)
        local u0 = u72
        if not u0 then
            return
        end
        local u1 = false
        local u7 = MarketplaceService.PromptProductPurchaseFinished:Connect(function(a1, a2, a3) -- Line: 1234
            -- upvalues: u0 (val), u73 (upval), u49 (upval), u1 (ref), u381 (upval), Notification (upval)
            if a2 ~= u0.productId then
                return
            end
            if not a3 then
                u73(nil)
                return
            end
            task.spawn(function() -- Line: 1244
                -- upvalues: u0 (upval), u49 (upval), u1 (upval), u381 (upval), u73 (upval), Notification (upval)
                local v1, v2, v3
                local tower = u0.tower
                local priceData = u0.priceData
                local v4 = u49[tower]
                local DisplayName = if not v4 then tower else if not v4.Properties.DisplayName then tower else v4.Properties.DisplayName
                for i = 1, 8 do
                    if u1 then
                        return
                    end
                    v1, v2 = u381(tower, priceData)
                    if v1 then
                        u73(nil)
                        return
                    end
                    v3 = false
                    if type(v2) == "string" then
                        v3 = string.find(string.lower(v2), "afford") ~= nil
                    end
                    if not v3 then
                        u73(nil)
                        Notification.Error(v2)
                        return
                    end
                    task.wait(0.75)
                end
                if u1 then
                    return
                end
                u73(nil)
                Notification.Error((("Currency purchased, but %* could not be purchased yet. Try again in a moment."):format(DisplayName)))
            end)
        end)
        return function() -- Line: 1281 -- upvalues: u1 (ref), u7 (val)
            u1 = true
            u7:Disconnect()
        end
    end, v27)
    v27 = {PromptMatchmaking, u213}
    useEffect(function() -- Line: 1287
        -- upvalues: PromptMatchmaking (val), u20 (val), u23 (val), u17 (val), StoryModeClient (upval), u213 (val)
        -- upvalues: StoryModeData (upval)
        if not PromptMatchmaking then
            return
        end
        local u1 = false
        u20.current = nil
        u23.current = nil
        u17({})
        task.spawn(function() -- Line: 1297
            -- upvalues: StoryModeClient (upval), u1 (ref), u213 (upval), u20 (upval), u23 (upval), u17 (upval)
            -- upvalues: StoryModeData (upval)
            local success, result = pcall(function() -- Line: 1298 -- upvalues: StoryModeClient (upval)
                return StoryModeClient.getProgress()
            end)
            if u1 then
                return
            end
            if not success then
                warn((("[NewMatchmaking] Failed to load Story Mode progress: %*"):format(result)))
                return
            end
            if result == nil then
                warn("[NewMatchmaking] Story Mode progress was unavailable")
                return
            end
            if type(result) ~= "table" then
                warn("[NewMatchmaking] Story Mode progress had an invalid response")
                return
            end
            local success_2, result_2 = pcall(function() -- Line: 1319 -- upvalues: StoryModeClient (upval)
                return StoryModeClient.getPartyStoryAvailability()
            end)
            if u1 then
                return
            end
            if not success_2 then
                warn((("[NewMatchmaking] Failed to load party Story Mode availability: %*"):format(result_2)))
                return
            end
            if type(result_2) == "table"
                and type(result_2.chapters) == "table"
                and type(result_2.memberUserIds) == "table" then
                local memberUserIds_2 = result_2.memberUserIds
                local v1 = table.create(#memberUserIds_2)
                for i, j in memberUserIds_2 do
                    v1[i] = (tostring(j))
                end
                if table.concat(v1, ",") ~= u213 then
                    warn("[NewMatchmaking] Ignoring stale party Story Mode availability")
                    return
                end
                local v2 = if not (#result_2.memberUserIds > 1) then nil else result_2
                u20.current = v2
                u23.current = result
                u17(StoryModeData.getSections(result, nil, nil, v2))
                return
            end
            warn("[NewMatchmaking] Party Story Mode availability had an invalid response")
        end)
        return function() -- Line: 1354 -- upvalues: u1 (ref), u20 (upval), u23 (upval)
            u1 = true
            u20.current = nil
            u23.current = nil
        end
    end, v27)
    v27 = {PromptMatchmaking, u16}
    useEffect(function() -- Line: 1361
        -- upvalues: PromptMatchmaking (val), u23 (val), StoryModeData (upval), u16 (val), u17 (val), u20 (val)
        if not PromptMatchmaking then
            return
        end
        local current = u23.current
        local v1 = StoryModeData.getNextUnlockAt(u16)
        if current and v1 then
            local u7 = false
            local u8 = false
            local u20_2 = task.delay(math.max(0, v1 - (workspace:GetServerTimeNow())) + 0.05, function() -- Line: 1376 -- upvalues: u7 (ref), u8 (ref), u17 (upval), StoryModeData (upval), current (val), u20 (upval)
                u7 = true
                if u8 then
                    return
                end
                u17(StoryModeData.getSections(current, nil, nil, u20.current))
            end)
            return function() -- Line: 1393 -- upvalues: u8 (ref), u7 (ref), u20_2 (val)
                u8 = true
                if not u7 then
                    task.cancel(u20_2)
                end
            end
        end
    end, v27)
    v25 = useEffect
    v27 = {PromptMatchmaking, a1.screen, a1.setIgnoreGuiInset, a1.setScreenInsets}
    v25(function() -- Line: 1401 -- upvalues: PromptMatchmaking (val), a1 (val)
        if not PromptMatchmaking then
            return
        end
        local screen = a1.screen
        local IgnoreGuiInset = if not screen then nil else screen.IgnoreGuiInset
        local ScreenInsets = if not screen then nil else screen.ScreenInsets
        local ClipToDeviceSafeArea = if not screen then nil else screen.ClipToDeviceSafeArea
        if a1.setIgnoreGuiInset then
            a1.setIgnoreGuiInset(true)
        end
        if a1.setScreenInsets then
            a1.setScreenInsets(Enum.ScreenInsets.DeviceSafeInsets)
        end
        if screen then
            screen.ClipToDeviceSafeArea = true
        end
        return function() -- Line: 1421
            -- upvalues: a1 (upval), IgnoreGuiInset (val), ScreenInsets (val), screen (val), ClipToDeviceSafeArea (val)
            if a1.setIgnoreGuiInset and IgnoreGuiInset ~= nil then
                a1.setIgnoreGuiInset(IgnoreGuiInset)
            end
            if a1.setScreenInsets and ScreenInsets ~= nil then
                a1.setScreenInsets(ScreenInsets)
            end
            if screen and screen.Parent and ClipToDeviceSafeArea ~= nil then
                screen.ClipToDeviceSafeArea = ClipToDeviceSafeArea
            end
        end
    end, v27)
    useEffect(function() -- Line: 1434 -- upvalues: ViewController (upval), MatchmakingStore (upval), u121 (val), u115 (val)
        return ViewController:onViewChange(function(a1) -- Line: 1435 -- upvalues: MatchmakingStore (upval), u121 (upval), u115 (upval), ViewController (upval)
            if a1 ~= "PromptMatchmaking" and a1 ~= "Loading" then
                MatchmakingStore.setDirectStatue(nil)
            end
            local current = u121.current
            u121.current = a1
            if u115.current and current == "Party" then
                if a1 ~= "Hotbar" and a1 ~= "" then
                    if u115.current and a1 ~= "Party" and a1 ~= "PromptMatchmaking" then
                        u115.current = false
                    end
                    return
                end
                u115.current = false
                if not MatchmakingStore.getCanStartMatchmaking() then
                    return
                end
                task.defer(function() -- Line: 1450 -- upvalues: ViewController (upval)
                    ViewController:setView("PromptMatchmaking")
                end)
                return
            end
            if u115.current and a1 ~= "Party" and a1 ~= "PromptMatchmaking" then
                u115.current = false
            end
        end)
    end, {})
    v25 = useCallback(function() -- Line: 1464 -- upvalues: u115 (val), ViewController (upval)
        u115.current = false
        ViewController:setView("Hotbar")
    end, {})
    v26 = useCallback(function() -- Line: 1469 -- upvalues: u115 (val), ViewController (upval)
        u115.current = true
        ViewController:setView("Party")
    end, {})
    local v28 = {u343}
    v27 = useCallback(function(a1) -- Line: 1474 -- upvalues: u343 (val), u65 (val) -- types: a1: string
        if u343(a1) then
            return
        end
        u65(a1)
    end, v28)
    local v29 = useCallback(function(a1) -- Line: 1482
        -- upvalues: MatchmakingModel (upval), Notification (upval), DisconnectionPenaltyController (upval)
        -- upvalues: ViewController (upval), MatchmakingStore (upval), MatchmakingController (upval)
        local v1, v2, v3
        local v4 = MatchmakingModel.buildQueueRequest(a1.modeEntry, a1.playerCount)
        if not v4 then
            Notification.Create({
                Text = "Error: This matchmaking option is not configured.",
                Color = Color3.fromRGB(255, 0, 0),
            })
            return false, "This matchmaking option is not configured."
        end
        if v4.mode == "pvp" then
            v1 = DisconnectionPenaltyController.IsRestrictedFromMatchmaking()
            if v1 == "PENALIZED" then
                ViewController:setView("RestrictedPopup")
                return false, "PVP matchmaking is currently restricted."
            end
            if v1 == "MATCH_ACTIVE" then
                ViewController:setView("RejoinMatchPopup")
                return false, "You already have an active PVP match."
            end
        end
        ViewController:setView("Loading")
        task.wait(0.5)
        if not MatchmakingStore.getIsInParty() then
            v1, v2 = MatchmakingController:createParty(true)
            if v1 ~= true then
                v3 = v2 or "Failed to create matchmaking party."
                Notification.Create({Color = Color3.fromRGB(255, 0, 0), Text = ("Error: %*"):format(v3)})
                ViewController:setView("PromptMatchmaking")
                return false, v3
            end
        end
        MatchmakingController:setCount(v4.playerCount)
        v1, v2 = MatchmakingController:startMatchmaking(v4.mode, v4.playerCount, nil, v4.difficulty, nil, v4.story)
        if v1 == true then
            ViewController:setView("Hotbar")
            return true
        end
        v3 = v2 or (if type(v1) ~= "string" then "Failed to start matchmaking." else v1)
        Notification.Create({Color = Color3.fromRGB(255, 0, 0), Text = ("Error: %*"):format(v3)})
        ViewController:setView("PromptMatchmaking")
        return false, v3
    end, {})
    if not PromptMatchmaking then
        return nil
    end
    return createElement(React.Fragment, nil, {
        interface = createElement(MatchmakingInterface, {
            canStartMatchmaking = v4,
            currentPartySize = v2,
            getSuggestedTowerActionColor = v22,
            getSuggestedTowerActionText = v20,
            hasSandboxAdmin = v8 or v9,
            hasVoidcoreAccess = v17,
            isPartyLeader = v16,
            isSuggestedTowerActionDisabled = v23,
            loadStoryMissionRewards = StoryModeRewards.load,
            mostPopularCategory = v21,
            directMode = v1,
            directModeTab = Attribute_2,
            onClose = v25,
            onMatchmakingRequested = v29,
            onPartyActivated = v26,
            onSuggestedTowerView = v27,
            partyCapacity = maxPlayers,
            partyLeader = LocalPlayer_2,
            partyMembers = players,
            playerCounts = v19,
            playerLevel = u37,
            pvpEnabled = v10,
            sandboxEnabled = v11,
            size = UDim2.fromScale(1, 1),
            storySections = u16,
            trialRotation = v13,
            visible = v5 < MatchmakingStates.SEARCHING,
        }),
        prompt = v7 and PromptMatchmaking and createElement(Prompt, v7),
    })
end

local function MatchmakingMenu_2(a1) -- Line: 1586
    -- upvalues: useScale (val), useState (val), u321 (val), useCache (val), useCharmSelector (val)
    -- upvalues: ServerCountStore (val), u579 (val), useEffect (val), ViewController (val)
    -- upvalues: DisconnectionPenaltyController (val), createElement (val), MatchmakingMenu (val), u390 (val)
    -- upvalues: GameModeSelector (val), DifficultySelector (val), StoryBook (val), MatchmakingStore (val)
    -- upvalues: MatchmakingController (val), Notification (val), PartyStore (val), PlayerSelector (val), u285 (val)
    local attribute, gamepass, hideRewardInfo, levelLock, maxGamepassPlayers, maxPlayers, playerCounts, v1, v2, v3, v4, v5, v6
    local v7 = math.max(1, 1 + (1 - (useScale(1.3, nil, true))))
    local u14, u15 = useState(false)
    local GameMode, GameMode_2 = useState("GameMode")
    local u21, u22 = useState()
    local u24, u25 = useState()
    local u37 = u24
    if u37 then
        v1 = u321
        v2 = nil
        for i, j in v1, v2 do
            if j.name == u24 then
                u37 = j
                v1 = useCache("Values.Level", 0)
                v2 = useCharmSelector(ServerCountStore.getState, function(a1) -- Line: 1594 -- upvalues: u579 (upval)
                    local v1, v2, v3
                    local v4 = {}
                    local v5 = nil
                    local v6 = nil
                    for i, j in a1.serverCount, v5, v6 do
                        v2 = nil
                        v3 = nil
                        for k, n in j, v2, v3 do
                            v1 = u579[k] or i
                            if not v4[v1] then
                                v4[v1] = 0
                            end
                            v4[v1] = v4[v1] + n
                        end
                    end
                    local v7 = 0
                    v5 = nil
                    for m, i5 in v4 do
                        if v7 < i5 then
                            v5 = m
                        end
                    end
                    return {count = v4, mostPopular = v5}
                end)
                useEffect(function() -- Line: 1622
                    -- upvalues: u14 (val), ViewController (upval), u25 (val), u22 (val), GameMode_2 (val), u15 (val)
                    -- upvalues: DisconnectionPenaltyController (upval)
                    local u0 = u14
                    local u1 = false
                    local u6 = ViewController:onViewChange(function(a1) -- Line: 1626 -- upvalues: u0 (ref), u1 (ref), u25 (upval), u22 (upval), GameMode_2 (upval), u15 (upval)
                        local v1
                        if a1 == "PromptMatchmaking" == u0 then
                            return
                        end
                        if u1 then
                            u1 = false
                            return
                        end
                        if not v1 then
                            u25(nil)
                            u22(nil)
                            GameMode_2("GameMode")
                        end
                        u15(v1)
                        u0 = v1
                    end)
                    local u16 = (ViewController:getEmitter("MatchmakingPrompt")):On("Show", function(a1, a2, a3) -- Line: 1648
                        -- upvalues: DisconnectionPenaltyController (upval), ViewController (upval), u25 (upval)
                        -- upvalues: u22 (upval), GameMode_2 (upval), u1 (ref), u15 (upval), u0 (ref)
                        local v1 = DisconnectionPenaltyController.IsRestrictedFromMatchmaking()
                        if v1 == "PENALIZED" then
                            ViewController:setView("RestrictedPopup")
                            return
                        end
                        if v1 == "MATCH_ACTIVE" then
                            ViewController:setView("RejoinMatchPopup")
                            return
                        end
                        warn(a1)
                        u25(a1)
                        u22(a2)
                        GameMode_2(a3 or "GameMode")
                        u1 = true
                        ViewController:setView("PromptMatchmaking")
                        u15(true)
                        u0 = true
                    end)
                    return function() -- Line: 1671 -- upvalues: u16 (val), u6 (val)
                        u16:Disconnect()
                        u6()
                    end
                end, {})
                if not u14 then
                    return nil
                end
                v3 = {
                    title = if GameMode ~= "Player" then if GameMode ~= "Story" then if GameMode ~= "Difficulty" then if GameMode ~= "Difficulty" then "Choose a Gamemode" else "Choose a Difficulty" else if u24 ~= "Special Modes" then if GameMode ~= "Difficulty" then "Choose a Gamemode" else "Choose a Difficulty" else "Choose a Mode" else "Choose a Story Mission" else "Choose a Squad Size",
                }
                v3.showBack = if not u37 then GameMode ~= "GameMode" else if not u37.hidden then GameMode ~= "GameMode" else if GameMode ~= "Difficulty" then GameMode ~= "GameMode" else false

                function v3.onBack() -- Line: 1695
                    -- upvalues: GameMode (val), u24 (val), u390 (upval), GameMode_2 (val), u25 (val), u22 (val)
                    if GameMode == "Player" and u390[u24] ~= nil then
                        GameMode_2("Difficulty")
                        return
                    end
                    u25(nil)
                    u22(nil)
                    GameMode_2("GameMode")
                end

                function v3.onClose() -- Line: 1705 -- upvalues: ViewController (upval)
                    ViewController:setView("Hotbar")
                end

                v4 = {}
                v6 = {Scale = v7}
                v4.scale = createElement("UIScale", v6)
                v5 = false
                if GameMode == "GameMode" then
                    v5 = createElement(GameModeSelector, {
                        level = v1,
                        serverCount = v2,
                        selectGameMode = function(a1) -- Line: 1716
                            -- upvalues: DisconnectionPenaltyController (upval), ViewController (upval), u25 (val)
                            -- upvalues: GameMode_2 (val), u390 (upval)
                            if a1 == "PVP" then
                                local v1 = DisconnectionPenaltyController.IsRestrictedFromMatchmaking()
                                if v1 == "PENALIZED" then
                                    ViewController:setView("RestrictedPopup")
                                    return
                                end
                                if v1 == "MATCH_ACTIVE" then
                                    ViewController:setView("RejoinMatchPopup")
                                    return
                                end
                            end
                            if a1 == "Story" then
                                u25(a1)
                                GameMode_2("Story")
                                return
                            end
                            u25(a1)
                            GameMode_2(if not (u390[a1] ~= nil) then "Player" else "Difficulty")
                        end,
                    })
                end
                v4.gameModeSelector = v5
                v5 = false
                if GameMode == "Difficulty" then
                    v6 = {gameMode = u24}
                    hideRewardInfo = u37 and (u37.hideRewardInfo or u37.hidden)
                    v6.hideRewardInfo = hideRewardInfo
                    v6.level = v1

                    function v6.selectDifficulty(a1) -- Line: 1746 -- upvalues: u22 (val), GameMode_2 (val)
                        u22(a1)
                        GameMode_2("Player")
                    end

                    v5 = createElement(DifficultySelector, v6)
                end
                v4.difficultySelector = v5
                v5 = false
                if GameMode == "Story" then
                    v5 = createElement("Frame", {
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(0.5, 0),
                        Position = UDim2.fromScale(0.5, 0),
                        Size = UDim2.fromScale(1, 0.95),
                    }, {
                        book = createElement(StoryBook, {
                            ShowClose = false,
                            OnReady = function(a1, a2) -- Line: 1760
                                -- upvalues: ViewController (upval), u25 (val), u22 (val), GameMode_2 (val)
                                -- upvalues: MatchmakingStore (upval), MatchmakingController (upval)
                                -- upvalues: Notification (upval), PartyStore (upval)
                                local v1
                                ViewController:setView("Loading")
                                task.wait(0.5)

                                local function v2() -- Line: 1765
                                    -- upvalues: ViewController (upval), u25 (upval), u22 (upval), GameMode_2 (upval)
                                    ViewController:setView("PromptMatchmaking")
                                    u25("Story")
                                    u22(nil)
                                    GameMode_2("Story")
                                end

                                if not MatchmakingStore.getIsInParty() then
                                    local v3
                                    v3, v1 = MatchmakingController:createParty(true)
                                    if v3 ~= true then
                                        Notification.Create({
                                            Text = ("Error: %*"):format(v1 or "unknown"),
                                            Color = Color3.fromRGB(255, 0, 0),
                                        })
                                        ViewController:setView("PromptMatchmaking")
                                        u25("Story")
                                        u22(nil)
                                        GameMode_2("Story")
                                        return
                                    end
                                end
                                local party = PartyStore.getState().party
                                v1 = if not party then 1 else math.max(#party.players, 1)
                                MatchmakingController:setCount(v1)
                                local v4, v5 = MatchmakingController:startMatchmaking("story", v1, nil, nil, nil, {chapter = a1, mission = a2})
                                if v4 == true then
                                    ViewController:setView("Hotbar")
                                    return
                                end
                                Notification.Create({
                                    Text = ("Error: %*"):format(v5 or "unknown"),
                                    Color = Color3.fromRGB(255, 0, 0),
                                })
                                ViewController:setView("PromptMatchmaking")
                                u25("Story")
                                u22(nil)
                                GameMode_2("Story")
                            end,
                        }),
                    })
                end
                v4.storySelector = v5
                v5 = false
                if GameMode == "Player" then
                    v6 = {gameMode = u24, difficulty = u21}
                    maxGamepassPlayers = u37 and u37.maxGamepassPlayers
                    v6.maxGamepassPlayers = maxGamepassPlayers
                    maxPlayers = u285[u24] or u37 and u37.maxPlayers or 4
                    v6.maxPlayers = maxPlayers
                    gamepass = u37 and u37.gamepass
                    v6.gamepass = gamepass
                    attribute = u37 and u37.attribute
                    v6.attribute = attribute
                    levelLock = u37 and u37.levelLock
                    v6.level = levelLock
                    playerCounts = u37 and u37.playerCounts
                    v6.playerCounts = playerCounts
                    v6.currentLevel = v1

                    function v6.selectPlayers(a1) -- Line: 1830
                        -- upvalues: ViewController (upval), u24 (val), u21 (val), u25 (val), u22 (val)
                        -- upvalues: GameMode_2 (val), MatchmakingStore (upval), MatchmakingController (upval)
                        -- upvalues: Notification (upval), u37 (val)
                        local v1, v2
                        ViewController:setView("Loading")
                        task.wait(0.5)
                        local v3 = u24
                        local v4 = u21
                        if u24 == "Special Modes" then
                            v3 = u21:lower()
                            v4 = nil
                        end
                        local v5 = if u24 ~= "PVP" then a1 else if a1 ~= 1 then if a1 ~= 2 then a1 else 4 else 2

                        local function v6() -- Line: 1855
                            -- upvalues: ViewController (upval), u25 (upval), u24 (upval), u22 (upval), u21 (upval)
                            -- upvalues: GameMode_2 (upval)
                            ViewController:setView("PromptMatchmaking")
                            u25(u24)
                            u22(u21)
                            GameMode_2("Player")
                        end

                        if not MatchmakingStore.getIsInParty() then
                            v1, v2 = MatchmakingController:createParty(true)
                            if v1 ~= true then
                                Notification.Create({
                                    Text = ("Error: %*"):format(error or "unknown"),
                                    Color = Color3.fromRGB(255, 0, 0),
                                })
                                ViewController:setView("PromptMatchmaking")
                                u25(u24)
                                u22(u21)
                                GameMode_2("Player")
                                return
                            end
                        end
                        MatchmakingController:setCount(v5)
                        v1, v2 = MatchmakingController:startMatchmaking(u37.gameModeOverride or v3:lower(), v5, nil, v4, nil)
                        local v7 = v1
                        if v7 == true then
                            ViewController:setView("Hotbar")
                            return
                        end
                        Notification.Create({
                            Text = ("Error: %*"):format(v2 or v7 or "Failed to start matchmaking!"),
                            Color = Color3.fromRGB(255, 0, 0),
                        })
                        ViewController:setView("PromptMatchmaking")
                        u25(u24)
                        u22(u21)
                        GameMode_2("Player")
                    end

                    v5 = createElement(PlayerSelector, v6)
                end
                v4.PlayerSelector = v5
                return createElement(MatchmakingMenu, v3, v4)
            end
        end
        u37 = nil
    end
    v1 = useCache("Values.Level", 0)
    v2 = useCharmSelector(ServerCountStore.getState, function(a1) -- Line: 1594 -- upvalues: u579 (upval)
        local v1, v2, v3
        local v4 = {}
        local v5 = nil
        local v6 = nil
        for i, j in a1.serverCount, v5, v6 do
            v2 = nil
            v3 = nil
            for k, n in j, v2, v3 do
                v1 = u579[k] or i
                if not v4[v1] then
                    v4[v1] = 0
                end
                v4[v1] = v4[v1] + n
            end
        end
        local v7 = 0
        v5 = nil
        for m, i5 in v4 do
            if v7 < i5 then
                v5 = m
            end
        end
        return {count = v4, mostPopular = v5}
    end)
    useEffect(function() -- Line: 1622
        -- upvalues: u14 (val), ViewController (upval), u25 (val), u22 (val), GameMode_2 (val), u15 (val)
        -- upvalues: DisconnectionPenaltyController (upval)
        local u0 = u14
        local u1 = false
        local u6 = ViewController:onViewChange(function(a1) -- Line: 1626 -- upvalues: u0 (ref), u1 (ref), u25 (upval), u22 (upval), GameMode_2 (upval), u15 (upval)
            local v1
            if a1 == "PromptMatchmaking" == u0 then
                return
            end
            if u1 then
                u1 = false
                return
            end
            if not v1 then
                u25(nil)
                u22(nil)
                GameMode_2("GameMode")
            end
            u15(v1)
            u0 = v1
        end)
        local u16 = (ViewController:getEmitter("MatchmakingPrompt")):On("Show", function(a1, a2, a3) -- Line: 1648
            -- upvalues: DisconnectionPenaltyController (upval), ViewController (upval), u25 (upval), u22 (upval)
            -- upvalues: GameMode_2 (upval), u1 (ref), u15 (upval), u0 (ref)
            local v1 = DisconnectionPenaltyController.IsRestrictedFromMatchmaking()
            if v1 == "PENALIZED" then
                ViewController:setView("RestrictedPopup")
                return
            end
            if v1 == "MATCH_ACTIVE" then
                ViewController:setView("RejoinMatchPopup")
                return
            end
            warn(a1)
            u25(a1)
            u22(a2)
            GameMode_2(a3 or "GameMode")
            u1 = true
            ViewController:setView("PromptMatchmaking")
            u15(true)
            u0 = true
        end)
        return function() -- Line: 1671 -- upvalues: u16 (val), u6 (val)
            u16:Disconnect()
            u6()
        end
    end, {})
    if not u14 then
        return nil
    end
    v3 = {
        title = if GameMode ~= "Player" then if GameMode ~= "Story" then if GameMode ~= "Difficulty" then if GameMode ~= "Difficulty" then "Choose a Gamemode" else "Choose a Difficulty" else if u24 ~= "Special Modes" then if GameMode ~= "Difficulty" then "Choose a Gamemode" else "Choose a Difficulty" else "Choose a Mode" else "Choose a Story Mission" else "Choose a Squad Size",
    }
    v3.showBack = if not u37 then GameMode ~= "GameMode" else if not u37.hidden then GameMode ~= "GameMode" else if GameMode ~= "Difficulty" then GameMode ~= "GameMode" else false

    function v3.onBack() -- Line: 1695
        -- upvalues: GameMode (val), u24 (val), u390 (upval), GameMode_2 (val), u25 (val), u22 (val)
        if GameMode == "Player" and u390[u24] ~= nil then
            GameMode_2("Difficulty")
            return
        end
        u25(nil)
        u22(nil)
        GameMode_2("GameMode")
    end

    function v3.onClose() -- Line: 1705 -- upvalues: ViewController (upval)
        ViewController:setView("Hotbar")
    end

    v4 = {}
    v6 = {Scale = v7}
    v4.scale = createElement("UIScale", v6)
    v5 = false
    if GameMode == "GameMode" then
        v5 = createElement(GameModeSelector, {
            level = v1,
            serverCount = v2,
            selectGameMode = function(a1) -- Line: 1716
                -- upvalues: DisconnectionPenaltyController (upval), ViewController (upval), u25 (val), GameMode_2 (val)
                -- upvalues: u390 (upval)
                if a1 == "PVP" then
                    local v1 = DisconnectionPenaltyController.IsRestrictedFromMatchmaking()
                    if v1 == "PENALIZED" then
                        ViewController:setView("RestrictedPopup")
                        return
                    end
                    if v1 == "MATCH_ACTIVE" then
                        ViewController:setView("RejoinMatchPopup")
                        return
                    end
                end
                if a1 == "Story" then
                    u25(a1)
                    GameMode_2("Story")
                    return
                end
                u25(a1)
                GameMode_2(if not (u390[a1] ~= nil) then "Player" else "Difficulty")
            end,
        })
    end
    v4.gameModeSelector = v5
    v5 = false
    if GameMode == "Difficulty" then
        v6 = {gameMode = u24}
        hideRewardInfo = u37 and (u37.hideRewardInfo or u37.hidden)
        v6.hideRewardInfo = hideRewardInfo
        v6.level = v1

        function v6.selectDifficulty(a1) -- Line: 1746 -- upvalues: u22 (val), GameMode_2 (val)
            u22(a1)
            GameMode_2("Player")
        end

        v5 = createElement(DifficultySelector, v6)
    end
    v4.difficultySelector = v5
    v5 = false
    if GameMode == "Story" then
        v5 = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(1, 0.95),
        }, {
            book = createElement(StoryBook, {
                ShowClose = false,
                OnReady = function(a1, a2) -- Line: 1760
                    -- upvalues: ViewController (upval), u25 (val), u22 (val), GameMode_2 (val)
                    -- upvalues: MatchmakingStore (upval), MatchmakingController (upval), Notification (upval)
                    -- upvalues: PartyStore (upval)
                    local v1
                    ViewController:setView("Loading")
                    task.wait(0.5)

                    local function v2() -- Line: 1765
                        -- upvalues: ViewController (upval), u25 (upval), u22 (upval), GameMode_2 (upval)
                        ViewController:setView("PromptMatchmaking")
                        u25("Story")
                        u22(nil)
                        GameMode_2("Story")
                    end

                    if not MatchmakingStore.getIsInParty() then
                        local v3
                        v3, v1 = MatchmakingController:createParty(true)
                        if v3 ~= true then
                            Notification.Create({
                                Text = ("Error: %*"):format(v1 or "unknown"),
                                Color = Color3.fromRGB(255, 0, 0),
                            })
                            ViewController:setView("PromptMatchmaking")
                            u25("Story")
                            u22(nil)
                            GameMode_2("Story")
                            return
                        end
                    end
                    local party = PartyStore.getState().party
                    v1 = if not party then 1 else math.max(#party.players, 1)
                    MatchmakingController:setCount(v1)
                    local v4, v5 = MatchmakingController:startMatchmaking("story", v1, nil, nil, nil, {chapter = a1, mission = a2})
                    if v4 == true then
                        ViewController:setView("Hotbar")
                        return
                    end
                    Notification.Create({
                        Text = ("Error: %*"):format(v5 or "unknown"),
                        Color = Color3.fromRGB(255, 0, 0),
                    })
                    ViewController:setView("PromptMatchmaking")
                    u25("Story")
                    u22(nil)
                    GameMode_2("Story")
                end,
            }),
        })
    end
    v4.storySelector = v5
    v5 = false
    if GameMode == "Player" then
        v6 = {gameMode = u24, difficulty = u21}
        maxGamepassPlayers = u37 and u37.maxGamepassPlayers
        v6.maxGamepassPlayers = maxGamepassPlayers
        maxPlayers = u285[u24] or u37 and u37.maxPlayers or 4
        v6.maxPlayers = maxPlayers
        gamepass = u37 and u37.gamepass
        v6.gamepass = gamepass
        attribute = u37 and u37.attribute
        v6.attribute = attribute
        levelLock = u37 and u37.levelLock
        v6.level = levelLock
        playerCounts = u37 and u37.playerCounts
        v6.playerCounts = playerCounts
        v6.currentLevel = v1

        function v6.selectPlayers(a1) -- Line: 1830
            -- upvalues: ViewController (upval), u24 (val), u21 (val), u25 (val), u22 (val), GameMode_2 (val)
            -- upvalues: MatchmakingStore (upval), MatchmakingController (upval), Notification (upval), u37 (val)
            local v1, v2
            ViewController:setView("Loading")
            task.wait(0.5)
            local v3 = u24
            local v4 = u21
            if u24 == "Special Modes" then
                v3 = u21:lower()
                v4 = nil
            end
            local v5 = if u24 ~= "PVP" then a1 else if a1 ~= 1 then if a1 ~= 2 then a1 else 4 else 2

            local function v6() -- Line: 1855
                -- upvalues: ViewController (upval), u25 (upval), u24 (upval), u22 (upval), u21 (upval)
                -- upvalues: GameMode_2 (upval)
                ViewController:setView("PromptMatchmaking")
                u25(u24)
                u22(u21)
                GameMode_2("Player")
            end

            if not MatchmakingStore.getIsInParty() then
                v1, v2 = MatchmakingController:createParty(true)
                if v1 ~= true then
                    Notification.Create({
                        Text = ("Error: %*"):format(error or "unknown"),
                        Color = Color3.fromRGB(255, 0, 0),
                    })
                    ViewController:setView("PromptMatchmaking")
                    u25(u24)
                    u22(u21)
                    GameMode_2("Player")
                    return
                end
            end
            MatchmakingController:setCount(v5)
            v1, v2 = MatchmakingController:startMatchmaking(u37.gameModeOverride or v3:lower(), v5, nil, v4, nil)
            local v7 = v1
            if v7 == true then
                ViewController:setView("Hotbar")
                return
            end
            Notification.Create({
                Text = ("Error: %*"):format(v2 or v7 or "Failed to start matchmaking!"),
                Color = Color3.fromRGB(255, 0, 0),
            })
            ViewController:setView("PromptMatchmaking")
            u25(u24)
            u22(u21)
            GameMode_2("Player")
        end

        v5 = createElement(PlayerSelector, v6)
    end
    v4.PlayerSelector = v5
    return createElement(MatchmakingMenu, v3, v4)
end

return function(a1) -- Line: 1903
    -- upvalues: createElement (val), React (val), NewMatchmakingMenu (val), MatchmakingMenu_2 (val)
    -- upvalues: MatchmakingQueueContainer (val), MatchmakingFound (val)
    local Fragment = React.Fragment
    local v1 = {}
    local v2 = if workspace.Type.Value ~= "Lobby" then createElement(MatchmakingMenu_2, a1) else createElement(NewMatchmakingMenu, a1)
    v1.menu = v2
    v1.queue = createElement(MatchmakingQueueContainer)
    v1.found = createElement(MatchmakingFound)
    return createElement(Fragment, nil, v1)
end