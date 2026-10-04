-- Script path: ReplicatedStorage.Content.Unit.Skeleton Knight.Animator
-- Decompile time: 1.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Client.Modules.TweenService)

function v1:Fire(a2) -- Line: 13 -- upvalues: Animation (val)
    local v1
    local v2 = if self.left then Animation.new({
        Track = self.Model.Animations.Attack2,
        Target = self.Model.AnimationController,
    }) else Animation.new({
        Track = self.Model.Animations.Attack1,
        Target = self.Model.AnimationController,
    })
    self.left = not self.left
    v2:Play()
    if self.lastSwingAnim and self.lastSwingAnim.Controller.IsPlaying then
        self.lastSwingAnim:Stop()
        self.lastSwingAnim = nil
    end
    self.lastSwingAnim = v2
    self:Face(a2, (TweenInfo.new(0.3)))
    if self.Model:FindFirstChild("Head") then
        local Swing_2 = self.Model.Head:FindFirstChild("Swing")
        if Swing_2 then
            v1 = Swing_2:Clone()
            v1.Parent = self.Model:WaitForChild("Head")
            v1.PlaybackSpeed = Random.new():NextNumber(0.8, 1.1)
            v1:Play()
            game.Debris:AddItem(v1, v1.TimeLength)
        end
    else
        local Swing = self.Model.PrimaryPart:FindFirstChild("Swing")
        if Swing then
            v1 = Swing:Clone()
            v1.Parent = self.Model.PrimaryPart
            v1.PlaybackSpeed = Random.new():NextNumber(0.8, 1.1)
            v1:Play()
            game.Debris:AddItem(v1, v1.TimeLength)
        end
    end
    self:Delay(self.Cooldown)
end

function v1.Initialize(a1) -- Line: 62 -- upvalues: Animation (val)
    a1.left = false
    a1.lastSwingAnim = nil
    a1.walk = Animation.new({
        IgnorePriority = true,
        Track = a1.Model.Animations:WaitForChild("Walk"),
        Target = a1.Model.AnimationController,
    })
    a1.aimIdle = Animation.new({
        IgnorePriority = true,
        Track = a1.Model.Animations:WaitForChild("AimIdle"),
        Target = a1.Model.AnimationController,
    })
    a1.walk:Play()
    a1.Executables = {
        Death = function(a1_2) -- Line: 82 -- upvalues: a1 (val), Animation (upval)
            if a1.Model.Animations:FindFirstChild("Death") then
                Animation.new({
                    Track = a1.Model.Animations.Death,
                    Target = a1.Model.AnimationController,
                }):Play()
            end
            if a1.Model:FindFirstChild("Head") then
                a1.Model.Head.Rattle:Play()
            end
            a1.walk:Stop()
            a1.aimIdle:Stop()
            if a1.lastSwingAnim and a1.lastSwingAnim.IsPlaying then
                a1.lastSwingAnim:Stop()
            end
        end,
        ShootState = function(a1_2) -- Line: 101 -- upvalues: a1 (val)
            if a1_2 then
                a1.walk:Stop()
                a1.aimIdle:Play()
                return
            end
            a1.walk:Play()
            a1.aimIdle:Stop()
        end,
        Attack = function(a1_2) -- Line: 111 -- upvalues: a1 (val)
            if not a1_2:IsA("Folder") and a1_2.PrimaryPart then
                a1:Fire(a1_2.PrimaryPart.Position)
            end
        end,
    }
end

return v1