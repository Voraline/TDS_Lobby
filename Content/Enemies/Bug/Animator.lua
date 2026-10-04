-- Script path: ReplicatedStorage.Content.Enemies.Bug.Animator
-- Decompile time: 0.42 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1
require(ReplicatedStorage.Shared.Modules.Animation)
require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
require(ReplicatedStorage.Shared.Modules.Projectile)

function v1.Initialize(a1) -- Line: 14
    while a1:IsAlive() do
        for k, v in pairs(a1.Model:GetDescendants()) do
            if v:IsA("MeshPart") or v:IsA("Part") then
                v.BrickColor = BrickColor.Random()
            end
        end
        wait(Random.new():NextNumber(0.2, 1))
    end
end

return v1