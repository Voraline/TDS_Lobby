-- Script path: ReplicatedStorage.Content.Enemies.Jaxe.Animator
-- Decompile time: 0.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val)
    a1.Executables = {
        Throw = function() -- Line: 14 -- upvalues: a1 (val), Animation (upval)
            local Handle = a1.Model:WaitForChild("Handle")
            a1.Model:WaitForChild("Head").Laugh:Play()
            local v1 = Animation.new({
                Track = a1.Model.Animations.Throw,
                Target = a1.Model.AnimationController,
            })
            v1:Play()
            local u30 = nil
            local v2 = (v1.Controller:GetMarkerReachedSignal("Action")):Connect(function(a1) -- Line: 27 -- upvalues: Handle (val), u30 (ref)
                if a1 == "Throw" then
                    Handle.Spin:Play()
                    return
                end
                if a1 == "Return" then
                    Handle.Return:Play()
                    return
                end
                if a1 == "Walk" then
                    u30:Disconnect()
                end
            end)
        end,
        Death = function() -- Line: 38 -- upvalues: Animation (upval), a1 (val)
            Animation.new({
                Track = a1.Model.Animations.Died,
                Target = a1.Model.AnimationController,
            }):Play()
            a1.Model.Head.Died:Play()
        end,
    }
end

return v1