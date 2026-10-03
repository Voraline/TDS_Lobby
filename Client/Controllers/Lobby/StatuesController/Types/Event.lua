-- Script path: ReplicatedStorage.Client.Controllers.Lobby.StatuesController.Types.Event
-- Decompile time: 3.14 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EventMissionStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.EventMissionStore)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local LocalPlayer = Players.LocalPlayer
local Level = LocalPlayer:WaitForChild("Level")
local u50 = {}
u50.__index = u50

function u50.new(a1) -- Line: 20 -- upvalues: Maid (val), Enum (val), Level (val), u50 (val) -- types: a1: userdata
    local Attribute = a1:GetAttribute("Mode")
    local v1 = a1:GetAttribute("Modes") and string.split(a1:GetAttribute("Modes"), ",") or {}
    local Attribute_3 = a1:GetAttribute("Disabled")
    local Attribute_4 = a1:GetAttribute("DisplayText")
    local v2 = a1:GetAttribute("Challenges") and string.split(a1:GetAttribute("Challenges"), ",") or {}
    local v3 = a1:GetAttribute("GameMode") or "Survival"
    local v4 = a1:GetAttribute("UseMatchmaking") or false
    local Attribute_6 = a1:GetAttribute("LevelLock")
    local Characters = a1:WaitForChild("Characters")
    local Boundary = a1:WaitForChild("Boundary")
    local v5 = {
        Mode = Attribute,
        Modes = v1,
        Disabled = Attribute_3,
        Challenges = v2,
        DisplayText = Attribute_4,
        Maid = Maid.new(),
        UseMatchmaking = v4,
        GameMode = Enum.Gamemode[v3],
        Model = a1,
        LevelLock = Attribute_6,
        _locked = if Attribute_6 then not not (Level.Value < Attribute_6) else false,
        _characters = Characters,
        _boundary = Boundary,
        _level = Attribute_6 or 0,
    }
    local v6 = setmetatable(v5, u50)
    v6:init()
    return v6
end

function u50:Destroy() -- Line: 63
    self.Maid:Sweep()
end

function u50:init() -- Line: 67
    -- upvalues: Create (val), ViewController (val), LocalPlayer (val), EventMissionStore (val), HttpService (val)
    -- upvalues: Level (val)
    local v1 = {
        Name = "Interaction",
        RequiresLineOfSight = false,
        Style = Enum.ProximityPromptStyle.Custom,
        Exclusivity = Enum.ProximityPromptExclusivity.OneGlobally,
    }
    local DisplayText = self.DisplayText or string.format("Play a %s game", self.Model.Name)
    v1.ObjectText = DisplayText
    v1.Enabled = self.Disabled ~= false
    v1.Parent = self.Model
    local u26 = Create("ProximityPrompt", v1)
    local Highlight = self._characters:FindFirstChildOfClass("Highlight")
    local LevelLock = self._boundary:FindFirstChild("LevelLock")
    local BillboardGui = self._boundary:FindFirstChild("BillboardGui")
    if Highlight then
        Highlight.Enabled = self._locked
        self._highlightLocked = Highlight
    end
    if BillboardGui then
        BillboardGui.Enabled = not self._locked
    end
    if LevelLock then
        LevelLock.Enabled = self._locked
        LevelLock.Status.TextLabel.Text = ("Lv. %*"):format(self._level)
    end
    self.Maid:Mark((ViewController:onViewChange(function(a1) -- Line: 96 -- upvalues: u26 (val)
        local v1 = true
        if a1 ~= "Hotbar" then
            v1 = a1 == ""
        end
        u26.Enabled = v1
    end)))
    u26.Triggered:Connect(function(a1) -- Line: 100
        -- upvalues: LocalPlayer (upval), self (val), ViewController (upval), EventMissionStore (upval)
        -- upvalues: HttpService (upval)
        if a1 == LocalPlayer and not self.Disabled then
            local v1 = ViewController:getCurrentView()
            if v1 ~= "Hotbar" and v1 ~= "" then
                return
            end
            EventMissionStore.add({
                id = HttpService:GenerateGUID(),
                modes = if not self.Mode then self.Modes else {self.Mode},
                gameMode = self.GameMode,
                challenges = self.Challenges,
                useMatchmaking = self.UseMatchmaking,
            })
            ViewController:queueView("EventMissions")
            return
        end
    end)
    self.Maid:Mark((Level.Changed:Connect(function(a1) -- Line: 121 -- upvalues: self (val), u26 (val), LevelLock (val), Highlight (val), BillboardGui (val)
        self._locked = a1 < self._level
        local _enabled = self._enabled and not self._locked
        u26.Enabled = _enabled
        if LevelLock then
            LevelLock.Enabled = self._locked
        end
        if Highlight then
            Highlight.Enabled = not self._enabled or self._locked
        end
        if BillboardGui then
            BillboardGui.Enabled = not self._locked
        end
    end)))
    self._prompt = u26
    self.Maid:Mark(function() -- Line: 140 -- upvalues: self (val)
        if self._prompt then
            self._prompt:Destroy()
            self._prompt = nil
        end
    end)
end

return u50