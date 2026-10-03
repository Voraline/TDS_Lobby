-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.MatchmakingController.Statue
-- Decompile time: 16.56 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Maps = require(ReplicatedStorage.Shared.Modules.Content)("Maps")
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local MatchmakingStore = require(ReplicatedStorage.Client.Interfaces.Stores.Lobby.MatchmakingStore)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local Charm = require(ReplicatedStorage.Packages.Charm)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Emitter = require(ReplicatedStorage.Shared.Modules.Emitter)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MapRotationController = require(ReplicatedStorage.Client.Controllers.Lobby.MapRotationController)
local LocalPlayer = Players.LocalPlayer
local Level = LocalPlayer:WaitForChild("Level")
local u95 = FFlagController.get("event.impossibleActive", false)
local u96 = {
    sandbox = "Sandbox",
    survival = "Survival",
    hardcore = "Hardcore",
    pvp = "PVP",
    halloween_live_event2025 = "halloween_live_event2025",
    halloween_act_1 = "HalloweenNight1",
    halloween_act_2 = "HalloweenNight2",
    halloween_act_3 = "HalloweenNight3",
    christmas2025 = "Christmas 2025",
    adidas_map_1 = "Map1Adidas",
    adidas_map_2 = "Map2Adidas",
    adidas_map_3 = "Map3Adidas",
}
local u97 = {}
u97.PVP_lowRanks = Color3.new(0.368627, 1, 0)
u97.PVP_midRanks = Color3.new(1, 0.482353, 0)
u97.PVP_highRanks = Color3.new(1, 0.14902, 0)
local u113 = {
    Act1Easy = "Easy",
    Act2Easy = "Easy",
    Act3Easy = "Easy",
    Act1 = "Hard",
    Act2 = "Hard",
    Act3 = "Hard",
    PlsDonate = "Easy",
    PlsDonateHard = "Hard",
    PVP_lowRanks = "Easy",
    PVP_midRanks = "Medium",
    PVP_highRanks = "Hard",
    SummerEasy = "Easy",
    SummerMedium = "Medium",
    SummerHard = "Hard",
    SummerExperimental = "Experimental",
}
local u129 = {
    badlands = 25,
    polluted = 25,
    halloween = 25,
    hardcore = 50,
    sandbox = 250,
    act1 = 5,
    act2 = 5,
    act3 = 5,
}
local u138 = {}

function u138.__index(a1, a2) -- Line: 92 -- upvalues: Emitter (val), u138 (val)
    return Emitter[a2] or u138[a2]
end

function u138.new(a1, a2) -- Line: 96
    -- upvalues: Cache (val), u95 (val), FFlagController (val), Maid (val), u129 (val), Level (val), u138 (val)
    local u42
    local Characters = a1:FindFirstChild("Characters") or a1:WaitForChild("Character")
    local Boundary = a1:WaitForChild("Boundary")
    local Attribute = a1:GetAttribute("Mode")
    local Attribute_2 = a1:GetAttribute("Challenge")
    local Attribute_3 = a1:GetAttribute("Night")
    local Attribute_4 = a1:GetAttribute("Disabled")
    if not a1:GetAttribute("Difficulties") then
        u42 = {}
    else
        u42 = string.split(a1:GetAttribute("Difficulties"), ",")
        if not u42 then
            u42 = {}
        end
    end
    if Attribute == "hunt_2025" then
        local Flags = Cache("Flags")
        local u53 = Flags:Get():expect()
        if u53 and u53.Hunt2025 and not table.find(u42, "Mega") then
            table.insert(u42, "Mega")
        end
        Flags.Updated:Connect(function() -- Line: 118 -- upvalues: u53 (ref), Flags (val), u42 (val)
            u53 = Flags:Get():expect()
            if u53 and u53.Hunt2025 then
                if table.find(u42, "Mega") then
                    return
                end
                table.insert(u42, "Mega")
                return
            end
            local v1 = table.find(u42, "Mega")
            if v1 then
                table.remove(u42, v1)
            end
        end)
        if u95() and not table.find(u42, "Impossible") then
            table.insert(u42, "Impossible")
        end
        FFlagController.Updated:Connect(function() -- Line: 141 -- upvalues: u95 (upval), u42 (val)
            if u95() then
                if table.find(u42, "Impossible") then
                    return
                end
                table.insert(u42, "Impossible")
                return
            end
            local v1 = table.find(u42, "Impossible")
            if v1 then
                table.remove(u42, v1)
            end
        end)
    end
    assert(Attribute, "Statue must have matchmaking mode")
    assert(not Attribute_3 or type(Attribute_3) == "number", "Statue night must be a number")
    local v1 = Maid.new()
    local v2 = u129[Attribute] or 0
    local v3 = Level.Value < v2
    local v4 = {
        _shown = false,
        Events = {},
        _enabled = a1:GetAttribute("Enabled") ~= false,
        _showNewMenu = a1:GetAttribute("ShowNewMenu") ~= false,
        _disabled = Attribute_4,
        _noMatchmaking = Attribute == "sandbox",
        _emitter = a2,
        _locked = v3,
        _level = v2,
        _mode = Attribute,
        _challenge = Attribute_2,
        _night = Attribute_3,
        _difficulties = u42,
        _christmas = a1:HasTag("CHRISTMAS_STATUE"),
        _character = Characters,
        _boundary = Boundary,
        _statue = a1,
        _maid = v1,
    }
    local u238 = setmetatable(v4, u138)
    u238:init()
    u238:On("show_prompt", function(a1) -- Line: 192 -- upvalues: u238 (val)
        if u238._locked then
            return
        end
        if u238._enabled then
            u238:SetShown(a1)
            return
        end
        u238:SetShown(false)
    end)
    u238._maid:Mark(((a1:GetAttributeChangedSignal("Enabled")):Connect(function() -- Line: 204 -- upvalues: u238 (val), a1 (val)
        u238:SetEnabled(a1:GetAttribute("Enabled") == true)
    end)))
    return u238
