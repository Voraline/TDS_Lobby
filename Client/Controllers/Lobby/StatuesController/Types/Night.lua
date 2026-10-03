-- Script path: ReplicatedStorage.Client.Controllers.Lobby.StatuesController.Types.Night
-- Decompile time: 6.27 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Nights = LocalPlayer:WaitForChild("Nights")
local Level = LocalPlayer:WaitForChild("Level")
local Events = require(ReplicatedStorage.Shared.Data.Events)
local Nights_2 = require(ReplicatedStorage.Shared.Data.Nights)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local u44 = {}
local u45 = {}
local u46 = {}
u46.__index = u46
local u47 = {}

local function waitUntilInDistance(a1, a2, a3) -- Line: 23
    -- upvalues: Promise (val), LocalPlayer (val), Level (val), RunService (val)
    local u3 = a3 or 0
    return (Promise.new(function(a1_2, a2_2, a3) -- Line: 26
        -- upvalues: LocalPlayer (upval), Level (upval), u3 (ref), RunService (upval), a1 (val), a2 (val)
        local u3_2 = nil
        local Character = LocalPlayer.Character
        local u12 = Level.Value < u3
        local u20 = Level.Changed:Connect(function(a1) -- Line: 32 -- upvalues: u12 (ref), u3 (upval)
            u12 = a1 < u3
        end)
        local u28 = LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 36 -- upvalues: Character (ref)
            Character = a1
        end)
        u3_2 = RunService.Heartbeat:Connect(function() -- Line: 40
            -- upvalues: Character (ref), u12 (ref), a1 (upval), a2 (upval), u28 (ref), u3_2 (ref), u20 (ref)
            -- upvalues: a1_2 (val)
            if Character and Character.PrimaryPart and not u12 then
                if (Character.PrimaryPart.Position - a1.Position).Magnitude <= a2 then
                    u28:Disconnect()
                    u3_2:Disconnect()
                    u20:Disconnect()
                    a1_2()
                end
                return
            end
        end)
        a3(function() -- Line: 55 -- upvalues: u20 (ref), u28 (ref), u3_2 (ref)
            u20:Disconnect()
            u28:Disconnect()
            u3_2:Disconnect()
        end)
    end))
end

function u46.new(a1) -- Line: 63 -- upvalues: u47 (val), Maid (val), u46 (val), u45 (val) -- types: a1: userdata
    local v1 = a1:GetAttribute("Event") or ""
    local v2 = a1:GetAttribute("Mode") or ""
    local v3 = a1:GetAttribute("Night") or 1
    local v4 = a1:GetAttribute("NoCharacter") or false
    local v5 = u47[v2]
    local v6 = {
        Enabled = false,
        Maid = Maid.new(),
        Model = a1,
        Level = v5 or 0,
        Character = not v4 and a1:WaitForChild("Character"),
        Event = v1,
        Night = v3,
    }
    v5 = setmetatable(v6, u46)
    if v5:init() then
        u45[v5] = a1
    end
    return v5
end

function u46:init() -- Line: 88 -- upvalues: Nights_2 (val)
    local v1 = Nights_2.Nights[self.Event]
    local v2 = v1 and v1.nights[self.Night]
    if not v2 then
        warn((("\"%*\", Night \"%*\" does not exist "):format(self.Event, self.Night)))
        return
    end
    local Character = self.Character
    if Character then
        Character = self.Model:WaitForChild("Interaction")
    end
    self.Interaction = Character
    self.Starts = v2.startsAt
    self.Ends = v2.endsAt
    if Character then
        Character.Enabled = false
        ;(Character:GetPropertyChangedSignal("Enabled")):Connect(function() -- Line: 104 -- upvalues: Character (val), self (val)
            if Character.Enabled ~= self.Enabled then
                Character.Enabled = self.Enabled
            end
        end)
    end
    if v1.init then
        v1.init(self)
    end
    return self
end

function u46:Destroy() -- Line: 118 -- upvalues: u45 (val), u44 (val)
    u45[self] = nil
    u44[self] = nil
    self.Maid:Destroy()
end

