-- Script path: ReplicatedStorage.Content.Tower.EvolvedKingpin.UpgradeOptions
-- Decompile time: 0.41 ms

local KingpinTooltips = require(script.Parent.Stats.KingpinTooltips)

local function getUnitValues() -- Line: 9 -- upvalues: KingpinTooltips (val)
    return {
        {
            Name = "Lackey",
            Icon = 117012512715591,
            Level = 0,
            Value = "Gunner",
            Tooltip = KingpinTooltips.UnitSelection.Gunner,
        },
        {
            Name = "Money Runner",
            Icon = 101018065480597,
            Level = 0,
            Value = "MoneyRunner",
            Tooltip = KingpinTooltips.UnitSelection.MoneyRunner,
        },
        {
            Name = "Bouncer",
            Icon = 96508625116086,
            Level = 4,
            Path = 2,
            Value = "Bouncer",
            Tooltip = KingpinTooltips.UnitSelection.Bouncer,
        },
        {
            Name = "Contractor",
            Icon = 105902098922567,
            Level = 6,
            Path = 2,
            Value = "Hitman",
            Tooltip = KingpinTooltips.UnitSelection.Hitman,
        },
    }
end

return {
    {
        Name = "Unit 1",
        Icon = 16742128592,
        QueueName = "Unit 1",
        Default = "Gunner",
        Values = getUnitValues(),
    },
    {
        Name = "Unit 2",
        Icon = 16742128592,
        QueueName = "Unit 2",
        Default = "Gunner",
        Values = getUnitValues(),
    },
    {
        Name = "Unit 3",
        Icon = 16742128592,
        QueueName = "Unit 3",
        Default = "Gunner",
        Values = getUnitValues(),
    },
    {
        Name = "Unit 4",
        Icon = 16742128592,
        QueueName = "Unit 4",
        Default = "Gunner",
        Values = getUnitValues(),
    },
}