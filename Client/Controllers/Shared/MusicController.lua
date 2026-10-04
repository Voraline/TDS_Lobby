-- Script path: ReplicatedStorage.Client.Controllers.Shared.MusicController
-- Decompile time: 19.28 ms

local CollectionService = game:GetService("CollectionService")
local ContentProvider = game:GetService("ContentProvider")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MusicTracks = require(ReplicatedStorage.Shared.Data.MusicTracks)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Game = SettingsController.Game
local u61 = workspace:WaitForChild("Type").Value == "Game"
local u65 = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
local u66 = {Stopped = 0, PlayingIntro = 1, PlayingBackground = 2}
local u67 = {}
local u68 = nil
local u69 = {Disabled = false, Tracks = MusicTracks, dJVolume = 0}
u69.__index = u69

local function canInteractWithController(a1) -- Line: 35 -- upvalues: u67 (val)
    for i, j in u67 do
        if j == a1 then
            return true
        end
        if 0 < j._playing then
            return false
        end
    end
    return false
end

local function toggleNextPlayer(a1, a2) -- Line: 47 -- upvalues: u67 (val) -- types: a2: boolean?
    local v1 = table.find(u67, a1)
    if not v1 then
        return
    end
    local v2 = nil
    local v3 = v1 + 1
    local v4 = #u67
    for i = v3, v4 do
        v2 = u67[i]
        if v2 and not (v2._playing < 1) then
            if a2 then
                v2:Pause()
                continue
            end
            if v2 then
                break
            end
            continue
        end
        v2 = nil
    end
    if v2 and not a2 then
        v2:Resume(true)
    end
end

function u69.init() -- Line: 75
    -- upvalues: u69 (val), CollectionService (val), SoundService (val), u61 (val), u68 (ref), ReplicatedStorage (val)
    -- upvalues: Game (val)
    u69.Global = u69.CreateController("Global", nil, "Music")
    local Music = workspace:WaitForChild("Music")
    ;(CollectionService:GetInstanceAddedSignal("AmbienceSound")):Connect(function(a1) -- Line: 80 -- upvalues: SoundService (upval) -- types: a1: userdata
        a1.SoundGroup = SoundService:WaitForChild("Ambience")
    end)
    ;(CollectionService:GetInstanceAddedSignal("Dialog")):Connect(function(a1) -- Line: 84 -- upvalues: SoundService (upval) -- types: a1: userdata
        a1.SoundGroup = SoundService:WaitForChild("Yapping")
    end)
    task.spawn(function() -- Line: 88 -- upvalues: CollectionService (upval), SoundService (upval)
        for i, j in CollectionService:GetTagged("AmbienceSound") do
            j.SoundGroup = SoundService:WaitForChild("Ambience")
        end
        for k, n in CollectionService:GetTagged("Dialog") do
            n.SoundGroup = SoundService:WaitForChild("Yapping")
        end
    end)
    if u61 then
        u68 = require(ReplicatedStorage.Shared.Modules.GameRules)
        ;(u68.GetRuleChangedEvent("MusicEnabled")):Connect(function(a1) -- Line: 101 -- upvalues: u69 (upval), Music (val)
            if a1 then
                u69.Global:Play(Music.Value)
                return
            end
            u69.Global:Stop()
        end)
    end
    Music.Changed:Connect(function() -- Line: 110 -- upvalues: u69 (upval), Music (val)
        u69.Global:Play(Music.Value)
    end)
    task.spawn(function() -- Line: 114 -- upvalues: u69 (upval), Music (val)
        u69.Global:Play(Music.Value)
    end)
    u69.GroupAudios = {}
    for i, j in {
        Music = SoundService:WaitForChild("Music"),
        Towers = SoundService:WaitForChild("Towers"),
        Emotes = SoundService:WaitForChild("Emotes"),
        Ambience = SoundService:WaitForChild("Ambience"),
        Communication = SoundService:WaitForChild("Communication"),
        DJ = SoundService:WaitForChild("DJ"),
        Stickers = SoundService:WaitForChild("Stickers"),
        Cutscene = SoundService:WaitForChild("Cutscene"),
        Enemies = SoundService:WaitForChild("Enemies"),
        Yapping = SoundService:WaitForChild("Yapping"),
    } do
        j.Volume = Game:Get(i) or 1
        u69.GroupAudios[j] = j.Volume
        Game:On(i, function(a1) -- Line: 138 -- upvalues: j (val), u69 (upval)
            j.Volume = a1 or 1
            u69.GroupAudios[j] = a1 or 1
        end)
    end
