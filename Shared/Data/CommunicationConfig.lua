-- Script path: ReplicatedStorage.Shared.Data.CommunicationConfig
-- Decompile time: 0.68 ms

local v1 = {
    PlaceTower = "PlaceTower",
    SellTower = "SellTower",
    UpgradeTower = "UpgradeTower",
    UseAbility = "UseAbility",
    UseConsumable = "UseConsumable",
}
return {
    SuggestionTTL = 120,
    TypeCooldown = 10,
    BurstWindow = 30,
    BurstLimit = 12,
    SoundGroup = "Communication",
    Type = v1,
    TypeOrder = {
        v1.PlaceTower,
        v1.SellTower,
        v1.UpgradeTower,
        v1.UseAbility,
        v1.UseConsumable,
    },
    TypeLabels = {
        [v1.PlaceTower] = "Place Tower",
        [v1.SellTower] = "Sell Tower",
        [v1.UpgradeTower] = "Upgrade Tower",
        [v1.UseAbility] = "Use Ability",
        [v1.UseConsumable] = "Use Consumable",
    },
    TypeIcons = {
        [v1.PlaceTower] = 5577929792,
        [v1.SellTower] = 5547581690,
        [v1.UpgradeTower] = 5577896365,
        [v1.UseAbility] = 96094123815590,
        [v1.UseConsumable] = 17409006603,
    },
    TypeSounds = {
        [v1.PlaceTower] = 124006477814057,
        [v1.SellTower] = 113167219763411,
        [v1.UpgradeTower] = 132659294376569,
        [v1.UseAbility] = 88222090100447,
        [v1.UseConsumable] = 138349382928106,
    },
    MarkerTypes = {[v1.PlaceTower] = true, [v1.SellTower] = true, [v1.UpgradeTower] = true},
    Palette = {
        Color3.fromRGB(61, 178, 255),
        Color3.fromRGB(255, 199, 44),
        Color3.fromRGB(255, 105, 128),
        Color3.fromRGB(105, 235, 144),
        Color3.fromRGB(188, 132, 255),
        (Color3.fromRGB(255, 145, 78)),
    },
    LoadoutFields = {
        Default = {Towers = "EquippedTowers", Consumables = "EquippedConsumables"},
        PVP = {Towers = "EquippedPVPTowers", Consumables = "EquippedPVPConsumables"},
    },
    CompletionRadius = {PlaceTower = 6},
    CameraFocus = {BindName = "CommunicationSuggestionFocus", TweenTime = 0.35, HoldTime = 2.5},
    Wheel = {ItemsPerPage = 6, StudioTestPlayerId = 16983447},
    Ping = {
        FallbackImage = 11914981726,
        FallbackRadius = 3.75,
        Height = 2,
        FallbackColor = Color3.new(1, 1, 1),
    },
}