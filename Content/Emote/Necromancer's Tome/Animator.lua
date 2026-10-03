-- Script path: ReplicatedStorage.Content.Emote.Necromancer's Tome.Animator
-- Decompile time: 1.54 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14 -- upvalues: EmitterManager (val)
    local v1, v2, v3
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local tomebook = Instance:WaitForChild("tomebook")
    local v4 = tomebook:Clone()
    a1.OutroMaid:Mark(v4)
    v4.Parent = Instance
    local tomebookfinal = v4:WaitForChild("tomebookfinal")
    tomebookfinal:WaitForChild("tomebookfinal").Part0 = HumanoidRootPart
    tomebook:Destroy()
    for i = 1, 3 do
        v3 = Instance:WaitForChild("Skeleton" .. i)
        v1 = v3:Clone()
        a1.OutroMaid:Mark(v1)
        v1.Parent = v3.Parent
        v3:Destroy()
        v2 = v1:WaitForChild("Torso" .. i)
        v2:WaitForChild("Torso").Part0 = HumanoidRootPart
    end
    local TomeEffect = Instance:WaitForChild("TomeEffect")
    local u78 = TomeEffect:Clone()
    a1.OutroMaid:Mark(u78)
    u78.Parent = Instance
    TomeEffect:Destroy()
    local Cast = Instance:WaitForChild("Cast")
    local u94 = Cast:Clone()
    a1.OutroMaid:Mark(u94)
    u94.Parent = Instance
    Cast:Destroy()
    v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    v1.FilterDescendantsInstances = {Instance}
    v2 = workspace:Raycast(HumanoidRootPart.Position, Vector3.new(0, -15, 0), v1)
    if not v2 then
        u78:PivotTo(HumanoidRootPart.CFrame * (CFrame.new(0, -3, 0)))
        u94:PivotTo(HumanoidRootPart.CFrame * (CFrame.new(0, -3, 0)))
    else
        u78:PivotTo((CFrame.new(v2.Position)))
        u94:PivotTo((CFrame.new(v2.Position)))
    end
    a1._animations = {
        loop = a1:LoadAnimation("rbxassetid://83701340486129"),
        unequip = a1:LoadAnimation("rbxassetid://109154974023448", true),
    }
    a1._initialized = true
    a1:OnTrackPlayed("rbxassetid://137220010575770", function(a1_2) -- Line: 65 -- upvalues: EmitterManager (upval), u94 (val), u78 (val), a1 (val) -- types: a1_2: userdata
        EmitterManager.manualEmit(u94)
        task.wait(0.25)
        EmitterManager.toggle(u78, true)
        task.wait(4.01)
        a1_2:Stop()
        a1._animations.loop:Play()
    end)
end

function v1:Destroy() -- Line: 75
    if self._initialized and not self.Preview then
        self._animations.unequip:Play()
        self:FinishAfter(1.6)
        return
    end
    self.OutroMaid:Sweep()
end

return v1