-- Script path: ReplicatedStorage.Content.Gamemodes.DefendTheCenter.Difficulties.Act3.Infinite
-- Decompile time: 0.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Enum)
return {
    MinInterval = 0.5,
    MaxInterval = 5,
    IntervalScalingCoefficient = 0.15000000000000002,
    HealthScalingCoefficient = 0.07500000000000001,
    HealthCutoffScalingCoefficient = 3,
    StartingHealth = 30,
    Music = "HandsBoss",
    EnemySpawns = {
        "Guard Plush",
        "Actor3",
        "Actor2",
        "Actor1",
        "Marionette",
        "Sock Puppet",
        "Voodoo Doll",
        "Knight Plush",
    },
    WaveInterval = NumberRange.new(15, 60),
    WaveCooldown = NumberRange.new(35, 50),
}