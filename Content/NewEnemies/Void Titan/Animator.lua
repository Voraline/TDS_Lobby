-- Script path: ReplicatedStorage.Content.NewEnemies.Void Titan.Animator
-- Decompile time: 1.81 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("SoundService")
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
require(ReplicatedStorage.Shared.Modules.ItemDrop)
require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local VoidTitan = ReplicatedStorage.Assets.Effects.Mob.VoidTitan
local v1 = {}
v1.__index = v1

function v1:_attack(a2) -- Line: 17 -- upvalues: TimescaleUtilities (val), VoidTitan (val), EmitterManager (val)
    TimescaleUtilities.Wait(1.46)
    local v1 = VoidTitan.VoidTitainExplosion:Clone()
    v1:PivotTo((CFrame.new(a2)))
    v1:ScaleTo(self.Stats.AttackRadius)
    v1.Parent = workspace.Trash
    EmitterManager.manualEmit(v1)
    TimescaleUtilities.CleanUp(v1, 3)
end

function v1._area(a1, a2, a3, a4, a5, a6) -- Line: 27
    -- upvalues: HttpService (val), AreaIndicatorStore (val)
    local u10 = HttpService:GenerateGUID(false)
    local create = AreaIndicatorStore.create
    local v1 = {type = if not (a2 > 0) then "full" else "normal", radius = a3}
    local v2 = false
    if a2 > 0 then
        v2 = 0
    end
    v1.initialAngle = v2
    v2 = false
    if a2 > 0 then
        v2 = a2
    end
    v1.desiredAngle = v2
    v1.color3 = Color3.fromRGB(255, 0, 64)
    v2 = false
    if a2 > 0 then
        v2 = a4
    end
    v1.cframe = v2
    local Position = false
    if a2 == 0 then
        Position = a4.Position
    end
    v1.position = Position
    v1.tweenInfo = a6 or TweenInfo.new(0.25)
    v1.lifeTime = a5
    create(u10, v1)
    a1:Delay(a5 + 1, function() -- Line: 46 -- upvalues: AreaIndicatorStore (upval), u10 (val)
        AreaIndicatorStore.remove(u10)
    end)
end

function v1.Initialize(a1) -- Line: 51 -- upvalues: VoidTitan (val), EmitterManager (val), TimescaleUtilities (val)
    a1.Executables = {
        HitEffect = function(a1_2) -- Line: 53 -- upvalues: VoidTitan (upval), a1 (val), EmitterManager (upval), TimescaleUtilities (upval)
            local v1 = VoidTitan.VoidTitainExplosion:Clone()
            v1:PivotTo((CFrame.new(a1_2)))
            v1:ScaleTo(a1.Stats.AttackRadius)
            v1.Parent = workspace.Trash
            EmitterManager.manualEmit(v1)
            TimescaleUtilities.CleanUp(v1, 3)
        end,
        Attack = function(a1_2) -- Line: 62 -- upvalues: a1 (val)
            a1:PlayAnimation("Attack")
            a1:Face(a1_2, TweenInfo.new(0.85), true)
            a1._throwTask = task.spawn(function() -- Line: 65 -- upvalues: a1 (upval), a1_2 (val)
                a1:_attack(a1_2)
            end)
        end,
        Death = function() -- Line: 69 -- upvalues: a1 (val)
            if a1._throwTask then
                task.cancel(a1._throwTask)
            end
            a1:StopAnimation("Attack")
            a1:PlayAnimation("Death")
        end,
    }
    a1:LoadAnimations()
end

return v1