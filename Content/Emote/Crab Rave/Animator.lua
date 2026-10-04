-- Script path: ReplicatedStorage.Content.Emote.Crab Rave.Animator
-- Decompile time: 1.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

local function toggleParticles(a1, a2) -- Line: 13 -- types: a1: userdata, a2: boolean
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j.Enabled = a2
        end
    end
end

function v1.Initialize(a1) -- Line: 21 -- upvalues: EasySound (val), toggleParticles (val)
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Humanoid = Instance:WaitForChild("Humanoid")
    local CRABs = Instance:WaitForChild("CRABs")
    local Animations = CRABs:WaitForChild("Animations")
    local RootPart = CRABs:WaitForChild("RootPart")
    local RootMotor = CRABs:WaitForChild("RootMotor")
    local Animator = (CRABs:WaitForChild("AnimationController")):WaitForChild("Animator")
    RootMotor.Part0 = HumanoidRootPart
    RootMotor.Part1 = RootPart
    RootMotor.C0 = CFrame.new(0, -Humanoid.HipHeight - HumanoidRootPart.Size.Y / 2, 0)
    if not a1.Preview and a1.Local then
        a1._sound = EasySound.Play({
            id = 100398234728079,
            looped = true,
            volume = 0.5,
            soundGroupName = "Emotes",
            timeScaled = false,
            position = HumanoidRootPart.Position,
        })
    end
    a1._crabAnimations = {
        intro = Animator:LoadAnimation((Animations:WaitForChild("Intro"))),
        loop = Animator:LoadAnimation((Animations:WaitForChild("Loop"))),
    }
    a1._crabAnimations.intro.Looped = false
    a1._crabAnimations.intro:Play()
    a1:PreloadTrack("rbxassetid://134558138326100")
    a1:PreloadTrack("rbxassetid://128117708781178")
    a1:OnTrackPlayed("rbxassetid://134558138326100", function(a1_2) -- Line: 55
        -- upvalues: toggleParticles (upval), RootPart (val), HumanoidRootPart (val), a1 (val)
        toggleParticles(RootPart, true)
        task.wait(0.5)
        toggleParticles(HumanoidRootPart, false)
        a1:PlayTrack("rbxassetid://128117708781178")
        a1_2:Stop()
        a1._crabAnimations.loop:Play()
    end)
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 67
    if self._sound then
        self._sound:Destroy()
    end
end

return v1