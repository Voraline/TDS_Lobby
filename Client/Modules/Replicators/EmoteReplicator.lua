-- Script path: ReplicatedStorage.Client.Modules.Replicators.EmoteReplicator
-- Decompile time: 182.48 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local u20 = {}
u20.__index = u20

function u20.__tostring(a1) -- Line: 13
    return "EmoteReplicator_" .. a1.Name
end

local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local Emotes = Network.Channel("Emotes")

local function getServerTimeNow() -- Line: 28 -- upvalues: RunService (val)
    if not RunService:IsRunning() then
        return tick()
    end
    return workspace:GetServerTimeNow()
end

local function createInteractionPrompt(a1, a2, a3) -- Line: 36
    -- upvalues: Create (val)
    local v1 = Create("Attachment", {
        Name = "InteractPrompt",
        CFrame = CFrame.new(0, -0.5, 0),
        Parent = a2:FindFirstChild("HumanoidRootPart"),
    })
    local v2 = {RequiresLineOfSight = false, MaxActivationDistance = 10, HoldDuration = 0.1}
    local v3 = false
    if a1:GetAttribute("ShowPrompts") ~= false then
        v3 = a2:GetAttribute("EmoteInteractable") ~= false
    end
    v2.Enabled = v3
    v2.ObjectText = a3 or "Interact"
    v2.Parent = v1
    v2.Style = Enum.ProximityPromptStyle.Custom
    local u38 = Create("ProximityPrompt", v2)
    local u48 = (a1:GetAttributeChangedSignal("ShowPrompts")):Connect(function() -- Line: 57 -- upvalues: u38 (val), a1 (val), a2 (val)
        local v1 = false
        if a1:GetAttribute("ShowPrompts") ~= false then
            v1 = a2:GetAttribute("EmoteInteractable") ~= false
        end
        u38.Enabled = v1
    end)
    local u56 = (a2:GetAttributeChangedSignal("EmoteInteractable")):Connect(function() -- Line: 62 -- upvalues: u38 (val), a1 (val), a2 (val)
        local v1 = false
        if a1:GetAttribute("ShowPrompts") ~= false then
            v1 = a2:GetAttribute("EmoteInteractable") ~= false
        end
        u38.Enabled = v1
    end)
    v1.Destroying:Connect(function() -- Line: 67 -- upvalues: u48 (val), u56 (val)
        u48:Disconnect()
        u56:Disconnect()
    end)
    return v1, u38.Triggered
end

local function updateInstanceValue(a1, a2, a3) -- Line: 75 -- types: a1: userdata, a2: string
    local u3 = a1[a2]
    a1[a2] = a3
    return function() -- Line: 79 -- upvalues: a1 (val), a2 (val), u3 (val)
        a1[a2] = u3
    end
end

local function updateCharacterAccessory(a1, a2, a3) -- Line: 84 -- types: a1: userdata, a2: string, a3: boolean
    local v1 = a1:FindFirstChild(a2)
    if not v1 then
        return
    end
    for i, j in v1:GetChildren() do
        if j:IsA("BasePart") then
            j.Transparency = if not a3 then 1 else 0
        end
    end
end

local function trackSoundSeek(a1, a2, a3) -- Line: 96 -- types: a1: number, a2: userdata, a3: userdata
    a3.Looped = a2.Looped
    if a3.Looped then
        a3.TimePosition = a1 % a2.Length
        a3:Play()
        return true
    end
    if not a3.IsLoaded then
        a3.Loaded:Wait()
    end
    if not (a1 < a3.TimeLength) then
        return false
    end
    a3.TimePosition = a1
    a3:Play()
    return true
end

local function trackSeek(a1, a2, ...) -- Line: 120 -- types: a1: number, a2: userdata
    if a2.Looped then
        a2.TimePosition = a1 % a2.Length
        a2:Play(...)
        return true
    end
    if not (a1 < a2.Length) then
        return false
    end
    a2.TimePosition = a1
    a2:Play(...)
    return true
end

local function trackLoaded(a1, a2) -- Line: 138 -- types: a1: userdata
    local Length
    if a1.Length ~= 0 then
        return true
    end
    local u4 = false
    a2:Mark(function() -- Line: 143 -- upvalues: u4 (ref)
        u4 = true
    end)
    repeat
        Length = a1.Length
        if Length == 0 then
            task.wait()
        end
    until Length ~= 0 or u4
    if u4 then
        return false
    end
    return true
end

local function trackGet(a1, a2) -- Line: 164 -- types: a1: userdata, a2: string
    for i, j in a1:GetPlayingAnimationTracks() do
        if j.Animation.AnimationId == a2 then
            return j
        end
    end
end

local function trackGetOrAwait(a1, a2, a3) -- Line: 172 -- upvalues: Promise (val) -- types: a1: userdata, a2: string
    local u6 = Promise.new(function(a1_2, a2_2, a3) -- Line: 173 -- upvalues: a1 (val), a2 (val)
        local u28, v1
        local v2 = a2
        for i, j in a1:GetPlayingAnimationTracks() do
            if j.Animation.AnimationId == v2 then
                v1 = j
                if v1 then
                    a1_2(v1)
                    return
                end
                u28 = nil
                u28 = a1.AnimationPlayed:Connect(function(a1) -- Line: 181 -- upvalues: a2 (upval), u28 (ref), a1_2 (val)
                    if a1.Animation.AnimationId == a2 then
                        u28:Disconnect()
                        u28 = nil
                        a1_2(a1)
                    end
                end)
                a3(function() -- Line: 189 -- upvalues: u28 (ref)
                    if u28 then
                        u28:Disconnect()
                        u28 = nil
                    end
                end)
                return
            end
        end
        v1 = nil
        if v1 then
            a1_2(v1)
            return
        end
        u28 = nil
        u28 = a1.AnimationPlayed:Connect(function(a1) -- Line: 181 -- upvalues: a2 (upval), u28 (ref), a1_2 (val)
            if a1.Animation.AnimationId == a2 then
                u28:Disconnect()
                u28 = nil
                a1_2(a1)
            end
        end)
        a3(function() -- Line: 189 -- upvalues: u28 (ref)
            if u28 then
                u28:Disconnect()
                u28 = nil
            end
        end)
    end)
    a3:Mark(function() -- Line: 196 -- upvalues: u6 (val)
        u6:cancel()
    end)
    return u6
end

function u20.new(a1, a2) -- Line: 210
    -- upvalues: u20 (val), Asset (val), Signal (val), Maid (val), Players (val)
    local v1 = setmetatable({}, u20)
    local v2 = Asset("NewEmotes", a2)
    if not v2 then
        error((("Emote \"%*\" does not exist!"):format(a2)))
        return
    end
    if not v2.Track then
        error((("Attempting to play animation \"%*\" but animation has no track!"):format(v2.Name)))
        return
    end
    v1.Interacted = Signal.new()
    v1.Playing = nil
    v1.Outro = Maid.new()
    v1.Preview = false
    v1.PlaySoundInPreview = false
    v1.Humanoid = a1.Humanoid
    v1.Player = a1.Player
    v1.Character = a1
    v1.Name = a2
    v1.Local = Players.LocalPlayer.UserId == a1.Player.UserId
    v1.Track = v2.Track
    v1.Sound = v2.Sound
    v1.Looped = v2.Looped == true
    v1.InteractionText = v2.InteractionText
    v1.Interaction = v2.Interaction
    v1.Accessories = v2.Accessories
    v1.WalkSpeed = v2.WalkSpeed or 0
    v1.JumpPower = v2.JumpPower or 0
    v1.Animator = v2.Animator
    v1.Effects = v2.Effects
    v1.Fade = 0.1
    return v1
end

function u20:IsPlaying() -- Line: 255
    return self.Playing ~= nil
end

