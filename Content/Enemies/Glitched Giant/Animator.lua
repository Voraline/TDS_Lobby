-- Script path: ReplicatedStorage.Content.Enemies.Glitched Giant.Animator
-- Decompile time: 0.36 ms

game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10
    while a1:IsAlive() do
        for k, v in pairs(a1.Model:GetDescendants()) do
            if v:IsA("MeshPart") or v:IsA("Part") then
                v.BrickColor = BrickColor.random()
            end
        end
        a1:Delay((Random.new():NextNumber(0.2, 1)))
    end
end

return v1