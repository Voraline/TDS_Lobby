-- Script path: ReplicatedStorage.Content.Emote.Jolly Tree.Animator
-- Decompile time: 2.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local u21 = {HumanoidRootPart = true, Head = true, Collider = true, Camera = true}
local u27 = Random.new()
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15
    -- upvalues: u21 (val), EasySound (val), u27 (val), SpringClass (val), RunService (val)
    local Name_2
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Humanoid = Instance:WaitForChild("Humanoid")
    if a1.Preview then
        local Name
        Humanoid.HipHeight = 2
        for k, n in Instance:GetChildren() do
            Name = n.Name
            if n:IsA("BasePart") and not u21[Name] then
                n.Transparency = 1
            end
        end
        return
    end
    local JollyTreeAccessory = Instance:WaitForChild("JollyTreeAccessory")
    local u40 = a1:PreloadTrack("rbxassetid://76443658660552")
    local v1 = a1:PlayTrack("rbxassetid://125747725390673")
    a1._connections = {}
    a1._transparencyCache = {}
    for i, j in Instance:GetChildren() do
        Name_2 = j.Name
        if j:IsA("BasePart") and not u21[Name_2] then
            a1._transparencyCache[j] = j.Transparency
        end
    end
    v1.Ended:Once(function() -- Line: 47 -- upvalues: a1 (val)
        if not a1:IsPlaying() then
            return
        end
        for i, j in a1._transparencyCache do
            i.Transparency = 1
        end
    end)
    local u73 = SpringClass.new(0, 0.2, 12)
    a1._connections.Movement = RunService.RenderStepped:Connect(function() -- Line: 68 -- upvalues: u73 (val), JollyTreeAccessory (val), Humanoid (val), u40 (val)
        JollyTreeAccessory:ScaleTo(1 + u73.p)
        local v1 = false
        if 0 < Humanoid.WalkSpeed then
            v1 = 0 < Humanoid.MoveDirection.Magnitude
        end
        if v1 and not u40.IsPlaying then
            u40:Play()
            local v2 = u73
            v2.v = v2.v + 0.5
        end
    end)
    a1._connections.IntroSpring = (v1:GetMarkerReachedSignal("Impulse")):Connect(function(a1) -- Line: 81 -- upvalues: u73 (val) -- types: a1: number
        local v1 = u73
        v1.v = v1.v + a1
    end)
    a1._connections.IntroParticles = (v1:GetMarkerReachedSignal("Particles")):Connect(function() -- Line: 86 -- upvalues: JollyTreeAccessory (val)
        JollyTreeAccessory.Tree.Grass:Emit(20)
    end)
    a1._connections.IntroSounds = (v1:GetMarkerReachedSignal("Sound")):Connect(function(a1, a2) -- Line: 56
        -- upvalues: EasySound (upval), HumanoidRootPart (val), u27 (upval)
        EasySound.Play({
            timeScaled = false,
            destroyOnEnd = true,
            soundGroupName = "Emotes",
            id = a1,
            parent = HumanoidRootPart,
            pitch = a2 and u27:NextNumber(0.8, 1.2),
        })
    end)
    a1._connections.HopSounds = (u40:GetMarkerReachedSignal("Sound")):Connect(function(a1) -- Line: 92
        -- upvalues: EasySound (upval), HumanoidRootPart (val), u27 (upval), u73 (val)
        EasySound.Play({
            timeScaled = false,
            destroyOnEnd = true,
            soundGroupName = "Emotes",
            id = a1,
            parent = HumanoidRootPart,
            pitch = u27:NextNumber(0.8, 1.2),
        })
        local v1 = u73
        v1.v = v1.v + 0.5
    end)
    v1.Stopped:Wait()
    Humanoid.WalkSpeed = 12
end

function v1.Destroy(a1) -- Line: 101
    if a1.Preview then
        return
    end
    for k, v in pairs(a1._connections) do
        v:Disconnect()
    end
    for i, j in a1._transparencyCache do
        i.Transparency = j
    end
end

return v1