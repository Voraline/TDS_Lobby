-- Script path: ReplicatedStorage.Content.Unit.Ripped Elf.Animator
-- Decompile time: 2.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Elf = ReplicatedStorage.Assets.Effects.Mob:WaitForChild("Elf")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15
    -- upvalues: Animation (val), Elf (val), TweenService (val), ItemDrop (val), EmitterManager (val), Shaker (val)
    local new = Animation.new
    local v1 = {
        IsPersistent = true,
        Track = a1.Model.Animations.Walk,
        Target = a1.Model.AnimationController,
    }
    local u9 = new(v1)
    a1.snowballModel = Elf.Snowball
    if a1.FBXModel then
        v1 = Elf:FindFirstChild(a1.Model.Name)
        if v1 then
            a1.snowballModel = v1
        end
    end

    function a1.DoWalk() -- Line: 30 -- upvalues: u9 (val)
        u9:Play()
    end

    a1.DoWalk()
    local Size = a1.Model.Snowball.Size
    a1.Executables = {
        Roll = function(a1_2) -- Line: 41 -- upvalues: a1 (val), Animation (upval), TweenService (upval), Size (val)
            local Snowball = a1.Model.Snowball
            Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Face(a1_2, (TweenInfo.new(0.3)))
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
        Death = function() -- Line: 65 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
            local Snowball = a1.Model:FindFirstChild("Snowball")
            if Snowball then
                Snowball.Transparency = 1
            end
        end,
        Shoot = function(a1_2) -- Line: 78 -- upvalues: a1 (val), ItemDrop (upval), EmitterManager (upval), Shaker (upval)
            local goal = a1_2.goal
            local gravity = a1_2.gravity
            local dtMultiplier = a1_2.dtMultiplier
            local velocity = a1_2.velocity
            local Snowball = a1.Model.Snowball
            Snowball.Transparency = 1
            local u13 = a1.snowballModel:Clone()
            u13.Parent = workspace:FindFirstChild("Trash")
            local Position = Snowball.Position
            ;(ItemDrop.Drop(Position, goal, u13, dtMultiplier, gravity, velocity, function(a1, a2, a3) -- Line: 92
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(1.5707963267948966, a1, 0)
                return v1 - v1.Position
            end)):andThen(function() -- Line: 95 -- upvalues: u13 (val), EmitterManager (upval), goal (val), Shaker (upval)
                u13:Destroy()
                EmitterManager.Emit("SnowExplosion", CFrame.new(goal))
                Shaker:Shake({1.3, 20.5, 0.1, 1}, 0.3, 0.2)
            end)
            task.delay(0, function() -- Line: 101 -- upvalues: u13 (val)
                u13.Trail.Enabled = true
            end)
        end,
        Face = function(a1_2) -- Line: 105 -- upvalues: a1 (val)
            a1:Face(a1_2, (TweenInfo.new(0.3)))
        end,
    }
end

return v1