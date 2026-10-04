-- Script path: ReplicatedStorage.Content.Emote.Sandcastle.Animator
-- Decompile time: 1.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: EasySound (val)
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    Instance:WaitForChild("Humanoid")
    local Sandcastle = Instance:WaitForChild("Sandcastle")
    local ROOTPART_Motor = Sandcastle:WaitForChild("ROOTPART_Motor")
    local ROOTPART = Sandcastle:WaitForChild("ROOTPART")
    ROOTPART_Motor.Part0 = HumanoidRootPart
    ROOTPART_Motor.Part1 = ROOTPART
    Sandcastle.PrimaryPart = ROOTPART
    if a1.Preview then
        return
    end
    a1:OnTrackPlayed("rbxassetid://110340070503700", function(a1_2) -- Line: 24
        -- upvalues: a1 (val), EasySound (upval), HumanoidRootPart (val), Instance (val), Sandcastle (val)
        a1._sound = EasySound.Play({
            id = 87114175082669,
            volume = 0.5,
            soundGroupName = "Emotes",
            timeScaled = false,
            position = HumanoidRootPart.Position,
            parent = Instance,
        })
        a1._connection = a1_2.Stopped:Once(function() -- Line: 35 -- upvalues: a1 (upval), a1_2 (val), Sandcastle (upval)
            if not a1.Playing and a1_2.TimePosition ~= a1_2.Length then
                return
            end
            local u44 = Sandcastle:Clone()
            for i, j in u44:GetDescendants() do
                if j:IsA("Motor6D") then
                    j:Destroy()
                end
                if j:IsA("BasePart") then
                    j.Anchored = true
                    j.CanCollide = false
                    j.CanTouch = false
                    j.CanQuery = false
                end
            end
            u44.Parent = workspace
            task.delay(20, function() -- Line: 56 -- upvalues: u44 (val)
                u44:Destroy()
            end)
        end)
    end)
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 65
    if self._sound then
        self._sound:Destroy()
        self._sound = nil
    end
    if self._connection then
        self._connection:Disconnect()
        self._connection = nil
    end
end

return v1