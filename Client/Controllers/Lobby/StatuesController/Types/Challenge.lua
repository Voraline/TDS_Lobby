-- Script path: ReplicatedStorage.Client.Controllers.Lobby.StatuesController.Types.Challenge
-- Decompile time: 4.40 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local LocalPlayer = Players.LocalPlayer
local Level = LocalPlayer:WaitForChild("Level")
local u33 = {}
u33.__index = u33

function u33.new(a1) -- Line: 15 -- upvalues: Maid (val), u33 (val) -- types: a1: userdata
    local Attribute = a1:GetAttribute("DisplayText")
    local Attribute_2 = a1:GetAttribute("LevelLock")
    local Character = a1:WaitForChild("Character")
    local Boundary = a1:WaitForChild("Boundary")
    local v1 = {
        Maid = Maid.new(),
        DisplayText = Attribute,
        Model = a1,
        _character = Character,
        _boundary = Boundary,
        _level = Attribute_2 or 0,
    }
    local v2 = setmetatable(v1, u33)
    v2:init()
    return v2
end

function u33:Destroy() -- Line: 37
    self.Maid:Sweep()
end

function u33:init() -- Line: 41 -- upvalues: Create (val), Level (val), ViewController (val), LocalPlayer (val)
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
    self._locked = Level.Value < self._level
    local Highlight = self._character:FindFirstChildOfClass("Highlight")
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
    self.Maid:Mark((ViewController:onViewChange(function(a1) -- Line: 72 -- upvalues: u26 (val), self (val)
        local v1
        if a1 == "Hotbar" then
            v1 = not self._locked
        else
            v1 = false
            if a1 == "" then
                v1 = not self._locked
            end
        end
        u26.Enabled = v1
    end)))
    u26.Triggered:Connect(function(a1) -- Line: 76 -- upvalues: LocalPlayer (upval), self (val), ViewController (upval)
        if a1 == LocalPlayer and not self.Disabled and not self._locked then
            local v1 = ViewController:getCurrentView()
            if v1 ~= "Hotbar" and v1 ~= "" then
                return
            end
            ViewController:setView("ChallengeMaps")
            return
        end
    end)
    self.Maid:Mark((Level.Changed:Connect(function(a1) -- Line: 89 -- upvalues: self (val), u26 (val), LevelLock (val), Highlight (val), BillboardGui (val)
        self._locked = a1 < self._level
        u26.Enabled = not self._locked
        if LevelLock then
            LevelLock.Enabled = self._locked
        end
        if Highlight then
            Highlight.Enabled = self._locked
        end
        if BillboardGui then
            BillboardGui.Enabled = not self._locked
        end
    end)))
    self._prompt = u26
    self.Maid:Mark(function() -- Line: 108 -- upvalues: self (val)
        if self._prompt then
            self._prompt:Destroy()
            self._prompt = nil
        end
    end)
end

return u33