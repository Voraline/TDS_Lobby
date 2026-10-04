-- Script path: ReplicatedStorage.Content.Emote.Flipping Burgers.Animator
-- Decompile time: 2.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 19 -- upvalues: EasySound (val)
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Grilling = Instance:WaitForChild("Grilling")
    local Patty = Grilling:WaitForChild("Patty")
    local Spatula = Grilling:WaitForChild("Spatula")
    local RightHand = Instance:WaitForChild("RightHand")
    local grill_base = Grilling:WaitForChild("Grill"):WaitForChild("grill_base")
    local PattyMotor = Grilling:WaitForChild("PattyMotor")
    local SpatulaMotor = Grilling:WaitForChild("SpatulaMotor")
    local GrillMotor = Grilling:WaitForChild("GrillMotor")
    PattyMotor.Part0 = HumanoidRootPart
    PattyMotor.Part1 = Patty
    SpatulaMotor.Part0 = RightHand
    SpatulaMotor.Part1 = Spatula
    GrillMotor.Part0 = HumanoidRootPart
    GrillMotor.Part1 = grill_base
    if a1.Preview then
        return
    end

    local function runFlipping() -- Line: 43 -- upvalues: a1 (val), EasySound (upval), HumanoidRootPart (val)
        if not a1.thread then
            a1.thread = task.spawn(function() -- Line: 45 -- upvalues: a1 (upval), EasySound (upval), HumanoidRootPart (upval)
                task.wait(2.3)
                while true do
                    a1:PlayTrack("rbxassetid://111268637496956")
                    task.wait(10)
                    a1._soundFlip = EasySound.Play({
                        id = 102346733773696,
                        destroyOnEnd = true,
                        volume = 0.5,
                        soundGroupName = "Emotes",
                        timeScaled = false,
                        position = HumanoidRootPart.Position,
                    })
                    a1:PlayTrack("rbxassetid://132855440430308")
                    task.wait(2.5)
                end
            end)
        end
    end

    a1._soundLoop = EasySound.Play({
        id = 105666534580655,
        destroyOnEnd = true,
        looped = true,
        volume = 0.5,
        soundGroupName = "Emotes",
        timeScaled = false,
        position = HumanoidRootPart.Position,
    })
    a1._soundFlip = EasySound.Play({
        id = 102346733773696,
        destroyOnEnd = true,
        volume = 0.5,
        soundGroupName = "Emotes",
        timeScaled = false,
        position = HumanoidRootPart.Position,
    })
    a1:PreloadTrack("rbxassetid://111268637496956")
    a1:PreloadTrack("rbxassetid://132855440430308")
    a1:OnTrackPlayed("rbxassetid://99131414572593", function(a1) -- Line: 84 -- types: a1: userdata
        task.wait(2.3)
        a1:Stop()
    end)
    if not a1.thread then
        a1.thread = task.spawn(function() -- Line: 45 -- upvalues: a1 (val), EasySound (upval), HumanoidRootPart (val)
            task.wait(2.3)
            while true do
                a1:PlayTrack("rbxassetid://111268637496956")
                task.wait(10)
                a1._soundFlip = EasySound.Play({
                    id = 102346733773696,
                    destroyOnEnd = true,
                    volume = 0.5,
                    soundGroupName = "Emotes",
                    timeScaled = false,
                    position = HumanoidRootPart.Position,
                })
                a1:PlayTrack("rbxassetid://132855440430308")
                task.wait(2.5)
            end
        end)
    end
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 93
    if self._soundLoop then
        self._soundLoop:Destroy()
    end
    if self._soundFlip then
        self._soundFlip:Destroy()
    end
    if self.thread then
        task.cancel(self.thread)
        self.thread = nil
    end
end

return v1