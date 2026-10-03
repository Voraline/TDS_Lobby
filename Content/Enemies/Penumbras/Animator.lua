-- Script path: ReplicatedStorage.Content.Enemies.Penumbras.Animator
-- Decompile time: 2.27 ms

local v1 = {}
v1.__index = v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Mob = ((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Mob")

function v1.Initialize(a1) -- Line: 16
    -- upvalues: Animation (val), Mob (val), TimescaleUtilities (val), TweenService (val)
    a1.Executables = {
        Throw = function(a1_2, a2, a3) -- Line: 18
            -- upvalues: Animation (upval), a1 (val), Mob (upval), TimescaleUtilities (upval), TweenService (upval)
            Animation.new({
                Track = a1.Model.Animations.Cast,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.18)
            local u29 = Mob:WaitForChild("Spell"):Clone()
            u29.CFrame = CFrame.new(a1.Model["Right Hand"].Position, a1_2)
            u29.Parent = workspace.CurrentCamera
            local v1 = u29.CFrame - u29.Position
            local u48 = a1.Model.Head.Cast:Clone()
            u48.PlaybackSpeed = Random.new():NextInteger(1, 1.3)
            u48.Name = "Cast_SFX"
            u48.Parent = a1.Model.Head
            u48:Play()
            TimescaleUtilities.Delay(u48.TimeLength, function() -- Line: 38 -- upvalues: u48 (val)
                u48:Destroy()
            end)
            TweenService:Create(
                u29,
                TweenInfo.new(a3, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
                {CFrame = CFrame.new(a1_2) * v1}
            ):Play()
            TimescaleUtilities.Delay(a3, function() -- Line: 58
                -- upvalues: u29 (val), Mob (upval), a1_2 (val), TweenService (upval), a2 (val)
                -- upvalues: TimescaleUtilities (upval), a1 (upval)
                u29:Destroy()
                local u11 = Mob:WaitForChild("MagicExplosion"):Clone()
                u11.Size = Vector3.new(0, 0, 0)
                u11.CFrame = CFrame.new(a1_2)
                u11.Parent = workspace.CurrentCamera
                u11.Aura.Enabled = true
                u11.Center.Debris:Emit(20)
                u11.Center.Impact:Emit(1)
                u11.Sound.PlayOnRemove = true
                u11.Sound:Destroy()
                TweenService:Create(
                    u11,
                    TweenInfo.new(0.6, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0),
                    {Size = Vector3.new(a2 * 2, a2 * 2, a2 * 2)}
                ):Play()
                TweenService:Create(u11, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0), {Transparency = 1}):Play()
                TimescaleUtilities.Delay(2, function() -- Line: 97 -- upvalues: u11 (val)
                    u11:Destroy()
                end)
                a1:Delay(0.5)
                u11.Aura.Enabled = false
            end)
        end,
        Summon = function(a1_2) -- Line: 106 -- upvalues: Animation (upval), a1 (val), TimescaleUtilities (upval)
            local HumanoidRootPart
            Animation.new({
                Track = a1.Model.Animations.Summon,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Summon:Play()
            for k, v in pairs(a1_2) do
                HumanoidRootPart = a1.Model:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    local u46 = HumanoidRootPart:FindFirstChild("SpawnFX"):Clone()
                    u46.Name = "Effect"
                    u46.Parent = workspace.Terrain
                    u46.WorldPosition = v
                    u46.Emitter.Enabled = true
                    TimescaleUtilities.Delay(2, function() -- Line: 126 -- upvalues: u46 (val)
                        u46.Emitter.Enabled = false
                    end)
                    TimescaleUtilities.Delay(8, function() -- Line: 130 -- upvalues: u46 (val)
                        u46:Destroy()
                    end)
                end
            end
        end,
        Death = function() -- Line: 137 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Dead:Play()
        end,
    }
end

return v1