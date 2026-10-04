-- Script path: ReplicatedStorage.Content.Unit.Sunflower.Animator
-- Decompile time: 1.40 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13 -- upvalues: Animation (val)
    local v1
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1._animations = {}
    for i, j in Animations:GetChildren() do
        v1 = Animation.new({IgnorePriority = true, Preload = true, Target = AnimationController, Track = j})
        a1._animations[j.Name] = v1
    end
    a1._animations.Idle:Play()
    a1:Thread(function() -- Line: 30 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 then
            a1:_fireAt(v1)
        end
    end)
end

function v1:_createBeam(a2, a3) -- Line: 38
    -- upvalues: Create (val), TweenService (val)
    local PrimaryPart = self.Model.PrimaryPart
    local Magnitude = (a3 - a2).Magnitude
    local u12 = Create("Attachment", {Name = "BeamEnd", WorldPosition = a3, Parent = workspace.Terrain})
    local u16 = PrimaryPart.BeamStart:Clone()
    for i, j in u16:GetChildren() do
        if j:IsA("Beam") then
            j.Attachment1 = u12
            j.Enabled = true
        end
    end
    u16.WorldPosition = a2
    u16.Parent = workspace.Terrain
    local v1 = TweenService:Create(u16, TweenInfo.new(Magnitude / 50), {WorldPosition = a3})
    v1:Play()
    v1.Completed:Once(function() -- Line: 62 -- upvalues: u16 (val), u12 (val)
        u16:Destroy()
        u12:Destroy()
    end)
end

function v1:_fireAt(a2) -- Line: 68 -- upvalues: EmitterManager (val)
    local Position = a2.PrimaryPart.Position
    local Start = self.Model.Sunflower.DEF_FLOWER.Start
    self:Face(Position)
    EmitterManager.manualEmit(Start.Fire)
    self:_createBeam(Start.WorldPosition, Position)
    self._animations.Fire:Play()
    self.Model.PrimaryPart.Fire:Play()
    self:Wait((self.Replicator:Get("Cooldown")))
end

return v1