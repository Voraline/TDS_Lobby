-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Pyromancer.Animator
-- Decompile time: 2.49 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local CorruptedPyromancer = ReplicatedStorage.Assets.Effects.Mob.CorruptedPyromancer
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15
    -- upvalues: Animation (val), CorruptedPyromancer (val), RunService (val), TimescaleUtilities (val)
    -- upvalues: HttpService (val), AreaIndicatorStore (val)
    local u10 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Attack,
        Target = a1.Model.AnimationController.Animator,
    })
    for i, j in {
        Start = function() -- Line: 27
            -- upvalues: a1 (val), CorruptedPyromancer (upval), RunService (upval), TimescaleUtilities (upval)
            local Delay, Heartbeat, Maid, _setConnection, v0, v1, v2
            a1._effect = CorruptedPyromancer.FireEffect:Clone()
            a1._effect.Parent = workspace.Trash
            a1._setConnection = RunService.Heartbeat:Connect(function(a1_2) -- Line: 30 -- upvalues: a1 (upval)
                local WorldCFrame
                if a1._effect then
                    WorldCFrame = a1.Model.Fire.Value.WorldCFrame
                    a1._effect.Part.CFrame = CFrame.lookAlong(WorldCFrame.Position, WorldCFrame.LookVector * Vector3.new(1, 0, 1))
                end
                return
            end)
            a1.Maid:Mark(a1._setConnection)
            TimescaleUtilities.Delay(10, function() -- Line: 41 -- upvalues: a1 (upval)
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
        End = function() -- Line: 52 -- upvalues: a1 (val), TimescaleUtilities (upval)
            local Delay, Descendants, Descendants_2, Descendants_3, v0, v1, v3, v4, v5, v6
            if a1._setConnection then
                a1._setConnection:Disconnect()
                a1._setConnection = nil
            end
            if a1._effect then
                for i, j in a1._effect:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("Trail") then
                        j.Enabled = false
                    end
                end
            end
            TimescaleUtilities.Delay(5, function() -- Line: 66 -- upvalues: a1 (upval)
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
        BurnEffect = function(a1) -- Line: 80 -- upvalues: CorruptedPyromancer (upval), TimescaleUtilities (upval)
            local u5 = CorruptedPyromancer.Burn:Clone()
            u5.Parent = workspace.Trash
            u5:PivotTo(a1.PrimaryPart.CFrame)
            u5.Size = a1:GetExtentsSize()
            local WeldConstraint = Instance.new("WeldConstraint")
            WeldConstraint.Part0 = u5
            WeldConstraint.Part1 = a1.PrimaryPart
            WeldConstraint.Parent = u5
            TimescaleUtilities.Delay(3, function() -- Line: 91 -- upvalues: u5 (val), TimescaleUtilities (upval)
                for i, j in u5:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("Trail") then
                        j.Enabled = false
                    end
                end
                TimescaleUtilities.Delay(2, function() -- Line: 97 -- upvalues: u5 (upval)
                    u5:Destroy()
                end)
            end)
        end,
        Fire = function(a1_2) -- Line: 103
            -- upvalues: a1 (val), u10 (val), HttpService (upval), AreaIndicatorStore (upval)
            -- upvalues: TimescaleUtilities (upval)
            a1:Face(a1_2, (TweenInfo.new(0.5)))
            u10:Play()
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