task.spawn(function() -- Line: 125
    -- upvalues: u45 (val), u44 (val), Nights_2 (val), Events (val), Nights (val), Promise (val), LocalPlayer (val)
    -- upvalues: Level (val), RunService (val)
    local Event, new, startsAt, v1, v2, v3, v4
    local v5 = {}
    while true do
        v1 = nil
        v2 = nil
        for i in u45, v1, v2 do
            if not u44[i] then
                local u20 = Nights_2.Nights[i.Event]
                v3 = u20 and u20.nights[i.Night]
                if v3 then
                    startsAt = v3.startsAt or u20.startsAt
                    if startsAt then
                        u20.ended = not Events.isActive(i.Event)
                        v4 = startsAt.UnixTimestamp - workspace:GetServerTimeNow()
                        if u20.countDown then
                            u20.countDown(i, (math.max(0, v4)))
                        end
                        if not (v4 > 0) then
                            if not v5[i] then
                                v5[i] = true
                                if u20.hideCountDown then
                                    u20.hideCountDown(i)
                                end
                            end
                            Event = i.Event
                            if not Events.getEvent(Event) then
                                if not ((Nights:GetAttribute(Event) or 1) < i.Night) then
                                    u44[i] = true
                                    local PrimaryPart = i.Model.PrimaryPart
                                    local u90 = i.Level or 0
                                    new = Promise.new
                                    local u93 = 25
                                    ;(new(function(a1, a2, a3) -- Line: 26
                                        -- upvalues: LocalPlayer (upval), Level (upval), u90 (ref), RunService (upval)
                                        -- upvalues: PrimaryPart (val), u93 (val)
                                        local u3 = nil
                                        local Character = LocalPlayer.Character
                                        local u12 = Level.Value < u90
                                        local u20 = Level.Changed:Connect(function(a1) -- Line: 32 -- upvalues: u12 (ref), u90 (upval)
                                            u12 = a1 < u90
                                        end)
                                        local u28 = LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 36 -- upvalues: Character (ref)
                                            Character = a1
                                        end)
                                        u3 = RunService.Heartbeat:Connect(function() -- Line: 40
                                            -- upvalues: Character (ref), u12 (ref), PrimaryPart (upval), u93 (upval)
                                            -- upvalues: u28 (ref), u3 (ref), u20 (ref), a1 (val)
                                            if Character and Character.PrimaryPart and not u12 then
                                                if (Character.PrimaryPart.Position - PrimaryPart.Position).Magnitude <= u93 then
                                                    u28:Disconnect()
                                                    u3:Disconnect()
                                                    u20:Disconnect()
                                                    a1()
                                                end
                                                return
                                            end
                                        end)
                                        a3(function() -- Line: 55 -- upvalues: u20 (ref), u28 (ref), u3 (ref)
                                            u20:Disconnect()
                                            u28:Disconnect()
                                            u3:Disconnect()
                                        end)
                                    end)):andThen(function() -- Line: 177 -- upvalues: u20 (val), i (val)
                                        if u20.intro then
                                            u20.intro(i)
                                        end
                                        if u20.unlock then
                                            u20.unlock(i)
                                        end
                                        i.Enabled = true
                                        if i.Character then
                                            i.Interaction.Enabled = true
                                        end
                                    end)
                                end
                            elseif Events.isActive(i.Event) and not ((Nights:GetAttribute(Event) or 1) < i.Night) then
                                u44[i] = true
                                local PrimaryPart = i.Model.PrimaryPart
                                local u90 = i.Level or 0
                                new = Promise.new
                                local u93 = 25
                                ;(new(function(a1, a2, a3) -- Line: 26
                                    -- upvalues: LocalPlayer (upval), Level (upval), u90 (ref), RunService (upval)
                                    -- upvalues: PrimaryPart (val), u93 (val)
                                    local u3 = nil
                                    local Character = LocalPlayer.Character
                                    local u12 = Level.Value < u90
                                    local u20 = Level.Changed:Connect(function(a1) -- Line: 32 -- upvalues: u12 (ref), u90 (upval)
                                        u12 = a1 < u90
                                    end)
                                    local u28 = LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 36 -- upvalues: Character (ref)
                                        Character = a1
                                    end)
                                    u3 = RunService.Heartbeat:Connect(function() -- Line: 40
                                        -- upvalues: Character (ref), u12 (ref), PrimaryPart (upval), u93 (upval)
                                        -- upvalues: u28 (ref), u3 (ref), u20 (ref), a1 (val)
                                        if Character and Character.PrimaryPart and not u12 then
                                            if (Character.PrimaryPart.Position - PrimaryPart.Position).Magnitude <= u93 then
                                                u28:Disconnect()
                                                u3:Disconnect()
                                                u20:Disconnect()
                                                a1()
                                            end
                                            return
                                        end
                                    end)
                                    a3(function() -- Line: 55 -- upvalues: u20 (ref), u28 (ref), u3 (ref)
                                        u20:Disconnect()
                                        u28:Disconnect()
                                        u3:Disconnect()
                                    end)
                                end)):andThen(function() -- Line: 177 -- upvalues: u20 (val), i (val)
                                    if u20.intro then
                                        u20.intro(i)
                                    end
                                    if u20.unlock then
                                        u20.unlock(i)
                                    end
                                    i.Enabled = true
                                    if i.Character then
                                        i.Interaction.Enabled = true
                                    end
                                end)
                            end
                        end
                    end
                end
            end
        end
        RunService.Heartbeat:Wait()
    end
end)
return u46