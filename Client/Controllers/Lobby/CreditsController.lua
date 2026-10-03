-- Script path: ReplicatedStorage.Client.Controllers.Lobby.CreditsController
-- Decompile time: 2.03 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UsernameFromId = require(ReplicatedStorage.Shared.Modules.UsernameFromId)
;(workspace:WaitForChild("Lobby")):WaitForChild("Credits")
local u29 = {
    BodyTypeScale = 0.3,
    DepthScale = 1,
    HeadScale = 1,
    HeightScale = 0.95,
    ProportionScale = 1,
    WidthScale = 1,
}

function setupCharacter(a1) -- Line: 18 -- upvalues: CollectionService (val)
    local Neck = a1:FindFirstChild("Neck", true)
    local Waist = a1:FindFirstChild("Waist", true)
    if Neck and Waist then
        local Folder = Instance.new("Folder")
        Folder.Name = "Config"
        Folder.Parent = a1
        local ObjectValue = Instance.new("ObjectValue")
        ObjectValue.Name = "Neck"
        ObjectValue.Value = Neck
        ObjectValue.Parent = Folder
        local ObjectValue_2 = Instance.new("ObjectValue")
        ObjectValue_2.Name = "Waist"
        ObjectValue_2.Value = Waist
        ObjectValue_2.Parent = Folder
        CollectionService:AddTag(a1, "STATUE")
        return
    end
end

function loadCharacter(a1, a2) -- Line: 42 -- upvalues: Players (val), u29 (val)
    local Pivot = a1:GetPivot()
    task.spawn(function() -- Line: 45 -- upvalues: Players (upval), a2 (val), u29 (upval), Pivot (val), a1 (val)
        local HumanoidDescriptionFromUserId = Players:GetHumanoidDescriptionFromUserId(a2)
        for k, v in pairs(u29) do
            HumanoidDescriptionFromUserId[k] = v
        end
        local v1 = Players:CreateHumanoidModelFromDescription(HumanoidDescriptionFromUserId, Enum.HumanoidRigType.R15)
        local Animate = v1:FindFirstChild("Animate")
        local v2 = v1:FindFirstChild("idle", true):GetChildren()[1]
        if v2 then
            v2.Name = "Animation"
            v2.Parent = v1
        end
        if Animate then
            Animate:Destroy()
        end
        setupCharacter(v1)
        v1.PrimaryPart.Anchored = true
        v1.Name = "Character"
        v1.Humanoid.BreakJointsOnDeath = false
        v1.Humanoid.RequiresNeck = false
        v1.Humanoid.EvaluateStateMachine = false
        for k2, i in pairs(v1:GetDescendants()) do
            if i:IsA("BasePart") then
                i.CollisionGroup = "Players"
                i.CanCollide = false
                i.CanTouch = false
                i.CanQuery = false
            end
        end
        v1:PivotTo(Pivot)
        v1.Parent = a1.Parent
        a1:Destroy()
    end)
end

;(CollectionService:GetInstanceAddedSignal("DevStatue")):Connect(function(a1) -- Line: 91 -- upvalues: UsernameFromId (val)
    local Character = a1:WaitForChild("Character")
    local Stand = a1:WaitForChild("Stand")
    local v1 = tonumber(a1.Name)
    local v2 = UsernameFromId(v1, false)
    local Username = (Stand:WaitForChild("Title")):WaitForChild("SurfaceGui"):WaitForChild("Username")
    loadCharacter(Character, v1)
    Username.Text = "@" .. v2
end)
task.spawn(function() -- Line: 106 -- upvalues: CollectionService (val), UsernameFromId (val)
    local Character, Stand, Username, v1, v2
    for k, v in pairs(CollectionService:GetTagged("DevStatue")) do
        Character = v:WaitForChild("Character")
        Stand = v:WaitForChild("Stand")
        v1 = tonumber(v.Name)
        v2 = UsernameFromId(v1, false)
        Username = (Stand:WaitForChild("Title")):WaitForChild("SurfaceGui"):WaitForChild("Username")
        loadCharacter(Character, v1)
        Username.Text = "@" .. v2
    end
end)
return true