function u20:Play(a2, a3, a4, a5) -- Line: 259
    -- upvalues: Maid (val), RunService (val), trackLoaded (val), trackSeek (val), trackGetOrAwait (val), Enum (val)
    -- upvalues: createInteractionPrompt (val), SoundService (val), Create (val), trackSoundSeek (val), Signal (val)
    -- upvalues: Emotes (val), TagReplicator (val), updateCharacterAccessory (val)
    local Effects, Emotes_2, Humanoid, Humanoid_2, JumpPower, JumpPower_2, WalkSpeed, WalkSpeed_2, runCallback, u207, u294, u299, u363, u398, u399, u411, u486, u487, v1, v2, v3, v4, v5, v6, v7, v8, v9
    if self:IsPlaying() then
        self:Stop()
    end
    self.Outro:Sweep()
    local u635 = Maid.new()
    self.Outro = u635
    local u637 = Maid.new()
    local u649 = {}
    self.Playing = u637

    local function isPlaying() -- Line: 272 -- upvalues: self (val), u637 (val)
        return self.Playing == u637
    end

    local function stopPlaying() -- Line: 276 -- upvalues: self (val), u637 (val)
        if self.Playing == u637 then
            self:Stop()
        end
    end

    u637:Mark(function() -- Line: 283 -- upvalues: u649 (val)
        for i in u649 do
            if i ~= coroutine.running() then
                pcall(task.cancel, i)
            end
        end
        table.clear(u649)
    end)
    local Player = self.Player
    local Instance = self.Character.Instance
    local Animator = self.Character.Animator
    local v10 = true
    local u733 = nil
    local u736 = math.clamp((if RunService:IsRunning() then workspace:GetServerTimeNow() else tick()) - a2, 0, (1 / 0))
    if not self.Local then
        v2, v3 = trackGetOrAwait(Animator, self.Track.AnimationId, u637):await()
        if v2 and v3 then
            v4 = self.Playing == u637
            if v4 then
                u207 = v3
                if not trackLoaded(u207, u637) then
                    if self.Playing == u637 then
                        self:Stop()
                    end
                    return
                end
                v5, v9, v1 = a3, a4, a2
                if not u207.IsPlaying then
                    if self.Playing == u637 then
                        self:Stop()
                    end
                    return
                end
                if not (self.Playing == u637) then
                    return
                end
                self._track = u207
                Instance:SetAttribute("Emoting", true)
                u637:Mark(function() -- Line: 371 -- upvalues: Instance (val)
                    Instance:SetAttribute("Emoting", nil)
                    Instance:SetAttribute("EmoteInteractable", nil)
                end)
                if not self.Preview and not self.Local then
                    v10 = false
                    if self.Interaction ~= Enum.EmoteInteractType.None then
                        v2, v3 = createInteractionPrompt(Player, Instance, self.InteractionText)
                        v3:Connect(function(a1) -- Line: 382 -- upvalues: Player (val), self (val)
                            if a1.UserId ~= Player.UserId then
                                self.Interacted:Fire(a1)
                            end
                        end)
                        u637:Mark(v2)
                    end
                end
                if not u207.Looped then
                    u637:Mark((u207.Stopped:Connect(stopPlaying)))
                end
                Humanoid = self.Humanoid
                WalkSpeed_2 = self.WalkSpeed
                WalkSpeed = Humanoid.WalkSpeed
                Humanoid.WalkSpeed = WalkSpeed_2
                u294 = "WalkSpeed"
                Humanoid_2 = self.Humanoid
                JumpPower_2 = self.JumpPower
                JumpPower = Humanoid_2.JumpPower
                Humanoid_2.JumpPower = JumpPower_2
                u299 = "JumpPower"
                if #self.Accessories > 0 then
                    u637:Mark((self.Character:AddAccessories(self.Accessories)))
                end
                u637:Mark(function() -- Line: 79 -- upvalues: Humanoid (val), u294 (val), WalkSpeed (val)
                    Humanoid[u294] = WalkSpeed
                end)
                u637:Mark(function() -- Line: 79 -- upvalues: Humanoid_2 (val), u299 (val), JumpPower (val)
                    Humanoid_2[u299] = JumpPower
                end)
                if v10 and self.Sound then
                    if self.Preview and not self.PlaySoundInPreview then
                        if self.Animator then
                            v4 = Signal.new()
                            v6 = Signal.new()
                            u398 = {}
                            u399 = {}
                            self._tracks = u398
                            u637:Mark(function() -- Line: 438 -- upvalues: u399 (val)
                                for i, j in u399 do
                                    if j.Connected then
                                        j:Disconnect()
                                    end
                                end
                                table.clear(u399)
                            end)
                            u637:Mark(function() -- Line: 448 -- upvalues: u398 (val)
                                for i, j in u398 do
                                    if j.IsPlaying then
                                        j:Stop(0)
                                    end
                                end
                                table.clear(u398)
                            end)

                            function runCallback(a1, ...) -- Line: 458
                                -- upvalues: self (val), u637 (val), u649 (val)
                                if a1 and self.Playing == u637 then
                                    local u9 = table.pack(...)
                                    local u10 = nil
                                    u10 = coroutine.create(function() -- Line: 465 -- upvalues: a1 (val), u9 (val), u649 (upval), u10 (ref), self (upval), u637 (upval)
                                        local success, result = xpcall(function() -- Line: 466 -- upvalues: a1 (upval), u9 (upval)
                                            a1(table.unpack(u9, 1, u9.n))
                                        end, debug.traceback)
                                        u649[u10] = nil
                                        if not success then
                                            warn((("Emote \"%*\" failed: %*"):format(self.Name, result)))
                                            if self.Playing == u637 then
                                                self:Stop()
                                            end
                                        end
                                    end)
                                    u649[u10] = true
                                    task.spawn(u10)
                                    return
                                end
                            end

                            u411 = nil
                            v7 = {
                                Replicator = self,
                                TagReplicator = u411,
                                Local = self.Local,
                                Preview = self.Preview,
                                Player = self.Player,
                                Character = self.Character,
                                Name = self.Name,
                                Sound = u733,
                                Looped = u207.Looped,
                                Track = u207,
                                Animator = Animator,
                                TargetUpdated = v4,
                                Target = v5,
                                Maid = u637,
                                OutroMaid = u635,
                                ClientState = v9,
                                ClientStateUpdated = v6,
                                IsPlaying = isPlaying,
                                Delay = function(a1, a2, a3) -- Line: 509
                                    -- upvalues: runCallback (val), self (val), u637 (val)
                                    runCallback(function() -- Line: 510 -- upvalues: a2 (val), self (upval), u637 (upval), a3 (val)
                                        task.wait(a2)
                                        if self.Playing == u637 then
                                            a3()
                                        end
                                    end)
                                end,
                                FinishAfter = function(a1, a2) -- Line: 518 -- upvalues: u635 (val) -- types: a2: number
                                    local u2 = nil
                                    u2 = task.delay(a2, function() -- Line: 520 -- upvalues: u2 (ref), u635 (upval)
                                        u2 = nil
                                        u635:Sweep()
                                    end)
                                    u635:Mark(function() -- Line: 524 -- upvalues: u2 (ref)
                                        if u2 then
                                            task.cancel(u2)
                                            u2 = nil
                                        end
                                    end)
                                end,
                                LoadAnimation = function(a1, a2, a3) -- Line: 532
                                    -- upvalues: u635 (val), u637 (val), Create (upval), Animator (val)
                                    local v1
                                    local v2 = Create("Animation", {AnimationId = a2})
                                    ;(if not a3 then u637 else u635):Mark(v2)
                                    local u19 = Animator:LoadAnimation(v2)
                                    u19.Priority = Enum.AnimationPriority.Action
                                    v1:Mark(function() -- Line: 538 -- upvalues: u19 (val)
                                        u19:Stop(0)
                                        u19:Destroy()
                                    end)
                                    return u19
                                end,
                                ReplicateAction = function(a1, a2, ...) -- Line: 545 -- upvalues: Emotes (upval), self (val) -- types: a2: string
                                    Emotes:FireServer("Execute", self.Name, a2, ...)
                                end,
                                GetReplicator = function(a1) -- Line: 549 -- upvalues: u411 (ref), self (val), u637 (val), TagReplicator (upval)
                                    if not u411 then
                                        local v1 = self.Character.Instance:WaitForChild((("EmoteReplicator_%*"):format(self.Name)))
                                        if not (self.Playing == u637) then
                                            return nil
                                        end
                                        u411 = TagReplicator.getReplicatorEntityFromFolder(v1, "Emote")
                                        u637:Mark(u411)
                                    end
                                    return u411
                                end,
                                Started = v1,
                                Stop = function() -- Line: 564 -- upvalues: self (val), u637 (val)
                                    if self.Local and self.Playing == u637 then
                                        self.Character:StopEmoting()
                                    end
                                end,
                                PreloadTrack = function(a1, a2, a3) -- Line: 570
                                    -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val)
                                    -- upvalues: u398 (val), Create (upval)
                                    if not self.Local then
                                        return trackGetOrAwait(Animator, a2, u637):expect()
                                    end
                                    if u398[a2] then
                                        return u398[a2]
                                    end
                                    local Animation = Create("Animation")
                                    Animation.Name = ("preloading_%*"):format((a2:match("%d+")))
                                    Animation.AnimationId = a2
                                    local v1 = (a3 or Animator):LoadAnimation(Animation)
                                    u398[a2] = v1
                                    return v1
                                end,
                                PlayTrack = function(a1, a2, a3, a4, a5, a6) -- Line: 590
                                    -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val)
                                    -- upvalues: u398 (val), Create (upval)
                                    if not self.Local then
                                        return trackGetOrAwait(Animator, a2, u637):expect()
                                    end
                                    if u398[a2] then
                                        u398[a2]:Play(a3, a4, a5)
                                        return u398[a2]
                                    end
                                    local Animation = Create("Animation")
                                    Animation.Name = ("playing_%*"):format((a2:match("%d+")))
                                    Animation.AnimationId = a2
                                    local v1 = (a6 or Animator):LoadAnimation(Animation)
                                    v1:Play(a3, a4, a5)
                                    u398[a2] = v1
                                    return v1
                                end,
                                OnTrackPlayed = function(a1, a2, a3) -- Line: 619
                                    -- upvalues: Animator (val), runCallback (val), u399 (val)
                                    assert(a2 and type(a2) == "string", "Argument #2: TrackId must be a string")
                                    local u20 = Animator.AnimationPlayed:Connect(function(a1) -- Line: 629 -- upvalues: a2 (val), runCallback (upval), a3 (val) -- types: a1: userdata
                                        if a1.Animation.AnimationId ~= a2 then
                                            return
                                        end
                                        runCallback(a3, a1)
                                    end)
                                    u399[a3] = u20
                                    for i, j in Animator:GetPlayingAnimationTracks() do
                                        if j.Animation.AnimationId == a2 then
                                            runCallback(a3, j)
                                        end
                                    end
                                    return function() -- Line: 645 -- upvalues: u399 (upval), a3 (val), u20 (val)
                                        u399[a3] = nil
                                        if u20.Connected then
                                            u20:Disconnect()
                                        end
                                    end
                                end,
                            }
                            v8 = {__index = self.Animator}
                            u486 = setmetatable(v7, v8)
                            u487 = false
                            if u486.Destroy then
                                u637:Mark(function() -- Line: 659 -- upvalues: self (val), u486 (val), u487 (ref), u635 (val)
                                    if self.CurrentAnimator == u486 then
                                        self.CurrentAnimator = nil
                                    end
                                    if u487 then
                                        local success, result = xpcall(function() -- Line: 665 -- upvalues: u486 (upval)
                                            u486:Destroy()
                                        end, debug.traceback)
                                        if not success then
                                            warn((("Emote \"%*\" cleanup failed: %*"):format(self.Name, result)))
                                            u635:Sweep()
                                        end
                                    end
                                end)
                            end
                            u637:Mark(v4)
                            u637:Mark(v6)
                            self.CurrentAnimator = u486
                            if u486.Initialize then
                                runCallback(function() -- Line: 681 -- upvalues: u487 (ref), u486 (val)
                                    u487 = true
                                    u486:Initialize()
                                end)
                            end
                        end
                        if not (self.Playing == u637) then
                            return
                        end
                        v4 = {
                            Appear = function(a1) -- Line: 694 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                                updateCharacterAccessory(Instance, a1, true)
                            end,
                            Disappear = function(a1) -- Line: 698 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                                updateCharacterAccessory(Instance, a1, false)
                            end,
                            Hide = function(a1) -- Line: 702 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                                updateCharacterAccessory(Instance, a1, false)
                            end,
                        }
                        Effects = self.Effects and function(a1) -- Line: 706 -- upvalues: self (val), u637 (val), Instance (val), u207 (ref)
                            if self.Effects[a1] then
                                self.Effects[a1](u637, Instance, u207)
                            end
                            return
                        end
                        v4.Event = Effects
                        for i12, i13 in v4 do
                            u637:Mark(((u207:GetMarkerReachedSignal(i12)):Connect(i13)))
                        end
                        return v9
                    end
                    Emotes_2 = SoundService:WaitForChild("Emotes")
                    if not (self.Playing == u637) then
                        return
                    end
                    u733 = Create("Sound", {
                        SoundId = ("rbxassetid://%*"):format(self.Sound),
                        SoundGroup = Emotes_2,
                        Parent = self.Character.Root,
                    })
                    u637:Mark(u733)
                    u363 = nil
                    u363 = coroutine.create(function() -- Line: 421 -- upvalues: trackSoundSeek (upval), u736 (val), u207 (ref), u733 (ref), u649 (val), u363 (ref)
                        trackSoundSeek(u736, u207, u733)
                        u649[u363] = nil
                    end)
                    u649[u363] = true
                    task.spawn(u363)
                end
                if self.Animator then
                    v4 = Signal.new()
                    v6 = Signal.new()
                    u398 = {}
                    u399 = {}
                    self._tracks = u398
                    u637:Mark(function() -- Line: 438 -- upvalues: u399 (val)
                        for i, j in u399 do
                            if j.Connected then
                                j:Disconnect()
                            end
                        end
                        table.clear(u399)
                    end)
                    u637:Mark(function() -- Line: 448 -- upvalues: u398 (val)
                        for i, j in u398 do
                            if j.IsPlaying then
                                j:Stop(0)
                            end
                        end
                        table.clear(u398)
                    end)

                    function runCallback(a1, ...) -- Line: 458
                        -- upvalues: self (val), u637 (val), u649 (val)
                        if a1 and self.Playing == u637 then
                            local u9 = table.pack(...)
                            local u10 = nil
                            u10 = coroutine.create(function() -- Line: 465 -- upvalues: a1 (val), u9 (val), u649 (upval), u10 (ref), self (upval), u637 (upval)
                                local success, result = xpcall(function() -- Line: 466 -- upvalues: a1 (upval), u9 (upval)
                                    a1(table.unpack(u9, 1, u9.n))
                                end, debug.traceback)
                                u649[u10] = nil
                                if not success then
                                    warn((("Emote \"%*\" failed: %*"):format(self.Name, result)))
                                    if self.Playing == u637 then
                                        self:Stop()
                                    end
                                end
                            end)
                            u649[u10] = true
                            task.spawn(u10)
                            return
                        end
                    end

                    u411 = nil
                    v7 = {
                        Replicator = self,
                        TagReplicator = u411,
                        Local = self.Local,
                        Preview = self.Preview,
                        Player = self.Player,
                        Character = self.Character,
                        Name = self.Name,
                        Sound = u733,
                        Looped = u207.Looped,
                        Track = u207,
                        Animator = Animator,
                        TargetUpdated = v4,
                        Target = v5,
                        Maid = u637,
                        OutroMaid = u635,
                        ClientState = v9,
                        ClientStateUpdated = v6,
                        IsPlaying = isPlaying,
                        Delay = function(a1, a2, a3) -- Line: 509
                            -- upvalues: runCallback (val), self (val), u637 (val)
                            runCallback(function() -- Line: 510 -- upvalues: a2 (val), self (upval), u637 (upval), a3 (val)
                                task.wait(a2)
                                if self.Playing == u637 then
                                    a3()
                                end
                            end)
                        end,
                        FinishAfter = function(a1, a2) -- Line: 518 -- upvalues: u635 (val) -- types: a2: number
                            local u2 = nil
                            u2 = task.delay(a2, function() -- Line: 520 -- upvalues: u2 (ref), u635 (upval)
                                u2 = nil
                                u635:Sweep()
                            end)
                            u635:Mark(function() -- Line: 524 -- upvalues: u2 (ref)
                                if u2 then
                                    task.cancel(u2)
                                    u2 = nil
                                end
                            end)
                        end,
                        LoadAnimation = function(a1, a2, a3) -- Line: 532
                            -- upvalues: u635 (val), u637 (val), Create (upval), Animator (val)
                            local v1
                            local v2 = Create("Animation", {AnimationId = a2})
                            ;(if not a3 then u637 else u635):Mark(v2)
                            local u19 = Animator:LoadAnimation(v2)
                            u19.Priority = Enum.AnimationPriority.Action
                            v1:Mark(function() -- Line: 538 -- upvalues: u19 (val)
                                u19:Stop(0)
                                u19:Destroy()
                            end)
                            return u19
                        end,
                        ReplicateAction = function(a1, a2, ...) -- Line: 545 -- upvalues: Emotes (upval), self (val) -- types: a2: string
                            Emotes:FireServer("Execute", self.Name, a2, ...)
                        end,
                        GetReplicator = function(a1) -- Line: 549 -- upvalues: u411 (ref), self (val), u637 (val), TagReplicator (upval)
                            if not u411 then
                                local v1 = self.Character.Instance:WaitForChild((("EmoteReplicator_%*"):format(self.Name)))
                                if not (self.Playing == u637) then
                                    return nil
                                end
                                u411 = TagReplicator.getReplicatorEntityFromFolder(v1, "Emote")
                                u637:Mark(u411)
                            end
                            return u411
                        end,
                        Started = v1,
                        Stop = function() -- Line: 564 -- upvalues: self (val), u637 (val)
                            if self.Local and self.Playing == u637 then
                                self.Character:StopEmoting()
                            end
                        end,
                        PreloadTrack = function(a1, a2, a3) -- Line: 570
                            -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val)
                            -- upvalues: Create (upval)
                            if not self.Local then
                                return trackGetOrAwait(Animator, a2, u637):expect()
                            end
                            if u398[a2] then
                                return u398[a2]
                            end
                            local Animation = Create("Animation")
                            Animation.Name = ("preloading_%*"):format((a2:match("%d+")))
                            Animation.AnimationId = a2
                            local v1 = (a3 or Animator):LoadAnimation(Animation)
                            u398[a2] = v1
                            return v1
                        end,
                        PlayTrack = function(a1, a2, a3, a4, a5, a6) -- Line: 590
                            -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val)
                            -- upvalues: Create (upval)
                            if not self.Local then
                                return trackGetOrAwait(Animator, a2, u637):expect()
                            end
                            if u398[a2] then
                                u398[a2]:Play(a3, a4, a5)
                                return u398[a2]
                            end
                            local Animation = Create("Animation")
                            Animation.Name = ("playing_%*"):format((a2:match("%d+")))
                            Animation.AnimationId = a2
                            local v1 = (a6 or Animator):LoadAnimation(Animation)
                            v1:Play(a3, a4, a5)
                            u398[a2] = v1
                            return v1
                        end,
                        OnTrackPlayed = function(a1, a2, a3) -- Line: 619
                            -- upvalues: Animator (val), runCallback (val), u399 (val)
                            assert(a2 and type(a2) == "string", "Argument #2: TrackId must be a string")
                            local u20 = Animator.AnimationPlayed:Connect(function(a1) -- Line: 629 -- upvalues: a2 (val), runCallback (upval), a3 (val) -- types: a1: userdata
                                if a1.Animation.AnimationId ~= a2 then
                                    return
                                end
                                runCallback(a3, a1)
                            end)
                            u399[a3] = u20
                            for i, j in Animator:GetPlayingAnimationTracks() do
                                if j.Animation.AnimationId == a2 then
                                    runCallback(a3, j)
                                end
                            end
                            return function() -- Line: 645 -- upvalues: u399 (upval), a3 (val), u20 (val)
                                u399[a3] = nil
                                if u20.Connected then
                                    u20:Disconnect()
                                end
                            end
                        end,
                    }
                    v8 = {__index = self.Animator}
                    u486 = setmetatable(v7, v8)
                    u487 = false
                    if u486.Destroy then
                        u637:Mark(function() -- Line: 659 -- upvalues: self (val), u486 (val), u487 (ref), u635 (val)
                            if self.CurrentAnimator == u486 then
                                self.CurrentAnimator = nil
                            end
                            if u487 then
                                local success, result = xpcall(function() -- Line: 665 -- upvalues: u486 (upval)
                                    u486:Destroy()
                                end, debug.traceback)
                                if not success then
                                    warn((("Emote \"%*\" cleanup failed: %*"):format(self.Name, result)))
                                    u635:Sweep()
                                end
                            end
                        end)
                    end
                    u637:Mark(v4)
                    u637:Mark(v6)
                    self.CurrentAnimator = u486
                    if u486.Initialize then
                        runCallback(function() -- Line: 681 -- upvalues: u487 (ref), u486 (val)
                            u487 = true
                            u486:Initialize()
                        end)
                    end
                end
                if not (self.Playing == u637) then
                    return
                end
                v4 = {
                    Appear = function(a1) -- Line: 694 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                        updateCharacterAccessory(Instance, a1, true)
                    end,
                    Disappear = function(a1) -- Line: 698 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                        updateCharacterAccessory(Instance, a1, false)
                    end,
                    Hide = function(a1) -- Line: 702 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                        updateCharacterAccessory(Instance, a1, false)
                    end,
                }
                Effects = self.Effects and function(a1) -- Line: 706 -- upvalues: self (val), u637 (val), Instance (val), u207 (ref)
                    if self.Effects[a1] then
                        self.Effects[a1](u637, Instance, u207)
                    end
                    return
                end
                v4.Event = Effects
                for i14, i15 in v4 do
                    u637:Mark(((u207:GetMarkerReachedSignal(i14)):Connect(i15)))
                end
                return v9
            end
        end
        if self.Playing == u637 then
            self:Stop()
        end
        return
    end
    v9 = if a4 then a4 else if not self.Animator then a4 else if not self.Animator.GetState then a4 else self.Animator.GetState()
    if not (self.Playing == u637) then
        return
    end
    if not self.Preview then
        Player:SetAttribute("ShowPrompts", false)
        Player:SetAttribute("SprintEnabled", false)
        u637:Mark(function() -- Line: 316 -- upvalues: Player (val)
            Player:SetAttribute("ShowPrompts", true)
            Player:SetAttribute("SprintEnabled", true)
        end)
    end
    local AnimationId = self.Track.AnimationId
    for i16, i17 in Animator:GetPlayingAnimationTracks() do
        if i17.Animation.AnimationId == AnimationId then
            u207 = i17
            if not u207 then
                u207 = Animator:LoadAnimation(self.Track)
                if a5 ~= nil or self.Preview then
                    u207.Looped = a5 or self.Preview
                end
            end
            u637:Mark(function() -- Line: 332 -- upvalues: u207 (ref)
                u207:Stop()
            end)
            v3 = trackLoaded(u207, u637) and self.Playing == u637 and trackSeek(u736, u207, self.Fade)
            if not v3 then
                if self.Playing == u637 then
                    self:Stop()
                end
                return
            end
            v5, v1 = a3, a2
            if not u207.IsPlaying then
                if self.Playing == u637 then
                    self:Stop()
                end
                return
            end
            if not (self.Playing == u637) then
                return
            end
            self._track = u207
            Instance:SetAttribute("Emoting", true)
            u637:Mark(function() -- Line: 371 -- upvalues: Instance (val)
                Instance:SetAttribute("Emoting", nil)
                Instance:SetAttribute("EmoteInteractable", nil)
            end)
            if not self.Preview and not self.Local then
                v10 = false
                if self.Interaction ~= Enum.EmoteInteractType.None then
                    v2, v3 = createInteractionPrompt(Player, Instance, self.InteractionText)
                    v3:Connect(function(a1) -- Line: 382 -- upvalues: Player (val), self (val)
                        if a1.UserId ~= Player.UserId then
                            self.Interacted:Fire(a1)
                        end
                    end)
                    u637:Mark(v2)
                end
            end
            if not u207.Looped then
                u637:Mark((u207.Stopped:Connect(stopPlaying)))
            end
            Humanoid = self.Humanoid
            WalkSpeed_2 = self.WalkSpeed
            WalkSpeed = Humanoid.WalkSpeed
            Humanoid.WalkSpeed = WalkSpeed_2
            u294 = "WalkSpeed"
            Humanoid_2 = self.Humanoid
            JumpPower_2 = self.JumpPower
            JumpPower = Humanoid_2.JumpPower
            Humanoid_2.JumpPower = JumpPower_2
            u299 = "JumpPower"
            if #self.Accessories > 0 then
                u637:Mark((self.Character:AddAccessories(self.Accessories)))
            end
            u637:Mark(function() -- Line: 79 -- upvalues: Humanoid (val), u294 (val), WalkSpeed (val)
                Humanoid[u294] = WalkSpeed
            end)
            u637:Mark(function() -- Line: 79 -- upvalues: Humanoid_2 (val), u299 (val), JumpPower (val)
                Humanoid_2[u299] = JumpPower
            end)
            if v10 and self.Sound then
                if self.Preview and not self.PlaySoundInPreview then
                    if self.Animator then
                        v4 = Signal.new()
                        v6 = Signal.new()
                        u398 = {}
                        u399 = {}
                        self._tracks = u398
                        u637:Mark(function() -- Line: 438 -- upvalues: u399 (val)
                            for i, j in u399 do
                                if j.Connected then
                                    j:Disconnect()
                                end
                            end
                            table.clear(u399)
                        end)
                        u637:Mark(function() -- Line: 448 -- upvalues: u398 (val)
                            for i, j in u398 do
                                if j.IsPlaying then
                                    j:Stop(0)
                                end
                            end
                            table.clear(u398)
                        end)

                        function runCallback(a1, ...) -- Line: 458
                            -- upvalues: self (val), u637 (val), u649 (val)
                            if a1 and self.Playing == u637 then
                                local u9 = table.pack(...)
                                local u10 = nil
                                u10 = coroutine.create(function() -- Line: 465 -- upvalues: a1 (val), u9 (val), u649 (upval), u10 (ref), self (upval), u637 (upval)
                                    local success, result = xpcall(function() -- Line: 466 -- upvalues: a1 (upval), u9 (upval)
                                        a1(table.unpack(u9, 1, u9.n))
                                    end, debug.traceback)
                                    u649[u10] = nil
                                    if not success then
                                        warn((("Emote \"%*\" failed: %*"):format(self.Name, result)))
                                        if self.Playing == u637 then
                                            self:Stop()
                                        end
                                    end
                                end)
                                u649[u10] = true
                                task.spawn(u10)
                                return
                            end
                        end

                        u411 = nil
                        v7 = {
                            Replicator = self,
                            TagReplicator = u411,
                            Local = self.Local,
                            Preview = self.Preview,
                            Player = self.Player,
                            Character = self.Character,
                            Name = self.Name,
                            Sound = u733,
                            Looped = u207.Looped,
                            Track = u207,
                            Animator = Animator,
                            TargetUpdated = v4,
                            Target = v5,
                            Maid = u637,
                            OutroMaid = u635,
                            ClientState = v9,
                            ClientStateUpdated = v6,
                            IsPlaying = isPlaying,
                            Delay = function(a1, a2, a3) -- Line: 509
                                -- upvalues: runCallback (val), self (val), u637 (val)
                                runCallback(function() -- Line: 510 -- upvalues: a2 (val), self (upval), u637 (upval), a3 (val)
                                    task.wait(a2)
                                    if self.Playing == u637 then
                                        a3()
                                    end
                                end)
                            end,
                            FinishAfter = function(a1, a2) -- Line: 518 -- upvalues: u635 (val) -- types: a2: number
                                local u2 = nil
                                u2 = task.delay(a2, function() -- Line: 520 -- upvalues: u2 (ref), u635 (upval)
                                    u2 = nil
                                    u635:Sweep()
                                end)
                                u635:Mark(function() -- Line: 524 -- upvalues: u2 (ref)
                                    if u2 then
                                        task.cancel(u2)
                                        u2 = nil
                                    end
                                end)
                            end,
                            LoadAnimation = function(a1, a2, a3) -- Line: 532
                                -- upvalues: u635 (val), u637 (val), Create (upval), Animator (val)
                                local v1
                                local v2 = Create("Animation", {AnimationId = a2})
                                ;(if not a3 then u637 else u635):Mark(v2)
                                local u19 = Animator:LoadAnimation(v2)
                                u19.Priority = Enum.AnimationPriority.Action
                                v1:Mark(function() -- Line: 538 -- upvalues: u19 (val)
                                    u19:Stop(0)
                                    u19:Destroy()
                                end)
                                return u19
                            end,
                            ReplicateAction = function(a1, a2, ...) -- Line: 545 -- upvalues: Emotes (upval), self (val) -- types: a2: string
                                Emotes:FireServer("Execute", self.Name, a2, ...)
                            end,
                            GetReplicator = function(a1) -- Line: 549 -- upvalues: u411 (ref), self (val), u637 (val), TagReplicator (upval)
                                if not u411 then
                                    local v1 = self.Character.Instance:WaitForChild((("EmoteReplicator_%*"):format(self.Name)))
                                    if not (self.Playing == u637) then
                                        return nil
                                    end
                                    u411 = TagReplicator.getReplicatorEntityFromFolder(v1, "Emote")
                                    u637:Mark(u411)
                                end
                                return u411
                            end,
                            Started = v1,
                            Stop = function() -- Line: 564 -- upvalues: self (val), u637 (val)
                                if self.Local and self.Playing == u637 then
                                    self.Character:StopEmoting()
                                end
                            end,
                            PreloadTrack = function(a1, a2, a3) -- Line: 570
                                -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val)
                                -- upvalues: Create (upval)
                                if not self.Local then
                                    return trackGetOrAwait(Animator, a2, u637):expect()
                                end
                                if u398[a2] then
                                    return u398[a2]
                                end
                                local Animation = Create("Animation")
                                Animation.Name = ("preloading_%*"):format((a2:match("%d+")))
                                Animation.AnimationId = a2
                                local v1 = (a3 or Animator):LoadAnimation(Animation)
                                u398[a2] = v1
                                return v1
                            end,
                            PlayTrack = function(a1, a2, a3, a4, a5, a6) -- Line: 590
                                -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val)
                                -- upvalues: Create (upval)
                                if not self.Local then
                                    return trackGetOrAwait(Animator, a2, u637):expect()
                                end
                                if u398[a2] then
                                    u398[a2]:Play(a3, a4, a5)
                                    return u398[a2]
                                end
                                local Animation = Create("Animation")
                                Animation.Name = ("playing_%*"):format((a2:match("%d+")))
                                Animation.AnimationId = a2
                                local v1 = (a6 or Animator):LoadAnimation(Animation)
                                v1:Play(a3, a4, a5)
                                u398[a2] = v1
                                return v1
                            end,
                            OnTrackPlayed = function(a1, a2, a3) -- Line: 619
                                -- upvalues: Animator (val), runCallback (val), u399 (val)
                                assert(a2 and type(a2) == "string", "Argument #2: TrackId must be a string")
                                local u20 = Animator.AnimationPlayed:Connect(function(a1) -- Line: 629 -- upvalues: a2 (val), runCallback (upval), a3 (val) -- types: a1: userdata
                                    if a1.Animation.AnimationId ~= a2 then
                                        return
                                    end
                                    runCallback(a3, a1)
                                end)
                                u399[a3] = u20
                                for i, j in Animator:GetPlayingAnimationTracks() do
                                    if j.Animation.AnimationId == a2 then
                                        runCallback(a3, j)
                                    end
                                end
                                return function() -- Line: 645 -- upvalues: u399 (upval), a3 (val), u20 (val)
                                    u399[a3] = nil
                                    if u20.Connected then
                                        u20:Disconnect()
                                    end
                                end
                            end,
                        }
                        v8 = {__index = self.Animator}
                        u486 = setmetatable(v7, v8)
                        u487 = false
                        if u486.Destroy then
                            u637:Mark(function() -- Line: 659 -- upvalues: self (val), u486 (val), u487 (ref), u635 (val)
                                if self.CurrentAnimator == u486 then
                                    self.CurrentAnimator = nil
                                end
                                if u487 then
                                    local success, result = xpcall(function() -- Line: 665 -- upvalues: u486 (upval)
                                        u486:Destroy()
                                    end, debug.traceback)
                                    if not success then
                                        warn((("Emote \"%*\" cleanup failed: %*"):format(self.Name, result)))
                                        u635:Sweep()
                                    end
                                end
                            end)
                        end
                        u637:Mark(v4)
                        u637:Mark(v6)
                        self.CurrentAnimator = u486
                        if u486.Initialize then
                            runCallback(function() -- Line: 681 -- upvalues: u487 (ref), u486 (val)
                                u487 = true
                                u486:Initialize()
                            end)
                        end
                    end
                    if not (self.Playing == u637) then
                        return
                    end
                    v4 = {
                        Appear = function(a1) -- Line: 694 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                            updateCharacterAccessory(Instance, a1, true)
                        end,
                        Disappear = function(a1) -- Line: 698 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                            updateCharacterAccessory(Instance, a1, false)
                        end,
                        Hide = function(a1) -- Line: 702 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                            updateCharacterAccessory(Instance, a1, false)
                        end,
                    }
                    Effects = self.Effects and function(a1) -- Line: 706 -- upvalues: self (val), u637 (val), Instance (val), u207 (ref)
                        if self.Effects[a1] then
                            self.Effects[a1](u637, Instance, u207)
                        end
                        return
                    end
                    v4.Event = Effects
                    for i18, i19 in v4 do
                        u637:Mark(((u207:GetMarkerReachedSignal(i18)):Connect(i19)))
                    end
                    return v9
                end
                Emotes_2 = SoundService:WaitForChild("Emotes")
                if not (self.Playing == u637) then
                    return
                end
                u733 = Create("Sound", {
                    SoundId = ("rbxassetid://%*"):format(self.Sound),
                    SoundGroup = Emotes_2,
                    Parent = self.Character.Root,
                })
                u637:Mark(u733)
                u363 = nil
                u363 = coroutine.create(function() -- Line: 421 -- upvalues: trackSoundSeek (upval), u736 (val), u207 (ref), u733 (ref), u649 (val), u363 (ref)
                    trackSoundSeek(u736, u207, u733)
                    u649[u363] = nil
                end)
                u649[u363] = true
                task.spawn(u363)
            end
            if self.Animator then
                v4 = Signal.new()
                v6 = Signal.new()
                u398 = {}
                u399 = {}
                self._tracks = u398
                u637:Mark(function() -- Line: 438 -- upvalues: u399 (val)
                    for i, j in u399 do
                        if j.Connected then
                            j:Disconnect()
                        end
                    end
                    table.clear(u399)
                end)
                u637:Mark(function() -- Line: 448 -- upvalues: u398 (val)
                    for i, j in u398 do
                        if j.IsPlaying then
                            j:Stop(0)
                        end
                    end
                    table.clear(u398)
                end)

                function runCallback(a1, ...) -- Line: 458
                    -- upvalues: self (val), u637 (val), u649 (val)
                    if a1 and self.Playing == u637 then
                        local u9 = table.pack(...)
                        local u10 = nil
                        u10 = coroutine.create(function() -- Line: 465 -- upvalues: a1 (val), u9 (val), u649 (upval), u10 (ref), self (upval), u637 (upval)
                            local success, result = xpcall(function() -- Line: 466 -- upvalues: a1 (upval), u9 (upval)
                                a1(table.unpack(u9, 1, u9.n))
                            end, debug.traceback)
                            u649[u10] = nil
                            if not success then
                                warn((("Emote \"%*\" failed: %*"):format(self.Name, result)))
                                if self.Playing == u637 then
                                    self:Stop()
                                end
                            end
                        end)
                        u649[u10] = true
                        task.spawn(u10)
                        return
                    end
                end

                u411 = nil
                v7 = {
                    Replicator = self,
                    TagReplicator = u411,
                    Local = self.Local,
                    Preview = self.Preview,
                    Player = self.Player,
                    Character = self.Character,
                    Name = self.Name,
                    Sound = u733,
                    Looped = u207.Looped,
                    Track = u207,
                    Animator = Animator,
                    TargetUpdated = v4,
                    Target = v5,
                    Maid = u637,
                    OutroMaid = u635,
                    ClientState = v9,
                    ClientStateUpdated = v6,
                    IsPlaying = isPlaying,
                    Delay = function(a1, a2, a3) -- Line: 509
                        -- upvalues: runCallback (val), self (val), u637 (val)
                        runCallback(function() -- Line: 510 -- upvalues: a2 (val), self (upval), u637 (upval), a3 (val)
                            task.wait(a2)
                            if self.Playing == u637 then
                                a3()
                            end
                        end)
                    end,
                    FinishAfter = function(a1, a2) -- Line: 518 -- upvalues: u635 (val) -- types: a2: number
                        local u2 = nil
                        u2 = task.delay(a2, function() -- Line: 520 -- upvalues: u2 (ref), u635 (upval)
                            u2 = nil
                            u635:Sweep()
                        end)
                        u635:Mark(function() -- Line: 524 -- upvalues: u2 (ref)
                            if u2 then
                                task.cancel(u2)
                                u2 = nil
                            end
                        end)
                    end,
                    LoadAnimation = function(a1, a2, a3) -- Line: 532
                        -- upvalues: u635 (val), u637 (val), Create (upval), Animator (val)
                        local v1
                        local v2 = Create("Animation", {AnimationId = a2})
                        ;(if not a3 then u637 else u635):Mark(v2)
                        local u19 = Animator:LoadAnimation(v2)
                        u19.Priority = Enum.AnimationPriority.Action
                        v1:Mark(function() -- Line: 538 -- upvalues: u19 (val)
                            u19:Stop(0)
                            u19:Destroy()
                        end)
                        return u19
                    end,
                    ReplicateAction = function(a1, a2, ...) -- Line: 545 -- upvalues: Emotes (upval), self (val) -- types: a2: string
                        Emotes:FireServer("Execute", self.Name, a2, ...)
                    end,
                    GetReplicator = function(a1) -- Line: 549 -- upvalues: u411 (ref), self (val), u637 (val), TagReplicator (upval)
                        if not u411 then
                            local v1 = self.Character.Instance:WaitForChild((("EmoteReplicator_%*"):format(self.Name)))
                            if not (self.Playing == u637) then
                                return nil
                            end
                            u411 = TagReplicator.getReplicatorEntityFromFolder(v1, "Emote")
                            u637:Mark(u411)
                        end
                        return u411
                    end,
                    Started = v1,
                    Stop = function() -- Line: 564 -- upvalues: self (val), u637 (val)
                        if self.Local and self.Playing == u637 then
                            self.Character:StopEmoting()
                        end
                    end,
                    PreloadTrack = function(a1, a2, a3) -- Line: 570
                        -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val)
                        -- upvalues: Create (upval)
                        if not self.Local then
                            return trackGetOrAwait(Animator, a2, u637):expect()
                        end
                        if u398[a2] then
                            return u398[a2]
                        end
                        local Animation = Create("Animation")
                        Animation.Name = ("preloading_%*"):format((a2:match("%d+")))
                        Animation.AnimationId = a2
                        local v1 = (a3 or Animator):LoadAnimation(Animation)
                        u398[a2] = v1
                        return v1
                    end,
                    PlayTrack = function(a1, a2, a3, a4, a5, a6) -- Line: 590
                        -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val)
                        -- upvalues: Create (upval)
                        if not self.Local then
                            return trackGetOrAwait(Animator, a2, u637):expect()
                        end
                        if u398[a2] then
                            u398[a2]:Play(a3, a4, a5)
                            return u398[a2]
                        end
                        local Animation = Create("Animation")
                        Animation.Name = ("playing_%*"):format((a2:match("%d+")))
                        Animation.AnimationId = a2
                        local v1 = (a6 or Animator):LoadAnimation(Animation)
                        v1:Play(a3, a4, a5)
                        u398[a2] = v1
                        return v1
                    end,
                    OnTrackPlayed = function(a1, a2, a3) -- Line: 619
                        -- upvalues: Animator (val), runCallback (val), u399 (val)
                        assert(a2 and type(a2) == "string", "Argument #2: TrackId must be a string")
                        local u20 = Animator.AnimationPlayed:Connect(function(a1) -- Line: 629 -- upvalues: a2 (val), runCallback (upval), a3 (val) -- types: a1: userdata
                            if a1.Animation.AnimationId ~= a2 then
                                return
                            end
                            runCallback(a3, a1)
                        end)
                        u399[a3] = u20
                        for i, j in Animator:GetPlayingAnimationTracks() do
                            if j.Animation.AnimationId == a2 then
                                runCallback(a3, j)
                            end
                        end
                        return function() -- Line: 645 -- upvalues: u399 (upval), a3 (val), u20 (val)
                            u399[a3] = nil
                            if u20.Connected then
                                u20:Disconnect()
                            end
                        end
                    end,
                }
                v8 = {__index = self.Animator}
                u486 = setmetatable(v7, v8)
                u487 = false
                if u486.Destroy then
                    u637:Mark(function() -- Line: 659 -- upvalues: self (val), u486 (val), u487 (ref), u635 (val)
                        if self.CurrentAnimator == u486 then
                            self.CurrentAnimator = nil
                        end
                        if u487 then
                            local success, result = xpcall(function() -- Line: 665 -- upvalues: u486 (upval)
                                u486:Destroy()
                            end, debug.traceback)
                            if not success then
                                warn((("Emote \"%*\" cleanup failed: %*"):format(self.Name, result)))
                                u635:Sweep()
                            end
                        end
                    end)
                end
                u637:Mark(v4)
                u637:Mark(v6)
                self.CurrentAnimator = u486
                if u486.Initialize then
                    runCallback(function() -- Line: 681 -- upvalues: u487 (ref), u486 (val)
                        u487 = true
                        u486:Initialize()
                    end)
                end
            end
            if not (self.Playing == u637) then
                return
            end
            v4 = {
                Appear = function(a1) -- Line: 694 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                    updateCharacterAccessory(Instance, a1, true)
                end,
                Disappear = function(a1) -- Line: 698 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                    updateCharacterAccessory(Instance, a1, false)
                end,
                Hide = function(a1) -- Line: 702 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                    updateCharacterAccessory(Instance, a1, false)
                end,
            }
            Effects = self.Effects and function(a1) -- Line: 706 -- upvalues: self (val), u637 (val), Instance (val), u207 (ref)
                if self.Effects[a1] then
                    self.Effects[a1](u637, Instance, u207)
                end
                return
            end
            v4.Event = Effects
            for i20, i21 in v4 do
                u637:Mark(((u207:GetMarkerReachedSignal(i20)):Connect(i21)))
            end
            return v9
        end
    end
    u207 = nil
    if not u207 then
        u207 = Animator:LoadAnimation(self.Track)
        if a5 ~= nil or self.Preview then
            u207.Looped = a5 or self.Preview
        end
    end
    u637:Mark(function() -- Line: 332 -- upvalues: u207 (ref)
        u207:Stop()
    end)
    v3 = trackLoaded(u207, u637) and self.Playing == u637 and trackSeek(u736, u207, self.Fade)
    if not v3 then
        if self.Playing == u637 then
            self:Stop()
        end
        return
    end
    v5, v1 = a3, a2
    if not u207.IsPlaying then
        if self.Playing == u637 then
            self:Stop()
        end
        return
    end
    if not (self.Playing == u637) then
        return
    end
    self._track = u207
    Instance:SetAttribute("Emoting", true)
    u637:Mark(function() -- Line: 371 -- upvalues: Instance (val)
        Instance:SetAttribute("Emoting", nil)
        Instance:SetAttribute("EmoteInteractable", nil)
    end)
    if not self.Preview and not self.Local then
        v10 = false
        if self.Interaction ~= Enum.EmoteInteractType.None then
            v2, v3 = createInteractionPrompt(Player, Instance, self.InteractionText)
            v3:Connect(function(a1) -- Line: 382 -- upvalues: Player (val), self (val)
                if a1.UserId ~= Player.UserId then
                    self.Interacted:Fire(a1)
                end
            end)
            u637:Mark(v2)
        end
    end
    if not u207.Looped then
        u637:Mark((u207.Stopped:Connect(stopPlaying)))
    end
    Humanoid = self.Humanoid
    WalkSpeed_2 = self.WalkSpeed
    WalkSpeed = Humanoid.WalkSpeed
    Humanoid.WalkSpeed = WalkSpeed_2
    u294 = "WalkSpeed"
    Humanoid_2 = self.Humanoid
    JumpPower_2 = self.JumpPower
    JumpPower = Humanoid_2.JumpPower
    Humanoid_2.JumpPower = JumpPower_2
    u299 = "JumpPower"
    if #self.Accessories > 0 then
        u637:Mark((self.Character:AddAccessories(self.Accessories)))
    end
    u637:Mark(function() -- Line: 79 -- upvalues: Humanoid (val), u294 (val), WalkSpeed (val)
        Humanoid[u294] = WalkSpeed
    end)
    u637:Mark(function() -- Line: 79 -- upvalues: Humanoid_2 (val), u299 (val), JumpPower (val)
        Humanoid_2[u299] = JumpPower
    end)
    if v10 and self.Sound then
        if self.Preview and not self.PlaySoundInPreview then
            if self.Animator then
                v4 = Signal.new()
                v6 = Signal.new()
                u398 = {}
                u399 = {}
                self._tracks = u398
                u637:Mark(function() -- Line: 438 -- upvalues: u399 (val)
                    for i, j in u399 do
                        if j.Connected then
                            j:Disconnect()
                        end
                    end
                    table.clear(u399)
                end)
                u637:Mark(function() -- Line: 448 -- upvalues: u398 (val)
                    for i, j in u398 do
                        if j.IsPlaying then
                            j:Stop(0)
                        end
                    end
                    table.clear(u398)
                end)

                function runCallback(a1, ...) -- Line: 458
                    -- upvalues: self (val), u637 (val), u649 (val)
                    if a1 and self.Playing == u637 then
                        local u9 = table.pack(...)
                        local u10 = nil
                        u10 = coroutine.create(function() -- Line: 465 -- upvalues: a1 (val), u9 (val), u649 (upval), u10 (ref), self (upval), u637 (upval)
                            local success, result = xpcall(function() -- Line: 466 -- upvalues: a1 (upval), u9 (upval)
                                a1(table.unpack(u9, 1, u9.n))
                            end, debug.traceback)
                            u649[u10] = nil
                            if not success then
                                warn((("Emote \"%*\" failed: %*"):format(self.Name, result)))
                                if self.Playing == u637 then
                                    self:Stop()
                                end
                            end
                        end)
                        u649[u10] = true
                        task.spawn(u10)
                        return
                    end
                end

                u411 = nil
                v7 = {
                    Replicator = self,
                    TagReplicator = u411,
                    Local = self.Local,
                    Preview = self.Preview,
                    Player = self.Player,
                    Character = self.Character,
                    Name = self.Name,
                    Sound = u733,
                    Looped = u207.Looped,
                    Track = u207,
                    Animator = Animator,
                    TargetUpdated = v4,
                    Target = v5,
                    Maid = u637,
                    OutroMaid = u635,
                    ClientState = v9,
                    ClientStateUpdated = v6,
                    IsPlaying = isPlaying,
                    Delay = function(a1, a2, a3) -- Line: 509
                        -- upvalues: runCallback (val), self (val), u637 (val)
                        runCallback(function() -- Line: 510 -- upvalues: a2 (val), self (upval), u637 (upval), a3 (val)
                            task.wait(a2)
                            if self.Playing == u637 then
                                a3()
                            end
                        end)
                    end,
                    FinishAfter = function(a1, a2) -- Line: 518 -- upvalues: u635 (val) -- types: a2: number
                        local u2 = nil
                        u2 = task.delay(a2, function() -- Line: 520 -- upvalues: u2 (ref), u635 (upval)
                            u2 = nil
                            u635:Sweep()
                        end)
                        u635:Mark(function() -- Line: 524 -- upvalues: u2 (ref)
                            if u2 then
                                task.cancel(u2)
                                u2 = nil
                            end
                        end)
                    end,
                    LoadAnimation = function(a1, a2, a3) -- Line: 532
                        -- upvalues: u635 (val), u637 (val), Create (upval), Animator (val)
                        local v1
                        local v2 = Create("Animation", {AnimationId = a2})
                        ;(if not a3 then u637 else u635):Mark(v2)
                        local u19 = Animator:LoadAnimation(v2)
                        u19.Priority = Enum.AnimationPriority.Action
                        v1:Mark(function() -- Line: 538 -- upvalues: u19 (val)
                            u19:Stop(0)
                            u19:Destroy()
                        end)
                        return u19
                    end,
                    ReplicateAction = function(a1, a2, ...) -- Line: 545 -- upvalues: Emotes (upval), self (val) -- types: a2: string
                        Emotes:FireServer("Execute", self.Name, a2, ...)
                    end,
                    GetReplicator = function(a1) -- Line: 549 -- upvalues: u411 (ref), self (val), u637 (val), TagReplicator (upval)
                        if not u411 then
                            local v1 = self.Character.Instance:WaitForChild((("EmoteReplicator_%*"):format(self.Name)))
                            if not (self.Playing == u637) then
                                return nil
                            end
                            u411 = TagReplicator.getReplicatorEntityFromFolder(v1, "Emote")
                            u637:Mark(u411)
                        end
                        return u411
                    end,
                    Started = v1,
                    Stop = function() -- Line: 564 -- upvalues: self (val), u637 (val)
                        if self.Local and self.Playing == u637 then
                            self.Character:StopEmoting()
                        end
                    end,
                    PreloadTrack = function(a1, a2, a3) -- Line: 570
                        -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val)
                        -- upvalues: Create (upval)
                        if not self.Local then
                            return trackGetOrAwait(Animator, a2, u637):expect()
                        end
                        if u398[a2] then
                            return u398[a2]
                        end
                        local Animation = Create("Animation")
                        Animation.Name = ("preloading_%*"):format((a2:match("%d+")))
                        Animation.AnimationId = a2
                        local v1 = (a3 or Animator):LoadAnimation(Animation)
                        u398[a2] = v1
                        return v1
                    end,
                    PlayTrack = function(a1, a2, a3, a4, a5, a6) -- Line: 590
                        -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val)
                        -- upvalues: Create (upval)
                        if not self.Local then
                            return trackGetOrAwait(Animator, a2, u637):expect()
                        end
                        if u398[a2] then
                            u398[a2]:Play(a3, a4, a5)
                            return u398[a2]
                        end
                        local Animation = Create("Animation")
                        Animation.Name = ("playing_%*"):format((a2:match("%d+")))
                        Animation.AnimationId = a2
                        local v1 = (a6 or Animator):LoadAnimation(Animation)
                        v1:Play(a3, a4, a5)
                        u398[a2] = v1
                        return v1
                    end,
                    OnTrackPlayed = function(a1, a2, a3) -- Line: 619
                        -- upvalues: Animator (val), runCallback (val), u399 (val)
                        assert(a2 and type(a2) == "string", "Argument #2: TrackId must be a string")
                        local u20 = Animator.AnimationPlayed:Connect(function(a1) -- Line: 629 -- upvalues: a2 (val), runCallback (upval), a3 (val) -- types: a1: userdata
                            if a1.Animation.AnimationId ~= a2 then
                                return
                            end
                            runCallback(a3, a1)
                        end)
                        u399[a3] = u20
                        for i, j in Animator:GetPlayingAnimationTracks() do
                            if j.Animation.AnimationId == a2 then
                                runCallback(a3, j)
                            end
                        end
                        return function() -- Line: 645 -- upvalues: u399 (upval), a3 (val), u20 (val)
                            u399[a3] = nil
                            if u20.Connected then
                                u20:Disconnect()
                            end
                        end
                    end,
                }
                v8 = {__index = self.Animator}
                u486 = setmetatable(v7, v8)
                u487 = false
                if u486.Destroy then
                    u637:Mark(function() -- Line: 659 -- upvalues: self (val), u486 (val), u487 (ref), u635 (val)
                        if self.CurrentAnimator == u486 then
                            self.CurrentAnimator = nil
                        end
                        if u487 then
                            local success, result = xpcall(function() -- Line: 665 -- upvalues: u486 (upval)
                                u486:Destroy()
                            end, debug.traceback)
                            if not success then
                                warn((("Emote \"%*\" cleanup failed: %*"):format(self.Name, result)))
                                u635:Sweep()
                            end
                        end
                    end)
                end
                u637:Mark(v4)
                u637:Mark(v6)
                self.CurrentAnimator = u486
                if u486.Initialize then
                    runCallback(function() -- Line: 681 -- upvalues: u487 (ref), u486 (val)
                        u487 = true
                        u486:Initialize()
                    end)
                end
            end
            if not (self.Playing == u637) then
                return
            end
            v4 = {
                Appear = function(a1) -- Line: 694 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                    updateCharacterAccessory(Instance, a1, true)
                end,
                Disappear = function(a1) -- Line: 698 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                    updateCharacterAccessory(Instance, a1, false)
                end,
                Hide = function(a1) -- Line: 702 -- upvalues: updateCharacterAccessory (upval), Instance (val)
                    updateCharacterAccessory(Instance, a1, false)
                end,
            }
            Effects = self.Effects and function(a1) -- Line: 706 -- upvalues: self (val), u637 (val), Instance (val), u207 (ref)
                if self.Effects[a1] then
                    self.Effects[a1](u637, Instance, u207)
                end
                return
            end
            v4.Event = Effects
            for i22, i23 in v4 do
                u637:Mark(((u207:GetMarkerReachedSignal(i22)):Connect(i23)))
            end
            return v9
        end
        Emotes_2 = SoundService:WaitForChild("Emotes")
        if not (self.Playing == u637) then
            return
        end
        u733 = Create("Sound", {
            SoundId = ("rbxassetid://%*"):format(self.Sound),
            SoundGroup = Emotes_2,
            Parent = self.Character.Root,
        })
        u637:Mark(u733)
        u363 = nil
        u363 = coroutine.create(function() -- Line: 421 -- upvalues: trackSoundSeek (upval), u736 (val), u207 (ref), u733 (ref), u649 (val), u363 (ref)
            trackSoundSeek(u736, u207, u733)
            u649[u363] = nil
        end)
        u649[u363] = true
        task.spawn(u363)
    end
    if self.Animator then
        v4 = Signal.new()
        v6 = Signal.new()
        u398 = {}
        u399 = {}
        self._tracks = u398
        u637:Mark(function() -- Line: 438 -- upvalues: u399 (val)
            for i, j in u399 do
                if j.Connected then
                    j:Disconnect()
                end
            end
            table.clear(u399)
        end)
        u637:Mark(function() -- Line: 448 -- upvalues: u398 (val)
            for i, j in u398 do
                if j.IsPlaying then
                    j:Stop(0)
                end
            end
            table.clear(u398)
        end)

        function runCallback(a1, ...) -- Line: 458
            -- upvalues: self (val), u637 (val), u649 (val)
            if a1 and self.Playing == u637 then
                local u9 = table.pack(...)
                local u10 = nil
                u10 = coroutine.create(function() -- Line: 465 -- upvalues: a1 (val), u9 (val), u649 (upval), u10 (ref), self (upval), u637 (upval)
                    local success, result = xpcall(function() -- Line: 466 -- upvalues: a1 (upval), u9 (upval)
                        a1(table.unpack(u9, 1, u9.n))
                    end, debug.traceback)
                    u649[u10] = nil
                    if not success then
                        warn((("Emote \"%*\" failed: %*"):format(self.Name, result)))
                        if self.Playing == u637 then
                            self:Stop()
                        end
                    end
                end)
                u649[u10] = true
                task.spawn(u10)
                return
            end
        end

        u411 = nil
        v7 = {
            Replicator = self,
            TagReplicator = u411,
            Local = self.Local,
            Preview = self.Preview,
            Player = self.Player,
            Character = self.Character,
            Name = self.Name,
            Sound = u733,
            Looped = u207.Looped,
            Track = u207,
            Animator = Animator,
            TargetUpdated = v4,
            Target = v5,
            Maid = u637,
            OutroMaid = u635,
            ClientState = v9,
            ClientStateUpdated = v6,
            IsPlaying = isPlaying,
            Delay = function(a1, a2, a3) -- Line: 509
                -- upvalues: runCallback (val), self (val), u637 (val)
                runCallback(function() -- Line: 510 -- upvalues: a2 (val), self (upval), u637 (upval), a3 (val)
                    task.wait(a2)
                    if self.Playing == u637 then
                        a3()
                    end
                end)
            end,
            FinishAfter = function(a1, a2) -- Line: 518 -- upvalues: u635 (val) -- types: a2: number
                local u2 = nil
                u2 = task.delay(a2, function() -- Line: 520 -- upvalues: u2 (ref), u635 (upval)
                    u2 = nil
                    u635:Sweep()
                end)
                u635:Mark(function() -- Line: 524 -- upvalues: u2 (ref)
                    if u2 then
                        task.cancel(u2)
                        u2 = nil
                    end
                end)
            end,
            LoadAnimation = function(a1, a2, a3) -- Line: 532
                -- upvalues: u635 (val), u637 (val), Create (upval), Animator (val)
                local v1
                local v2 = Create("Animation", {AnimationId = a2})
                ;(if not a3 then u637 else u635):Mark(v2)
                local u19 = Animator:LoadAnimation(v2)
                u19.Priority = Enum.AnimationPriority.Action
                v1:Mark(function() -- Line: 538 -- upvalues: u19 (val)
                    u19:Stop(0)
                    u19:Destroy()
                end)
                return u19
            end,
            ReplicateAction = function(a1, a2, ...) -- Line: 545 -- upvalues: Emotes (upval), self (val) -- types: a2: string
                Emotes:FireServer("Execute", self.Name, a2, ...)
            end,
            GetReplicator = function(a1) -- Line: 549 -- upvalues: u411 (ref), self (val), u637 (val), TagReplicator (upval)
                if not u411 then
                    local v1 = self.Character.Instance:WaitForChild((("EmoteReplicator_%*"):format(self.Name)))
                    if not (self.Playing == u637) then
                        return nil
                    end
                    u411 = TagReplicator.getReplicatorEntityFromFolder(v1, "Emote")
                    u637:Mark(u411)
                end
                return u411
            end,
            Started = v1,
            Stop = function() -- Line: 564 -- upvalues: self (val), u637 (val)
                if self.Local and self.Playing == u637 then
                    self.Character:StopEmoting()
                end
            end,
            PreloadTrack = function(a1, a2, a3) -- Line: 570
                -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val), Create (upval)
                if not self.Local then
                    return trackGetOrAwait(Animator, a2, u637):expect()
                end
                if u398[a2] then
                    return u398[a2]
                end
                local Animation = Create("Animation")
                Animation.Name = ("preloading_%*"):format((a2:match("%d+")))
                Animation.AnimationId = a2
                local v1 = (a3 or Animator):LoadAnimation(Animation)
                u398[a2] = v1
                return v1
            end,
            PlayTrack = function(a1, a2, a3, a4, a5, a6) -- Line: 590
                -- upvalues: self (val), trackGetOrAwait (upval), Animator (val), u637 (val), u398 (val), Create (upval)
                if not self.Local then
                    return trackGetOrAwait(Animator, a2, u637):expect()
                end
                if u398[a2] then
                    u398[a2]:Play(a3, a4, a5)
                    return u398[a2]
                end
                local Animation = Create("Animation")
                Animation.Name = ("playing_%*"):format((a2:match("%d+")))
                Animation.AnimationId = a2
                local v1 = (a6 or Animator):LoadAnimation(Animation)
                v1:Play(a3, a4, a5)
                u398[a2] = v1
                return v1
            end,
            OnTrackPlayed = function(a1, a2, a3) -- Line: 619
                -- upvalues: Animator (val), runCallback (val), u399 (val)
                assert(a2 and type(a2) == "string", "Argument #2: TrackId must be a string")
                local u20 = Animator.AnimationPlayed:Connect(function(a1) -- Line: 629 -- upvalues: a2 (val), runCallback (upval), a3 (val) -- types: a1: userdata
                    if a1.Animation.AnimationId ~= a2 then
                        return
                    end
                    runCallback(a3, a1)
                end)
                u399[a3] = u20
                for i, j in Animator:GetPlayingAnimationTracks() do
                    if j.Animation.AnimationId == a2 then
                        runCallback(a3, j)
                    end
                end
                return function() -- Line: 645 -- upvalues: u399 (upval), a3 (val), u20 (val)
                    u399[a3] = nil
                    if u20.Connected then
                        u20:Disconnect()
                    end
                end
            end,
        }
        v8 = {__index = self.Animator}
        u486 = setmetatable(v7, v8)
        u487 = false
        if u486.Destroy then
            u637:Mark(function() -- Line: 659 -- upvalues: self (val), u486 (val), u487 (ref), u635 (val)
                if self.CurrentAnimator == u486 then
                    self.CurrentAnimator = nil
                end
                if u487 then
                    local success, result = xpcall(function() -- Line: 665 -- upvalues: u486 (upval)
                        u486:Destroy()
                    end, debug.traceback)
                    if not success then
                        warn((("Emote \"%*\" cleanup failed: %*"):format(self.Name, result)))
                        u635:Sweep()
                    end
                end
            end)
        end
        u637:Mark(v4)
        u637:Mark(v6)
        self.CurrentAnimator = u486
        if u486.Initialize then
            runCallback(function() -- Line: 681 -- upvalues: u487 (ref), u486 (val)
                u487 = true
                u486:Initialize()
            end)
        end
    end
    if not (self.Playing == u637) then
        return
    end
    v4 = {
        Appear = function(a1) -- Line: 694 -- upvalues: updateCharacterAccessory (upval), Instance (val)
            updateCharacterAccessory(Instance, a1, true)
        end,
        Disappear = function(a1) -- Line: 698 -- upvalues: updateCharacterAccessory (upval), Instance (val)
            updateCharacterAccessory(Instance, a1, false)
        end,
        Hide = function(a1) -- Line: 702 -- upvalues: updateCharacterAccessory (upval), Instance (val)
            updateCharacterAccessory(Instance, a1, false)
        end,
    }
    Effects = self.Effects and function(a1) -- Line: 706 -- upvalues: self (val), u637 (val), Instance (val), u207 (ref)
        if self.Effects[a1] then
            self.Effects[a1](u637, Instance, u207)
        end
        return
    end
    v4.Event = Effects
    for i24, i25 in v4 do
        u637:Mark(((u207:GetMarkerReachedSignal(i24)):Connect(i25)))
    end
    return v9
end

function u20:Stop() -- Line: 720
    local Playing = self.Playing
    if Playing then
        self.Playing = nil
        self._track = nil
        self._tracks = nil
        self.CurrentAnimator = nil
        Playing:Sweep()
    end
end

function u20:Destroy() -- Line: 731
    if self.Interacted then
        self.Interacted:Destroy()
        self.Interacted = nil
    end
    self:Stop()
    self.Outro:Sweep()
end

return u20