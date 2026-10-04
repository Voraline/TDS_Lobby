-- Script path: ReplicatedStorage.Content.NewEnemies.MiniHand.Animator
-- Decompile time: 2.27 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local HandBoss = ReplicatedStorage.Assets.Effects.Mob.HandBoss
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 16
    -- upvalues: Animation (val), HandBoss (val), EmitterManager (val), ItemDrop (val), HttpService (val)
    -- upvalues: AreaIndicatorStore (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    local u15 = Animation.new({
        Preload = true,
        IgnorePriority = true,
        IsPersistent = true,
        Target = AnimationController,
        Track = Animations.Shoot_old,
    })
    a1.Executables = {
        SwingHand = function(a1_2) -- Line: 29 -- upvalues: a1 (val)
            a1.LookAt = a1:Face(a1_2.Position, TweenInfo.new(0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), true)
        end,
        FireAt = function(a1_2) -- Line: 37 -- upvalues: u15 (val), a1 (val), HandBoss (upval), EmitterManager (upval), ItemDrop (upval)
            u15:Play()
            a1:Delay(0.8)
            local u14 = HandBoss.Bullet:Clone()
            u14.Parent = workspace.Trash
            u14.CFrame = a1.Model.ParticleRef.MuzzleFlash.Value.WorldCFrame
            EmitterManager.manualEmit(a1.Model.ParticleRef.MuzzleFlash.Value)
            ;(ItemDrop.Drop(a1_2.start, a1_2.goal, u14, a1_2.dtMultiplier, a1_2.gravity, a1_2.velocity, function(a1, a2, a3) -- Line: 55
                return CFrame.lookAt(a3, a2).Rotation
            end)):andThen(function() -- Line: 58 -- upvalues: a1 (upval), EmitterManager (upval), a1_2 (val), u14 (val)
                local v1 = math.rad(a1.Stats.FOV / 2)
                local v2 = a1.Stats.Range * math.tan(v1)
                EmitterManager.Emit("FrostyExplosionNarrator", CFrame.new(a1_2.goal), v2)
                u14:Destroy()
            end)
        end,
        AreaIndicator = function(a1_2, a2, a3, a4) -- Line: 67
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), a1 (val)
            local v1 = HttpService:GenerateGUID(false)
            local create = AreaIndicatorStore.create
            local v2 = {type = if not (a1_2 > 0) then "full" else "normal", radius = a2}
            local v3 = false
            if a1_2 > 0 then
                v3 = 0
            end
            v2.initialAngle = v3
            v3 = false
            if a1_2 > 0 then
                v3 = a1_2
            end
            v2.desiredAngle = v3
            v2.color3 = Color3.fromRGB(255, 0, 64)
            v3 = false
            if a1_2 > 0 then
                v3 = a3
            end
            v2.cframe = v3
            local Position = false
            if a1_2 == 0 then
                Position = a3.Position
            end
            v2.position = Position
            v2.tweenInfo = TweenInfo.new(0.25)
            v2.lifeTime = a4
            create(v1, v2)
            a1:Wait(a4 + 1)
            AreaIndicatorStore.remove(v1)
        end,
        Death = function() -- Line: 83 -- upvalues: Animation (upval), AnimationController (val), Animations (val)
            Animation.new({Target = AnimationController, Track = Animations.Death}):Play()
        end,
    }
end

return v1