-- Script path: ReplicatedStorage.Content.Tower.Executioner.TowerInformation
-- Decompile time: 1.63 ms

local v1, v2
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Default = require(script.Parent.Stats).Stats.Default
local v3 = {ToolTip = {"Throws an axe back and forth through a cache of enemies, gaining damage on each contact."}}

local function getDetectionText(a1, a2) -- Line: 11 -- upvalues: Default (val)
    local Defaults
    local v1 = #Default.Upgrades
    for i = 0, v1 do
        Defaults = if i ~= 0 then Default.Upgrades[i].Stats else Default.Defaults
        if Defaults.Detections and Defaults.Detections[v2] then
            if i == 0 then
                return (("Detects %* enemies."):format(v3))
            end
            return (("Gains %* detection at level %*."):format(v3, i))
        end
    end
    return nil
end

local v4 = {
    {Enum.StatusEffect.FlyingDetection, "flying"},
    {Enum.StatusEffect.HiddenDetection, "hidden"},
}
local v5 = {}
for i, j in v4 do
    v2 = getDetectionText(j[1], j[2])
    if v2 then
        table.insert(v5, v2)
    end
end
if #v5 > 0 then
    table.insert(v3.ToolTip, (table.concat(v5, " ")))
end
local v6 = table.clone(Default.Defaults.Attributes)
local v7 = #Default.Upgrades
for k = 0, v7 do
    if k > 0 then
        for n, m in Default.Upgrades[k].Stats.Attributes or {} do
            v6[n] = m
        end
    end
    v1 = {
        ["Tower Ability"] = {
            {
                Header = "Bouncing Axe",
                Icon = 129697807,
                Description = ("%* cached targets. Up to %* enemy contacts, including the first hit."):format(v6.MaxTargets, v6.MaxBounces),
                Content = {
                    {
                        Text = ("+%* damage per previous contact. Cooldown begins after the catch."):format(v6.BounceDamage),
                    },
                },
            },
        },
    }
    v3[k] = v1
end
return v3