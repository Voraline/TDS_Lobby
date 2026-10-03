-- Script path: ReplicatedStorage.Client.Modules.LobbyBoard
-- Decompile time: 6.43 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MapRewardPreview = require(ReplicatedStorage.Client.Modules.MapRewardPreview)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local u47 = {}
u47.__index = u47
local u48 = {
    [Enum.Difficulty.VeryEasy] = 0,
    [Enum.Difficulty.Easy] = 1,
    [Enum.Difficulty.Medium] = 2,
    [Enum.Difficulty.Normal] = 2,
    [Enum.Difficulty.Hard] = 3,
    [Enum.Difficulty.Insane] = 4,
}
local u67 = {}
u67[Enum.Difficulty.VeryEasy] = (Color3.fromRGB(255, 224, 87))
u67[Enum.Difficulty.Easy] = (Color3.fromRGB(0, 255, 127))
u67[Enum.Difficulty.Medium] = (Color3.fromRGB(0, 170, 255))
u67[Enum.Difficulty.Normal] = (Color3.fromRGB(0, 170, 255))
u67[Enum.Difficulty.Hard] = (Color3.fromRGB(255, 56, 56))
u67[Enum.Difficulty.Insane] = (Color3.fromRGB(170, 0, 255))
local u110 = {Coins = Icons.Coins, Gems = Icons.Gems, Experience = Icons.Experience}

local function setRewardRow(a1, a2, a3) -- Line: 51
    -- upvalues: MapRewardPreview (val), u110 (val)
    if not a1 then
        return false
    end
    if a1:IsA("GuiObject") then
        a1.Visible = a3 ~= nil
    end
    if not a3 then
        return false
    end
    local TextLabel = a1:FindFirstChild("TextLabel", true)
    if TextLabel and TextLabel:IsA("TextLabel") then
        TextLabel.Text = MapRewardPreview.FormatRange(a3)
    end
    local ImageLabel = a1:FindFirstChildWhichIsA("ImageLabel", true)
    local v1 = u110[a2]
    if ImageLabel and v1 then
        ImageLabel.Image = v1
    end
    return true
end

local function prepareRewardDisplay(a1) -- Line: 78 -- types: a1: userdata
    local v1
    a1.Position = UDim2.new(0.5, 0, 0, 64)
    a1.ZIndex = 4
    for i, j in a1:GetDescendants() do
        if j:IsA("GuiObject") then
            v1 = if j.Name ~= "DropShadow" then 5 else 3
            j.ZIndex = v1
        end
    end
end

local function getDifficultyValue() -- Line: 93 -- upvalues: ReplicatedStorage (val)
    local State = ReplicatedStorage:FindFirstChild("State")
    local Difficulty = State and State:FindFirstChild("Difficulty")
    if Difficulty and Difficulty:IsA("StringValue") then
        return Difficulty
    end
    return nil
end

function u47.new(a1, a2) -- Line: 104
    -- upvalues: Maid (val), u47 (val), prepareRewardDisplay (val), Players (val), FFlagController (val)
    -- upvalues: ReplicatedStorage (val)
    local Hitboxes = a1:WaitForChild("Hitboxes")
    local v1 = {
        _maid = Maid.new(),
        _voteMaids = {},
        _topUI = (Hitboxes:WaitForChild("Top")):WaitForChild("MapIcon"),
        _bottomUI = (Hitboxes:WaitForChild("Bottom")):WaitForChild("MapDisplay"),
        _countUI = (Hitboxes:WaitForChild("Count")):WaitForChild("Counter"),
        _promptCallbacks = {},
        _mapChangeCallbacks = {},
        _clearVotesCallbacks = {},
        num = a2,
        model = a1,
    }
    local u40 = setmetatable(v1, u47)
    a1.Destroying:Connect(function() -- Line: 121 -- upvalues: u40 (val)
        u40:Destroy()
    end)
    local Attachment = Instance.new("Attachment")
    Attachment.Position = Vector3.new(0, 5, 0)
    Attachment.Parent = Hitboxes:WaitForChild("VotePlatform")
    local ProximityPrompt = Instance.new("ProximityPrompt")
    ProximityPrompt.RequiresLineOfSight = false
    ProximityPrompt.MaxActivationDistance = 10
    ProximityPrompt.HoldDuration = 0.1
    ProximityPrompt.ObjectText = "Vote"
    ProximityPrompt.Style = Enum.ProximityPromptStyle.Custom
    ProximityPrompt.Parent = Attachment
    u40.Prompt = ProximityPrompt
    u40._maid:Mark(ProximityPrompt)
    local Reward = u40._topUI:FindFirstChild("Reward")
    if Reward and Reward:IsA("GuiObject") then
        prepareRewardDisplay(Reward)
        Reward.Visible = false
    end
    ProximityPrompt.Triggered:Connect(function(a1) -- Line: 146 -- upvalues: Players (upval), u40 (val)
        if a1 ~= Players.LocalPlayer then
            return
        end
        for i, j in u40._promptCallbacks do
            j(u40.name, a1)
        end
    end)
    u40:SetMap((workspace:GetAttribute("Map" .. a2)))
    u40._maid:Mark(((workspace:GetAttributeChangedSignal("Map" .. a2)):Connect(function() -- Line: 159 -- upvalues: a2 (val), u40 (val)
        u40:SetMap((workspace:GetAttribute("Map" .. a2)))
    end)))
    u40._maid:Mark(((workspace:GetAttributeChangedSignal("GameMode")):Connect(function() -- Line: 163 -- upvalues: u40 (val)
        if u40._mapDifficulty then
            u40:_UpdateRewardDisplay(u40._mapDifficulty)
        end
    end)))
    u40._maid:Mark((FFlagController.Updated:Connect(function() -- Line: 168 -- upvalues: u40 (val)
        if u40._mapDifficulty then
            u40:_UpdateRewardDisplay(u40._mapDifficulty)
        end
    end)))
    local State = ReplicatedStorage:FindFirstChild("State")
    local Difficulty = State and State:FindFirstChild("Difficulty")
    local v2 = if not Difficulty then nil else if not Difficulty:IsA("StringValue") then nil else Difficulty
    if v2 then
        u40._maid:Mark((v2.Changed:Connect(function() -- Line: 176 -- upvalues: u40 (val)
            if u40._mapDifficulty then
                u40:_UpdateRewardDisplay(u40._mapDifficulty)
            end
        end)))
    end
    return u40
