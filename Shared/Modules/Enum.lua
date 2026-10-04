-- Script path: ReplicatedStorage.Shared.Modules.Enum
-- Decompile time: 3.09 ms

local v1
local u278 = Enum
local v2 = {
    Team = {Player = 10, Enemy = 11, Red = 12, Blue = 13},
    DamageType = {
        Normal = 1,
        LeadBullet = 2,
        Explosion = 3,
        Energy = 4,
        Fire = 5,
        Melee = 6,
        UnitCollision = 7,
        FlyDetectMelee = 8,
    },
    DamageDisplayType = {
        Normal = 1,
        Explosion = 2,
        Posion = 3,
        Poison = 3,
        Energy = 4,
        Melee = 5,
        Heal = 6,
        Frost = 7,
    },
    TargetingMode = {
        First = 1,
        Last = 2,
        Strongest = 3,
        Weakest = 4,
        Closest = 5,
        Farthest = 6,
        Random = 7,
    },
    StunType = {
        Normal = 1,
        Poison = 2,
        Fire = 3,
        Frozen = 4,
        Ducky = 5,
        Spooky = 6,
        Boomer = 7,
        Legacy = 8,
        Golden = 9,
    },
    JesterBomb = {Fire = 1, Ice = 2, Poison = 3, Confusion = 4},
    Element = {Frost = 1, Fire = 2},
    AcePilotMode = {Normal = 1, Figure8 = 2},
    ArrowType = {Normal = 1, Flame = 2, Shock = 3, Explosive = 4},
    BuffType = {Range = 1, Damage = 2, Cooldown = 3, FortifyReduction = 4},
    CharacterScale = {Normal = 1, Small = 2, Large = 3},
    UIScale = {Small = 1, Default = 2, Large = 3, Huge = 4},
    Modifier = {
        God = 1,
        Hidden = 2,
        Flying = 3,
        Stunned = 4,
        Lead = 5,
        CliffUnit = 6,
        StunImmune = 7,
        Ignore = 8,
        HiddenDetection = 9,
        Boss = 10,
        ExplosionImmune = 11,
        EnergyImmune = 12,
        FreezeImmune = 13,
        FireImmune = 14,
        Ghost = 15,
        Invincible = 16,
        HealthRegen = 17,
        Slime = 18,
        Nimble = 19,
        Bloated = 20,
        LastSlime = 21,
        Tank = 22,
        Explosive = 23,
        Jailed = 24,
        Aggro = 25,
        DoubleDamage = 26,
        MoltenCorpse = 27,
        Frozen = 28,
        FullRefund = 29,
        FireworkBuff = 30,
        Hologram = 31,
        Blessed = 32,
        Shield = 33,
        SpeedBoost = 34,
        HiddenExposed = 35,
        Neuralyzed = 36,
        Cursed = 37,
        Marathon = 38,
    },
}
v2.DetectionModifiers = {
    Hidden = v2.Modifier.Hidden,
    Lead = v2.Modifier.Lead,
    Flying = v2.Modifier.Flying,
}
v2.HookType = {
    SpawnEnemy = 1,
    EnemyRequestSpawn = 2,
    OnDialogue = 3,
    OnMapLoad = 4,
    OnMapHealthCalculated = 5,
    OnNextWave = 6,
    ManagerCreatedEnemy = 7,
    OnRewardCalculated = 8,
    OnWaveEnemiesGenerated = 9,
    OnWaveMusicCreated = 10,
    OnGameRewarded = 11,
    OnPlayerLoadout = 12,
    OnStartingCashReward = 13,
    OnCashReward = 14,
    OnEcoScale = 15,
    OnDialogueOverride = 16,
    OnWavesGenerated = 17,
    OnBattlepassRewardMultiplier = 18,
    OnFarmIncome = 19,
    OnWaveLayout = 20,
    OnWaveEnd = 21,
    OnWaveBonus = 22,
    OnDebuffCreated = 23,
    OnBuffCreated = 24,
    OnEnemyHovered = 25,
}
v2.ItemPickupType = {
    PhilipsRazor = 1,
    Shell = 2,
    CandyCane = 3,
    Cookie = 3,
    Battery = 4,
    Cash = 5,
    Coin = 6,
    XP = 7,
    Gem = 8,
    Pumpkin = 9,
    CandyCorn = 10,
    EnemyLorebook = 11,
    Bell = 12,
    Duck = 13,
    BeachBall = 14,
    Gumdrop = 15,
    StarBattery = 16,
    SnowCharm = 17,
    Bunz = 18,
}
v2.GameModifier = {
    PollutedWasteland = 1,
    DoubleHealth = 2,
    Fallen = 3,
    Small = 4,
    Birthday = 5,
    Cowboy = 6,
    AllPaths = 7,
    NewModels = 8,
    HealthLock = 9,
    Mutation = 10,
    BadTranslation = 11,
    ClassicDeath = 12,
    PirateHat = 13,
    Halloween = 14,
    Christmas = 15,
    Valentines = 16,
    Easter = 17,
    NewYear = 18,
    JulyFourth = 19,
    Astronaut = 20,
    Scuba = 21,
    Glass = 22,
    Boss = 23,
    BadlandsEnemies = 24,
    Blood = 25,
    PizzaParty = 26,
    Redemption = 27,
    Weekend = 28,
    MemeMode = 29,
    Juggernaut = 30,
    Vanguard = 31,
    OopsAllSlimes = 32,
    ClassicRoblox = 33,
    ClassicOof = 34,
    BackToBasics = 35,
    BossRush = 36,
    Legion = 37,
    JailedTower = 38,
    Battlepass = 39,
    BanFarm = 40,
    BanGatlingGun = 41,
    Legacy = 42,
    UseEnemySpawner = 43,
}
v2.DebuffType = {
    Burn = 1,
    Posion = 2,
    Poison = 2,
    Sting = 3,
    Freeze = 5,
    Shock = 6,
    Stun = 7,
    Scale = 8,
    Slowness = 9,
    Confuse = 10,
    Frost = 11,
    Bleed = 12,
    Bees = 13,
    Neuralyzed = 14,
    Slime = 15,
}
v2.StatusEffect = {
    Burn = "Burn",
    Poison = "Poison",
    Sting = "Sting",
    Freeze = "Freeze",
    Shock = "Shock",
    Stun = "Stun",
    Scale = "Scale",
    Slow = "Slow",
    Slimed = "Slimed",
    Confuse = "Confuse",
    Frost = "Frost",
    Bleed = "Bleed",
    Bees = "Bees",
    DamageBuff = "DamageBuff",
    RangeBuff = "RangeBuff",
    CooldownBuff = "CooldownBuff",
    FortifyReduction = "FortifyReduction",
    DiscountBuff = "DiscountBuff",
    Scared = "Scared",
    Fatigue = "Fatigue",
    HiddenBuff = "HiddenBuff",
    Coordination = "Coordination",
    SharedOptics = "SharedOptics",
    Blessed = "Blessed",
    SpeedBoost = "SpeedBoost",
    Marathon = "Marathon",
    Hidden = "Hidden",
    HiddenExposed = "HiddenExposed",
    Bloated = "Bloated",
    Boss = "Boss",
    Aggro = "Aggro",
    Neuralyzed = "Neuralyzed",
    HealthRegen = "HealthRegen",
    Nimble = "Nimble",
    Slime = "Slime",
    Explosive = "Explosive",
    MoltenCorpse = "MoltenCorpse",
    CliffUnit = "CliffUnit",
    Stunned = "Stunned",
    Flying = "Flying",
    Lead = "Lead",
    Ghost = "Ghost",
    God = "God",
    Invincible = "Invincible",
    Tank = "Tank",
    DoubleDamage = "DoubleDamage",
    Ignore = "Ignore",
    StunImmune = "StunImmune",
    FireImmune = "FireImmune",
    FreezeImmune = "FreezeImmune",
    ConfuseImmune = "ConfuseImmune",
    EnergyImmune = "EnergyImmune",
    ExplosionImmune = "ExplosionImmune",
    LastSlime = "LastSlime",
    Jailed = "Jailed",
    Frozen = "Frozen",
    Shield = "Shield",
    Cursed = "Cursed",
    DisableDiscount = "DisableDiscount",
    FullRefund = "FullRefund",
    FireworkBuff = "FireworkBuff",
    Hologram = "Hologram",
    HiddenDetection = "HiddenDetection",
    FlyingDetection = "FlyingDetection",
    LeadDetection = "LeadDetection",
}
v2.Result = {Success = 1, Error = 2}
v2.TowerType = {Flying = 1, Ground = 2, Cliff = 3, Both = 4}
v2.TowerCategory = {
    Starter = 1,
    Intermediate = 2,
    Advanced = 3,
    Hardcore = 4,
    Exclusive = 5,
    Event = 6,
    Evolved = 7,
}
v2.TowerRole = {Offense = 1, Defense = 2, Support = 3}
v2.Rarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Legendary = 4,
    Golden = 5,
    Mythic = 6,
    Ultimate = 7,
    Exclusive = 8,
    Event = 9,
    Developer = 10,
}
v2.SkinRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Legendary = 4,
    Golden = 5,
    Ultimate = 9,
    Exclusive = 6,
    Event = 7,
    Developer = 8,
    GoldenButton = 10,
    Utility = 11,
    Gem = 12,
}
v2.FlairRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Legendary = 4,
    Exclusive = 6,
}
v2.StickerRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Legendary = 4,
    Exclusive = 6,
}
v2.CrateItemRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Epic = 4,
    Legendary = 5,
    Mythic = 6,
    Exclusive = 7,
}
v2.ConsumableRarity = {
    Common = 1,
    Uncommon = 2,
    Rare = 3,
    Epic = 4,
    Legendary = 5,
    Exclusive = 6,
}
v2.CurrencyType = {Free = 1, Coins = 2, Gems = 3, Robux = 4}
v2.CrateCategory = {Default = 1, Consumables = 2, Robux = 3, Event = 4}
v2.Difficulty = {
    Easy = 1,
    Medium = 2,
    Normal = 3,
    Hard = 4,
    Insane = 5,
    Event = 6,
    Special = 7,
    VeryEasy = 8,
}
v2.Gamemode = {
    Survival = 1,
    Hardcore = 2,
    DefendTheCenter = 3,
    Halloween = 4,
    Winter = 5,
    Tutorial = 6,
    EggHunt2024 = 7,
    Event = 8,
    PVP = 9,
    Halloween2024 = 10,
    PlsDonate = 11,
    Sandbox = 12,
    FrostInvasion = 13,
    Special = 14,
    EggHunt2025 = 15,
    Hunt2025 = 16,
    DuckEvent = 17,
    Summer2025 = 18,
    Halloween2025 = 19,
    Christmas2025 = 20,
    AdidasMap1 = 21,
    AdidasMap2 = 22,
    AdidasMap3 = 23,
}
v2.GamemodeType = {Evergreen = 1, Event = 2, Hidden = 3}
v2.MapType = {Standard = 1, Exclusive = 2, Community = 3}
v2.CutSceneTiming = {PreWave = 1, PostWave = 2}
v2.EmoteInteractType = {None = 1, Single = 2, Multi = 3}
v2.TutorialStage = {Start = 1, Game = 2, Lobby = 3, Completed = 4}
v2.UGCState = {InProgress = 1, Completed = 2}
v2.UGCPurchaseResult = {Purchased = 1, NotPurchased = 2, NoItemsLeft = 3}
v2.BanReason = {
    Exploiting = 1,
    Toxicity = 2,
    Scamming = 3,
    Abusing = 4,
    Other = 100,
}
v2.TweenPriority = {Stepped = 1, Heartbeat = 2, RenderStepped = 3}
v2.ConsumableState = {Ready = 1, Queued = 2, Consuming = 3}
v2.ConsumableQueue = {None = 1, Global = 2, PerPlayer = 3}
v2.CooldownType = {None = 1, Post = 2, Instant = 3}
v2.MiddlewarePriority = {Stack = 1, Replace = 2}
v2.MatchResult = {Lose = 1, Win = 2, Draw = 3}
v2.CameraMode = {Default = 1, BirdsEye = 2, Spectate = 3}
v2.Rank = {
    Unranked = -1,
    PrivateI = 1,
    PrivateII = 2,
    PrivateIII = 3,
    SergeantI = 4,
    SergeantII = 5,
    SergeantIII = 6,
    LieutenantI = 7,
    LieutenantII = 8,
    LieutenantIII = 9,
    MajorI = 10,
    MajorII = 11,
    MajorIII = 12,
    GeneralI = 13,
    GeneralII = 14,
    GeneralIII = 15,
}
v2.SkillTreeCategory = {Offense = 1, Defense = 2, Economy = 3, Strategy = 4}
v2.SkillTreeNode = {
    EnhancedOptics = 1,
    ResellValue = 2,
    Fortify = 3,
    Overhealing = 4,
    FightDirty = 5,
    ExtremeConditioning = 6,
    Stonks = 7,
    ExpandedBarracks = 8,
    SplashDamage = 9,
    BeefedUpMinions = 10,
    Precision = 11,
    Scavenger = 12,
    SkillAccelerator = 13,
    Reenforcements = 14,
    BiggerBudget = 15,
    Bandages = 16,
    Scholar = 17,
}
v2.SkillTreeFormat = {
    Percentage = 1,
    Number = 2,
    Integer = 3,
    Currency = 4,
    Enemies = 5,
}
v2.SkillTileState = {Locked = 1, Unlocked = 2, Owned = 3, MaxedOut = 4}
v2.ShopItemType = {
    Tower = 1,
    Skin = 2,
    Modifier = 3,
    Consumable = 4,
    Crate = 5,
    Sticker = 6,
    Emote = 7,
    Flair = 8,
    Nametag = 9,
}
v2.ShopProductSize = {
    Card = 1,
    Square = 2,
    Featured_Duo = 3,
    Featured_Thirds = 4,
    Currency_Vertical = 5,
    Currency_Horizontal = 6,
}
for k, v in pairs(v2) do
    local u276 = {}
    local u285 = {}
    for k2, i in pairs(v) do
        v1 = tostring(i)
        v[k2] = v1
        if u276[v1] == nil then
            table.insert(u285, v1)
        end
        u276[v1] = k2
    end
    table.sort(u285, function(a1, a2) -- Line: 1383
        local v1 = tonumber(a1)
        local v2 = tonumber(a2)
        if v1 and v2 then
            return v1 < v2
        end
        if v1 then
            return true
        end
        if v2 then
            return false
        end
        return a1 < a2
    end)
    local u248 = {}

    function u248.__newindex(a1, a2, a3) -- Line: 1399
        error("Enum." .. a2 .. " is read-only", 2)
    end

    function u248.Next(a1) -- Line: 1403 -- upvalues: u285 (val), k (val), v (val), u276 (val)
        local v1 = table.find(u285, (tostring(a1)))
        if not v1 then
            error(string.format("%q is not a valid value of %s", tostring(a1), k), 2)
        end
        v1 = v1 + 1
        if #u285 < v1 then
            v1 = 1
        end
        return v[u276[u285[v1]]]
    end

    function u248.ToString(a1) -- Line: 1417 -- upvalues: u276 (val)
        return u276[tostring(a1)]
    end

    function u248.HasValue(a1) -- Line: 1421 -- upvalues: u276 (val)
        return u276[tostring(a1)] ~= nil
    end

    function u248.HasKey(a1) -- Line: 1424 -- upvalues: v (val)
        return rawget(v, a1) ~= nil
    end

    function u248.__index(a1, a2) -- Line: 1429 -- upvalues: u248 (val), k (val)
        if u248[a2] then
            return u248[a2]
        end
        error(string.format("%q is not a valid member of %s", tostring(a2), k), 2)
    end

    setmetatable(v, u248)
end
local v3 = {
    __index = function(a1, a2) -- Line: 1441 -- upvalues: u278 (val)
        if u278[a2] then
            return u278[a2]
        end
        error(string.format("%q is not a valid member of Enum", (tostring(a2))), 2)
    end,
    __newindex = function() -- Line: 1448
        error("Enum is read-only", 2)
    end,
}
setmetatable(v2, v3)
return v2