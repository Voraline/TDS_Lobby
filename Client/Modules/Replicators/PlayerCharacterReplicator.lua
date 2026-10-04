-- Script path: ReplicatedStorage.Client.Modules.Replicators.PlayerCharacterReplicator
-- Decompile time: 16.62 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local u15 = {}
u15.__index = u15

function u15.__tostring(a1) -- Line: 12
    return string.format("CharacterReplicator_%s", a1.Player.Name)
end

local LocalPlayer = Players.LocalPlayer
local CustomAccessories = require(ReplicatedStorage.Shared.Modules.CustomAccessories)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local EmoteReplicator = require(ReplicatedStorage.Client.Modules.Replicators.EmoteReplicator)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local Emotes = Network.Channel("Emotes")
local u57 = {}
local u58 = {}
local u59 = false
local BindableEvent = Instance.new("BindableEvent")

function u15.new(a1, a2) -- Line: 40
    -- upvalues: u15 (val), Maid (val), u58 (val), u57 (val), BindableEvent (val)
    local Player = a1.Player
    assert(Player, "PlayerEntity has no player instance")
    local u10 = setmetatable({}, u15)
    u10.Maid = Maid.new()
    u10.Emote = nil
    u10.EmoteStarted = nil
    u10.StoppedEmote = nil
    u10.Instance = a2
    u10.Root = a2:WaitForChild("HumanoidRootPart", 5)
    u10.Humanoid = a2:WaitForChild("Humanoid", 5)
    if u10.Root and u10.Humanoid then
        u10.Animator = u10.Humanoid:WaitForChild("Animator", 5)
        if not u10.Animator then
            warn((("Skipping character entity for %*: missing Animator"):format(Player.Name)))
            return nil
        end
        task.spawn(function() -- Line: 68 -- upvalues: u10 (val), a2 (val)
            u10.Camera = a2:WaitForChild("Camera", 5)
        end)
        u10.Replicator = a1.Replicator
        u10.PlayerReplicator = a1
        u10.Player = Player
        u58[Player] = u10
        u57[a2] = u10
        u10.Maid:Mark((u10.Humanoid.Died:Connect(function() -- Line: 79 -- upvalues: u10 (val)
            u10:StopEmotingLocally()
        end)))
        u10.Maid:Mark(((u10.Replicator:GetStateChangedSignal("Emote")):Connect(function(a1) -- Line: 83 -- upvalues: u10 (val)
            if a1 == nil then
                u10:StopEmotingLocally()
                return
            end
            if a1 and a1.Name and a1.Started then
                u10:StartEmotingLocally(a1.Name, a1.Started, a1.Target, a1.ClientState)
            end
        end)))
        u10.Maid:Mark(function() -- Line: 91 -- upvalues: u58 (upval), Player (val), u10 (val), u57 (upval), a2 (val)
            if u58[Player] == u10 then
                u58[Player] = nil
            end
            if u57[a2] == u10 then
                u57[a2] = nil
            end
        end)
        u10:UpdateCharacterHidden()
        BindableEvent:Fire(a2)
        return u10
    end
    warn((("Skipping character entity for %*: missing humanoid or root part"):format(Player.Name)))
    return nil
end

function u15:UpdateCharacterHidden() -- Line: 109 -- upvalues: u59 (ref)
    local Enabled
    if not self.Instance then
        return
    end
    for i, j in self.Instance:GetDescendants() do
        if j:IsA("BasePart") or j:IsA("Decal") then
            j.LocalTransparencyModifier = if not u59 then 0 else 1
        elseif j:IsA("ParticleEmitter") or j:IsA("Trail") or j:IsA("Beam") then
            if not u59 then
                j.Enabled = j:GetAttribute("WasEnabled")
            else
                Enabled = j.Enabled
                j:SetAttribute("WasEnabled", Enabled)
                j.Enabled = false
            end
        end
    end
end

function u15.AddAccessories(a1, a2) -- Line: 133 -- upvalues: CustomAccessories (val) -- types: a1: table, a2: table
    return CustomAccessories.AddAccessories(a1.Instance, a2)
end

