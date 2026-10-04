-- Script path: ReplicatedStorage.Content.Enemies.Beehive.Animator
-- Decompile time: 0.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val)
    a1.Executables = {
        Normal = function() -- Line: 15 -- upvalues: a1 (val), Animation (upval)
            a1.Model.Folder.Beehive.Transparency = 1
            a1.Model.Folder.Honey.Transparency = 1
            a1.Model.Folder.Bees.Transparency = 1
            a1.Model.Head.face.Texture = "rbxassetid://1580311808"
            Animation.new({
                Track = a1.Model.Animations.NormalWalk,
                Target = a1.Model.AnimationController,
            }):Play()
        end,
    }
end

return v1