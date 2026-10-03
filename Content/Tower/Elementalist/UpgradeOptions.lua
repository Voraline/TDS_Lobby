-- Script path: ReplicatedStorage.Content.Tower.Elementalist.UpgradeOptions
-- Decompile time: 0.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
return {
    {
        Name = "Element",
        Icon = 90574233330483,
        CoolDown = 5,
        Default = Enum.Element.Frost,
        Values = {
            {Name = "Frost", Icon = 90574233330483, Level = 0, Value = Enum.Element.Frost},
            {Name = "Fire", Icon = 102536701896068, Level = 0, Value = Enum.Element.Fire},
        },
    },
}