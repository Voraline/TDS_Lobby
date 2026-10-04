-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Runtime.NPC
-- Decompile time: 5.89 ms

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Dependencies = require(script.Parent.Parent.Dependencies)
local Trove = Dependencies.get("Trove")
local Charm = Dependencies.get("Charm")
local FractalitySpring = Dependencies.get("FractalitySpring")
require(script.Parent.Parent.Types)
local Atoms = require(script.Parent.Parent.Atoms)
local Config = require(script.Parent.Parent.Config)
local u43 = {}
u43.__index = u43

local function peekAtom(a1) -- Line: 29 -- upvalues: Charm (val)
    local peek = Charm.peek
    if peek then
        return peek(a1)
    end
    return Charm.untracked(a1)
end

function u43.new(a1) -- Line: 65 -- upvalues: u43 (val), Trove (val), Charm (val)
    local v1 = setmetatable({}, u43)
    v1.id = a1.id
    v1.config = a1
    v1.model = a1.model
    v1.trove = Trove.new()
    v1.bonesSprings = {}
    v1.animations = {idleActions = {}}
    v1.idleActionThread = nil
    v1.isPlayingIdleActions = false
    v1.proximityPrompt = nil
    v1.atoms = {isActive = Charm.atom(false), isPlayerNearby = Charm.atom(false)}
    u43._initLookBones(v1)
    u43._initAnimations(v1)
    u43._initProximityPrompt(v1)
    u43._initSubscribers(v1)
    u43._initRenderLoop(v1)
    return v1
end

function u43._initLookBones(a1) -- Line: 94 -- upvalues: FractalitySpring (val) -- types: a1: table
    local speed_2, v1
    local lookBones = a1.config.lookBones
    if not lookBones then
        return
    end
    local v2 = nil
    local v3 = nil
    local v4 = a1
    for i, j in lookBones, v2, v3 do
        v1 = v4.model:FindFirstChild(i, true)
        if v1 and v1:IsA("Bone") then
            speed_2 = if typeof(j.speed) ~= "number" then j.speed() else j.speed
            table.insert(v4.bonesSprings, {
                bone = v1,
                spring = FractalitySpring.new(j.damper, speed_2, CFrame.identity, CFrame.identity),
                entry = j,
            })
        end
    end
end

function u43._initAnimations(a1) -- Line: 115 -- types: a1: table
    local AnimationController = a1.model:FindFirstChildOfClass("AnimationController")
    if not AnimationController then
        return
    end
    local Animations = a1.model:FindFirstChild("Animations")
    if not Animations then
        return
    end
    local Idle = Animations:FindFirstChild("Idle")
    if Idle and Idle:IsA("Animation") then
        a1.animations.idle = AnimationController:LoadAnimation(Idle)
    end
    local Greet = Animations:FindFirstChild("Greet")
    if Greet and Greet:IsA("Animation") then
        a1.animations.greet = AnimationController:LoadAnimation(Greet)
    end
    local IdleActions = Animations:FindFirstChild("IdleActions")
    if IdleActions then
        for i, j in IdleActions:GetChildren() do
            if j:IsA("Animation") then
                table.insert(a1.animations.idleActions, (AnimationController:LoadAnimation(j)))
            end
        end
    end
    if a1.animations.idle then
        a1.animations.idle:Play()
    end
end

function u43._initProximityPrompt(a1) -- Line: 151 -- upvalues: Atoms (val), Charm (val) -- types: a1: table
    local PrimaryPart = a1.model.PrimaryPart or a1.model:FindFirstChild("HumanoidRootPart")
    if not PrimaryPart then
        return
    end
    local Attachment = Instance.new("Attachment")
    a1.trove:Add(Attachment)
    Attachment.Parent = PrimaryPart
    local ProximityPrompt = Instance.new("ProximityPrompt")
    a1.trove:Add(ProximityPrompt)
    ProximityPrompt.ActionText = a1.config.promptAction or "Talk"
    ProximityPrompt.ObjectText = a1.config.promptObject or ""
    ProximityPrompt.MaxActivationDistance = 12
    ProximityPrompt.HoldDuration = 0
    ProximityPrompt.RequiresLineOfSight = false
    ProximityPrompt.Parent = Attachment
    a1.proximityPrompt = ProximityPrompt
    a1.trove:Connect(ProximityPrompt.Triggered, function(a1_2) -- Line: 172 -- upvalues: Atoms (upval), Charm (upval), a1 (val) -- types: a1_2: userdata
        local currentNpcId = Atoms.currentNpcId
        local peek = Charm.peek
        if (if not peek then Charm.untracked(currentNpcId) else peek(currentNpcId)) == a1.id then
            return
        end
        Atoms.currentNpcId(a1.id)
    end)
end

function u43._initSubscribers(a1) -- Line: 181 -- upvalues: Charm (val), Atoms (val), u43 (val) -- types: a1: table
    local u5 = Charm.subscribe(function() -- Line: 182 -- upvalues: Atoms (upval)
        return Atoms.currentNpcId()
    end, function(a1_2) -- Line: 184 -- upvalues: a1 (val), u43 (upval) -- types: a1_2: string?
        local v1
        a1.atoms.isActive(a1_2 == a1.id)
        if a1.proximityPrompt then
            a1.proximityPrompt.Enabled = not v1
        end
        if not v1 then
            u43._playIdleActions(a1)
            return
        end
        u43._stopIdleActions(a1)
        if not a1.animations.greet then
            return
        end
        a1.animations.greet:Play()
    end)
    a1.trove:Add({
        Disconnect = function(a1) -- Line: 202 -- upvalues: u5 (val)
            u5()
        end,
    })
    u43._playIdleActions(a1)
