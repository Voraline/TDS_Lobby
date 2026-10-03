-- Script path: ReplicatedStorage.Content.Emote.Bunny Mech.Animator
-- Decompile time: 4.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u26 = {
    Player = {
        Equip = "rbxassetid://127864522375028",
        Idle = "rbxassetid://96552146652571",
        Walk = "rbxassetid://135440700509905",
        Jump = "rbxassetid://107510129856963",
    },
    Rig = {
        Equip = "rbxassetid://128224588975378",
        Idle = "rbxassetid://96546106027603",
        Walk = "rbxassetid://91499157202242",
        Jump = "rbxassetid://97450631824401",
    },
}
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 36
    -- upvalues: u26 (val), EasySound (val), spr (val), SpringClass (val), RunService (val)
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Humanoid = Instance:FindFirstChild("Humanoid")
    local BunnyMechEmoteRig = Instance:WaitForChild("BunnyMechEmoteRig")
    local Body = BunnyMechEmoteRig:WaitForChild("Body")
    local Animator = (BunnyMechEmoteRig:WaitForChild("AnimationController")):WaitForChild("Animator")

    local function playRigAnimation(a1_2) -- Line: 45 -- upvalues: a1 (val), Animator (val) -- types: a1_2: string
        return a1:PlayTrack(a1_2, nil, nil, nil, Animator)
    end

    a1:PlayTrack(u26.Rig.Idle, nil, nil, nil, Animator)
    if a1.Preview then
        Humanoid.HipHeight = 2
        return
    end
    local WalkSpeed = Humanoid.WalkSpeed
    local u42 = true
    local u43 = true
    local u45 = tick()
    local Scale = Instance:GetScale()
    local Replicator = a1:GetReplicator()
    EasySound.Play({
        id = 88749169834824,
        volume = 0.5,
        destroyOnEnd = true,
        soundGroupName = "Emotes",
        parent = Body,
    })
    if a1.Local then
        Humanoid.WalkSpeed = 0
        spr.target(Humanoid, 0.3, 1, {CameraOffset = Vector3.new(0, 3, 0) * Scale})
    end
    a1:PlayTrack(u26.Rig.Equip, nil, nil, nil, Animator)
    a1:PlayTrack(u26.Player.Equip).Stopped:Wait()
    local u95 = SpringClass.new(0, 1, 12)
    local u107 = a1:PlayTrack(u26.Rig.Walk, nil, nil, nil, Animator)
    local Local = a1.Local
    if Local then
        Local = a1:PlayTrack(u26.Player.Walk)
    end
    local u120 = EasySound.Create({id = 128289635378856, volume = 0.5, soundGroupName = "Emotes", parent = Body})
    local u124 = EasySound.Create({id = 128289635378856, volume = 0.5, soundGroupName = "Emotes", parent = Body})
    local u128 = EasySound.Create({
        id = 88749169834824,
        volume = 0.5,
        playbackSpeed = 2,
        soundGroupName = "Emotes",
        parent = Body,
    })
    Humanoid.WalkSpeed = WalkSpeed
    ;(u107:GetMarkerReachedSignal("Sound")):Connect(function(a1) -- Line: 107 -- upvalues: HumanoidRootPart (val), u120 (val), u124 (val) -- types: a1: string
        if 5 < HumanoidRootPart.AssemblyLinearVelocity.Magnitude then
            if a1 == "LeftStep" then
                u120:Play()
                return
            end
            u124:Play()
        end
    end)
    if not a1.Local then
        (Replicator:GetStateChangedSignal("Jump")):Connect(function(a1_2) -- Line: 153
            -- upvalues: u26 (upval), a1 (val), Animator (val), u128 (val), EasySound (upval), Body (val)
            if not a1_2 then
                EasySound.Play({
                    id = 132283898354568,
                    volume = 0.5,
                    destroyOnEnd = true,
                    soundGroupName = "Emotes",
                    parent = Body,
                })
                return
            end
            a1:PlayTrack(u26.Rig.Jump, nil, nil, nil, Animator)
            a1:PlayTrack(u26.Player.Jump)
            u128:Play()
        end)
    else
        a1._humanoidConn = Humanoid.StateChanged:Connect(function(a1_2, a2) -- Line: 120
            -- upvalues: u26 (upval), a1 (val), Animator (val), u42 (ref), u43 (ref), u128 (val), Humanoid (val)
            -- upvalues: EasySound (upval), Body (val), WalkSpeed (val), u45 (ref)
            if a2 ~= Enum.HumanoidStateType.Jumping then
                if a2 == Enum.HumanoidStateType.Landed then
                    EasySound.Play({
                        id = 132283898354568,
                        volume = 0.5,
                        destroyOnEnd = true,
                        soundGroupName = "Emotes",
                        parent = Body,
                    })
                    a1:ReplicateAction("Land")
                    u43 = true
                    Humanoid.WalkSpeed = WalkSpeed
                    u45 = tick()
                end
                return
            end
            a1:PlayTrack(u26.Rig.Jump, nil, nil, nil, Animator)
            if not a1.Local then
                return
            end
            u42 = false
            u43 = false
            a1:PlayTrack(u26.Player.Jump)
            u128:Play()
            Humanoid.WalkSpeed = 35
            a1:ReplicateAction("Jump")
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
        end)
    end
    a1._walkConn = RunService.PostSimulation:Connect(function() -- Line: 170
        -- upvalues: HumanoidRootPart (val), u95 (val), Humanoid (val), Scale (val), u107 (val), a1 (val), Local (val)
        -- upvalues: u42 (ref), u43 (ref), u45 (ref)
        u95.t = HumanoidRootPart.AssemblyLinearVelocity.Magnitude / 16
        local p = u95.p
        local v1 = not ((Humanoid:GetState()) == Enum.HumanoidStateType.Freefall) and math.clamp(p, 0.0001, 0.9999) or 0.001
        local v2 = math.max(2 - Scale, 1)
        u107:AdjustWeight(v1)
        u107:AdjustSpeed(v1 * v2)
        if a1.Local then
            Local:AdjustWeight(v1)
            Local:AdjustSpeed(v1 * v2)
            if not u42 and u43 and 2 < tick() - u45 then
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                u42 = true
            end
        end
    end)
end

function v1.Destroy(a1) -- Line: 196 -- upvalues: spr (val)
    if a1.Preview then
        return
    end
    local Humanoid = a1.Character.Instance.Humanoid
    if a1._walkConn then
        a1._walkConn:Disconnect()
        a1._walkConn = nil
    end
    if a1._humanoidConn then
        a1._humanoidConn:Disconnect()
        a1._humanoidConn = nil
    end
    if a1.Local then
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        spr.target(Humanoid, 1, 2, {CameraOffset = Vector3.new()})
    end
end

return v1