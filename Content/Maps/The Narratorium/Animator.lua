-- Script path: ReplicatedStorage.Content.Maps.The Narratorium.Animator
-- Decompile time: 4.12 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local GlobalBus = require(ReplicatedStorage.Shared.Modules.GlobalBus)
require(ReplicatedStorage.Shared.Modules.Maid)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local u46 = require(ReplicatedStorage.Client.Modules.TagReplicator)._new(ReplicatedStorage.StateReplicators:WaitForChild("NarratorMapReplicator"))

local function hideTowers() -- Line: 16
    for i, j in workspace:WaitForChild("Towers"):GetChildren() do
        if j:IsA("Model") then
            for k, n in j:GetDescendants() do
                if n:IsA("BasePart") then
                    n.LocalTransparencyModifier = 1
                end
            end
        end
    end
end

local function unHideTowers() -- Line: 28
    for i, j in workspace:WaitForChild("Towers"):GetChildren() do
        if j:IsA("Model") then
            for k, n in j:GetDescendants() do
                if n:IsA("BasePart") then
                    n.LocalTransparencyModifier = 0
                end
            end
        end
    end
end

local function hideCharacters() -- Line: 40 -- upvalues: Players (val)
    local Character
    for i, j in Players:GetPlayers() do
        Character = j.Character
        if Character then
            Character.PrimaryPart.Anchored = true
            Character:SetAttribute("OGPivot", (Character:GetPivot()))
            Character:PivotTo((CFrame.new(0, 5000, 0)))
        end
    end
end

local function unHideCharacters() -- Line: 51 -- upvalues: Players (val)
    local Attribute, Character
    for i, j in Players:GetPlayers() do
        Character = j.Character
        if Character then
            Character.PrimaryPart.Anchored = false
            Attribute = Character:GetAttribute("OGPivot")
            if Attribute then
                Character:PivotTo(Attribute)
            end
        end
    end
end

return function(a1, a2) -- Line: 64
    -- upvalues: GlobalBus (val), Shaker (val), GameState (val), u46 (val), CollectionService (val), unHideTowers (val)
    -- upvalues: unHideCharacters (val), hideCharacters (val), hideTowers (val)
    local u12 = require((a1:WaitForChild("AnimatorCode")):WaitForChild("Main"))()
    a2:Mark((GlobalBus.Connect("ToggleMapLights", function(a1) -- Line: 67 -- upvalues: u12 (val) -- types: a1: boolean
        u12.toggleLights(a1)
    end)))
    u12.setShaker(Shaker)
    u12.makePhaseInvisible(1)
    u12.makePhaseInvisible(2)
    u12.makePhaseInvisible(3)
    for i, j in u12.lights do
        j:Dance()
    end
    ;(GameState.Replicator:GetStateChangedSignal("Wave")):Connect(function(a1) -- Line: 81 -- upvalues: u12 (val) -- types: a1: number
        u12.toggleCardboardCutOut(a1)
    end)
    ;(u46:GetStateChangedSignal("Phase")):Connect(function(a1) -- Line: 85 -- upvalues: u46 (upval), u12 (val), CollectionService (upval) -- types: a1: number
        local v1 = u46:Get("PreviousPhase")
        u12.followSpline()
        u12.transitionMapPhase(v1, a1)
        task.delay(5, function() -- Line: 90 -- upvalues: CollectionService (upval)
            local v1
            for i, j in (CollectionService:GetTagged("Cloud")) do
                v1 = (j:GetAttribute("Height")) + 4
                j:SetAttribute("Height", v1)
            end
        end)
        if a1 == 3 then
            task.delay(4, function() -- Line: 98 -- upvalues: u12 (upval)
                for i, j in u12.mainGears do
                    j:Spin()
                end
            end)
            task.wait(10)
            u12.desturctionPhase()
        end
    end)
    ;(u46:GetStateChangedSignal("HideTowers")):Connect(function(a1) -- Line: 109
        -- upvalues: u12 (val), unHideTowers (upval), unHideCharacters (upval), hideCharacters (upval)
        -- upvalues: hideTowers (upval)
        if a1 then
            hideCharacters()
            hideTowers()
            return
        end
        u12.cancelSpline()
        unHideTowers()
        unHideCharacters()
    end)
    u12.toggleCardboardCutOut(GameState.Replicator:WaitForState("Wave"))
    a2:Mark(function() -- Line: 121 -- upvalues: u12 (val)
        u12.Destroy()
    end)
end