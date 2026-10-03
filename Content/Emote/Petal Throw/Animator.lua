-- Script path: ReplicatedStorage.Content.Emote.Petal Throw.Animator
-- Decompile time: 0.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: EmitterManager (val), RunService (val)
    local RightHand = a1.Character.Instance:WaitForChild("RightHand")
    local Basket = a1.Character.Instance:WaitForChild("Basket")
    Basket:WaitForChild("BasketMotor").Part0 = RightHand
    if not a1.Preview then
        a1:OnTrackPlayed("rbxassetid://77612755835022", function(a1) -- Line: 17 -- upvalues: EmitterManager (upval), Basket (val) -- types: a1: userdata
            (a1:GetMarkerReachedSignal("Confetti")):Connect(function() -- Line: 18 -- upvalues: EmitterManager (upval), Basket (upval)
                EmitterManager.manualEmit(Basket)
            end)
        end)
    end
    if a1.Local then
        local Character = a1.Character
        local Root = Character.Root
        local Humanoid = Character.Humanoid
        a1.Maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 28 -- upvalues: Humanoid (val), Root (val)
            Humanoid:MoveTo(Root.Position + Root.CFrame.LookVector * 10)
        end)))
    end
end

function v1.Destroy(a1) -- Line: 34
    if a1.Local then
        a1.Character.Humanoid:MoveTo(a1.Character.Root.Position)
    end
end

return v1