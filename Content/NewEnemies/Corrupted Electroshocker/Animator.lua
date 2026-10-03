-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Electroshocker.Animator
-- Decompile time: 1.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local u21 = Random.new()
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12 -- upvalues: Animation (val), EmitterManager (val), u21 (val), Laser (val)
    local Animator = a1.Model.AnimationController.Animator
    a1._animations = {}
    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    a1.Executables = {
        Death = function(a1_2) -- Line: 28 -- upvalues: a1 (val), EmitterManager (upval), u21 (upval), Laser (upval)
            a1._animations.Death:Play()
            local DeathVFX = a1.Model:FindFirstChild("DeathVFX")
            if DeathVFX then
                EmitterManager.manualEmit(DeathVFX)
            end
            if #a1_2 <= 0 then
                return
            end
            local v1 = a1_2[1]
            local PrimaryPart = v1 and v1.PrimaryPart
            if not v1 and not PrimaryPart then
                return
            end
            local v2 = Color3.fromRGB(132, 0, 255)
            local v3 = u21:NextNumber(0.25, 1)
            local Start = a1.Model.ShockVFX.Start
            if Start and PrimaryPart then
                local v4 = {
                    minWidth = 0.1,
                    maxWidth = 0.2,
                    Bursts = 2,
                    Color = v2,
                    Start = Start.WorldPosition,
                    End = PrimaryPart.Position,
                    Lifetime = v3,
                    Offset = u21:NextNumber(0.25, 0.5),
                }
                Laser:Lightning(v4)
                if #a1_2 > 1 then
                    local PrimaryPart_2 = a1_2[#a1_2].PrimaryPart
                    if PrimaryPart_2 then
                        v4.Start = PrimaryPart.Position
                        v4.End = PrimaryPart_2.Position
                        Laser:Lightning(v4)
                    end
                end
            end
            a1:Delay(2)
        end,
    }
end

return v1