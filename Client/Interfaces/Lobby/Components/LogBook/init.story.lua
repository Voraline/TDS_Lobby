-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.LogBook.init.story
-- Decompile time: 2.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Time = require(ReplicatedStorage.Client.Modules.Time)
local Parent = require(script.Parent)
local NewEnemies = Content("NewEnemies")
local Maps = Content("Maps")
return function(a1) -- Line: 17
    -- upvalues: React (val), NewEnemies (val), Icons (val), Maps (val), Time (val), Parent (val), ReactRoblox (val)
    local v1 = React.createElement(function() -- Line: 18
        -- upvalues: React (upval), NewEnemies (upval), Icons (upval), Maps (upval), Time (upval), Parent (upval)
        local Selection_2, Selection = React.useState("Selection")
        local Enemies, Enemies_2 = React.useState("Enemies")
        local v1, u14 = React.useState(nil)
        local v2, u19 = React.useState(nil)
        local u24 = React.useMemo(function() -- Line: 25 -- upvalues: NewEnemies (upval), Icons (upval)
            local v1, v2
            local v3 = {}
            local v4 = Random.new()
            for i, j in NewEnemies:GetChildren() do
                v2 = {
                    name = j.Name,
                    displayName = j.Name,
                    locked = 0.5 <= (v4:NextNumber()),
                }
                v1 = Icons.Enemies[j.Name] or Icons.LegacyEnemies[j.Name] or "rbxassetid://15913919212"
                v2.icon = v1
                v1 = false
                if Icons.Enemies[j.Name] == nil then
                    v1 = Icons.LegacyEnemies[j.Name] ~= nil
                end
                v2.legacy = v1
                table.insert(v3, v2)
            end
            return v3
        end, {})
        local v3 = React.useMemo(function() -- Line: 45 -- upvalues: Maps (upval), Time (upval)
            local v1, v2, v3, v4, v5
            local v6 = {}
            for i, j in Maps:GetChildren() do
                v2 = if not j:IsA("ModuleScript") then require(j.Data) else require(j)
                v3, v4 = Time(Random.new():NextInteger(0, 3600))
                v5 = {
                    {name = "Wins", value = Random.new():NextInteger(0, 1000)},
                    {name = "Losses", value = Random.new():NextInteger(0, 1000)},
                    {
                        name = "W/L Ratio",
                        value = string.format("%.1f", Random.new():NextNumber(0, 5)),
                    },
                    {name = "Best Time", value = string.format("%02d:%02d", v3, v4)},
                }
                v1 = {
                    {
                        name = "Fallen",
                        maxWave = 40,
                        icon = 18757025100,
                        wave = Random.new():NextInteger(0, 40),
                        color = Color3.fromRGB(244, 117, 255),
                    },
                    {
                        name = "Molten",
                        maxWave = 40,
                        icon = 18757025100,
                        wave = Random.new():NextInteger(0, 40),
                        color = Color3.fromRGB(245, 108, 45),
                    },
                    {
                        name = "Intermediate",
                        maxWave = 40,
                        icon = 18757025100,
                        wave = Random.new():NextInteger(0, 40),
                        color = Color3.fromRGB(0, 100, 8),
                    },
                }
                table.insert(v6, {
                    name = j.Name,
                    icon = v2.ImageID or "rbxassetid://15913919212",
                    difficulty = v2.Difficulty,
                    scores = v5,
                    modes = v1,
                })
            end
            return v6
        end, {})
        local v4 = {u24}
        React.useEffect(function() -- Line: 114 -- upvalues: u24 (val), u14 (val), Selection (val)
            if u24 then
                for i, j in u24 do
                    if j.name == "Nerd Duck" then
                        u14(j)
                        Selection("Information")
                        return
                    end
                end
            end
        end, v4)
        return React.createElement(Parent, {
            page = Selection_2,
            onEnemySelected = function(a1) -- Line: 130 -- upvalues: u14 (val), Selection (val)
                u14(a1)
                Selection("Information")
            end,
            onMapSelected = function(a1) -- Line: 135 -- upvalues: u19 (val), Selection (val)
                u19(a1)
                Selection("Selection")
            end,
            onBack = function() -- Line: 140 -- upvalues: u14 (val), u19 (val), Selection (val)
                u14(nil)
                u19(nil)
                Selection("Selection")
            end,
            onTabSelected = function(a1) -- Line: 147
                -- upvalues: Enemies (val), u14 (val), u19 (val), Selection (val), Enemies_2 (val)
                if a1 == Enemies then
                    return
                end
                u14(nil)
                u19(nil)
                Selection("Selection")
                Enemies_2(a1)
            end,
            tab = Enemies,
            selectedEnemy = v1,
            selectedMap = v2,
            sortedAchievements = {},
            maps = v3,
            enemies = u24,
        })
    end)
    local u8 = ReactRoblox.createRoot(a1)
    u8:render(v1)
    return function() -- Line: 174 -- upvalues: u8 (val)
        u8:unmount()
    end
end