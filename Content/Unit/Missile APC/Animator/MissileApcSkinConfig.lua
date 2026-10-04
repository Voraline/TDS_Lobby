-- Script path: ReplicatedStorage.Content.Unit.Missile APC.Animator.MissileApcSkinConfig
-- Decompile time: 1.18 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local CurrentCamera = workspace.CurrentCamera
local v1 = {}

local function scaleParticleHack(a1, a2) -- Line: 11 -- types: a1: userdata, a2: number
    local Parent = a1.Parent
    local Model = Instance.new("Model")
    a1.Parent = Model
    Model:ScaleTo(a2)
    a1.Parent = Parent
    Model:Destroy()
end

v1.Overrides = {
    MissileExplosion = {
        Wonderland = function(a1, a2, a3) -- Line: 22
            -- upvalues: ReplicatedStorage (val), CurrentCamera (val), EmitterManager (val), Debris (val)
            local v1 = ReplicatedStorage.Assets.Effects.SingleEmit.WonderlandMissileExplosion:Clone()
            local Parent = v1.Parent
            local Model = Instance.new("Model")
            v1.Parent = Model
            Model:ScaleTo(a2)
            v1.Parent = Parent
            Model:Destroy()
            v1.Parent = CurrentCamera
            v1.Position = a3
            EmitterManager.manualEmit(v1)
            Debris:AddItem(v1, 3)
        end,
    },
    DeathExplosion = {
        Wonderland = function(a1) -- Line: 33 -- upvalues: ReplicatedStorage (val), EmitterManager (val), Debris (val)
            local v1 = ReplicatedStorage.Assets.Effects.SingleEmit.WonderlandApcDeath:Clone()
            v1.CFrame = a1.Model.PrimaryPart.Node.WorldCFrame
            v1.Parent = workspace.Trash
            EmitterManager.manualEmit(v1)
            Debris:AddItem(v1, 2)
        end,
    },
}
v1.MissileExplosions = {
    Wonderland = {Name = "WonderlandMissileExplosion", Scale = 1},
    Patriotic = {Name = "FireworkExplosion", Scale = 0.3333333333333333},
    Werewolf = {Name = "PurpleExplosion", Scale = 0.3333333333333333},
}
v1.DeathExplosion = {Wonderland = {Name = "WonderlandApcDeath", Scale = 1}}
v1.IgnoreReload = {Werewolf = true}
return v1