end

function u69.CreateController(a1, a2, a3) -- Line: 145
    -- upvalues: u67 (val), SoundService (val), Maid (val), Sound (val), u69 (val)
    local v1 = a2 or 1
    for i, j in u67 do
        if j.Name == a1 then
            return j
        end
    end
    local v2 = nil
    if a3 then
        v2 = SoundService:WaitForChild(a3)
    end
    local v3 = {
        Track = "",
        Paused = false,
        _playing = 0,
        Name = a1,
        Priority = v1,
        _maid = Maid.new(),
        _introSound = Sound(("Controller %* Intro"):format(a1), {Properties = {Volume = 0.6, Looped = false, SoundGroup = v2}}).Sound,
        _backgroundSound = Sound(("Controller %* Background"):format(a1), {Properties = {Volume = 0.6, Looped = true, SoundGroup = v2}}).Sound,
    }
    local u53 = setmetatable(v3, u69)
    u53._introSound.Ended:Connect(function() -- Line: 185 -- upvalues: u53 (val)
        if not u53.Paused then
            u53._backgroundSound:Play()
        end
    end)
    table.insert(u67, v1, u53)
    return u53
end

function u69.IsPlaying(a1) -- Line: 195
    return 0 < a1._playing
end

function u69:Pause() -- Line: 199 -- upvalues: TweenService (val), u65 (val)
    self.Paused = true
    local u8 = TweenService:Create(self._introSound, u65, {Volume = 0})
    TweenService:Create(self._backgroundSound, u65, {Volume = 0}):Play()
    u8:Play()
    task.spawn(function() -- Line: 210 -- upvalues: u8 (val), self (val)
        u8.Completed:Wait()
        if not self.Paused then
            return
        end
        self._introSound:Pause()
        self._backgroundSound:Pause()
    end)
end

function u69:Resume(a2) -- Line: 222 -- upvalues: TweenService (val), u65 (val) -- types: self: table, a2: boolean?
    self.Paused = false
    if a2 then
        self._introSound.TimePosition = 0
        self._backgroundSound.TimePosition = 0
        if not self._hasIntro then
            self._backgroundSound:Play()
        else
            self._introSound:Play()
        end
    elseif self._playing ~= 1 then
        self._backgroundSound:Resume()
    else
        self._introSound:Resume()
    end
    TweenService:Create(self._introSound, u65, {Volume = 0.6}):Play()
    TweenService:Create(self._backgroundSound, u65, {Volume = 0.6}):Play()
end

