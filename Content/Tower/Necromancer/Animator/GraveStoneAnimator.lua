-- Script path: ReplicatedStorage.Content.Tower.Necromancer.Animator.GraveStoneAnimator
-- Decompile time: 3.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Assets = ReplicatedStorage:WaitForChild("Assets")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local Streaming = Network.Channel("Streaming")
local u48 = {}
u48.__index = u48

function u48.new(a1, a2, a3, a4, a5) -- Line: 17
    -- upvalues: Streaming (val), Assets (val), u48 (val), Maid (val)
    Streaming:FireServer("SelectTower", "Necromancer", a3, true)
    local Gravestone = Assets:WaitForChild("Gravestone")
    local v1 = setmetatable({}, u48)
    v1.Position = a1
    v1.Skin = Gravestone:FindFirstChild(a3) and a3 or "Default"
    v1.Level = a2
    v1.Model = Gravestone:FindFirstChild(v1.Skin):Clone()
    v1.HeightOffset = v1.Model.PrimaryPart.HeightOffset.Position.Y
    for i, j in v1.Model:GetDescendants() do
        if j:IsA("BasePart") then
            j.CanCollide = false
        end
    end
    v1.maid = Maid.new()
    v1.tower = a5
    local v2 = CFrame.Angles(math.rad((Random.new():NextNumber(-10, 10))), Random.new():NextNumber(0, 6.283185307179586), 0)
    v1.CFrame = CFrame.new(v1.Position + Vector3.new(0, -1 * v1.HeightOffset, 0)) * v2
    v1.Model:PivotTo(v1.CFrame)
    v1:IntroAnimation(a4)
    v1.Model.Parent = workspace.CurrentCamera
    return v1
end

function u48:IntroAnimation(a2) -- Line: 56 -- upvalues: TweenService (val), EmitterManager (val)
    local v1 = TweenInfo.new(a2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
    self.Model.PrimaryPart.CFrame = self.CFrame * CFrame.new(0, self.HeightOffset * 2, 0)
    local CFrame_2 = self.Model.PrimaryPart.CFrame
    TweenService:Create(self.Model.PrimaryPart, v1, function(a1) -- Line: 64 -- upvalues: self (val), CFrame_2 (val)
        if self.Model and self.Model.PrimaryPart and self.CFrame then
            self.Model.PrimaryPart.CFrame = CFrame_2:Lerp(self.CFrame, a1)
            return
        end
    end):Play()
    self.maid:Mark((task.spawn(function() -- Line: 72 -- upvalues: EmitterManager (upval), self (val)
        EmitterManager.manualEmit(self.Model:WaitForChild("Effect"))
    end)))
end

function u48.ReplicateAction(a1, a2, ...) -- Line: 79
    -- upvalues: EmitterManager (val), LightningBolt (val), Shaker (val), TimescaleUtilities (val)
    local v1 = {
        Hatch = function(a1_2) -- Line: 81
            -- upvalues: a1 (val), EmitterManager (upval), LightningBolt (upval), Shaker (upval)
            -- upvalues: TimescaleUtilities (upval)
            if a1.Model:FindFirstChild("Effect") then
                EmitterManager.manualEmit(a1.Model.Effect)
            end
            if 3 <= a1.Level then
                local v1 = {}
                local v2 = {}
                v1.WorldPosition = a1.Model.PrimaryPart.Position + Vector3.new(0, Random.new():NextNumber(15, 20), 0)
                v1.WorldAxis = Vector3.new(0, 0, 1)
                v2.WorldPosition = a1.CFrame.Position
                v2.WorldAxis = Vector3.new(0, 0, 1)
                local v3 = LightningBolt.new(v1, v2, 14)
                local Attribute = a1.tower.Model:GetAttribute("LightingColor") or Color3.new(0.25, 1, 0.8)
                v3.Color = Attribute
                v3.PulseSpeed = 20
                v3.Frequency = 2
                v3.AnimationSpeed = 20
                v3.Thickness = 0.15
                Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
                TimescaleUtilities.Wait(0.1)
                v3:DestroyDissipate()
                EmitterManager.Emit(a1.tower.Model:GetAttribute("SpawnEffect") or "EnergyExplosion", a1.CFrame, a1_2)
            end
        end,
        SetLevel = function(a1_2) -- Line: 117 -- upvalues: a1 (val)
            a1.Level = a1_2
            for k, v in pairs((a1.Model:WaitForChild("Levels"):GetChildren())) do
                if v:IsA("Model") then
                    if tonumber(v.Name) ~= a1_2 then
                        for k2, i in pairs(v:GetDescendants()) do
                            if i:IsA("ParticleEmitter") then
                                i.Enabled = false
                            end
                            if i:IsA("BasePart") then
                                i.Transparency = 1
                            end
                        end
                    else
                        for k3, j in pairs(v:GetDescendants()) do
                            if j:IsA("ParticleEmitter") then
                                j.Enabled = true
                            end
                            if j:IsA("BasePart") then
                                j.Transparency = 0
                            end
                        end
                    end
                end
            end
        end,
    }
    local v2 = v1[a2]
    if v2 then
        v2(...)
    end
end

function u48:Destroy() -- Line: 153 -- upvalues: EmitterManager (val)
    self.maid:Sweep()
    EmitterManager.Emit("GravestoneBreak", CFrame.new(self.Position))
    self.Model:Destroy()
end

return u48