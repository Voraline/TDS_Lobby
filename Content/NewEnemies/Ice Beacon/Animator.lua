-- Script path: ReplicatedStorage.Content.NewEnemies.Ice Beacon.Animator
-- Decompile time: 3.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local u43 = Random.new()

function v1.Initialize(a1) -- Line: 23
    -- upvalues: u43 (val), EasySound (val), TweenService (val), RunService (val), GameState (val), EmitterManager (val)
    -- upvalues: NPCReplicator (val)
    local HumanoidRootPart = a1.Model:WaitForChild("HumanoidRootPart")
    local Head = a1.Model.Head
    local Torso_2 = a1.Model.Torso
    local Torso = (a1.Model:WaitForChild("HumanoidRootPart")):WaitForChild("Torso")
    local u24 = u43:NextNumber(0, 6.283185307179586)
    local u30 = u43:NextNumber(0, 6.283185307179586)
    local u36 = u43:NextNumber(0, 6.283185307179586)
    local u37 = -5
    local u38 = 0
    local u39 = 0
    local u40 = 1
    local u41 = 0
    EasySound.Play({
        name = "Intro",
        id = 92112356230050,
        destroyOnEnd = true,
        soundGroupName = "Enemies",
        playbackSpeed = u43:NextNumber(0.8, 1.2),
        parent = HumanoidRootPart,
    })
    local u55 = EasySound.Play({
        name = "Loop",
        id = 96121327067512,
        volume = 0.25,
        looped = true,
        delay = 1,
        destroyOnEnd = true,
        soundGroupName = "Enemies",
        parent = HumanoidRootPart,
    })
    local Color = Head.Color
    local Color_2 = Torso_2.Color
    Head.Color = Color3.new()
    Torso_2.Color = Color3.new()
    TweenService:Create(Head, TweenInfo.new(1), {Color = Color}):Play()
    TweenService:Create(Torso_2, TweenInfo.new(1), {Color = Color_2}):Play()
    a1.Maid:Mark((RunService.RenderStepped:Connect(function(a1) -- Line: 64
        -- upvalues: GameState (upval), u37 (ref), u38 (ref), u39 (ref), u40 (ref), Torso (val), u36 (val), u41 (ref)
        -- upvalues: u24 (val), u30 (val)
        local v1 = a1 * GameState.TimeScale
        u37 = math.lerp(u37, u38, v1)
        u39 = math.lerp(u39, u40, v1)
        Torso.C0 = (CFrame.new(0, u37 + math.sin(u36 + u41 * 2) * 0.5, 0)) * CFrame.Angles(0, 1.0471975511965976 * (u24 + u41), math.cos(u30 + u41 * 2) * 0.17453292519943295)
        u41 = u41 + v1 * u39
    end)))
    a1.Executables = {
        Death = function() -- Line: 84
            -- upvalues: u38 (ref), u40 (ref), EmitterManager (upval), HumanoidRootPart (val), a1 (val)
            -- upvalues: TweenService (upval), u55 (val), EasySound (upval), u43 (upval)
            local v1, v2, v3
            u38 = -2.5
            u40 = 0
            EmitterManager.manualEmit(HumanoidRootPart.Explosion)
            for i, v in ipairs(a1.Model:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Beam") then
                    v.Enabled = false
                elseif v:IsA("BasePart") then
                    v1 = TweenService
                    v2 = TweenInfo.new(2)
                    v3 = {Color = Color3.new()}
                    v1:Create(v, v2, v3):Play()
                end
            end
            u55:Stop()
            EasySound.Play({
                name = "Shutdown",
                id = 123578756399413,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                parent = HumanoidRootPart,
                playbackSpeed = u43:NextNumber(0.8, 1.2),
            })
        end,
    }

    local function updateTarget(a1) -- Line: 110 -- upvalues: NPCReplicator (upval), Head (val)
        if not a1 then
            return
        end
        local v1 = NPCReplicator.GetNPCFromFolder(a1)
        if not v1 then
            return
        end
        local BeamAttachment = Head:WaitForChild("BeamAttachment")
        local BeamAttachment_2 = v1.Model.PrimaryPart:FindFirstChild("BeamAttachment")
        if not BeamAttachment_2 then
            return
        end
        for i, v in ipairs(BeamAttachment:GetChildren()) do
            if v:IsA("Beam") then
                v.Attachment1 = BeamAttachment_2
            end
        end
    end

    local v1 = a1.Replicator:WaitForState("Target")
    if v1 then
        updateTarget(v1)
    end
    ;(a1.Replicator:GetStateChangedSignal("Target")):Connect(updateTarget)
end

return v1