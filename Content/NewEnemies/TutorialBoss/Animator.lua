-- Script path: ReplicatedStorage.Content.NewEnemies.TutorialBoss.Animator
-- Decompile time: 1.15 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13 -- upvalues: Shaker (val), EmitterManager (val), Animation (val)
    local WalkTrack = a1.WalkTrack
    local u2 = true
    task.spawn(function() -- Line: 18 -- upvalues: WalkTrack (ref), a1 (val), u2 (ref), Shaker (upval), EmitterManager (upval)
        while not WalkTrack do
            WalkTrack = a1.WalkTrack
            task.wait()
        end
        WalkTrack.KeyframeReached:Connect(function() -- Line: 24 -- upvalues: u2 (upval), a1 (upval), Shaker (upval), EmitterManager (upval)
            u2 = not u2
            local Model = a1.Model
            if not workspace.CurrentCamera then
                return
            end
            local v1 = u2 and Model["Left Hand"] or Model["Right Hand"]
            local Position = v1.CFrame:ToWorldSpace((CFrame.new(0, -v1.Size.Y * 0.5, 0))).Position
            Shaker:Shake({0.25, 20, 0.1, 1}, 0.2, 0.25)
            Model.Head.Stomp:Play()
            EmitterManager.Emit("BileExplosionQuietSound", CFrame.lookAt(Position, Position + Vector3.new(0, 1, 0)), 1)
        end)
    end)
    a1.Executables = {
        Death = function() -- Line: 49 -- upvalues: WalkTrack (ref), Animation (upval), a1 (val)
            WalkTrack:Stop()
            Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Revive:Play()
        end,
    }
end

return v1