function u69:Play(a2, a3, a4) -- Line: 250
    -- upvalues: u68 (ref), u69 (val), TimescaleUtilities (val), TweenService (val), u67 (val), u66 (val)
    -- upvalues: toggleNextPlayer (val)
    local u22
    if u68 and not u68.Has("MusicEnabled") then
        return
    end
    if u69.Disabled then
        return
    end
    if self._currentThread then
        task.cancel(self._currentThread)
        self._currentThread = nil
    end
    if not a3 then
        u22 = 0
    else
        u22 = tick() + a3
        if not u22 then
            u22 = 0
        end
    end
    self._currentThread = task.spawn(function() -- Line: 266
        -- upvalues: self (val), a2 (val), a4 (val), TimescaleUtilities (upval), TweenService (upval), u69 (upval)
        -- upvalues: u67 (upval), u66 (upval), toggleNextPlayer (upval), u22 (val)
        local _playing, u50, v1
        self._maid:Sweep()
        self:Stop(false)
        if a2 == "" then
            return
        end
        if not a4 then
            TimescaleUtilities.Wait(0.5)
        end
        if self._currentTween then
            self._currentTween:Cancel()
            self._currentTween = nil
        end
        if not a4 then
            self._currentTween = TweenService:Create(self._backgroundSound, TweenInfo.new(0.5), {Volume = 0.6})
            self._currentTween:Play()
        end
        if typeof(a2) ~= "number" then
            u50 = u69.Tracks[a2]
        else
            u50 = {Music = a2}
            if not u50 then
                u50 = u69.Tracks[a2]
            end
        end
        if not u50 then
            warn((("Track \"%*\" is not valid"):format(a2 or "nil")))
            return
        end
        if not u50.Music then
            warn((("Track \"%*\" must have main music loop"):format(a2)))
            return
        end
        self.Track = not (typeof(a2) ~= "string") and a2 or ""
        if u50.Intro then
            self._introSound.SoundId = ("rbxassetid://%*"):format(u50.Intro)
            self._hasIntro = true
        end
        self._backgroundSound.SoundId = ("rbxassetid://%*"):format(u50.Music)
        self._playing = if not u50.Intro then 2 else 1
        for i, j in u67 do
            if j ~= self then
                _playing = j._playing
                if not (u66.Stopped < _playing) then
                    continue
                else
                    v1 = false
                end
            else
                v1 = true
            end
            if v1 then
                toggleNextPlayer(self, true)
                v1 = u22 > 0 and tick() - u22 or 0
                if not u50.Intro then
                    self._backgroundSound:Play()
                    self._backgroundSound.TimePosition = v1
                else
                    self._introSound:Play()
                    self._introSound.TimePosition = v1
                end
            end
            if u50.LoopPoint then
                self._maid:Mark(function() -- Line: 328 -- upvalues: self (upval)
                    self._backgroundSound.PlaybackRegionsEnabled = false
                end)
                self._maid:Mark((task.spawn(function() -- Line: 332 -- upvalues: self (upval), u50 (val)
                    while not self._backgroundSound.IsLoaded do
                        task.wait()
                    end
                    self._backgroundSound.PlaybackRegionsEnabled = true
                    self._backgroundSound.LoopRegion = NumberRange.new(u50.LoopPoint, self._backgroundSound.TimeLength)
                end)))
            end
            return
        end
        v1 = false
        if v1 then
            toggleNextPlayer(self, true)
            v1 = u22 > 0 and tick() - u22 or 0
            if not u50.Intro then
                self._backgroundSound:Play()
                self._backgroundSound.TimePosition = v1
            else
                self._introSound:Play()
                self._introSound.TimePosition = v1
            end
        end
        if u50.LoopPoint then
            self._maid:Mark(function() -- Line: 328 -- upvalues: self (upval)
                self._backgroundSound.PlaybackRegionsEnabled = false
            end)
            self._maid:Mark((task.spawn(function() -- Line: 332 -- upvalues: self (upval), u50 (val)
                while not self._backgroundSound.IsLoaded do
                    task.wait()
                end
                self._backgroundSound.PlaybackRegionsEnabled = true
                self._backgroundSound.LoopRegion = NumberRange.new(u50.LoopPoint, self._backgroundSound.TimeLength)
            end)))
        end
    end)
end

function u69:Stop(a2) -- Line: 344
    -- upvalues: TweenService (val), u67 (val), u66 (val), toggleNextPlayer (val)
    if self._playing == 0 then
        return
    end
    if self._currentThread then
        task.cancel(self._currentThread)
        self._currentThread = nil
    end
    self._playing = 0
    if self._hasIntro then
        self._introSound:Stop()
    end
    if self._currentTween then
        self._currentTween:Cancel()
        self._currentTween = nil
    end
    self._currentTween = TweenService:Create(self._backgroundSound, TweenInfo.new(0.5), {Volume = 0})
    self._currentTween:Play()
    self._currentTween.Completed:Connect(function() -- Line: 387 -- upvalues: self (val)
        if not self._currentTween then
            return
        end
        self._backgroundSound:Stop()
    end)
    if a2 ~= false then
        local v1
        for i, j in u67 do
            if j == self then
                v1 = true
            elseif not (u66.Stopped < j._playing) then
                continue
            else
                v1 = false
            end
            if v1 then
                toggleNextPlayer(self, false)
            end
            return
        end
        if false then
            toggleNextPlayer(self, false)
        end
    end
end

function u69.preloadTrack(a1) -- Line: 401 -- upvalues: MusicTracks (val), ContentProvider (val) -- types: a1: string
    local v1 = MusicTracks[a1]
    if not v1 then
        return
    end
    local Intro = v1.Intro
    local Music = v1.Music
    local u5 = {}
    if Intro then
        local Sound = Instance.new("Sound")
        Sound.SoundId = Music
        table.insert(u5, Sound)
    end
    if Music then
        local Sound_2 = Instance.new("Sound")
        Sound_2.SoundId = Music
        table.insert(u5, Sound_2)
    end
    pcall(function() -- Line: 424 -- upvalues: ContentProvider (upval), u5 (val)
        ContentProvider:PreloadAsync(u5)
    end)
end

u69.init()
return u69