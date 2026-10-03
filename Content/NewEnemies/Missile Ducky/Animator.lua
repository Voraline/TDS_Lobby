-- Script path: ReplicatedStorage.Content.NewEnemies.Missile Ducky.Animator
-- Decompile time: 2.92 ms

local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local CurrentCamera = workspace.CurrentCamera
local MissileDucky = ReplicatedStorage.Assets.Effects.Mob.MissileDucky
local v1 = {}
v1.__index = v1

local function stepProjectile(a1) -- Line: 18
    local timeToDest = a1.timeToDest
    local alpha = a1.alpha
    local Position = a1.lastCFrame.Position
    local start = a1.start
    local goal = a1.goal
    local v1 = CFrame.lookAt(start, goal)
    local v2 = v1:Lerp(CFrame.lookAlong(goal, v1.LookVector), alpha)
    local v3 = (goal - start).Magnitude / 2 * a1.heightFactor
    local v4 = math.sin(alpha * 3.141592653589793)
    local v5 = math.min(math.sin(alpha * 3.141592653589793) * 2, 1)
    local v6 = a1.elapsedTime * 10
    local v7 = math.pow(-1, a1.dir)
    local v8 = v2 * CFrame.new(v7 * 1.5 * math.cos(v6) * v5, v3 * v4 + math.sin(v6) * 1.5 * v5, 0)
    return (CFrame.new(v8.Position, v8.Position + (v8.Position - Position).Unit)) * CFrame.Angles(0, 0, v7 * -12.566370614359172 * timeToDest * alpha)
end

local function projectileFinished(a1) -- Line: 44
    -- upvalues: MissileDucky (val), CurrentCamera (val), Debris (val), EmitterManager (val), EasySound (val)
    local part = a1.part
    local v1 = MissileDucky.RocketExplosion:Clone()
    v1.Position = a1.goal + Vector3.new(0, 1, 0)
    v1.Parent = CurrentCamera
    Debris:AddItem(v1, 2)
    EmitterManager.manualEmit(v1)
    EasySound.Play({
        id = 115428290108131,
        volume = 0.5,
        destroyOnEnd = true,
        soundGroupName = "Enemies",
        parent = v1,
    })
    part.Transparency = 1
    EmitterManager.toggle(part.Flame, false)
    Debris:AddItem(part, 1)
end

function v1.Initialize(a1) -- Line: 66
    -- upvalues: Animation (val), EasySound (val), MissileDucky (val), CurrentCamera (val), EmitterManager (val)
    -- upvalues: HttpService (val), AreaIndicatorStore (val), CustomProjectile (val), stepProjectile (val)
    -- upvalues: projectileFinished (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    local Start = a1.Model.PrimaryPart.ROOT.DEF_CANNON.Start
    local u20 = Animation.new({Preload = true, Target = AnimationController, Track = Animations.Fire})
    local u26 = EasySound.Create({
        id = 113701525344643,
        name = "Fire",
        volume = 0.5,
        soundGroupName = "Enemies",
        parent = a1.Model.PrimaryPart,
    })
    a1.Executables = {
        Fire = function(a1_2, a2, a3, a4, a5) -- Line: 86
            -- upvalues: Start (val), a1 (val), u20 (val), MissileDucky (upval), CurrentCamera (upval)
            -- upvalues: EmitterManager (upval), HttpService (upval), AreaIndicatorStore (upval), u26 (val)
            -- upvalues: CustomProjectile (upval), stepProjectile (upval), projectileFinished (upval)
            local WorldPosition = Start.WorldPosition
            a1:Face(a1_2)
            u20:Play()
            local v1 = MissileDucky.Missile:Clone()
            v1.Parent = CurrentCamera
            v1.Position = WorldPosition
            EmitterManager.manualEmit(Start)
            local v2 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v2, {
                type = "full",
                fadeInTime = 0.25,
                radius = a3,
                tweenInfo = TweenInfo.new(a2),
                lifeTime = a2,
                color3 = Color3.fromRGB(255, 0, 64),
                position = a1_2,
            })
            u26:Play()
            CustomProjectile:ThrowProjectile(WorldPosition, a1_2, a2, v1, stepProjectile, projectileFinished, {dir = a4, heightFactor = a5})
        end,
        Death = function() -- Line: 130 -- upvalues: Animation (upval), AnimationController (val), Animations (val)
            Animation.new({Target = AnimationController, Track = Animations.Death}):Play()
        end,
    }
end

return v1