-- Script path: ReplicatedStorage.Content.NewEnemies.Long Ducky.Animator
-- Decompile time: 1.28 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1
local LongDucky = ReplicatedStorage.Assets.Effects.Mob.LongDucky

function v1.Initialize(a1) -- Line: 12
    -- upvalues: EasySound (val), Animation (val), LongDucky (val), EmitterManager (val), Debris (val)
    local u1 = nil
    local u7 = EasySound.Create({
        id = 97784252057860,
        destroyOnEnd = true,
        soundGroupName = "Enemies",
        parent = a1.Model.RootPart,
    })
    local u13 = EasySound.Create({
        id = 112711095105742,
        destroyOnEnd = false,
        soundGroupName = "Enemies",
        parent = a1.Model.RootPart,
    })
    local u22 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.Death,
        Target = a1.Model.AnimationController,
    })
    local u31 = Animation.new({
        Preload = true,
        Track = a1.Model.Animations.Attack,
        Target = a1.Model.AnimationController,
    })
    ;(u31.Controller:GetMarkerReachedSignal("Hit")):Connect(function() -- Line: 38 -- upvalues: u1 (ref), LongDucky (upval), EmitterManager (upval), Debris (upval)
        if u1 then
            local v1 = u1
            if v1:IsDescendantOf(workspace) then
                v1 = LongDucky.Hit:Clone()
                v1.Position = u1.PrimaryPart.Position
                v1.Parent = workspace.CurrentCamera
                EmitterManager.manualEmit(v1)
                Debris:AddItem(v1, 3)
            end
        end
    end)
    a1.Executables = {
        Attack = function(a1_2) -- Line: 49 -- upvalues: u1 (ref), a1 (val), u31 (val), u13 (val)
            if a1_2 then
                u1 = a1_2
                a1:Face(a1_2.PrimaryPart.Position)
            end
            u31:Play()
            u13:Play()
        end,
        Death = function() -- Line: 58 -- upvalues: u22 (val), u7 (val)
            u22:Play()
            u7:Play()
        end,
    }
end

return v1