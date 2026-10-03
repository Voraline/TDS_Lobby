-- Script path: ReplicatedStorage.Content.NewEnemies.Circuit2.Animator
-- Decompile time: 0.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Laser (val), TimescaleUtilities (val)
    a1.Name = "Circuit"
    a1.Executables = {
        Lightning = function(a1_2, a2) -- Line: 14 -- upvalues: Laser (upval), a1 (val), TimescaleUtilities (upval)
            local v1 = {
                Start = a1_2.HumanoidRootPart.Position + (Vector3.new(0, Random.new():NextNumber(5, 8), 0)),
                Pos = a1_2.HumanoidRootPart.Position,
                Color = BrickColor.new("Medium blue"),
                Transparency = 0.1,
                Size = 0.15,
                Fade = 2,
                Type = "Fade",
            }
            Laser:Bolt(v1)
            for k, v in pairs(a1.Model.HumanoidRootPart.SpeedEffect:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    local u55 = v:Clone()
                    u55.Parent = a1_2.Hitbox
                    u55.Enabled = true
                    TimescaleUtilities.Delay(a2, function() -- Line: 35 -- upvalues: u55 (val)
                        u55:Destroy()
                    end)
                end
            end
        end,
    }
end

return v1