end

function u138:init() -- Line: 212
    -- upvalues: RunService (val), Create (val), Maps (val), Charm (val), MapRotationController (val), LocalPlayer (val)
    -- upvalues: Level (val), Notification (val), MatchmakingStore (val), ViewController (val), u96 (val), u113 (val)
    -- upvalues: u97 (val)
    if not RunService:IsRunning() then
        return
    end
    local _statue = self._statue
    local _maid = self._maid
    local v1 = {
        Name = "Interaction",
        RequiresLineOfSight = false,
        Style = Enum.ProximityPromptStyle.Custom,
    }
    v1.Exclusivity = if _statue:HasTag("NIGHT_STATUE") then Enum.ProximityPromptExclusivity.OneGlobally or _statue:GetAttribute("Exclusivity") and Enum.ProximityPromptExclusivity[_statue:GetAttribute("Exclusivity")] or Enum.ProximityPromptExclusivity.AlwaysShow else _statue:HasTag("CHRISTMAS_STATUE") and Enum.ProximityPromptExclusivity.OneGlobally or _statue:GetAttribute("Exclusivity") and Enum.ProximityPromptExclusivity[_statue:GetAttribute("Exclusivity")] or Enum.ProximityPromptExclusivity.AlwaysShow
    local Attribute = self._statue:GetAttribute("DisplayText") or string.format("Play a %s game", _statue.Name)
    v1.ObjectText = Attribute
    local _enabled = self._enabled and not self._locked
    v1.Enabled = _enabled
    v1.MaxActivationDistance = self._statue:GetAttribute("Range") or 10
    v1.Parent = self._boundary
    local u81 = Create("ProximityPrompt", v1)
    u81:SetAttribute("BaseText", u81.ObjectText)
    local v2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad)
    local Highlight_2 = Instance.new("Highlight")
    Highlight_2.DepthMode = Enum.HighlightDepthMode.Occluded
    Highlight_2.FillTransparency = 1
    Highlight_2.OutlineTransparency = 1
    Highlight_2.Enabled = false
    Highlight_2.Parent = _statue
    local Maps_2 = _statue:FindFirstChild("Maps", true)
    local MapReset = _statue:FindFirstChild("MapReset", true)
    if Maps_2 then
        local u110 = {}
        for i, v in ipairs(Maps_2:GetChildren()) do
            if v:IsA("ImageLabel") then
                table.insert(u110, v)
            end
        end
        local u125 = 0

        local function updateMapResetText() -- Line: 265 -- upvalues: MapReset (val), u125 (ref), MapReset (val)
            if not MapReset then
                return
            end
            local v1 = math.max(u125 - os.time(), 0)
            MapReset.Text = string.format("Maps reset | %02d:%02d:%02d", math.floor(v1 / 3600), math.floor(v1 % 3600 / 60), (math.floor(v1 % 60)))
        end

        _maid:Mark((Charm.listen(MapRotationController.getRotation, function(a1) -- Line: 279 -- upvalues: u125 (ref), updateMapResetText (val), u110 (val), Maps (upval)
            local format, v1, v2, v3
            local maps = a1 and a1.maps or {}
            local currentTime = a1 and a1.currentTime
            local endTime = a1 and a1.endTime
            u125 = if not currentTime then 0 else if not endTime then 0 else os.time() + (endTime.UnixTimestamp - currentTime.UnixTimestamp)
            updateMapResetText()
            for i, v in ipairs(u110) do
                v3 = maps[i]
                v1 = nil
                if v3 then
                    v2 = Maps:FindFirstChild(v3, true)
                    if not v2 then
                        warn("Map asset not found: " .. v3)
                    else
                        v1 = require(v2)
                    end
                end
                v2 = v1 ~= nil
                v.Visible = v2
                format = string.format
                v.Image = format("rbxassetid://%d", v1 and v1.Icon or 0)
            end
        end)))
        if MapReset then
            local u140 = true
            local u144 = task.spawn(function() -- Line: 316 -- upvalues: u140 (ref), _statue (val), updateMapResetText (val)
                while u140 do
                    if not _statue:IsDescendantOf(workspace) then
                        break
                    end
                    updateMapResetText()
                    task.wait(1)
                end
            end)
            _maid:Mark(function() -- Line: 323 -- upvalues: u140 (ref), u144 (val)
                u140 = false
                if coroutine.status(u144) ~= "dead" then
                    task.cancel(u144)
                end
            end)
        end
        self._mapReset = MapReset
        self._maps = Maps_2
    end
    local Highlight = self._character:FindFirstChildOfClass("Highlight")
    local LevelLock = self._boundary:FindFirstChild("LevelLock")
    local BillboardGui = self._boundary:FindFirstChild("BillboardGui")
    if Highlight then
        Highlight.Enabled = not self._enabled or self._locked
        self._highlightLocked = Highlight
    end
    if BillboardGui then
        BillboardGui.Enabled = not self._locked
    end
    if LevelLock then
        LevelLock.Enabled = self._locked
        LevelLock.Status.TextLabel.Text = ("Lv. %*"):format(self._level)
    end
    self._prompt = u81
    self._highlight = Highlight_2
    self._highlightTweenInfo = v2
    self:SetDisabled(self._disabled)
    _maid:Mark(function() -- Line: 359 -- upvalues: self (val)
        if self._highlightTween then
            self._highlightTween:Cancel()
            self._highlightTween = nil
        end
    end)
    _maid:Mark(u81)
    _maid:Mark(Highlight_2)
    if self._mode == "sandbox" then
        _maid:Mark(((LocalPlayer:GetAttributeChangedSignal("SandboxAccess")):Connect(function() -- Line: 369
            -- upvalues: LocalPlayer (upval), self (val), u81 (val), LevelLock (val), Highlight (val)
            -- upvalues: BillboardGui (val)
            if LocalPlayer:GetAttribute("SandboxAccess") then
                self._locked = false
                self._level = 0
                u81.Enabled = true
                if LevelLock then
                    LevelLock.Enabled = false
                end
                if Highlight then
                    Highlight.Enabled = false
                end
                if BillboardGui then
                    BillboardGui.Enabled = true
                end
            end
        end)))
        if LocalPlayer:GetAttribute("SandboxAccess") then
            self._locked = false
            self._level = 0
            u81.Enabled = true
            if LevelLock then
                LevelLock.Enabled = false
            end
            if Highlight then
                Highlight.Enabled = false
            end
            if BillboardGui then
                BillboardGui.Enabled = true
            end
        end
    end
    _maid:Mark((Level.Changed:Connect(function(a1) -- Line: 397 -- upvalues: self (val), u81 (val), LevelLock (val), Highlight (val), BillboardGui (val)
        self._locked = a1 < self._level
        local _enabled = self._enabled and not self._locked
        u81.Enabled = _enabled
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
    _maid:Mark((u81.PromptShown:Connect(function() -- Line: 415 -- upvalues: self (val)
        self:Emit("show_prompt", true)
    end)))
    _maid:Mark((u81.PromptHidden:Connect(function() -- Line: 419 -- upvalues: self (val)
        self:Emit("show_prompt", false)
    end)))
    _maid:Mark((u81.Triggered:Connect(function(a1) -- Line: 423
        -- upvalues: LocalPlayer (upval), self (val), Notification (upval), _statue (val), MatchmakingStore (upval)
        -- upvalues: ViewController (upval), u96 (upval), u113 (upval), u97 (upval)
        if a1 == LocalPlayer and not self._disabled and self._enabled and not self._locked then
            local v1
            local Night = self:GetNight()
            local Nights = LocalPlayer:FindFirstChild("Nights")
            if Night and Nights and Nights:GetAttribute("Adidas2026") < Night then
                Notification.Create({
                    Text = "You have not unlocked this map yet!",
                    Color = Color3.fromRGB(236, 0, 0),
                })
                return
            end
            if self._showNewMenu and _statue:GetAttribute("DirectMatchmaking") == true then
                MatchmakingStore.setDirectStatue(_statue)
                ViewController:setView("PromptMatchmaking")
                return
            end
            local v2 = u96[self._mode]
            if v2 and self._showNewMenu then
                v1 = if v2 == "Survival" then "Difficulty" else if v2 == "PVP" then "Difficulty" else if not self._statue:GetAttribute("ShowDifficulty") then "Player" else "Difficulty"
                if self._statue.Name == "SpecialGamemodes" then
                    v2 = "Special Modes"
                    v1 = "Difficulty"
                end
                if ViewController:getCurrentView() == "PromptMatchmaking" then
                    return
                end
                ;(ViewController:getEmitter("MatchmakingPrompt")):Emit("Show", v2, nil, v1)
                return
            end
            if not self._noMatchmaking then
                if not next(self._difficulties) then
                    self:Emit("triggered", self:GetMode(), self:GetNight(), self:GetChristmas(), nil, (self:GetChallenge()))
                else
                    local v3, v4
                    v1 = {}
                    ViewController:setView("Matchmaking")
                    for i, v in ipairs(self._difficulties) do
                        v3 = {Text = u113[v] or v}
                        v4 = u97[v] or Color3.new(0, 0.749019, 1)
                        v3.Color = v4

                        function v3.Clicked() -- Line: 486 -- upvalues: ViewController (upval), self (upval), v (val)
                            ViewController:closePrompt()
                            self:Emit("triggered", self:GetMode(), self:GetNight(), self:GetChristmas(), v, (self:GetChallenge()))
                        end

                        table.insert(v1, v3)
                    end
                    table.insert(v1, {
                        Text = "Cancel",
                        Clicked = function() -- Line: 503 -- upvalues: ViewController (upval)
                            ViewController:setView("Hotbar")
                            ViewController:closePrompt()
                        end,
                    })
                    ViewController:prompt({
                        Override = true,
                        Subject = "Select Difficulty",
                        Description = "Choose a difficulty to play on",
                        Icon = "rbxassetid://10777737541",
                        Buttons = v1,
                    })
                end
            end
            if not self._noMatchmaking then
                return
            end
            self._emitter:Emit("manualMatch", (self:GetMode()))
            return
        end
    end)))
end

function u138.Destroy(a1) -- Line: 535
    a1._maid:Sweep()
    table.clear(a1)
    setmetatable(a1, nil)
end

function u138:GetMode() -- Line: 542
    return self._mode
end

function u138:GetNight() -- Line: 546
    return self._night
end

function u138:GetChristmas() -- Line: 550
    return self._christmas
end

function u138:GetChallenge() -- Line: 554
    return self._challenge
end

function u138:SetShown(a2) -- Line: 558 -- upvalues: TweenService (val)
    if self._shown == a2 then
        return
    end
    self._shown = a2
    if self._highlightTween then
        self._highlightTween:Cancel()
    end
    self._highlightTween = TweenService:Create(self._highlight, self._highlightTweenInfo, {
        FillTransparency = if not a2 then 1 else 0.4,
        OutlineTransparency = if not a2 then 1 else 0,
    })
    self._highlightTween:Play()
end

function u138:SetDisabled(a2) -- Line: 576
    local v1 = if not a2 then Color3.new(1, 1, 1) else Color3.new(1, 0, 0)
    self._disabled = a2
    self._highlight.OutlineColor = v1
    self._highlight.FillColor = v1
    self._prompt.ObjectText = if not a2 then "" .. self._prompt:GetAttribute("BaseText") else "[DISABLED] "
end

function u138:SetEnabled(a2) -- Line: 588
    self._enabled = a2
    local _prompt = self._prompt
    local _enabled = self._enabled and not self._locked
    _prompt.Enabled = _enabled
    if not self._enabled then
        self:SetShown(false)
    end
    if self._highlightLocked then
        self._highlightLocked.Enabled = not self._enabled or self._locked
    end
end

return u138