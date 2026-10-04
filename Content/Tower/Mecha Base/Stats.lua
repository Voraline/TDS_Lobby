-- Script path: ReplicatedStorage.Content.Tower.Mecha Base.Stats
-- Decompile time: 0.77 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    Stats = {
        Default = {
            Upgrades = {
                {
                    Image = 7610093373,
                    Title = "ROCKET MECHA",
                    Cost = 1200,
                    Stats = {
                        Attributes = {UnitToSend = "Mark1Rocket", SpawnTime = 30},
                        Extras = {"AI ruined my funny descriptions ill fix later"},
                    },
                },
                {
                    Image = 7610093373,
                    Title = "EPIC MECHA",
                    Cost = 2000,
                    Stats = {Attributes = {UnitToSend = "Mark2"}, Extras = {"Mikey Boss"}},
                },
                {
                    Image = 7610093373,
                    Title = "SIGMA MECHA",
                    Cost = 4000,
                    Stats = {Attributes = {UnitToSend = "Mark3"}, Extras = {"Mikey Boss"}},
                },
                {
                    Image = 7610093373,
                    Title = "OMEGA MECHA",
                    Cost = 8000,
                    Stats = {Attributes = {UnitToSend = "Mark4"}, Extras = {"Mikey Boss"}},
                },
                {
                    Image = 7610093373,
                    Title = "Z.O.D. MACHINE",
                    Cost = 80000,
                    Stats = {Attributes = {UnitToSend = "Mark5"}, Extras = {"Mikey Boss"}},
                },
            },
            Defaults = {
                Limit = 3,
                Price = 6000,
                Range = 3,
                Cooldown = 0.5,
                Damage = 0,
                Detections = {
                    [Enum.StatusEffect.FlyingDetection] = false,
                    [Enum.StatusEffect.HiddenDetection] = false,
                },
                Attributes = {UnitToSend = "Mark1", SpawnTime = 45},
            },
        },
    },
    Properties = {
        Description = "Spawns durable gunner walkers that fire on enemies and gain rocket barrages at higher levels.",
        BoundarySize = 2.25,
        Height = 0,
        Level = 50,
        BoundingSize = Vector3.new(0, 0, 0),
        Role = Enum.TowerRole.Defense,
        Class = Enum.TowerType.Ground,
        Preview = {
            FieldOfView = 60,
            TowerOffset = Vector3.new(0, 0.5, 0),
            Icon = 6883292239,
            Thumbnail = 0,
            TowerRotation = CFrame.Angles(0, -0.7853981633974483, 0),
            CameraOffset = CFrame.new(0, 0, 6),
        },
        Category = Enum.TowerCategory.Exclusive,
    },
}