-- Script path: ReplicatedStorage.Content.Enemies.Ripped Elf.Animator
-- Decompile time: 2.38 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local Elf = game:GetService("ReplicatedStorage").Assets.Effects.Mob:WaitForChild("Elf")

function v1.Initialize(a1) -- Line: 18
    -- upvalues: Animation (val), TweenService (val), Elf (val), ItemDrop (val), EmitterManager (val), Shaker (val)
    -- upvalues: TimescaleUtilities (val)
    a1.Shooting = false

    function a1.Face(a1_2) -- Line: 20 -- upvalues: a1 (val)
        local HumanoidRootPart = a1.Model.HumanoidRootPart
        return CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
    end

    function a1.IgnoreList() -- Line: 29 -- upvalues: a1 (val)
        local v1 = {
            a1.Model,
            workspace.Map.Boundaries,
            workspace.Towers,
            workspace.ClientUnits,
            workspace.CurrentCamera,
            workspace.Replicate,
        }
        for k, v in pairs(game.Players:GetChildren()) do
            table.insert(v1, v.Character)
        end
        return v1
    end

    local Size = a1.Model.Snowball.Size
    a1.Executables = {
        Death = function() -- Line: 48 -- upvalues: a1 (val), Animation (upval)
            a1.Model.Snowball.Transparency = 1
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
        Roll = function(a1_2) -- Line: 57 -- upvalues: a1 (val), Animation (upval), TweenService (upval), Size (val)
            local Snowball = a1.Model.Snowball
            local v1 = Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            })
            v1:Play()
            v1:Play()
            local v2 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v2}
            ):Play()
            local v3 = a1.Face(a1_2)
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                {CFrame = v3}
            ):Play()
            Snowball.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
            Snowball.Transparency = 0
            Snowball.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
            Snowball.Transparency = 0
            TweenService:Create(
                Snowball,
                TweenInfo.new(0.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0),
                {Size = Size}
            ):Play()
        end,
        Shoot = function(a1_2) -- Line: 101
            -- upvalues: a1 (val), Elf (upval), ItemDrop (upval), EmitterManager (upval), Shaker (upval)
            -- upvalues: TimescaleUtilities (upval)
            local Snowball = a1.Model.Snowball
            Snowball.Transparency = 1
            local v1 = Elf.Snowball:Clone()
            v1.Parent = workspace.Trash
            local u16 = Elf.Snowball:Clone()
            u16.Parent = workspace.Trash
            local Position_2 = Snowball.Position
            local Position = Snowball.Position
            ;(ItemDrop.Drop(Position, a1_2, u16, 5, -0.9, 3, function(a1, a2, a3) -- Line: 113
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(1.5707963267948966, a1, 0)
                return v1 - v1.Position
            end)):andThen(function() -- Line: 116 -- upvalues: u16 (val), EmitterManager (upval), a1_2 (val), Shaker (upval)
                u16:Destroy()
                EmitterManager.Emit("SnowExplosion", CFrame.new(a1_2))
                Shaker:Shake({6.3, 20.5, 0.1, 1}, 0.3, 0.2)
            end)
            TimescaleUtilities.Delay(0.01, function() -- Line: 122 -- upvalues: u16 (val)
                u16.Trail.Enabled = true
            end)
        end,
    }
end

return v1