-- Script path: ReplicatedStorage.Content.NewEnemies.Agent Ducky.Animator
-- Decompile time: 1.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 10 -- upvalues: Animation (val), EasySound (val), Laser (val)
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    local Handle = a1.Model.Handle
    local Start = a1.Model.PrimaryPart.ROOT.DEF_GUN.Start
    local u22 = Animation.new({Preload = true, Target = AnimationController, Track = Animations.Fire})
    local u28 = EasySound.Create({
        id = 120555463780737,
        volume = 0.5,
        soundGroupName = "Enemies",
        parent = a1.Model.PrimaryPart,
    })
    a1.Executables = {
        FireAt = function(a1_2) -- Line: 30
            -- upvalues: a1 (val), u22 (val), u28 (val), Handle (val), Start (val), Laser (upval)
            local PrimaryPart = a1_2.PrimaryPart
            a1:Face(PrimaryPart.Position, (TweenInfo.new(0.5)))
            u22:Play()
            u28:Play()
            a1:Wait(0.6)
            Handle.Transparency = 0
            a1:Wait(0.6)
            if not a1:IsAlive() then
                return
            end
            local v1 = {
                Start = Start.WorldPosition,
                Pos = PrimaryPart.Position,
                Color = BrickColor.new("Cork").Color,
                Transparency = 0.1,
                Size = 0.04,
                Fade = 90,
                Type = "Bullet",
                Bullet = "Normal",
            }
            Laser:Cast(v1)
            a1:Wait(1)
            Handle.Transparency = 1
        end,
        Death = function() -- Line: 61 -- upvalues: Animation (upval), AnimationController (val), Animations (val)
            Animation.new({Target = AnimationController, Track = Animations.Death}):Play()
        end,
    }
end

return v1