-- Script path: ReplicatedStorage.Content.NewEnemies.Projector.Animator
-- Decompile time: 3.06 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 17
    -- upvalues: Animation (val), EasySound (val), EmitterManager (val), HttpService (val), AreaIndicatorStore (val)
    -- upvalues: TimescaleUtilities (val), RunService (val), GameState (val), TweenService (val)
    local v1
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    local PrimaryPart = a1.Model.PrimaryPart
    a1._animations = {}
    for i, j in Animations:GetChildren() do
        v1 = Animation.new({Preload = true, Target = AnimationController, Track = j})
        a1._animations[j.Name] = v1
    end
    a1.Executables = {
        Attack = function(a1_2, a2) -- Line: 33
            -- upvalues: a1 (val), EasySound (upval), PrimaryPart (val), EmitterManager (upval), HttpService (upval)
            -- upvalues: AreaIndicatorStore (upval), TimescaleUtilities (upval), RunService (upval), GameState (upval)
            -- upvalues: TweenService (upval)
            local BeamStart = a1.Model.BeamStart
            local BeamEnd = a1.Model.BeamEnd
            local v1 = (workspace:GetServerTimeNow()) - a2
            local u19 = math.max(a1.Stats.LaserTime - v1, 0)
            local FOV = a1.Stats.FOV
            local Range = a1.Stats.Range
            local Windup = a1.Stats.Windup
            local Rest = a1.Stats.Rest
            local v2 = a1:Face(a1_2, (TweenInfo.new(Windup)))
            local u47 = v2 * CFrame.Angles(0, math.rad(FOV / 2), 0)
            local v3 = EasySound.Create({
                id = 103049083952231,
                volume = 0.5,
                destroyOnEnd = true,
                soundGroupName = "Enemies",
                playbackSpeed = 0.7,
                parent = PrimaryPart,
            })
            local AttackIntro = a1._animations.AttackIntro
            AttackIntro:Play()
            AttackIntro:AdjustSpeed(1 / (Windup / AttackIntro.Controller.Length))
            EmitterManager.toggle(BeamStart, true)
            local v4 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v4, {
                type = "normal",
                initialAngle = 0,
                radius = Range,
                desiredAngle = FOV,
                tweenInfo = TweenInfo.new(0.25),
                lifeTime = Windup + u19,
                color3 = Color3.fromRGB(255, 0, 64),
                cframe = (CFrame.new(PrimaryPart.Node.WorldPosition)) * v2.Rotation,
            })
            TimescaleUtilities.Wait(Windup)
            local AttackLoop = a1._animations.AttackLoop
            AttackLoop:Play()
            AttackLoop:AdjustSpeed(1 / (u19 / AttackLoop.Controller.Length))
            v3:Play()
            EmitterManager.toggle(BeamEnd, true)
            BeamEnd.Position = BeamStart.Position
            local u125 = 0
            local v5 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 90
                -- upvalues: a1 (upval), GameState (upval), u125 (ref), u19 (val), TweenService (upval), FOV (val)
                -- upvalues: Range (val), u47 (val), BeamEnd (val)
                if not a1:IsAlive() then
                    return
                end
                local v1 = a1_2 * GameState.TimeScale
                local v2 = u125 / u19
                local v3 = v2 < 0.5 and math.min(v2 * 2, 1) or math.max(1 - (v2 - 0.5) * 2, 0)
                local Value = TweenService:GetValue(v3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                local v4 = u47 * CFrame.Angles(0, math.rad(-FOV * Value or Range), 0) * CFrame.new(0, 0, -Range)
                local v5 = RaycastParams.new()
                v5.FilterType = Enum.RaycastFilterType.Include
                v5.FilterDescendantsInstances = {workspace.Ground}
                local v6 = Vector3.new(0, 1, 0) * -a1.Height
                local v7 = workspace:Raycast(v4.Position, v6, v5)
                local Position_2 = v7 and v7.Position or v4.Position + v6
                BeamEnd.Position = Position_2
                u125 = u125 + v1
            end)
            TimescaleUtilities.Wait(u19)
            v5:Disconnect()
            EmitterManager.toggle(BeamStart, false)
            EmitterManager.toggle(BeamEnd, false)
            local AttackOutro = a1._animations.AttackOutro
            AttackOutro:Play()
            AttackOutro:AdjustSpeed(1 / (Rest / AttackOutro.Controller.Length))
        end,
        Death = function() -- Line: 133 -- upvalues: a1 (val)
            a1._animations.Death:Play()
        end,
    }
end

return v1