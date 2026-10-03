-- Script path: ReplicatedStorage.Shared.Data.SharedData.ClientItemPickupData
-- Decompile time: 5.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Icons_2 = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Seasons = require(ReplicatedStorage.Shared.Data.Seasons)
local ItemPickupType = Enum.ItemPickupType

local function getNPCIcon(a1) -- Line: 14 -- upvalues: Icons (val) -- types: a1: string
    local v1 = if not (string.sub(a1, #a1 - 6) == " Legacy") then a1 else string.sub(a1, 1, #a1 - 7)
    if v1 and v1 ~= "" then
        local v2
        local LegacyEnemies = v2 and Icons.LegacyEnemies or Icons.Enemies
        return LegacyEnemies[v1] or "rbxassetid://15913919212"
    end
    return ""
end

local v1 = {}
v1[ItemPickupType.StarBattery] = {
    ModelName = "StarBattery",
    SoundName = "Shell",
    Icon = 136854065383009,
    AlwaysShow = true,
    OnSpawn = function(a1) -- Line: 32
        a1.model.Trail.Enabled = false
    end,
    OnPickup = function(a1) -- Line: 35
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 37 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
}
v1[ItemPickupType.PhilipsRazor] = {
    ModelName = "PhilipsRazor",
    Icon = Seasons.Seasons["Philips x TDS"].currency.icon,
    OnSpawn = function(a1) -- Line: 46
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 48 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 52
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Shell] = {
    ModelName = "Shell",
    Icon = Seasons.Seasons["End of Summer"].currency.icon,
    OnSpawn = function(a1) -- Line: 59
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 61 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 65
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Pumpkin] = {
    ModelName = "Pumpkin",
    SoundName = "Shell",
    Icon = Seasons.Seasons["Lunar Overture"].currency.icon,
    OnSpawn = function(a1) -- Line: 73
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 75 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 79
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.CandyCorn] = {
    ModelName = "CandyCorn",
    SoundName = "Shell",
    Icon = Seasons.Seasons["Hexscape Event"].currency.icon,
    OnSpawn = function(a1) -- Line: 87
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 89 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 93
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Bell] = {
    ModelName = "Bell",
    SoundName = "Shell",
    Icon = Seasons.Seasons["Operation I.C.E"].currency.icon,
    OnSpawn = function(a1) -- Line: 101
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 103 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 107
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Duck] = {
    ModelName = "Duck",
    SoundName = "Shell",
    Icon = Seasons.Seasons["Ducky Revenge"].currency.icon,
    OnSpawn = function(a1) -- Line: 115
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 117 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 121
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.BeachBall] = {
    ModelName = "BeachBall",
    SoundName = "Shell",
    Icon = Seasons.Seasons["Surf & Turf"].currency.icon,
    OnSpawn = function(a1) -- Line: 129
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 131 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 135
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.CandyCane] = {
    ModelName = "CandyCane",
    Icon = Seasons.Seasons["Violent Night"].currency.icon,
    OnSpawn = function(a1) -- Line: 142
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 144 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 148
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Gumdrop] = {
    ModelName = "Gumdrop",
    SoundName = "Shell",
    Icon = 109967561334777,
    OnSpawn = function(a1) -- Line: 156
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 158 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 162
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Cookie] = {
    ModelName = "Cookie",
    SoundName = "Cookie",
    Icon = Seasons.Seasons["Krampus' Revenge"].currency.icon,
    OnSpawn = function(a1) -- Line: 170
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 172 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 176
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Battery] = {
    ModelName = "Battery",
    Icon = Icons_2.Battery,
    OnSpawn = function(a1) -- Line: 183
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 185 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 189
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Cash] = {
    ModelName = "Cash",
    SoundName = "Shell",
    Icon = Icons_2.Cash,
    OnSpawn = function(a1) -- Line: 197
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 199 -- upvalues: a1 (val)
            local v1
            for i, j in a1.model.Center:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    v1 = tonumber((j:GetAttribute("EmitCount")))
                    j:Emit(v1 or 1)
                end
            end
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 208
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Coin] = {
    ModelName = "Coin",
    SoundName = "Shell",
    Icon = Icons_2.Coins,
    OnSpawn = function(a1) -- Line: 217
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 219 -- upvalues: a1 (val)
            local v1
            for i, j in a1.model.Center:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    v1 = tonumber((j:GetAttribute("EmitCount")))
                    j:Emit(v1 or 1)
                end
            end
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 228
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.XP] = {
    ModelName = "XP",
    SoundName = "Shell",
    Icon = Icons_2.Experience,
    OnSpawn = function(a1) -- Line: 236
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 238 -- upvalues: a1 (val)
            local v1
            for i, j in a1.model.Center:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    v1 = tonumber((j:GetAttribute("EmitCount")))
                    j:Emit(v1 or 1)
                end
            end
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 247
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Gem] = {
    ModelName = "Gem",
    SoundName = "Shell",
    Icon = Icons_2.Gems,
    OnSpawn = function(a1) -- Line: 255
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 257 -- upvalues: a1 (val)
            local v1
            for i, j in a1.model.Center:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    v1 = tonumber((j:GetAttribute("EmitCount")))
                    j:Emit(v1 or 1)
                end
            end
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 266
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.EnemyLorebook] = {
    ModelName = "Lorebook",
    SoundName = "Shell",
    Height = 1,
    Icon = Icons_2.LogBook,
    OnSpawn = function(a1) -- Line: 275 -- upvalues: Icons (val)
        local v1
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 277 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
        local ImageLabel = a1.model.Icon.SurfaceGui.ImageLabel
        local name = a1.data.name
        local v2 = if not (string.sub(name, #name - 6) == " Legacy") then name else string.sub(name, 1, #name - 7)
        if not v2 then
            v1 = ""
        elseif v2 ~= "" then
            local v3
            local LegacyEnemies = v3 and Icons.LegacyEnemies or Icons.Enemies
            v1 = LegacyEnemies[v2] or "rbxassetid://15913919212"
        else
            v1 = ""
        end
        ImageLabel.Image = v1
    end,
    OnPickup = function(a1) -- Line: 289
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.SnowCharm] = {
    ModelName = "SnowCharm",
    SoundName = "BattlepassDrop",
    Icon = 128884225767916,
    OnSpawn = function(a1) -- Line: 297
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 299 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 303
        a1.model.Trail.Enabled = false
    end,
}
v1[ItemPickupType.Bunz] = {
    ModelName = "Bunz",
    SoundName = "Shell",
    Icon = 86790225450686,
    OnSpawn = function(a1) -- Line: 311
        a1.model.Trail.Enabled = true
        task.delay(1, function() -- Line: 313 -- upvalues: a1 (val)
            a1.model.Trail.Enabled = false
        end)
    end,
    OnPickup = function(a1) -- Line: 317
        a1.model.Trail.Enabled = false
    end,
}
for k, v in pairs(ReplicatedStorage.Assets.ItemPickups.Models:GetChildren()) do
    if v:IsA("BasePart") then
        v.Anchored = true
        v.CanCollide = false
        v.CanTouch = false
        v.CanQuery = false
    end
end
return v1