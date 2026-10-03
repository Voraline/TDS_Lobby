-- Script path: ReplicatedStorage.Content.Unit.Gift Bomber.Animator
-- Decompile time: 1.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local u28 = Random.new()
local Bombs = (ReplicatedStorage.Assets.Effects.Mob:WaitForChild("Elf")):WaitForChild("Bombs")

function v1.Initialize(a1) -- Line: 16
    -- upvalues: Animation (val), Bombs (val), TweenService (val), u28 (val), ItemDrop (val), EffectsController (val)
    function a1.Face(a1_2) -- Line: 17 -- upvalues: a1 (val)
        local PrimaryPart = a1.Model.PrimaryPart
        return CFrame.new(PrimaryPart.CFrame.Position, (Vector3.new(a1_2.X, PrimaryPart.Position.Y, a1_2.Z)))
    end

    Animation.new({
        IsPersistent = true,
        Track = a1.Model.Animations.Walk,
        Target = a1.Model.AnimationController,
    }):Play()
    local u22 = Animation.new({
        Track = a1.Model.Animations.Throw,
        Target = a1.Model.AnimationController,
    })
    a1.Executables = {
        ShootAnim = function() -- Line: 38 -- upvalues: u22 (val)
            u22:Play()
        end,
        Death = function(a1_2) -- Line: 41 -- upvalues: a1 (val), Animation (upval)
            local Death = a1.Model.Animations:FindFirstChild("Death")
            if Death then
                Animation.new({Track = Death, Target = a1.Model.AnimationController}):Play()
            end
        end,
        Shoot = function(a1_2, a2) -- Line: 50
            -- upvalues: Bombs (upval), a1 (val), TweenService (upval), u28 (upval), ItemDrop (upval)
            -- upvalues: EffectsController (upval)
            local u14 = (Bombs:FindFirstChild(a1.Model.Name) or Bombs.Default):Clone()
            u14.Parent = workspace:FindFirstChild("Trash")
            local Position = a1.Model.Bomb.Position
            a1.Model.Bomb.Transparency = 1
            TweenService:Create(a1.Model.Bomb, TweenInfo.new(0.5), {Transparency = 0}):Play()
            local u45 = u28:NextNumber()
            ;(ItemDrop.Drop(Position, a1_2, u14, 7, -0.9, 2, function(a1, a2, a3) -- Line: 59 -- upvalues: u45 (val)
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u45 + a1, 0, 0)
                return v1 - v1.Position
            end)):andThen(function() -- Line: 62 -- upvalues: u14 (val), EffectsController (upval), a1_2 (val), a2 (val)
                u14:Destroy()
                EffectsController.Explosion({
                    Position = a1_2,
                    Radius = a2,
                    Color = BrickColor.new("Br. yellowish orange"),
                    Sound = 4725504496,
                    Material = Enum.Material.Neon,
                    Particles = false,
                    Visible = true,
                })
            end)
        end,
    }
end

return v1