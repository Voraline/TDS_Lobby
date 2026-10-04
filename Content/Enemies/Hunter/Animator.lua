-- Script path: ReplicatedStorage.Content.Enemies.Hunter.Animator
-- Decompile time: 1.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)

function v1.Initialize(a1) -- Line: 15
    -- upvalues: ReplicatedStorage (val), Projectile (val), Animation (val), Create (val)
    a1.ArrowType = "Arrow"

    function a1.Arrow(a1, a2, a3) -- Line: 17 -- upvalues: ReplicatedStorage (upval), Projectile (upval)
        a1.Part = (ReplicatedStorage:WaitForChild("Effects")):WaitForChild(a3)
        Projectile:CalcDuration(a1)
        Projectile:Throw(a1)
    end

    a1.Executables = {
        Projectile = function(a1_2) -- Line: 27 -- upvalues: Animation (upval), a1 (val), Create (upval)
            local v1 = Animation.new({
                Track = a1.Model.Animations.Shoot,
                Target = a1.Model.AnimationController,
            })
            local u12 = nil
            local v2 = (v1.Controller:GetMarkerReachedSignal("Action")):Connect(function(a1_3) -- Line: 34 -- upvalues: a1 (upval), a1_2 (val), Create (upval), u12 (ref)
                if a1_3 == "Fire" then
                    a1.Model.Weapon.Arrow.Transparency = 1
                    a1.Arrow(a1_2, a1.Model.Weapon.Pull, a1.ArrowType)
                    Create("Sound", {
                        PlayOnRemove = true,
                        SoundId = a1.Model.Weapon.Handle.Fire.SoundId,
                        Parent = a1.Model.Weapon.Handle,
                    }):Destroy()
                    return
                end
                if a1_3 == "Arrow" then
                    a1.Model.Weapon.FakeArrow.Transparency = 0
                    return
                end
                if a1_3 == "Pull" then
                    a1.Model.Weapon.Arrow.Transparency = 0
                    a1.Model.Weapon.FakeArrow.Transparency = 1
                    Create("Sound", {
                        PlayOnRemove = true,
                        SoundId = a1.Model.Weapon.Handle.Draw.SoundId,
                        Parent = a1.Model.Weapon.Handle,
                    }):Destroy()
                    u12:Disconnect()
                end
            end)
            v1:Play()
        end,
    }
end

return v1