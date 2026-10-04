-- Script path: ReplicatedStorage.Content.Emote.Water The Plant.Animator
-- Decompile time: 2.67 ms

local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 16
    -- upvalues: CollectionService (val), Players (val), EasySound (val), Lighting (val), NewTween (val)
    if a1.Preview then
        if a1.Character.Instance:FindFirstChild("Sunflower") then
            a1.Character.Instance.Sunflower:Destroy()
        end
        return
    end
    local Instance = a1.Character.Instance
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    v1.IgnoreWater = true
    local u26 = Instance:WaitForChild("Sunflower"):Clone()
    Instance.Sunflower:Destroy()
    u26:AddTag("Sunflower_Emote")
    u26.Parent = workspace
    u26:ScaleTo(0.01)
    local Tagged = CollectionService:GetTagged("Sunflower_Emote")
    for i, j in Players:GetPlayers() do
        if j.Character then
            table.insert(Tagged, j.Character)
        end
    end
    v1.FilterDescendantsInstances = Tagged
    local v2 = a1:PlayTrack("rbxassetid://83386084297306")
    local v3 = Random.new():NextNumber(0.9, 1.1)
    v2:AdjustSpeed(v3)
    EasySound.Play({
        id = 78932061040470,
        volume = 0.5,
        soundGroupName = "Emotes",
        timeScaled = false,
        parent = Instance:WaitForChild("HumanoidRootPart"),
        playbackSpeed = v3,
    })
    local u86 = 2 * v3
    local Position = (Instance.HumanoidRootPart.CFrame * (CFrame.new(0, 0, -6))).Position
    local u102 = workspace:Raycast(Position, Vector3.new(-0, -5, -0), v1)
    if not u102 then
        u26:Destroy()
    else
        task.delay(0.5, function() -- Line: 66 -- upvalues: u26 (val), Lighting (upval), u102 (val), NewTween (upval), u86 (val)
            local u5 = u26:GetExtentsSize().Y / 2
            local SunDirection = Lighting:GetSunDirection()
            local Rotation = CFrame.lookAt(u102.Position, u102.Position + Vector3.new(SunDirection.X, 0, SunDirection.Z)).Rotation
            local u30 = CFrame.new(u102.Position - Vector3.new(0, 1, 0) * u5) * Rotation
            u26:PivotTo(u30)
            NewTween(u26, TweenInfo.new(u86), function(a1) -- Line: 75 -- upvalues: u26 (upval), u5 (ref), u102 (upval), Rotation (val), u30 (val)
                u26:ScaleTo((math.clamp(a1, 0.01, 1)))
                u5 = u26:GetExtentsSize().Y / 2
                local v1 = (CFrame.new(u102.Position + Vector3.new(0, 1, 0) * u5)) * Rotation
                u26:PivotTo((u30:Lerp(v1, a1)))
            end, function() -- Line: 81 -- upvalues: u26 (upval)
                task.delay(10, function() -- Line: 82 -- upvalues: u26 (upval)
                    u26:Destroy()
                end)
            end)
        end)
    end
    local WaterCan = Instance:WaitForChild("WaterCan")
    local Handle = WaterCan:WaitForChild("Handle")
    Handle.LocalTransparencyModifier = 1
    ;(v2:GetMarkerReachedSignal("ShowCan")):Once(function() -- Line: 95 -- upvalues: WaterCan (val)
        local Handle = WaterCan:WaitForChild("Handle")
        Handle.LocalTransparencyModifier = 0
        task.delay(0.5, function() -- Line: 98 -- upvalues: WaterCan (upval)
            local Attachment = WaterCan.Handle.Attachment
            for i, j in Attachment:GetChildren() do
                if j:IsA("ParticleEmitter") then
                    j.Enabled = true
                end
            end
            task.wait(1.8)
            for k, n in Attachment:GetChildren() do
                if n:IsA("ParticleEmitter") then
                    n.Enabled = false
                end
            end
        end)
    end)
    ;(v2:GetMarkerReachedSignal("HideCan")):Once(function() -- Line: 119 -- upvalues: WaterCan (val)
        local Handle = WaterCan:WaitForChild("Handle")
        Handle.LocalTransparencyModifier = 1
    end)
end

return v1