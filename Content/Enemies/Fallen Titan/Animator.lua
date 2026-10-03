-- Script path: ReplicatedStorage.Content.Enemies.Fallen Titan.Animator
-- Decompile time: 2.96 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)

function v1.Initialize(a1) -- Line: 15
    -- upvalues: Animation (val), ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val)
    a1.idleAnim = Animation.new({
        Track = a1.Model.Animations.Idle,
        Target = a1.Model.AnimationController,
    })

    function a1.Face(a1_2) -- Line: 21 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        HumanoidRootPart.CFrame = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.Spike(a1_2, a2, a3) -- Line: 30
        -- upvalues: ReplicatedStorage (upval), TweenService (upval), TimescaleUtilities (upval), a1 (val)
        local u10 = ReplicatedStorage.Assets.Effects.Mob.VoidSpike:Clone()
        u10.CFrame = CFrame.new(a1_2 + Vector3.new(0, a3, 0))
        local CFrame_2 = u10.CFrame
        u10.Size = Vector3.new(0, 0, 0)
        local v1 = Vector3.new(a2, a2 / 4, a2)
        u10.Parent = workspace.Trash
        TweenService:Create(u10, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {Size = v1}):Play()
        TweenService:Create(u10, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame_2}):Play()
        u10.Exp:Play()
        TimescaleUtilities.Delay(0.2, function() -- Line: 53 -- upvalues: TweenService (upval), u10 (val), a1 (upval)
            TweenService:Create(u10, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Transparency = 1}):Play()
            a1:Delay(0.4)
            u10:Destroy()
        end)
    end

    a1.Executables = {
        Face = function(a1_2) -- Line: 65 -- upvalues: a1 (val)
            a1.Face(a1_2)
        end,
        Equip = function(a1_2) -- Line: 68 -- upvalues: a1 (val), Animation (upval)
            if a1_2 then
                a1.idleAnim:Play()
                Animation.new({
                    Track = a1.Model.Animations.Equip,
                    Target = a1.Model.AnimationController,
                }):Play()
                a1:Delay(0.75)
                for k3, j in pairs(a1.Model.Weapon:GetChildren()) do
                    if j:IsA("BasePart") then
                        j.Transparency = 0
                    end
                end
                for k4, k5 in pairs(a1.Model.BackWeapon:GetChildren()) do
                    if k5:IsA("BasePart") then
                        k5.Transparency = 1
                    end
                end
                return
            end
            a1.idleAnim:Stop()
            Animation.new({
                Track = a1.Model.Animations.Unequip,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(1.35)
            for k, v in pairs(a1.Model.Weapon:GetChildren()) do
                if v:IsA("BasePart") then
                    v.Transparency = 1
                end
            end
            for k2, i in pairs(a1.Model.BackWeapon:GetChildren()) do
                if i:IsA("BasePart") then
                    i.Transparency = 0
                end
            end
        end,
        Death = function() -- Line: 107 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
        Slash = function(a1_2, a2, a3) -- Line: 115 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Swing,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.5)
            for k, v in pairs(a2) do
                if v ~= nil then
                    a1.Spike(v, a1_2, 0.5)
                end
                a1:Delay(v1)
            end
        end,
        Shield = function(a1_2, a2) -- Line: 131 -- upvalues: a1 (val), TimescaleUtilities (upval)
            local Size = a1.Model.HumanoidRootPart.Size
            local u14 = game.ReplicatedStorage.Assets.Effects.Misc.Shield:Clone()
            u14:SetPrimaryPartCFrame(a1.Model.HumanoidRootPart.CFrame)
            u14.Effect.Size = Vector3.new(Size.X * 2.5, Size.Y * 1.5, Size.X * 2.5)
            u14.Effect.Damage1.Display.Text = a2
            u14.Effect.Damage2.Display.Text = a2
            u14.Effect.Damage3.Display.Text = a2
            u14.Effect.Damage4.Display.Text = a2
            u14.Parent = a1.Model
            u14.PrimaryPart.Weld.Part1 = a1.Model.HumanoidRootPart
            TimescaleUtilities.Delay(a1_2, function() -- Line: 145 -- upvalues: u14 (val)
                u14:Destroy()
            end)
        end,
    }
end

return v1