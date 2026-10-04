-- Script path: ReplicatedStorage.Content.NewEnemies.Narrator.Animator.HandClientClass
-- Decompile time: 2.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local u30 = {}
u30.__index = u30

function u30.new(a1, a2) -- Line: 10
    -- upvalues: u30 (val), Maid (val), TagReplicator (val), Animation (val)
    local v1
    local u5 = setmetatable({}, u30)
    u5.Maid = Maid.new()
    a1.Maid:Mark(function() -- Line: 15 -- upvalues: u5 (val)
        u5.Maid:Sweep()
    end)
    u5.clientEntity = a1
    u5.handName = a2
    u5.handStats = a1.Stats.Hands[a2]
    u5.handModel = u5.clientEntity.Model:WaitForChild(a2 .. "Hand")
    u5.handModel.Parent = workspace
    u5.Replicator = TagReplicator.getReplicatorEntityFromFolder(u5.clientEntity.Replicator.Folder:WaitForChild(a2 .. "Hand"))
    u5._animations = {}
    for i, j in u5.handModel.Animations:GetChildren() do
        v1 = Animation.new({
            IgnorePriority = true,
            Preload = true,
            Track = j,
            Target = u5.handModel.AnimationController.Animator,
        })
        u5._animations[j.Name] = v1
    end
    u5.currentCFrame = u5.handModel.PrimaryPart.CFrame
    u5.currentVelocity = Vector3.new(0, 0, 0)
    u5.smoothTime = 1
    u5.maxSpeed = 45
    u5:PlayAnimation("Walk")
    return u5
end

function u30:PlayAnimation(a2, a3) -- Line: 52 -- types: self: table, a2: string, a3: number?
    local v1 = self._animations[a2]
    if v1 then
        v1:Play(a3 or 0.2)
    end
    return v1
end

function u30.StopAnimation(a1, a2) -- Line: 61 -- types: a1: table, a2: string
    local v1 = a1._animations[a2]
    if v1 then
        v1:Stop()
    end
end

function u30.Step(a1, a2) -- Line: 68 -- upvalues: TweenService (val), GameState (val)
    local v1, v2 = TweenService:SmoothDamp(
        a1.currentCFrame,
        (a1.clientEntity:GetLookCFrame()) * a1.handStats.Offset * CFrame.new(0, ((not (a1.handModel.Name ~= "LeftHand") and math.sin or math.cos)((tick()) * 2)) * 0.005, 0),
        a1.currentVelocity,
        a1.smoothTime,
        a1.maxSpeed,
        a2 * GameState.TimeScale
    )
    a1.currentCFrame = v1
    a1.currentVelocity = v2
    if not a1.Replicator:Get("Moving") then
        a1.currentCFrame = a1.handModel.PrimaryPart.CFrame
        return
    end
    a1.handModel.PrimaryPart.CFrame = a1.currentCFrame
end

function u30:Destroy() -- Line: 96
    self.handModel:Destroy()
end

return u30