function u15.RemoveAccessories(a1, a2) -- Line: 137
    -- upvalues: CustomAccessories (val)
    if a2 then
        CustomAccessories.RemoveAccessories(a1.Instance)
        return
    end
    for i, j in a1.Instance:GetChildren() do
        if j:IsA("Accessory") then
            j:Destroy()
        end
    end
end

function u15:StartEmoting(a2, a3, a4) -- Line: 149
    -- upvalues: LocalPlayer (val), Emotes (val)
    assert(self.Player == LocalPlayer, "You must run this locally")
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v1, u27 = self:StartEmotingLocally(a2, ServerTimeNow, a3, a4)
    if v1 and self.EmoteStarted == ServerTimeNow then
        task.spawn(function() -- Line: 159 -- upvalues: Emotes (upval), a2 (val), ServerTimeNow (val), a3 (val), u27 (val), self (val)
            if not Emotes:InvokeServer("Play", a2, ServerTimeNow, a3, u27) and self.EmoteStarted == ServerTimeNow then
                self:StopEmotingLocally()
            end
        end)
        return
    end
end

function u15.StopEmoting(a1) -- Line: 168 -- upvalues: LocalPlayer (val), Emotes (val)
    assert(a1.Player == LocalPlayer, "You must run this locally")
    if not a1.Emote and not a1.EmoteStarted then
        return false
    end
    Emotes:FireServer("Stop")
    a1:StopEmotingLocally()
    return true
end

function u15:StartEmotingLocally(a2, a3, a4, a5) -- Line: 181
    -- upvalues: EmoteReplicator (val), ReplicatedStorage (val), LocalPlayer (val), Enum (val)
    local v1, v2
    if self.Destroyed then
        return false
    end
    local Emote = self.Emote
    local v3 = not Emote
    if not v3 then
        v3 = true
        if Emote.Name == a2 then
            v3 = self.EmoteStarted ~= a3
        end
    end
    if v3 then
        local Emote_2 = self.Emote
        local StoppedEmote = self.StoppedEmote
        self.Emote = nil
        self.StoppedEmote = nil
        self.EmoteStarted = a3
        if Emote_2 then
            Emote_2:Destroy()
        end
        if StoppedEmote then
            StoppedEmote:Destroy()
        end
        if self.EmoteStarted ~= a3 then
            return false
        end
        Emote = nil
    end
    if Emote then
        if Emote.Interaction == Enum.EmoteInteractType.Single and a4 then
            self.Instance:SetAttribute("EmoteInteractable", false)
            if a4.Character then
                a4.Character:SetAttribute("EmoteInteractable", false)
            end
        end
        if v3 then
            a5 = Emote:Play(a3, a4, a5)
        elseif Emote:IsPlaying() and Emote.CurrentAnimator then
            if a4 then
                Emote.CurrentAnimator.Target = a4
                Emote.CurrentAnimator.TargetUpdated:Fire(a4)
            end
            if a5 then
                Emote.CurrentAnimator.ClientState = a5
                Emote.CurrentAnimator.ClientStateUpdated:Fire(a5)
            end
        end
        v1 = false
        if self.Emote == Emote then
            v1 = Emote:IsPlaying()
        end
        v2 = a5
        return v1, v2
    end
    Emote = EmoteReplicator.new(self, a2)
    if not self.Destroyed and self.EmoteStarted == a3 then
        Emote.Interacted:Connect(function() -- Line: 220 -- upvalues: ReplicatedStorage (upval), LocalPlayer (upval), a2 (val), self (val), a5 (ref)
            local PlayerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.PlayerReplicator)
            require(ReplicatedStorage.Shared.Modules.CustomAccessories)
            local v1 = PlayerReplicator.GetEntityFromPlayer(LocalPlayer)
            if not v1 then
                return
            end
            local Character = v1.Character
            if not Character then
                return
            end
            Character:StartEmoting(a2, self.Player, a5)
        end)
        self.Emote = Emote
        if Emote.Interaction == Enum.EmoteInteractType.Single and a4 then
            self.Instance:SetAttribute("EmoteInteractable", false)
            if a4.Character then
                a4.Character:SetAttribute("EmoteInteractable", false)
            end
        end
        if v3 then
            a5 = Emote:Play(a3, a4, a5)
        elseif Emote:IsPlaying() and Emote.CurrentAnimator then
            if a4 then
                Emote.CurrentAnimator.Target = a4
                Emote.CurrentAnimator.TargetUpdated:Fire(a4)
            end
            if a5 then
                Emote.CurrentAnimator.ClientState = a5
                Emote.CurrentAnimator.ClientStateUpdated:Fire(a5)
            end
        end
        v1 = false
        if self.Emote == Emote then
            v1 = Emote:IsPlaying()
        end
        v2 = a5
        return v1, v2
    end
    Emote:Destroy()
    return false
