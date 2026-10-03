-- Script path: ReplicatedStorage.Content.Unit.Guard1.Animator
-- Decompile time: 3.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local v1 = {}
v1.__index = v1

function v1:Face(a2, a3) -- Line: 11
    local HumanoidRootPart = a2:FindFirstChild("HumanoidRootPart")
    local v1 = self.Model.HumanoidRootPart:FindFirstChild(a2.Name)
    local lookVector = HumanoidRootPart.CFrame.lookVector
    local Unit = (a3 - HumanoidRootPart.Position).Unit
    v1.C0 = v1.C0 * CFrame.Angles(0, (math.deg((math.atan2(lookVector.Z, lookVector.X)) - (math.atan2(Unit.Z, Unit.X)))) * 0.017453292519943295, 0)
end

function v1:FireUnit(a2, a3) -- Line: 27
    self:Face(a2, a3)
    local Weapon = a2.Weapon
    local Start = Weapon.Handle.Start
    a2.AnimationController:LoadAnimation(a2.Animations.Fire):Play()
    Start.Flash:Emit(1)
    Start.Spark:Emit(1)
    if Weapon then
        self:Bullet({Start = Start.WorldPosition, End = a3, Spread = 50, Speed = 140})
    end
end

function v1:Fire(a2) -- Line: 51 -- upvalues: EasySound (val)
    local Position = a2.HumanoidRootPart.Position
    local HumanoidRootPart_2 = self.Model:FindFirstChild("HumanoidRootPart")
    self:FireUnit(self.Units[self.shootNumber], Position)
    self.shootNumber = self.shootNumber + 1
    local shootNumber = self.shootNumber
    if #self.Units < shootNumber then
        self.shootNumber = 1
    end
    if HumanoidRootPart_2 then
        local Fire = HumanoidRootPart_2:FindFirstChild("Fire")
        if Fire and Fire:IsA("Sound") then
            local PlaybackSpeed = Fire.PlaybackSpeed
            EasySound.Play({
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = Fire.SoundId,
                parent = HumanoidRootPart_2,
                volume = Fire.Volume,
                playbackSpeed = (Random.new()):NextNumber(PlaybackSpeed * 0.9, PlaybackSpeed * 1.2),
            })
        end
    end
    self:Delay(self.Cooldown)
end

function v1.Initialize(a1) -- Line: 83 -- upvalues: TweenService (val)
    local AnimationController, C0, v1, v2
    a1.Replicator:Set("DisplayName", "Body Guard")
    a1.Units = {a1.Model.Crook1}
    a1.shootNumber = 1
    a1.originalC0 = {}
    a1.walkAnims = {}
    a1.idleAnims = {}
    for k, v in pairs(a1.Units) do
        AnimationController = v:FindFirstChild("AnimationController")
        if AnimationController then
            a1.walkAnims[v] = (AnimationController:LoadAnimation(v.Animations.Walk))
            a1.idleAnims[v] = (AnimationController:LoadAnimation(v.Animations.Idle))
            v1 = a1.Model.HumanoidRootPart:FindFirstChild(v.Name)
            if v1 then
                C0 = v1.C0
                a1.originalC0[v] = C0
            end
            v2 = a1.walkAnims[v]
            v2:Play()
            v2:AdjustSpeed(a1.Speed / 3.5)
        end
    end
    a1.Connections:Mark(((a1.Replicator:GetStateChangedSignal("Speed")):Connect(function(a1_2) -- Line: 118 -- upvalues: a1 (val), TweenService (upval)
        local v1, v2
        if a1_2 == 0 then
            for k2, i in pairs(a1.Units) do
                a1.walkAnims[i]:Stop(0.5)
                a1.idleAnims[i]:Play(0.5)
            end
            return
        end
        for k, v in pairs(a1.Units) do
            if v:FindFirstChild("HumanoidRootPart") then
                v1 = a1.Model.HumanoidRootPart:FindFirstChild(v.Name)
                if v1 then
                    TweenService:Create(
                        v1,
                        TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                        {C0 = a1.originalC0[v]}
                    ):Play()
                end
            end
            v1 = a1.walkAnims[v]
            v2 = v3 / 3.5
            v1:Play(0.1)
            v1:AdjustSpeed(v2)
        end
    end)))
    a1.Connections:Mark(((a1.Replicator:GetStateChangedSignal("Stopped")):Connect(function(a1_2) -- Line: 160 -- upvalues: a1 (val), TweenService (upval)
        local v1, v2
        if a1_2 then
            for k2, i in pairs(a1.Units) do
                a1.walkAnims[i]:Stop(0.5)
                a1.idleAnims[i]:Play(0.5)
            end
            return
        end
        for k, v in pairs(a1.Units) do
            if v:FindFirstChild("HumanoidRootPart") then
                v1 = a1.Model.HumanoidRootPart:FindFirstChild(v.Name)
                if v1 then
                    TweenService:Create(
                        v1,
                        TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                        {C0 = a1.originalC0[v]}
                    ):Play()
                end
            end
            v1 = a1.walkAnims[v]
            v2 = a1.Speed / 3.5
            v1:Play(0.1)
            v1:AdjustSpeed(v2)
        end
    end)))
    a1:Thread(function() -- Line: 202 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 and not a1.Dead then
            a1:Fire(v1)
        end
    end)
    a1.Executables = {
        Death = function(a1_2) -- Line: 211 -- upvalues: a1 (val)
            a1.Dead = true
            for k, v in pairs(a1.Units) do
                (v:FindFirstChild("AnimationController")):LoadAnimation(v.Animations.Death):Play()
                v.Weapon:ClearAllChildren()
            end
        end,
    }
end

return v1