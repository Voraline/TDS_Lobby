-- Script path: ReplicatedStorage.Content.NewEnemies.Void Guardian.Animator
-- Decompile time: 1.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local VoidGuardian = ReplicatedStorage.Assets.Effects.Mob.VoidGuardian
local v1 = {}
v1.__index = v1

function v1:_playAnimation(a2, a3) -- Line: 13 -- types: self: table, a2: string
    local v1 = self._animations[a2]
    if not v1 then
        return
    end
    v1:Play(a3)
end

function v1:_stopAnimation(a2) -- Line: 22 -- types: self: table, a2: string
    local v1 = self._animations[a2]
    if not v1 then
        return
    end
    v1:Stop()
end

function v1.Initialize(a1) -- Line: 31
    -- upvalues: Create (val), SoundService (val), Animation (val), VoidGuardian (val), EmitterManager (val)
    -- upvalues: TimescaleUtilities (val)
    local v1
    a1._animations = {}
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local u17 = Create("Sound", {
        Name = "SummonPortal",
        SoundId = "rbxassetid://117524871823841",
        Volume = 0.75,
        Parent = a1.Model.PrimaryPart,
    })
    u17.SoundGroup = SoundService.Enemies
    for i, j in (Animations:GetChildren()) do
        if j.Name ~= "Walk" then
            v1 = Animation.new({IgnorePriority = true, Preload = true, Track = j, Target = AnimationController})
            a1._animations[j.Name] = v1
        end
    end
    a1.Executables = {
        Death = function() -- Line: 58 -- upvalues: a1 (val)
            a1:_stopAnimation("Attack")
            a1:_playAnimation("Death", 0)
        end,
        Attack = function(a1_2) -- Line: 62
            -- upvalues: a1 (val), u17 (val), VoidGuardian (upval), EmitterManager (upval), TimescaleUtilities (upval)
            a1:_playAnimation("Attack")
            local v1 = a1:Face(a1_2, TweenInfo.new(0.65), true)
            a1:CreateAreaIndicator({
                openTime = 0.65,
                angle = a1.Stats.FOV,
                radius = a1.Stats.AttackRadius,
                cframe = v1 * CFrame.new(0, a1.Model.PrimaryPart.Node.Position.Y, 0),
            })
            u17:Play()
            a1:Delay(0.45, function() -- Line: 72 -- upvalues: VoidGuardian (upval), a1 (upval), EmitterManager (upval), TimescaleUtilities (upval)
                local v1 = VoidGuardian.Attack:Clone()
                v1.CFrame = a1.Model.PrimaryPart.CFrame * CFrame.new(0, 0, -5)
                v1.Parent = workspace
                EmitterManager.manualEmit(v1)
                TimescaleUtilities.CleanUp(v1, 3)
            end)
        end,
    }
end

return v1