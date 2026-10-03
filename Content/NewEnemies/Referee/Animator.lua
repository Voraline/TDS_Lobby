-- Script path: ReplicatedStorage.Content.NewEnemies.Referee.Animator
-- Decompile time: 2.61 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local Sounds = require(script.Parent.Sounds)
local Referee = ReplicatedStorage.Assets.Effects.Mob.Referee
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 19
    -- upvalues: Animation (val), Referee (val), EmitterManager (val), RunService (val), TimescaleUtilities (val)
    -- upvalues: EasySound (val), Sounds (val), HttpService (val), AreaIndicatorStore (val)
    local u10 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Attack,
        Target = a1.Model.AnimationController.Animator,
    })
    for i, j in {
        Start = function() -- Line: 31
            -- upvalues: a1 (val), Referee (upval), EmitterManager (upval), RunService (upval)
            -- upvalues: TimescaleUtilities (upval)
            local Delay, Heartbeat, Maid, Maid_2, _effect, _setConnection, v0, v1, v2
            a1._effect = Referee.FireEffect:Clone()
            a1._effect.Parent = workspace.Trash
            a1.Maid:Mark(a1._effect)
            EmitterManager.toggle(a1._effect, true)
            a1._setConnection = RunService.Heartbeat:Connect(function(a1_2) -- Line: 36 -- upvalues: a1 (upval)
                local WorldCFrame
                if a1._effect then
                    WorldCFrame = a1.Model.Fire.Value.WorldCFrame
                    a1._effect.CFrame = CFrame.lookAlong(WorldCFrame.Position, WorldCFrame.LookVector * Vector3.new(1, 0, 1))
                end
                return
            end)
            a1.Maid:Mark(a1._setConnection)
            TimescaleUtilities.Delay(10, function() -- Line: 47 -- upvalues: a1 (upval)
                local v0, v1
                if a1._effect then
                    a1._effect:Destroy()
                    a1._effect = nil
                    if a1._setConnection then
                        a1._setConnection:Disconnect()
                        a1._setConnection = nil
                    end
                end
                return
            end)
            return
        end,
        End = function() -- Line: 58 -- upvalues: a1 (val), EmitterManager (upval), TimescaleUtilities (upval)
            local Delay, v0, v1
            if a1._setConnection then
                a1._setConnection:Disconnect()
                a1._setConnection = nil
            end
            if a1._effect then
                EmitterManager.toggle(a1._effect, false)
            end
            TimescaleUtilities.Delay(5, function() -- Line: 68 -- upvalues: a1 (upval)
                local v0, v1
                if a1._effect then
                    a1._effect:Destroy()
                    a1._effect = nil
                end
                return
            end)
            return
        end,
    } do
        (u10.Controller:GetMarkerReachedSignal(i)):Connect(j)
    end
    a1.Executables = {
        BurnEffect = function(a1) -- Line: 82 -- upvalues: Referee (upval), TimescaleUtilities (upval)
            local u5 = Referee.Burn:Clone()
            u5.Parent = workspace.Trash
            u5:PivotTo(a1.PrimaryPart.CFrame)
            u5.Size = a1:GetExtentsSize()
            local WeldConstraint = Instance.new("WeldConstraint")
            WeldConstraint.Part0 = u5
            WeldConstraint.Part1 = a1.PrimaryPart
            WeldConstraint.Parent = u5
            TimescaleUtilities.Delay(3, function() -- Line: 93 -- upvalues: u5 (val), TimescaleUtilities (upval)
                for i, j in u5:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("Trail") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.Delay(2, function() -- Line: 99 -- upvalues: u5 (upval)
                    u5:Destroy()
                end)
            end)
        end,
        Fire = function(a1_2) -- Line: 105
            -- upvalues: a1 (val), u10 (val), EasySound (upval), Sounds (upval), HttpService (upval)
            -- upvalues: AreaIndicatorStore (upval), TimescaleUtilities (upval)
            a1:Face(a1_2, (TweenInfo.new(0.5)))
            u10:Play()
            EasySound.Play({
                volume = 0.5,
                soundGroupName = "Enemies",
                id = Sounds.WhistleSounds[math.random(1, #Sounds.WhistleSounds)],
                position = a1.Position,
                parent = workspace.CurrentCamera,
            })
            local v1 = HttpService:GenerateGUID(false)
            AreaIndicatorStore.create(v1, {
                type = "normal",
                initialAngle = 0,
                lifeTime = 2,
                radius = a1.Stats.FireRange,
                desiredAngle = a1.Stats.Angle,
                color3 = Color3.fromRGB(255, 0, 64),
                cframe = (CFrame.new(a1.Model.PrimaryPart.Node.WorldPosition * Vector3.new(1, 0, 1), a1_2 * Vector3.new(1, 0, 1))) * CFrame.new(0, a1.Model.PrimaryPart.Node.WorldPosition.Y + 0.1, 0),
                tweenInfo = TweenInfo.new(0.25),
            })
            TimescaleUtilities.Wait(3)
            AreaIndicatorStore.remove(v1)
        end,
    }
end

return v1