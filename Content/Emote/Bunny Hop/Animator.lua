-- Script path: ReplicatedStorage.Content.Emote.Bunny Hop.Animator
-- Decompile time: 1.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13 -- upvalues: EasySound (val), RunService (val)
    local RightHand = a1.Character.Instance:WaitForChild("RightHand")
    local BunnyMesh = (a1.Character.Instance:WaitForChild("BunnyMesh")):WaitForChild("BunnyMesh")
    BunnyMesh:WaitForChild("BunnyMesh").Part0 = RightHand
    if not a1.Preview then
        local u25 = EasySound.Create({
            id = 138247928917028,
            audioGroup = "Emotes",
            destroyOnEnd = true,
            volume = 0.5,
            parent = BunnyMesh,
        })
        local u29 = EasySound.Create({
            id = 79435343450313,
            audioGroup = "Emotes",
            looped = true,
            volume = 0.5,
            parent = BunnyMesh,
        })
        u25:Play()
        a1.Maid:Mark(function() -- Line: 35 -- upvalues: u25 (val), u29 (val)
            u25:Destroy()
            u29:Destroy()
        end)
        a1.Maid:Mark((u25.Ended:Once(function() -- Line: 39 -- upvalues: BunnyMesh (val), u29 (val)
            if BunnyMesh:IsDescendantOf(workspace) then
                u29:Play()
            end
        end)))
        if a1.Local then
            local Character = a1.Character
            local Root = Character.Root
            local Humanoid = Character.Humanoid
            a1.Maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 49 -- upvalues: Humanoid (val), Root (val)
                Humanoid:MoveTo(Root.Position + Root.CFrame.LookVector * 10)
            end)))
        end
    end
end

function v1:Destroy() -- Line: 56
    if self.Local then
        self.Character.Humanoid:MoveTo(self.Character.Root.Position)
    end
end

return v1