-- Script path: ReplicatedStorage.Content.NewEnemies.Titus.Animator
-- Decompile time: 3.67 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 9 -- upvalues: Animation (val), TimescaleUtilities (val), TweenService (val)
    a1._animations = {}
    a1._beams = {}
    a1._animationFunctions = {
        VoidStream = function() -- Line: 14 -- upvalues: a1 (val)
            a1.Model.HumanoidRootPart.Laser:Play()
            a1._animations.VoidStreamIntro:Play()
            a1._animations.VoidStreamLoop:Play()
        end,
        VoidStreamStop = function() -- Line: 20 -- upvalues: a1 (val)
            a1._animations.VoidStreamOutro:Play()
            a1._animations.VoidStreamLoop:Stop()
        end,
        DarkDecoy = function() -- Line: 25 -- upvalues: a1 (val)
            a1.Model.HumanoidRootPart.Summon:Play()
            a1._animations.SummonIntro:Play()
            a1._animations.SummonLoop:Play()
        end,
        DarkDecoyStop = function() -- Line: 30 -- upvalues: a1 (val)
            a1._animations.SummonOutro:Play()
            a1._animations.SummonLoop:Stop()
        end,
    }
    local Animator = a1.Model.AnimationController.Animator
    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    local u30 = a1.Replicator:Get("Health")
    local u31 = nil
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Health")):Connect(function(a1_2) -- Line: 51 -- upvalues: u30 (ref), u31 (ref), a1 (val), TimescaleUtilities (upval)
        if u30 < a1_2 then
            if u31 then
                task.cancel(u31)
            end
            u31 = task.spawn(function() -- Line: 56 -- upvalues: a1 (upval), TimescaleUtilities (upval)
                for i, j in a1.Model.BossHeal:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = true
                    end
                end
                TimescaleUtilities.Wait(2)
                for k, n in a1.Model.BossHeal:GetDescendants() do
                    if n:IsA("ParticleEmitter") then
                        n.Enabled = false
                    end
                end
            end)
        end
        u30 = a1_2
    end)))
    a1.Executables = {
        Death = function() -- Line: 76 -- upvalues: a1 (val)
            a1.Model.HumanoidRootPart.Death:Play()
            for i, j in a1._animations do
                j:Stop()
            end
            a1._animations.Death:Play()
        end,
        CleanBeams = function() -- Line: 84 -- upvalues: a1 (val)
            for i, j in a1._beams do
                j:Destroy()
            end
            table.clear(a1._beams)
        end,
        Face = function(a1_2) -- Line: 91 -- upvalues: a1 (val), TweenService (upval)
            local v1 = CFrame.new(a1.Model.HumanoidRootPart.Position, (Vector3.new(a1_2.X, a1.Model.HumanoidRootPart.Position.Y, a1_2.Z)))
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {CFrame = v1}
            ):Play()
        end,
        MainEffect = function(a1_2) -- Line: 104 -- upvalues: a1 (val)
            for i, j in a1.Model.MainEffect:GetDescendants() do
                if j:IsA("ParticleEmitter") or j:IsA("Light") then
                    j.Enabled = a1_2
                end
            end
        end,
        Flash = function() -- Line: 112 -- upvalues: a1 (val), TimescaleUtilities (upval), TweenService (upval)
            local Attribute, Attribute_2
            for i, j in a1.Model.Hand.Activate:GetDescendants() do
                if j:IsA("Light") then
                    j.Brightness = 16
                    TimescaleUtilities.Delay(0.1, function() -- Line: 116 -- upvalues: TweenService (upval), j (val)
                        TweenService:Create(j, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Brightness = 0}):Play()
                    end)
                elseif j:IsA("ParticleEmitter") then
                    Attribute = j:GetAttribute("EmitDelay")
                    if Attribute then
                        TimescaleUtilities.Delay(Attribute, function() -- Line: 132 -- upvalues: j (val)
                            j:Emit((j:GetAttribute("EmitCount")))
                        end)
                    else
                        Attribute_2 = j:GetAttribute("EmitCount")
                        j:Emit(Attribute_2)
                    end
                end
            end
        end,
        AddBeam = function(a1_2) -- Line: 140 -- upvalues: a1 (val), TweenService (upval)
            local v1
            local Attachment = Instance.new("Attachment")
            Attachment.Parent = a1_2.PrimaryPart
            Attachment.WorldCFrame = a1.Model.Hand.CFrame
            TweenService:Create(
                Attachment,
                TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {WorldCFrame = a1_2.PrimaryPart.CFrame}
            ):Play()
            for i, j in a1.Model.Hand.Beam:GetChildren() do
                v1 = j:Clone()
                v1.Parent = a1.Model.Hand
                v1.Attachment0 = a1.Model.Hand.Activate
                v1.Attachment1 = Attachment
                v1.Enabled = true
                v1.Parent = a1.Model.Hand
                table.insert(a1._beams, v1)
            end
        end,
        Animation = function(a1_2) -- Line: 166 -- upvalues: a1 (val)
            if a1._animationFunctions[a1_2] then
                a1._animationFunctions[a1_2]()
                return
            end
            a1._animations[a1_2]:Play()
        end,
    }
end

return v1