end

function u43._playIdleActions(a1) -- Line: 210 -- types: a1: table
    if not a1.isPlayingIdleActions and #a1.animations.idleActions ~= 0 then
        a1.isPlayingIdleActions = true
        a1.idleActionThread = task.spawn(function() -- Line: 216 -- upvalues: a1 (val)
            local v1
            while a1.isPlayingIdleActions do
                task.wait((math.random(4, 10)))
                if not a1.isPlayingIdleActions then
                    break
                end
                v1 = a1.animations.idleActions[(math.random(1, #a1.animations.idleActions))]
                v1:Play()
                v1.Stopped:Wait()
            end
        end)
        return
    end
end

function u43._stopIdleActions(a1) -- Line: 233 -- types: a1: table
    a1.isPlayingIdleActions = false
    if a1.idleActionThread then
        task.cancel(a1.idleActionThread)
        a1.idleActionThread = nil
    end
    for i, j in a1.animations.idleActions do
        j:Stop()
    end
end

function u43._handleIsPlayerNearby(a1) -- Line: 245 -- upvalues: Players (val) -- types: a1: table
    local LocalPlayer = Players.LocalPlayer
    if LocalPlayer and LocalPlayer.Character then
        local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local PrimaryPart = a1.model.PrimaryPart or a1.model:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart and PrimaryPart then
            local v1 = HumanoidRootPart.Position - PrimaryPart.Position
            if 25 < v1.Magnitude then
                a1.atoms.isPlayerNearby(false)
                return
            end
            a1.atoms.isPlayerNearby(-0.2 < (PrimaryPart.CFrame.LookVector:Dot(v1.Unit)))
            return
        end
        a1.atoms.isPlayerNearby(false)
        return
    end
    a1.atoms.isPlayerNearby(false)
end

function u43._applyLookSpring(a1, a2) -- Line: 274 -- types: a1: table, a2: userdata
    local axisMask, entry, speed, spring, v1, v2, v3, v4
    local v5 = nil
    local v6 = nil
    for i, j in a1.bonesSprings, v5, v6 do
        entry = j.entry
        spring = j.spring
        v4 = a2
        axisMask = entry.axisMask
        if axisMask ~= Vector3.new(1, 1, 1) then
            v1, v2, v3 = v4:ToEulerAnglesXYZ()
            v4 = CFrame.fromEulerAnglesXYZ(v1 * axisMask.X, v2 * axisMask.Y, v3 * axisMask.Z)
        end
        spring:setGoal((CFrame.identity:Lerp(v4, entry.weight)))
        speed = entry.speed
        if typeof(speed) ~= "number" then
            spring:setFrequency((speed()))
        end
    end
end

function u43._renderNPCMovement(a1, a2) -- Line: 296 -- types: a1: table, a2: number
    for i, j in a1.bonesSprings do
        j.bone.Transform = j.spring:step(a2)
    end
end

function u43._resetLookSprings(a1, a2) -- Line: 304 -- types: a1: table, a2: number
    local spring
    for i, j in a1.bonesSprings do
        spring = j.spring
        spring:setGoal(CFrame.identity)
        j.bone.Transform = spring:step(a2)
    end
end

function u43._initRenderLoop(a1) -- Line: 312
    -- upvalues: RunService (val), u43 (val), Players (val), Charm (val), Config (val), Atoms (val)
    a1.trove:Connect(RunService.RenderStepped, function(a1_2) -- Line: 313
        -- upvalues: u43 (upval), a1 (val), Players (upval), Charm (upval), Config (upval), Atoms (upval)
        u43._handleIsPlayerNearby(a1)
        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local PrimaryPart = a1.model.PrimaryPart or a1.model:FindFirstChild("HumanoidRootPart")
        local isActive = a1.atoms.isActive
        local peek = Charm.peek
        if (if not peek then Charm.untracked(isActive) else peek(isActive)) and Character and PrimaryPart then
            local Magnitude = (Character.Position - PrimaryPart.Position).Magnitude
            if Config.MaxDialogDistance < Magnitude then
                Atoms.currentNpcId(nil)
            end
        end
        local isPlayerNearby = a1.atoms.isPlayerNearby
        local peek_2 = Charm.peek
        local v1 = if not peek_2 then Charm.untracked(isPlayerNearby) else peek_2(isPlayerNearby)
        local v2 = a1.config.isWatchingPlayer ~= false
        if v1 and v2 and Character and PrimaryPart then
            local v3 = #a1.bonesSprings
            if v3 > 0 then
                v3 = (CFrame.lookAt(PrimaryPart.Position, Character.Position)):ToObjectSpace(PrimaryPart.CFrame):Inverse()
                u43._applyLookSpring(a1, v3)
                u43._renderNPCMovement(a1, a1_2)
                return
            end
        end
        if #a1.bonesSprings > 0 then
            u43._resetLookSprings(a1, a1_2)
        end
    end)
end

function u43.destroy(a1) -- Line: 343 -- upvalues: u43 (val) -- types: a1: table
    u43._stopIdleActions(a1)
    a1.trove:Destroy()
end

return u43