end

function u15:StopEmotingLocally() -- Line: 271
    local Emote = self.Emote
    self.Emote = nil
    self.EmoteStarted = nil
    local StoppedEmote = self.StoppedEmote
    if Emote then
        self.StoppedEmote = Emote
    end
    self.Replicator:Set("Emote", nil)
    if Emote then
        if StoppedEmote then
            StoppedEmote:Destroy()
        end
        Emote:Stop()
    end
end

function u15:Step(a2) -- Line: 291 -- upvalues: LocalPlayer (val) -- types: self: table, a2: number
    local CurrentCamera = workspace.CurrentCamera
    local Camera = self.Camera
    if self.Player == LocalPlayer and CurrentCamera and Camera then
        Camera.CFrame = (CFrame.new(self.Root.Position)) * CurrentCamera.CFrame.Rotation
    end
end

function u15.HideCharacters(a1) -- Line: 302 -- upvalues: u59 (ref), u57 (val) -- types: a1: boolean
    u59 = a1
    for i, j in u57 do
        j:UpdateCharacterHidden()
    end
end

function u15.GetEntityFromPlayer(a1) -- Line: 309 -- upvalues: u58 (val) -- types: a1: userdata
    return u58[a1]
end

function u15.GetEntityFromModel(a1) -- Line: 313 -- upvalues: u57 (val) -- types: a1: userdata
    return u57[a1]
end

function u15.WaitForReplicator(a1) -- Line: 317
    -- upvalues: u57 (val), Promise (val), BindableEvent (val)
    if u57[a1] then
        return Promise.resolve(u57[a1])
    end
    return Promise.new(function(a1_2, a2, a3) -- Line: 322 -- upvalues: BindableEvent (upval), a1 (val), u57 (upval)
        local u3 = nil
        u3 = BindableEvent.Event:Connect(function(a1_3) -- Line: 324 -- upvalues: a1 (upval), u3 (ref), a1_2 (val), u57 (upval)
            if a1_3 ~= a1 then
                return
            end
            u3:Disconnect()
            a1_2(u57[a1_3])
        end)
        a3(function() -- Line: 333 -- upvalues: u3 (ref)
            u3:Disconnect()
        end)
    end)
end

function u15:Destroy() -- Line: 339
    self.Destroyed = true
    if self.Maid then
        self.Maid:Sweep()
        self.Maid = nil
    end
    self.EmoteStarted = nil
    if self.Emote then
        local Emote = self.Emote
        self.Emote = nil
        Emote:Destroy()
    end
    if self.StoppedEmote then
        local StoppedEmote = self.StoppedEmote
        self.StoppedEmote = nil
        StoppedEmote:Destroy()
    end
end

if RunService:IsRunning() then
    Emotes:On("Execute", function(a1, a2, a3, ...) -- Line: 359 -- upvalues: u15 (val) -- types: a1: userdata, a2: string, a3: string
        local v1 = u15.GetEntityFromPlayer(a1)
        local Emote = v1 and v1.Emote and v1.Emote.CurrentAnimator
        if Emote and Emote.Name == a2 then
            local Executables = Emote.Executables
            if Executables and Executables[a3] then
                Executables[a3](...)
            end
        end
    end)
    Scheduler.add("CharacterReplicator", RunService.Heartbeat, function(a1) -- Line: 373 -- upvalues: u57 (val)
        for i, j in u57 do
            j:Step(a1)
        end
    end)
end
return u15