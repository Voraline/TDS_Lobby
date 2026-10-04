-- Script path: ReplicatedStorage.Content.Unit.Monster.Animator
-- Decompile time: 1.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local v1 = {}
v1.__index = v1

function v1:Face(a2) -- Line: 14 -- upvalues: TweenService (val)
    local HumanoidRootPart = self.Model.HumanoidRootPart
    TweenService:Create(HumanoidRootPart, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), {
        CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a2.X, HumanoidRootPart.Position.Y, a2.Z))),
    }):Play()
end

function v1:Fire(a2) -- Line: 29 -- upvalues: Animation (val)
    self:Face(a2)
    if not self.left then
        Animation.new({
            Track = self.Model.Animations.Swing2,
            Target = self.Model.AnimationController,
        }):Play()
    else
        Animation.new({
            Track = self.Model.Animations.Swing1,
            Target = self.Model.AnimationController,
        }):Play()
    end
    self.Model.Head.Swing:Play()
    self.left = not self.left
end

function v1.Initialize(a1) -- Line: 49
    a1.left = false
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.guard = a1.Model:WaitForChild("Guard")
    local AnimationController_2 = a1.guard:WaitForChild("AnimationController")
    a1.walkAnim = AnimationController:LoadAnimation(a1.Model.Animations.Walk)
    a1.idleAnim = AnimationController:LoadAnimation(a1.Model.Animations.Idle)
    a1.guardIdle = AnimationController_2:LoadAnimation(a1.guard.Animations.Idle)
    a1.walkAnim:Play()
    a1.guardIdle:Play()

    local function v1() -- Line: 65 -- upvalues: a1 (val)
        a1.walkAnim:AdjustSpeed(a1.Speed / 3.5)
    end

    a1.walkAnim:AdjustSpeed(a1.Speed / 3.5)
    a1.Connections:Mark(((a1.Replicator:GetStateChangedSignal("Speed")):Connect(function(a1_2) -- Line: 71 -- upvalues: a1 (val)
        if a1_2 == 0 then
            a1.walkAnim:Stop()
            a1.idleAnim:Play()
            return
        end
        a1.walkAnim:Play()
        a1.walkAnim:AdjustSpeed(a1.Speed / 3.5)
        a1.idleAnim:Stop()
    end)))
    a1.Executables = {
        Death = function(a1_2) -- Line: 83 -- upvalues: a1 (val)
            a1.Dead = true
        end,
        Attack = function(a1_2) -- Line: 87 -- upvalues: a1 (val)
            a1:Fire(a1_2)
        end,
    }
end

return v1