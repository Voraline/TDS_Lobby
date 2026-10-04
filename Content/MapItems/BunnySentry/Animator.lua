-- Script path: ReplicatedStorage.Content.MapItems.BunnySentry.Animator
-- Decompile time: 4.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u52 = {
    popOut = 72689608727399,
    jump = 125947194393049,
    randomVoices = {111793673318356, 108162443076353, 91244920562434},
    shoots = {100450242498781, 111149984323555},
}
return {
    new = function(a1, a2, a3) -- Line: 26
        -- upvalues: Maid (val), Animation (val), u52 (val), Create (val), RunService (val), TimescaleUtilities (val)
        -- upvalues: ItemDrop (val), EffectsController (val), EmitterManager (val)
        return {
            maid = Maid.new(),
            Destroy = function(self) -- Line: 31
                self.maid:Sweep()
                task.defer(function() -- Line: 33 -- upvalues: self (val)
                    self.mainBone.CFrame = self.boneCFrame
                    self.animations.Open:Stop()
                    self.animations.Idle:Stop()
                end)
            end,
            LoadAnimations = function(self) -- Line: 40 -- upvalues: a1 (val), Animation (upval)
                local v1
                self.animations = {}
                for i, j in a1.Animations:GetChildren() do
                    v1 = Animation.new({
                        IgnorePriority = true,
                        Preload = true,
                        Track = j,
                        Target = a1.AnimationController.Animator,
                    })
                    self.animations[j.Name] = v1
                end
                self.animations.Closed:Play()
            end,
            Initialize = function(a1_2) -- Line: 54
                -- upvalues: a1 (val), u52 (upval), Create (upval), a3 (val), RunService (upval)
                -- upvalues: TimescaleUtilities (upval), ItemDrop (upval), EffectsController (upval)
                local v1, v2, v3, v4
                a1_2:LoadAnimations()
                a1_2.sounds = {}
                a1_2.barrel = 0
                a1_2.shootEffects = {}
                for i, j in a1:GetDescendants() do
                    if j.Name == "Shoot2" or j.Name == "Shoot" then
                        a1_2.shootEffects[j.Name] = j
                    end
                end
                local v5 = nil
                local v6 = nil
                for k, n in u52, v5, v6 do
                    if typeof(n) ~= "table" then
                        v2 = Create("Sound", {
                            Volume = 0.28,
                            SoundId = "rbxassetid://" .. n,
                            Name = k,
                            Parent = a1.MainBody.Root.LowerSpring,
                            SoundGroup = game:GetService("SoundService").Towers,
                        })
                        a1_2.sounds[k] = v2
                    else
                        v3 = nil
                        v4 = nil
                        for m, i5 in n, v3, v4 do
                            v1 = Create("Sound", {
                                Volume = 0.28,
                                SoundId = "rbxassetid://" .. i5,
                                Name = k,
                                Parent = a1.MainBody.Root.LowerSpring,
                                SoundGroup = game:GetService("SoundService").Towers,
                            })
                            if not a1_2.sounds[k] then
                                a1_2.sounds[k] = {}
                            end
                            table.insert(a1_2.sounds[k], v1)
                        end
                    end
                end
                a1_2.mainBone = a1.MainBody.Root.LowerSpring
                a1_2.boneCFrame = a1_2.mainBone.CFrame
                a1_2.position = a1.MainBody:GetPivot().Position
                a1_2.defaultCFrame = a1_2.mainBone.WorldCFrame
                a1_2.animations.Open:Play()
                a1_2.animations.Idle:Play()
                a1_2.animations.Closed:Stop()
                a1_2.sounds.popOut:Play()
                local mainBone = a1_2.mainBone
                mainBone.CFrame = mainBone.CFrame * CFrame.new(0, 10, 0)
                if a3:WaitForState("State") == "Death" then
                    a1_2.mainBone.WorldCFrame = a1_2.defaultCFrame
                    a1_2.animations.JumpLoop:Stop(0)
                    a1_2.animations.Closed:Play(0)
                    a1_2.animations.Open:Stop()
                    a1_2.animations.Idle:Stop()
                end
                warn(a3)
                ;(a3:GetStateChangedSignal("State")):Connect(function(a1) -- Line: 122 -- upvalues: a1_2 (val)
                    if a1 == "Reset" then
                        a1_2.mainBone.CFrame = a1_2.boneCFrame
                        a1_2.animations.Open:Stop()
                        a1_2.animations.Idle:Stop()
                    end
                end)
                a1_2.maid:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 130 -- upvalues: a1_2 (val)
                    if a1_2.sacrificing then
                        return
                    end
                    a1_2:UpdateModel()
                end)))
                a1_2.Executables = {
                    LaunchAttack = function(a1) -- Line: 139
                        -- upvalues: a1_2 (val), TimescaleUtilities (upval), RunService (upval), ItemDrop (upval)
                        -- upvalues: EffectsController (upval)
                        a1_2.sacrificing = true
                        local v1 = CFrame.new(
                            a1_2.mainBone.WorldPosition,
                            (Vector3.new(a1.endPosition.X, a1_2.mainBone.WorldPosition.Y, a1.endPosition.Z))
                        )
                        a1_2.face = v1 * CFrame.Angles(0, 3.141592653589793, 0)
                        a1_2.mainBone.WorldCFrame = a1_2.face
                        a1_2.sounds.jump:Play()
                        a1_2.animations.Jump:Play()
                        TimescaleUtilities.Wait(0.6)
                        a1_2.sounds.randomVoices[math.random(1, #a1_2.sounds.randomVoices)]:Play()
                        a1_2.animations.JumpLoop:Play()
                        a1_2.animations.Jump:Stop()
                        local Part = Instance.new("Part")
                        local u79 = RunService.Heartbeat:Connect(function(a1) -- Line: 163 -- upvalues: a1_2 (upval), Part (val)
                            a1_2.mainBone.WorldCFrame = Part.CFrame
                        end)
                        ;(ItemDrop.Drop(a1.startPosition, a1.endPosition, Part, a1.dtMultiplier, a1.gravity, a1.velocity, function(a1, a2, a3) -- Line: 174
                            return CFrame.lookAt(a3, a2).Rotation * CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0)
                        end)):andThen(function() -- Line: 178 -- upvalues: EffectsController (upval), a1 (val), u79 (val), Part (val), a1_2 (upval)
                            EffectsController.BigExplosion(a1.endPosition + Vector3.new(0, 6, 0), 20)
                            u79:Disconnect()
                            Part:Destroy()
                            a1_2.mainBone.WorldCFrame = a1_2.defaultCFrame
                            a1_2.animations.JumpLoop:Stop(0)
                            a1_2.animations.Closed:Play(0)
                            a1_2.animations.Open:Stop()
                            a1_2.animations.Idle:Stop()
                        end)
                    end,
                }
                warn("BunnyInitialize")
            end,
            Step = function(a1, a2_2) -- Line: 195 -- upvalues: EmitterManager (upval), TimescaleUtilities (upval), a2 (val)
                if a1.sacrificing then
                    return
                end
                local v1 = a1:FindTarget()
                if v1 then
                    local Position = v1.Model.PrimaryPart.Position
                    a1.face = (CFrame.new(a1.mainBone.WorldPosition, (Vector3.new(Position.X, a1.mainBone.WorldPosition.Y, Position.Z)))) * CFrame.Angles(0, 3.141592653589793, 0)
                    a1.barrel = a1.barrel + 1
                    if 1 < a1.barrel then
                        a1.barrel = 0
                    end
                    if a1.barrel ~= 0 then
                        EmitterManager.manualEmit(a1.shootEffects.Shoot2)
                        a1.animations.ShootLeft:Play()
                    else
                        EmitterManager.manualEmit(a1.shootEffects.Shoot)
                        a1.animations.ShootRight:Play()
                    end
                    a1.sounds.shoots[math.random(1, #a1.sounds.shoots)]:Play()
                end
                TimescaleUtilities.Wait(a2.Cooldown)
            end,
            UpdateModel = function(self) -- Line: 229
                if self.face then
                    self.mainBone.WorldCFrame = self.face
                end
            end,
        }
    end,
}