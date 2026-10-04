-- Script path: ReplicatedStorage.Content.NewEnemies.Clown.Animator
-- Decompile time: 1.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
require(ReplicatedStorage.Client.Modules.Shaker)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 26
    -- upvalues: Animation (val), ItemDrop (val), EmitterManager (val), TweenService (val)
    a1.deathAnim = (a1.Model:WaitForChild("AnimationController")):LoadAnimation((a1.Model:WaitForChild("Animations"):WaitForChild("Death")))
    local Ball = a1.Model.HumanoidRootPart:WaitForChild("Ball")
    Ball.MaxVelocity = 1 / a1.Speed

    function a1.HideBomb(a1_2) -- Line: 35 -- upvalues: a1 (val) -- types: a1_2: boolean
        local Bomb = a1.Model:FindFirstChild("Bomb")
        if Bomb then
            Bomb.Transparency = if not a1_2 then 0 else 1
        end
    end

    a1.Executables = {
        Attack = function(a1_2, a2, a3) -- Line: 43 -- upvalues: Animation (upval), a1 (val), ItemDrop (upval), EmitterManager (upval)
            Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.5)
            local u27 = a1.Model.Bomb:Clone()
            u27.Anchored = true
            u27.Parent = workspace.CurrentCamera
            a1.HideBomb(true)
            local CFrame = a1.Model.Bomb.CFrame
            local u43 = Random.new():NextNumber()
            ;(ItemDrop.Drop(CFrame, a1_2, u27, 6, -1.5, 4, function(a1, a2, a3) -- Line: 67 -- upvalues: u43 (val)
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u43 + a1, 0, 0)
                return v1 - v1.Position
            end)):andThen(function(a1) -- Line: 72 -- upvalues: u27 (val), EmitterManager (upval), a2 (val)
                u27:Destroy()
                EmitterManager.Emit("PoisonExplosion", CFrame.new(a1), a2)
            end)
            a1:Delay(a3 / 2)
            a1.HideBomb(false)
        end,
        Death = function() -- Line: 82 -- upvalues: a1 (val), TweenService (upval), Ball (val)
            a1.deathAnim:Play()
            task.defer(function() -- Line: 85 -- upvalues: a1 (upval)
                while a1.deathAnim.Length == 0 do
                    task.wait()
                end
                task.wait(a1.deathAnim.Length * 0.95)
                a1.deathAnim:AdjustSpeed(0)
            end)
            local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
            TweenService:Create(Ball, v1, {MaxVelocity = 0}):Play()
        end,
    }
end

return v1