end

function u47:_UpdateRewardDisplay(a2) -- Line: 186
    -- upvalues: prepareRewardDisplay (val), MapRewardPreview (val), setRewardRow (val)
    local Reward = self._topUI:FindFirstChild("Reward")
    if Reward and Reward:IsA("GuiObject") then
        prepareRewardDisplay(Reward)
        local v1 = MapRewardPreview.GetModeRewards(a2)
        if not v1 then
            Reward.Visible = false
            return
        end
        local v2 = setRewardRow(Reward:FindFirstChild("Currency"), v1.CurrencyLabel, v1.Currency)
        local v3 = setRewardRow(Reward:FindFirstChild("Experience"), "Experience", v1.Experience)
        Reward.Visible = v2 or v3
        return
    end
end

function u47:SetMap(a2, a3) -- Line: 210
    -- upvalues: Asset (val), u48 (val), u67 (val), Promise (val), Players (val)
    local v1
    local v2 = Asset("NewMaps", a2)
    self._mapDifficulty = v2.Difficulty
    self._bottomUI.Title.Text = v2.DisplayName or a2
    local v3, v4 = self, a2
    for i, j in self._bottomUI.Rating:GetChildren() do
        if j:IsA("ImageLabel") then
            v1 = (tonumber(j.Name)) <= u48[v2.Difficulty]
            j.Visible = v1
        end
    end
    v3._topUI.Icon.Image = "rbxassetid://" .. v2.ImageID
    v3._topUI.Icon.UIStroke.Color = u67[v2.Difficulty]
    for k, n in v3._mapChangeCallbacks do
        n(v4, v3.name)
    end
    v3._topUI.Creator.Visible = false
    v3:_UpdateRewardDisplay(v2.Difficulty)
    if v2.Creator then
        local u106 = ""
        for m, i5 in v2.Creator do
            ((Promise.new(function(a1) -- Line: 239 -- upvalues: Players (upval), i5 (val)
                a1((Players:GetNameFromUserIdAsync(i5)))
            end)):andThen(function(a1) -- Line: 244 -- upvalues: u106 (ref) -- types: a1: string
                u106 = u106 .. a1
            end)):catch(function() -- Line: 247 -- upvalues: u106 (ref), i5 (val)
                u106 = u106 .. "Player#" .. i5
            end):await()
            if m == #v2.Creator - 1 then
                u106 = u106 .. " & "
            elseif m ~= #v2.Creator then
                u106 = u106 .. ", "
            end
        end
        v3._topUI.Creator.Text = "Created by " .. u106
        v3._topUI.Creator.Visible = true
    end
    v3.name = v4
    if player then
        v3._topUI.Voter.Text = "🗳️ Voted By: " .. player.Name
    end
    v3._topUI.Voter.Visible = player ~= nil
end

function u47.RemoveVote(a1, a2) -- Line: 272 -- types: a1: table, a2: userdata
    if a1._voteMaids[a2] then
        a1._voteMaids[a2]:Sweep()
    end
end

function u47.ClearVotes(a1) -- Line: 278
    local v1 = nil
    local v2 = nil
    local v3 = a1
    for i, j in a1._voteMaids, v1, v2 do
        j:Sweep()
        for k, n in v3._clearVotesCallbacks do
            n(i)
        end
    end
    table.clear(v3._voteMaids)
end

function u47.AddVote(a1, a2) -- Line: 290 -- upvalues: Maid (val) -- types: a1: table, a2: userdata
    if a1._voteMaids[a2] then
        a1._voteMaids[a2]:Sweep()
        return
    end
    a1._voteMaids[a2] = (Maid.new())
end

function u47.BindPromptTrigger(a1, a2) -- Line: 298 -- types: a1: table, a2: function
    table.insert(a1._promptCallbacks, a2)
end

function u47.BindToDestroy(a1, a2) -- Line: 302 -- types: a1: table, a2: function
    a1._maid:Mark(a2)
end

function u47.BindSetMapChange(a1, a2) -- Line: 306 -- types: a1: table, a2: function
    table.insert(a1._mapChangeCallbacks, a2)
end

function u47.BindClearVotes(a1, a2) -- Line: 310 -- types: a1: table, a2: function
    table.insert(a1._clearVotesCallbacks, a2)
end

function u47:Destroy() -- Line: 314
    if self._maid then
        self._maid:Sweep()
        self._maid = nil
    end
end

return u47