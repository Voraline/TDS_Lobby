-- Script path: ReplicatedStorage.Content.NewEnemies.Witch.Animator
-- Decompile time: 1.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
require(ReplicatedStorage.Client.Modules.Shaker)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 26 -- upvalues: Animation (val), ItemDrop (val), EmitterManager (val)
    function a1.HideFlask(a1_2) -- Line: 27 -- upvalues: a1 (val) -- types: a1_2: boolean
        local Handle = a1.Model:FindFirstChild("Handle")
        if Handle then
            Handle.Transparency = if not a1_2 then 0 else 1
            local Gloop = Handle:FindFirstChild("Gloop")
            if Gloop then
                Gloop.Transparency = if not a1_2 then 0 else 1
            end
        end
    end

    a1.Executables = {
        Attack = function(a1_2, a2, a3) -- Line: 41 -- upvalues: Animation (upval), a1 (val), ItemDrop (upval), EmitterManager (upval)
            Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            }):Play()
            a1:Delay(0.9)
            local u27 = a1.Model.Handle:Clone()
            u27.Anchored = true
            u27.Parent = workspace.CurrentCamera
            a1.HideFlask(true)
            local CFrame = a1.Model.Handle.CFrame
            local u43 = Random.new():NextNumber()
            ;(ItemDrop.Drop(CFrame, a1_2, u27, 6, -1.5, 4, function(a1, a2, a3) -- Line: 65 -- upvalues: u43 (val)
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u43 + a1, 0, 0)
                return v1 - v1.Position
            end)):andThen(function(a1) -- Line: 70 -- upvalues: u27 (val), EmitterManager (upval), a2 (val)
                u27:Destroy()
                EmitterManager.Emit("BileExplosion", CFrame.new(a1), a2)
            end)
            a1:Delay(a3 / 2)
            a1.HideFlask(false)
        end,
    }
end

return v1