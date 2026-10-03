-- Script path: ReplicatedStorage.Client.Interfaces.Icons
-- Decompile time: 0.57 ms

local v1
local v2 = {
    CoinsTiny = 128907328829271,
    CoinsSmall = 89744048301159,
    CoinsChest = 92523260529252,
    CoinsChestBig = 137499332066264,
    GemsTiny = 108777382125602,
    GemsSmall = 125489262334710,
    GemsChest = 80750720797102,
    GemsChestBig = 112885199126586,
    Experience = 6794340240,
    Timescale = 17447507910,
    Revive = 18557179994,
    Spin = 18493073533,
    Flying = 12270724272,
    Hidden = 12270723919,
    Lead = 12270724694,
    Defense = 13019520315,
    Cooldown = 5577896365,
    Damage = 5577895610,
    Attack = 77594082345021,
    Income = 5547581690,
    Limit = 5577929792,
    Range = 5577896808,
    SpawnTime = 5577906526,
    ExplosionDamage = 5591343189,
    Boss = 9666309147,
    Ignore = 72358855014516,
    Ghost = 5466658816,
    ExplosionImmune = 5468026893,
    EnergyImmune = 5467978241,
    FireImmune = 5466693430,
    FreezeImmune = 5468008851,
    StunImmune = 5467978241,
    FireworkBuff = 114727715199473,
    Coordination = 114589404718941,
    SharedOptics = 138731994983910,
    XmasPresent = 15690514701,
    Flair = {
        Verified = "rbxasset://textures/ui/VerifiedBadgeNameIcon.png",
        ["Content Creator"] = "rbxassetid://12292033404",
        ["QA Tester"] = "rbxassetid://12292033404",
        Contributor = "rbxassetid://12292033404",
        Moderator = "rbxassetid://12292032948",
        Administrator = "rbxassetid://12292032948",
        ["Community Manager"] = "rbxassetid://12292032948",
        Developer = "rbxassetid://12292032610",
        Owner = "rbxassetid://12292032610",
    },
    HealthRegen = 17340669543,
    Slime = 121335862670868,
    Slowed = 121335862670868,
    Nimble = 17340669795,
    Bloated = 17340670296,
    Tank = 17340669942,
    Aggro = 17860670790,
    Bleed = 429480091,
    Neuralyzed = 128267223128563,
    Bee = 105785337955293,
    MoltenCorpse = 91998895277524,
    Blessed = 115146566907520,
    EnemyHealth = 17524466110,
    EnemySpeed = 17524465924,
    EnemyAttack = 77594082345021,
}
local v3 = {}
for k, v in pairs(v2) do
    if type(v) ~= "number" then
        v3[k] = (table.clone(v))
    else
        v1 = v2[k]
        v3[k] = "rbxassetid://" .. tostring(v1)
    end
end
table.freeze(v3)
return v3