-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PlayerList.init.story
-- Decompile time: 10.48 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Parent = require(script.Parent)
local PlayerListStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.PlayerListStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useEvent = require(ReplicatedStorage.Client.Interfaces.Hooks.useEvent)
local useBinding = React.useBinding
local createElement = React.createElement
local u45 = 0
local u47 = Random.new()
local u48 = {"bark", "referee", "microphone", "conspiracy", "sick", "accurate", "fast", "salmon", "useful", "map"}

local function generateRichText() -- Line: 30 -- upvalues: u47 (val)
    local v1 = {
        "rainbow",
        "binary",
        "champion",
        "glitchy",
        "rich",
        "fallen",
        "polluted",
        "molten",
        "doge",
        "ocean",
        "sour",
        "sparkletime",
    }
    if (u47:NextInteger(1, 3)) < 3 then
        return v1[u47:NextInteger(1, #v1)]
    end
end

local function generateStatus() -- Line: 51 -- upvalues: u47 (val)
    local v1 = {"VIP", "Developer", "Owner"}
    return v1[u47:NextInteger(1, #v1 + 1)]
end

local function generateStats() -- Line: 62 -- upvalues: u47 (val)
    return {
        Triumphs = u47:NextInteger(0, 69),
        Deaths = u47:NextInteger(0, 420),
        Level = u47:NextInteger(0, 256),
    }
end

local function generateMedals() -- Line: 70 -- upvalues: u47 (val)
    return {
        Easy = u47:NextInteger(0, 20),
        Normal = u47:NextInteger(0, 40),
        Insane = u47:NextInteger(0, 60),
    }
end

local function generateTowers() -- Line: 78
    return {"Elf Camp", "Ranger", "Military Base", "Mecha Base", "Scout"}
end

local function generatePlayer() -- Line: 88
    -- upvalues: u48 (val), u47 (val), u45 (ref), generateMedals (val), generateStats (val), generateRichText (val)
    local v1 = u48[u47:NextInteger(1, #u48)] .. u48[u47:NextInteger(1, #u48)]
    u45 = u45 + 1
    local v2 = {
        Map = "Grass Isle",
        Username = v1,
        DisplayName = v1,
        UserId = u45 - 1 + 19004289,
        WinRatio = math.random() + math.random(),
        MapsCleared = math.random(1, 250),
        LoginStreak = math.random(0, 7),
        Medals = generateMedals(),
        Stats = generateStats(),
        Towers = {"Elf Camp", "Ranger", "Military Base", "Mecha Base", "Scout"},
    }
    local v3 = {"VIP", "Developer", "Owner"}
    v2.Status = v3[u47:NextInteger(1, #v3 + 1)]
    v2.Verified = u47:NextInteger(1, 2) == 1
    v2.Tag = generateRichText()
    return v2
end

local function PlayerListPane(a1) -- Line: 110
    -- upvalues: useBinding (val), useEvent (val), UserInputService (val), createElement (val), Parent (val)
    local u3, u4 = useBinding(true)
    local v1, u8 = useBinding(nil)
    local v2 = {u3}
    useEvent(UserInputService.InputBegan, function(a1, a2) -- Line: 114 -- upvalues: u4 (val), u3 (val)
        if not a2 and a1.UserInputType == Enum.UserInputType.Keyboard and a1.KeyCode == Enum.KeyCode.V then
            u4(not u3:getValue())
        end
    end, v2)
    return createElement(Parent, {
        Visible = u3,
        ShowProfile = useBinding(false),
        SetShowProfile = function() end,
        SelectedPlayerId = v1,
        SetSelectedPlayerId = function(a1) -- Line: 131 -- upvalues: u8 (val) -- types: a1: number
            u8(a1)
        end,
    })
end

return function(a1) -- Line: 137
    -- upvalues: createElement (val), PlayerListPane (val), ReactRoblox (val), table (val), generatePlayer (val)
    -- upvalues: PlayerListStore (val), u47 (val)
    local u1 = true
    local v1 = createElement(PlayerListPane, {})
    local u9 = ReactRoblox.createRoot(a1)
    local u10 = {}
    for i = 1, 45 do
        table.insert(u10, (generatePlayer()))
    end
    table.sort(u10, function(a1, a2) -- Line: 147
        if a1.Stats.Level == a2.Stats.Level then
            return a1.Username < a2.Username
        end
        return a2.Stats.Level < a1.Stats.Level
    end)
    PlayerListStore.setPlayers(u10)
    local u44 = task.spawn(function() -- Line: 159
        -- upvalues: u1 (ref), u47 (upval), u10 (val), table (upval), generatePlayer (upval), PlayerListStore (upval)
        while u1 do
            task.wait(u47:NextNumber(0.01, 0.05))
            if u47:NextInteger(1, 2) ~= 1 or not (#u10 > 5) then
                table.insert(u10, (generatePlayer()))
                table.sort(u10, function(a1, a2) -- Line: 167
                    if a1.Stats.Level == a2.Stats.Level then
                        return a1.Username < a2.Username
                    end
                    return a2.Stats.Level < a1.Stats.Level
                end)
            else
                table.remove(u10, u47:NextInteger(1, #u10))
            end
            PlayerListStore.setPlayers(u10)
        end
    end)
    u9:render(v1)
    return function() -- Line: 183 -- upvalues: u44 (ref), u1 (ref), u9 (val)
        if u44 then
            task.cancel(u44)
            u44 = nil
        end
        u1 = false
        u9:unmount()
    end
end