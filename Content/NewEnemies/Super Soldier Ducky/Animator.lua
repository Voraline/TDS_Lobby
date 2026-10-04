-- Script path: ReplicatedStorage.Content.NewEnemies.Super Soldier Ducky.Animator
-- Decompile time: 1.44 ms

local Debris = game:GetService("Debris")
game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local CurrentCamera = workspace.CurrentCamera
local SuperSoldierDucky = ReplicatedStorage.Assets.Effects.Mob.SuperSoldierDucky
local v1 = {}
v1.__index = v1

local function stepProjectile(a1) -- Line: 16
    return CFrame.new(a1.start:Lerp(a1.goal, a1.alpha))
end

local function projectileFinished(a1) -- Line: 21
    -- upvalues: SuperSoldierDucky (val), CurrentCamera (val), Debris (val), EmitterManager (val)
    local part = a1.part
    local v1 = SuperSoldierDucky.Hit:Clone()
    v1.Position = a1.goal
    v1.Parent = CurrentCamera
    Debris:AddItem(v1, 2)
    EmitterManager.manualEmit(v1)
    part.Transparency = 1
    Debris:AddItem(part, 1)
end

function v1.Initialize(a1) -- Line: 33
    -- upvalues: Animation (val), EasySound (val), SuperSoldierDucky (val), EmitterManager (val), CustomProjectile (val)
    -- upvalues: stepProjectile (val), projectileFinished (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    local Start = a1.Model.PrimaryPart.ROOT.DEF_GUN.DEF_GUN_BARREL.Start
    local u21 = Animation.new({Preload = true, Target = AnimationController, Track = Animations.Fire})
    local u27 = EasySound.Create({
        id = 121450057177421,
        name = "Fire",
        volume = 0.5,
        destroyOnEnd = true,
        soundGroupName = "Enemies",
        parent = a1.Model.PrimaryPart,
    })
    a1.Executables = {
        Fire = function(a1_2, a2) -- Line: 54
            -- upvalues: Start (val), a1 (val), u21 (val), SuperSoldierDucky (upval), EmitterManager (upval), u27 (val)
            -- upvalues: CustomProjectile (upval), stepProjectile (upval), projectileFinished (upval)
            local WorldPosition = Start.WorldPosition
            a1:Face(a1_2)
            u21:Play()
            local v1 = SuperSoldierDucky.Projectile:Clone()
            v1.Position = WorldPosition
            v1.Parent = workspace
            EmitterManager.manualEmit(Start)
            u27:Play()
            CustomProjectile:ThrowProjectile(WorldPosition, a1_2, a2, v1, stepProjectile, projectileFinished)
        end,
        Death = function() -- Line: 74 -- upvalues: Animation (upval), AnimationController (val), Animations (val)
            Animation.new({Target = AnimationController, Track = Animations.Death}):Play()
        end,
    }
end

return v1