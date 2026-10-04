-- Script path: ReplicatedStorage.Content.Emote.Sun Bathing.Animator
-- Decompile time: 0.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14 -- upvalues: EasySound (val)
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local TanningChair = Instance:WaitForChild("TanningChair")
    local LoungechairMotor = TanningChair:WaitForChild("LoungechairMotor")
    local SheetMotor = TanningChair:WaitForChild("SheetMotor")
    local Sheet_2 = (TanningChair:WaitForChild("TanningSheet")):WaitForChild("Sheet_2")
    local loungechair = TanningChair:WaitForChild("loungechair")
    SheetMotor.Part0 = HumanoidRootPart
    SheetMotor.Part1 = Sheet_2
    LoungechairMotor.Part0 = HumanoidRootPart
    LoungechairMotor.Part1 = loungechair
    a1._sound = EasySound.Play({
        id = 136853751931198,
        destroyOnEnd = true,
        volume = 0.5,
        soundGroupName = "Emotes",
        timeScaled = false,
        position = HumanoidRootPart.Position,
    })
    if a1.Preview then
        local Humanoid = Instance:WaitForChild("Humanoid")
        Humanoid.HipHeight = 2
        return
    end
    a1:PreloadTrack("rbxassetid://136449912497444")
    a1:OnTrackPlayed("rbxassetid://113441922159950", function(a1_2) -- Line: 45 -- upvalues: a1 (val) -- types: a1_2: userdata
        task.wait(1.5)
        a1_2:Stop()
        a1:PlayTrack("rbxassetid://136449912497444")
    end)
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 54
    if self._sound then
        self._sound:Destroy()
    end
end

return v1